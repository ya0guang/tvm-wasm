#!/usr/bin/env python3
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

"""Builds a simple graph for testing."""
import argparse
import os
import subprocess
import sys

import onnx
import tvm
from tvm import relay, runtime
from tvm.contrib.download import download_testdata
from tvm.contrib import graph_executor

from PIL import Image
import numpy as np
import tvm.relay as relay


model_url = "".join(
    [
        "https://github.com/onnx/models/raw/",
        "master/vision/classification/resnet/model/",
        "resnet50-v2-7.onnx",
    ]
)

def _get_mod_and_params(model_file):
    onnx_model = onnx.load(model_file)
    shape_dict = {}
    for input in onnx_model.graph.input:
        shape_dict[input.name] = [dim.dim_value for dim in input.type.tensor_type.shape.dim]

    return relay.frontend.from_onnx(onnx_model, shape_dict)


def build_graph_lib(model_file, opt_level):
    """Compiles the pre-trained model with TVM"""
    out_dir = os.path.join(sys.path[0], "../lib")
    if not os.path.exists(out_dir):
        os.makedirs(out_dir)

    model_path = download_testdata(model_url, "resnet50-v2-7.onnx", module="onnx")
    onnx_model = onnx.load(model_path)

    img_url = "https://s3.amazonaws.com/model-server/inputs/kitten.jpg"
    img_path = download_testdata(img_url, "imagenet_cat.png", module="data")

    # Resize it to 224x224
    resized_image = Image.open(img_path).resize((224, 224))
    img_data = np.asarray(resized_image).astype("float32")

    # Our input image is in HWC layout while ONNX expects CHW input, so convert the array
    img_data = np.transpose(img_data, (2, 0, 1))

    # Normalize according to the ImageNet input specification
    imagenet_mean = np.array([0.485, 0.456, 0.406]).reshape((3, 1, 1))
    imagenet_stddev = np.array([0.229, 0.224, 0.225]).reshape((3, 1, 1))
    norm_img_data = (img_data / 255 - imagenet_mean) / imagenet_stddev

    # Add the batch dimension, as we are expecting 4-dimensional input: NCHW.
    img_data = np.expand_dims(norm_img_data, axis=0)

    input_name = "data"
    shape_dict = {input_name: img_data.shape}

    mod, params = relay.frontend.from_onnx(onnx_model, shape_dict)
    # target = "llvm -mtriple=wasm32-unknown-unknown -mattr=+simd128 --system-lib"
    target = "llvm -mtriple=wasm32-unknown-unknown --system-lib"

    with tvm.transform.PassContext(opt_level=3):
        (graph_json, lib_raw, params) = relay.build(mod, target=target, params=params)

    # (graph_json, lib_raw, params) = lib
    
    
    # with tvm.transform.PassContext(opt_level=opt_level):
    #     graph_json, lib, params = relay.build(mod, target=target, params=params)

    # dev = tvm.device(str(target), 0)
    # module = graph_executor.GraphModule(lib["default"](dev))


    # Save the model artifacts to obj_file
    obj_file = os.path.join(out_dir, "graph.o")
    lib_raw.save(obj_file)
    # Run llvm-ar to archive obj_file into lib_file
    lib_file = os.path.join(out_dir, "libgraph_wasm32.a")
    cmds = [os.environ.get("LLVM_AR", "llvm-ar-10"), "rcs", lib_file, obj_file]
    subprocess.run(cmds)

    with open(os.path.join(out_dir, "graph.json"), "w") as f_graph:
        f_graph.write(graph_json)

    with open(os.path.join(out_dir, "graph.params"), "wb") as f_params:
        f_params.write(runtime.save_param_dict(params))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="ONNX model build example")
    parser.add_argument("model_file", type=str, help="the path of onnx model file")
    parser.add_argument(
        "-O",
        "--opt-level",
        type=int,
        default=0,
        help="level of optimization. 0 is non-optimized and 3 is the highest level",
    )
    args = parser.parse_args()

    build_graph_lib(args.model_file, args.opt_level)
