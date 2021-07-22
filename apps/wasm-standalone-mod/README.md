This readme is for *modified* `wasm-standalone` example to record the problems and solutions in compiling & running TVM graph as a WebAssembly module.

**Note:** Code in this directory works with latest TVM rather than this fork.

# Debugging note

## **Partly Solved** Bug: wasm trap: indirect call type mismatch

This is a runtime error which occurs after the model can be successfully compiled to wasm and `wasm-graph` can deserialize input data correctly. Some issue/PRs in TVM are related to this problem, but it wasn't really get fixed yet:

- [Issue 6816](https://github.com/apache/tvm/issues/6816)
- [PR 5489](https://github.com/apache/tvm/pull/5489)
- [PR 6886](https://github.com/apache/tvm/pull/6886)

The most related part in `tvm` is [`rust/tvm-graph-rt`](https://github.com/apache/tvm/tree/main/rust/tvm-graph-rt). It even contains a [test-wasm32](https://github.com/apache/tvm/tree/main/rust/tvm-graph-rt/tests/test_wasm32), but the test is commented in the [test scripts](https://github.com/apache/tvm/blob/main/tests/scripts/task_rust.sh#L75). Also, I cannot run the test successfully with the command written in this script. 

*Note*: if you want to run the test locally on the latest version, please add a line in `rust/Cargo.toml` to include this test as a member.

### Error log 

#### `test_wasm32`

It can be compiled successfully, but when I run the compiled wasm32 file using `wasmtime`, the error pops out:

```sh
> WASMTIME_BACKTRACE_DETAILS=1 wasmtime ../../../target/wasm32-wasi/debug/test-rt-wasm32.wasm
Error: failed to run main module `../../../target/wasm32-wasi/debug/test-rt-wasm32.wasm`

Caused by:
    0: failed to invoke command default
    1: wasm trap: indirect call type mismatch
       wasm backtrace:
           0: 0x2eacd - tvm_graph_rt::module::wrap_backend_packed_func::{{closure}}::hc6cbbde68277fac0
                           at /home/ya0guang/Code/tvm/rust/tvm-graph-rt/src/module/mod.rs:49:25
           1: 0x5db8 - test_rt_wasm32::main::h1e18168ce80abd2a
                           at /home/ya0guang/Code/tvm/rust/tvm-graph-rt/tests/test_wasm32/src/main.rs:52:5
           2: 0xb44f - core::ops::function::FnOnce::call_once::h05e495bd98c71022
                           at /home/ya0guang/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/ops/function.rs:227:5
           3: 0x526a - std::sys_common::backtrace::__rust_begin_short_backtrace::h9ebb4194174cec1d
                           at /home/ya0guang/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/std/src/sys_common/backtrace.rs:125:18
           4: 0xb133 - std::rt::lang_start::{{closure}}::h32e3f78429000bd2
                           at /home/ya0guang/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/std/src/rt.rs:49:18
           5: 0x7bbf5 - core::ops::function::impls::<impl core::ops::function::FnOnce<A> for &F>::call_once::ha4f60a9c9c7a97e0
                           at /rustc/53cb7b09b00cbea8754ffb78e7e3cb521cb8af4b/library/core/src/ops/function.rs:259:13
                     - std::panicking::try::do_call::h30bf5b3340484c17
                           at /rustc/53cb7b09b00cbea8754ffb78e7e3cb521cb8af4b/library/std/src/panicking.rs:379:40
                     - std::panicking::try::h168ce69db8716de2
                           at /rustc/53cb7b09b00cbea8754ffb78e7e3cb521cb8af4b/library/std/src/panicking.rs:343:19
                     - std::panic::catch_unwind::h22e85b292aa7f362
                           at /rustc/53cb7b09b00cbea8754ffb78e7e3cb521cb8af4b/library/std/src/panic.rs:431:14
                     - std::rt::lang_start_internal::h1e63ab493c96e529
                           at /rustc/53cb7b09b00cbea8754ffb78e7e3cb521cb8af4b/library/std/src/rt.rs:34:21
           6: 0xb0e5 - std::rt::lang_start::h331eadc6eeffb0c4
                           at /home/ya0guang/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/std/src/rt.rs:48:5
           7: 0x5f4b - <unknown>!__original_main
           8: 0x10ea - <unknown>!_start
           9: 0x8534b - <unknown>!_start.command_export
```

This error still exists on the most recent release version.

#### `wasm-standalone`

The error site is the same as which in `test_wasm32`

```sh
> WASMTIME_BACKTRACE_DETAILS=1 RUST_BACKTRACE=1 ./target/debug/test_graph_resnet50 -g ./wasm_graph.wasm -i ./cat.png -l ./synset.csv
original image dimensions: (256, 256)
resized image dimensions: (224, 224)
DEBUG: data_size before grow: 103415808
DEBUG: data_size after grow: 105578496
DEBUG, input addr: 103415808, size: 2138872
DEBUG: after set_input [44, 49, 57, 49, 44, 49, 54, 55, 44, 53]
DEBUG: in run [44, 49, 57, 49, 44, 49, 54, 55, 44, 53]
DEBUG: in_addr 0x62a0000, in_size 2138872
DEBUG: wasm_graph load_input data_vec: [44, 49, 57, 49, 44, 49, 54, 55, 44, 53]
DEBUG: SER SUCCEED!!! and Ok
DEBUG: graph OK
DEBUG: params OK
DEBUG: exec OK
DEBUG: set_input OK
DEBUG: run: unwrap OK, executor
thread 'main' panicked at 'called `Result::unwrap()` on an `Err` value: wasm trap: indirect call type mismatch
wasm backtrace:
    0: 0x9270d - tvm_graph_rt::module::wrap_backend_packed_func::{{closure}}::hc41b54aab3cb76f6
                    at /home/ya0guang/Code/tvm/rust/tvm-graph-rt/src/module/mod.rs:49:25
    1: 0x31ffb - tvm_graph_rt::graph::GraphExecutor::setup_op_execs::{{closure}}::h796f856bdd94f006
                    at /home/ya0guang/Code/tvm/rust/tvm-graph-rt/src/graph.rs:311:17
    2: 0xc9813 - <alloc::boxed::Box<F,A> as core::ops::function::Fn<Args>>::call::hf5ca8f8ac2b01304
                    at /home/ya0guang/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/alloc/src/boxed.rs:1560:9
    3: 0x9e8be - tvm_graph_rt::graph::GraphExecutor::run::{{closure}}::h64f3e6e6888bde03
                    at /home/ya0guang/Code/tvm/rust/tvm-graph-rt/src/graph.rs:204:13
    4: 0x83de8 - <core::slice::iter::Iter<T> as core::iter::traits::iterator::Iterator>::for_each::h71b18dc5ce1e6a4c
                    at /home/ya0guang/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/slice/iter/macros.rs:203:21
    5: 0x9e874 - tvm_graph_rt::graph::GraphExecutor::run::h2fd8fe0d78a2c3ff
                    at /home/ya0guang/Code/tvm/rust/tvm-graph-rt/src/graph.rs:203:9
    6: 0x2bbdd - run
                    at /home/ya0guang/Code/tvm/apps/wasm-standalone-mod/wasm-graph/src/lib.rs:86:5
', src/main.rs:84:22
stack backtrace:
   0: rust_begin_unwind
             at /rustc/53cb7b09b00cbea8754ffb78e7e3cb521cb8af4b/library/std/src/panicking.rs:493:5
   1: core::panicking::panic_fmt
             at /rustc/53cb7b09b00cbea8754ffb78e7e3cb521cb8af4b/library/core/src/panicking.rs:92:14
   2: core::result::unwrap_failed
             at /rustc/53cb7b09b00cbea8754ffb78e7e3cb521cb8af4b/library/core/src/result.rs:1355:5
   3: core::result::Result<T,E>::unwrap
             at /home/ya0guang/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/result.rs:1037:23
   4: test_graph_resnet50::main
             at ./src/main.rs:84:5
   5: core::ops::function::FnOnce::call_once
             at /home/ya0guang/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/ops/function.rs:227:5
note: Some details are omitted, run with `RUST_BACKTRACE=full` for a verbose backtrace.
```

### Hot Fix

With the help from my collages, I'm now able to run the two examples.

#### Track the error message

The error says "indirect call type mismatch", and the error site is at this function:

```rs
// @see `WrapPackedFunc` in `llvm_module.cc`.
fn wrap_backend_packed_func(func_name: String, func: BackendPackedCFunc) -> Box<dyn PackedFunc> {
    Box::new(move |args: &[ArgValue]| {
        let (values, type_codes): (Vec<TVMValue>, Vec<i32>) = args
            .iter()
            .map(|arg| {
                let (val, code) = arg.to_tvm_value();
                (val, code as i32)
            })
            .unzip();
        let ret: RetValue = RetValue::default();
        let (mut ret_val, mut ret_type_code) = ret.to_tvm_value();

        // Error occurs here
        let exit_code = func(
            values.as_ptr(),
            type_codes.as_ptr(),
            values.len() as i32,
            &mut ret_val,
            &mut ret_type_code,
        );
        if exit_code == 0 {
            Ok(RetValue::from_tvm_value(ret_val, ret_type_code))
        } else {
            Err(tvm_sys::errors::FuncCallError::get_with_context(
                func_name.clone(),
            ))
        }
    })
}
```

It's not hard to guess this snippet makes an indirect call to `func`, which is a `BackendPackedCFunc`, and this function calls to compiled WASM code. The definition of `BackendPackedCFunc` is in `rust/tvm-sys/src/lib.rs`: 

```rs
    pub type BackendPackedCFunc = extern "C" fn(
        args: *const TVMValue,
        type_codes: *const c_int,
        num_args: c_int,
        out_ret_value: *mut TVMValue,
        out_ret_tcode: *mut u32,
    ) -> c_int;
```

Therefore, there may be a extern function in WASM module whose signature doesn't match this definition.

#### Digging the WASM File

Here we take [the test](https://github.com/apache/tvm/tree/main/rust/tvm-graph-rt/tests/test_wasm32) as an example.

The compiled module looks like [this](./test.wat).  

Function `$f6` invokes `$env.TVMBackendRegisterSystemLibSymbol`, which seems to export two symbols, `__tvm_module_ctx` and `default_function` (at 2882, it's very strange there are two `default_function`s in data segment).

Indeed, none of the functions in WASM module has the same signature with `BackendPackedCFunc`. The most close one takes 6 parameters. So what if we pass 6 parameters to `func`? We modify `rust/tvm-graph-rt/src/module/mod.rs`: adding a new function type and forcely passing 6 parameters to func.

```rs
pub type BackendPackedCFuncMod = extern "C" fn(
    args: *const TVMValue,
    type_codes: *const c_int,
    num_args: c_int,
    out_ret_value: *mut TVMValue,
    out_ret_tcode: *mut u32,
    additional: c_int,
) -> c_int;

// Some code

        let func_mod: BackendPackedCFuncMod = unsafe {std::mem::transmute(func)};

        let exit_code = func_mod(
            values.as_ptr(),
            type_codes.as_ptr(),
            values.len() as i32,
            &mut ret_val,
            &mut ret_type_code,
            0,
        );

```

Then it works!!!!!!!

### In-depth Analysis

#### LLVM Compiled IR

Please see [this](./test.ll).

As mentioned in [this PR](https://github.com/apache/tvm/pull/6886) and [related issue](https://github.com/apache/tvm/issues/6816), TVM may has compatibility problem with WASI ABI.  
~~To solve this problem, we may need to figure out the root cause in ABI level first.~~

Although the `test_wasm32` and `wasm-standalone` can be executed with no error for now, the root cause of this problem is unclear. We still need to answer the following questions:

- How is the `default_function` compiled? Why it's taking 6 parameters in WASM but `BackendPackedCFunc` only takes 5 parameters?
- What's the exact calling convention of TVM?
- How the functions compiled by TVM packed and wrapped?
- Will there be type confusion problems in WASM/TVM?


## **Solved** Bug: Modified bytes in deserialization 

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

After updating the `wasmtime` to `0.28.0` and rewrite `graph.rs`, there is still an error, but it's a lot different.

```sh
original image dimensions: (256, 256)
resized image dimensions: (224, 224)
DEBUG: instantiate result: Err(WebAssembly failed to compile

Caused by:
    0: WebAssembly translation error
    1: Invalid input WebAssembly code at offset 1578578: alignment must not be larger than natural)
thread 'main' panicked at 'called `Result::unwrap()` on an `Err` value: WebAssembly failed to compile

Caused by:
    0: WebAssembly translation error
    1: Invalid input WebAssembly code at offset 1578578: alignment must not be larger than natural', src/main.rs:87:12
stack backtrace:
   0:     0x559304857880 - std::backtrace_rs::backtrace::libunwind::trace::ha5edb8ba5c6b7a6c
                               at /rustc/53cb7b09b00cbea8754ffb78e7e3cb521cb8af4b/library/std/src/../../backtrace/src/backtrace/libunwind.rs:90:5
   1:     0x559304857880 - std::backtrace_rs::backtrace::trace_unsynchronized::h0de86d320a827db2
                               at /rustc/53cb7b09b00cbea8754ffb78e7e3cb521cb8af4b/library/std/src/../../backtrace/src/back
```

### Root Cause

After digging deep inside this error, I found this error originates in `apps/wasm-standalone/wasm-graph/src/utils.rs`:
```rs
    let mut data_vec = Vec::new();
    for i in 0..in_size {
        data_vec.push(ptr::read(in_addr.offset(i as isize)));
    }
```
The snippet above creates a new local vector and fills it byte by byte. 

However, the memory seems to be compromised during vector data filling. This error may originates in the differences of memory management between the host(runtime) and WASM app. There is also a blog post introducing MM in WASM runtimes: [A practical guide to WebAssembly memory
](https://radu-matei.com/blog/practical-guide-to-wasm-memory/s).

> Maybe I should look deep inside the implementation of the MM-related interfaces of WASM runtimes.

### Solution

1. Upgrade `wasmtime` library to the latest version (`0.28.0`)
2. Rewrite the source code using the updated APIs and pass the input/output in secure ways.

#### Insights

- Pointers pointing to sandboxed data structures can be invalidated whenever the memory size of the sandbox changes.
- Prepare enough memory (e.g. by `grow`) before passing input data, and use safe API (`Memory::write`) to pass data in. Please make sure to write data on the "growed memory" 

## **Solved** Error: Model Doesn't Compile to `wasm32` target

This problem can be easily solved using the latest TVM APIs or just adding a line in the Python script.

- [updated script](https://github.com/ya0guang/tvm-wasm-teaclave/blob/wasm-debug/apps/wasm-standalone-mod/wasm-graph/tools/build_graph_lib.py): contains dead code, only for debug use

### Alternative solution

```py
def _get_mod_and_params(model_file):
    onnx_model = onnx.load(model_file)
    shape_dict = {}
    for input in onnx_model.graph.input:
        shape_dict[input.name] = [dim.dim_value for dim in input.type.tensor_type.shape.dim]

    shape_dict = {"data": shape_dict["data"]}
    return relay.frontend.from_onnx(onnx_model, shape_dict)
```
