<!--- Licensed to the Apache Software Foundation (ASF) under one -->
<!--- or more contributor license agreements.  See the NOTICE file -->
<!--- distributed with this work for additional information -->
<!--- regarding copyright ownership.  The ASF licenses this file -->
<!--- to you under the Apache License, Version 2.0 (the -->
<!--- "License"); you may not use this file except in compliance -->
<!--- with the License.  You may obtain a copy of the License at -->

<!---   http://www.apache.org/licenses/LICENSE-2.0 -->

<!--- Unless required by applicable law or agreed to in writing, -->
<!--- software distributed under the License is distributed on an -->
<!--- "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY -->
<!--- KIND, either express or implied.  See the License for the -->
<!--- specific language governing permissions and limitations -->
<!--- under the License. -->


# Debugging note

## Bug: Modified bytes in deserialization

Some bytes are mystically modified:

```sh
original image dimensions: (256, 256)
resized image dimensions: (224, 224)
DEBUG: vector: [44, 49, 57, 49, 44, 49, 54, 55, 44, 53]
DEBUG, input addr: 103546880, size: 2138872
DEBUG: wasm_graph load_input data_vec: [44, 49, 57, 49, 177, 140, 31, 0, 44, 53]
thread '<unnamed>' panicked at 'called `Result::unwrap()` on an `Err` value: Error("expected `,` or `]`", line: 1, column: 95005)', src/utils.rs:36:11
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
thread 'main' panicked at 'called `Result::unwrap()` on an `Err` value: wasm trap: unreachable
wasm backtrace:
  0: 0x16de2 - <unknown>!rust_panic
  1: 0xdb69 - <unknown>!std::panicking::rust_panic_with_hook::h7d1c07b3a075203c
  2: 0x1763e - <unknown>!std::panicking::begin_panic_handler::{{closure}}::h3513767ae6c4d95c
  3: 0x17585 - <unknown>!std::sys_common::backtrace::__rust_end_short_backtrace::h0bbf8ae75ca302c2
  4: 0x474c - <unknown>!rust_begin_unwind
  5: 0x3cca - <unknown>!core::panicking::panic_fmt::h2e0bed4f7ae7c673
  6: 0x6ed5 - <unknown>!core::result::unwrap_failed::h9a191c82353b6b6a
  7: 0x31375 - <unknown>!run
', src/main.rs:95:22
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
```

### Hot fix

```rs
// file: apps/wasm-standalone/wasm-graph/src/utils.rs
    data_vec[95004] = 44;
    data_vec[95005] = 49;
    data_vec[95006] = 54;
    data_vec[95007] = 55;
```

After changing some bytes, another similar bug occurs:
> thread '<unnamed>' panicked at 'called `Result::unwrap()` on an `Err` value: Error("expected `,` or `]`", line: 1, column: 95069)', src/utils.rs:40:11

It seems this memory region is compromised.

### Solution 1: update Runtime

# WebAssembly Standalone for Deep Learning Framework with TVM Runtime

#### Experimental notice: This project is still *experimental* and only serves as a proof of concept for running deep learning frameworks on [WebAssembly runtime](https://github.com/bytecodealliance/wasmtime) with [TVM stack](https://tvm.apache.org/).

- [WebAssembly Standalone for Deep Learning Framework with TVM Runtime](#webassembly-standalone-for-deep-learning-framework-with-tvm-runtime)
    - [Motivation](#motivation)
    - [Framework Landscape](#framework-landscape)
    - [Project Status](#project-status)
    - [PoC Guidelines](#poc-guidelines)
        - [Pre-installation](#pre-installation)
        - [Build ResNet50 model](#build-resnet50-model)
        - [Build wasm-graph package](#build-wasm-graph-package)
        - [Test](#test)
    - [Future Work](#future-work)
        - [More networks support](#more-networks-support)
        - [Performance benchmark](#performance-benchmark)
        - [Native TVM Rust runtime support](#native-tvm-rust-runtime-support)
    - [Appendix](#appendix)
        - [System packages install](#system-packages-install)

## Motivation

<img src="https://github.com/dmlc/web-data/raw/main/tvm/tutorial/tvm_support_list.png" alt="TVM hardware support" width="600"/>

As demonstrated in TVM runtime [tutorials](https://tvm.apache.org/docs/tutorials/get_started/relay_quick_start.html), TVM already supports WASM as the optional hardware backend, so we can leverage the features of WebAssembly (portability, security) and TVM runtime (domain-specific, optimization) to build a flexible and auto-optimized graph compiler for all deep learning frameworks.

## Framework Landscape

The figures below demonstrate the whole landscape of running deep learning frameworks on WASM runtime with TVM compiler stack.

* WASM graph generation
    ```
       _ _ _ _ _ _ _ _ _ _        _ _ _ _ _ _ _        _ _ _ _ _ _ _ _ _ _ _ _
      |                   |      |             |      |                       |
      |  Framework Model  | ---> |  ONNX Model | ---> |  TVM Relay Python API |
      |_ _ _ _ _ _ _ _ _ _|      |_ _ _ _ _ _ _|      |_ _ _ _ _ _ _ _ _ _ _ _|
                                                                 ||
                                                                 \/
                 _ _ _ _ _ _ _ _ _ _ _                  _ _ _ _ _ _ _ _ _ _ _
                |                     |                |                     |
                | WASM Graph Builder  |                |  TVM Compiler Stack |
                |    (TVM runtime)    |                |_ _ _ _ _ _ _ _ _ _ _|
                |_ _ _ _ _ _ _ _ _ _ _|                          ||
                          ||                                     \/
      _ _ _ _ _ _ _ _ _   ||   _ _ _ _ _ _ _ _ _ _            _ _ _ _ _
     |                 |  \/  |                   |  llvm-ar |         |
     | wasm_graph.wasm | <--- | libgraph_wasm32.a | <------- | graph.o |
     |_ _ _ _ _ _ _ _ _|      |_ _ _ _ _ _ _ _ _ _|          |_ _ _ _ _|
    ```

* WASM graph loading
    ```
         _ _ _ _ _ _ _ _ _ _ _
        |                     |
        |  WASM Graph Loader  |
        |   (WASM runtime)    |
        |_ _ _ _ _ _ _ _ _ _ _|
                  ||
                  \/
          _ _ _ _ _ _ _ _ _ _
         |                   |
         |  wasm_graph.wasm  |
         |_ _ _ _ _ _ _ _ _ _|
    ```

## Project Status

This project should be considered **experimental** at the very early stage, all rich features are under active development. Here is the current operator support matrix:

| Model Name | Status |
| ---------- | ------ |
| ResNet50 | ✔️ |
| LeNet | <center>&mdash;</center> |

**NOTICE**: Currently this project is ONLY tested on Ubuntu system, so `Ubuntu 16.04+` should be prepared as the testing environment.

## PoC Guidelines

### Pre-installation

* Rust

    Before running this demo, please make sure [Rust](#system-packages-install) has been installed.

    After Rust installed, execute the code below to add `wasm32-wasi` target:
    ```shell
    rustup target add wasm32-wasi
    ```

* TVM

    Please follow TVM [installations](https://tvm.apache.org/docs/install/index.html) for the detailed instruction.

* LLVM

    `LLVM 10.0` or later is REQUIRED.

### Build ResNet50 model

- Build DL library in the WebAssembly format.

  - Download model

    ```
    cd wasm-graph/tools && wget https://s3.amazonaws.com/onnx-model-zoo/resnet/resnet50v1/resnet50v1.onnx
    ```

  - Compile

    ```
    LLVM_AR=llvm-ar-10 python ./build_graph_lib.py -O3 ./resnet50v1.onnx
    ```

### Build wasm-graph package

```shell
cd wasm-graph && cargo build --release
cp ./target/wasm32-wasi/release/wasm_graph.wasm ./lib/wasm_graph_resnet50.wasm
```

### Test

Before running this demo, please make sure [`Rust`](#system-packages-install) has been installed.

Next run the command below to install the runtime package for testing (`rust` REQUIRED):

```shell
cd wasm-runtime/tests/test_graph_resnet50 && cargo build
```

Check the usage of `test_graph_resnet50`:

```shell
~# ./target/debug/test_graph_resnet50 -h

Usage: ./target/debug/test_graph_resnet50 [options]

Options:
    -g, --wasm-graph-file FILE_PATH
                        set the path to wasm graph file
    -i, --input-data-file FILE_PATH
                        set the path to input image file
    -l, --label-class-file FILE_PATH
                        set the path to label class file
    -h, --help          print this help menu
```

Next perform model inference using these commands below:
```
$ cp ../../../wasm-graph/lib/wasm_graph_resnet50.wasm ./
$ wget -O cat.png https://github.com/dmlc/mxnet.js/blob/main/data/cat.png?raw=true
$ wget -O synset.csv https://raw.githubusercontent.com/kazum/tvm-wasm/master/synset.csv
$ ./target/debug/test_graph_resnet50 -g ./wasm_graph_resnet50.wasm -i ./cat.png -l ./synset.csv
original image dimensions: (256, 256)
resized image dimensions: (224, 224)
input image belongs to the class `tabby, tabby cat`
```

## Future Work

### More networks support
TODO

### Performance benchmark

We are working on several improvements on performances:
* WebAssembly simd128 support (**Done**)
* Auto-tvm enhancement for llvm target

### Native TVM Rust runtime support
TODO

## Appendix

### System packages install

* Rust (latest version)

    If you are running Windows, to install Rust, download and run the [RUST-INIT.EXE](https://win.rustup.rs/), and then follow the onscreen instructions.

    If you are a Linux user, run the following in your terminal, then follow the on-screen instructions to install Rust.

    ```shell
    curl https://sh.rustup.rs -sSf | sh
    ```
