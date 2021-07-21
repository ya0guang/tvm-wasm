(module
  (type $t0 (func (param i32 i32 i32 i32 i32 i32) (result i32)))
  (type $t1 (func (param i32)))
  (type $t2 (func (param i32 i32 i32 i32 i32 i32 i32) (result i32)))
  (type $t3 (func (param i32 i32 i32) (result i32)))
  (type $t4 (func))
  (type $t5 (func (param i32 i32) (result i32)))
  (import "env" "__linear_memory" (memory $env.__linear_memory 1))
  (import "env" "TVMAPISetLastError" (func $env.TVMAPISetLastError (type $t1)))
  (import "env" "__stack_pointer" (global $env.__stack_pointer (mut i32)))
  (import "env" "TVMBackendParallelLaunch" (func $env.TVMBackendParallelLaunch (type $t3)))
  (import "env" "TVMBackendRegisterSystemLibSymbol" (func $env.TVMBackendRegisterSystemLibSymbol (type $t5)))
  (import "env" "__indirect_function_table" (table $env.__indirect_function_table 2 funcref))
  (func $f3 (type $t0) (param $p0 i32) (param $p1 i32) (param $p2 i32) (param $p3 i32) (param $p4 i32) (param $p5 i32) (result i32)
    (local $l6 i32) (local $l7 i32) (local $l8 i32) (local $l9 i32) (local $l10 i32) (local $l11 i32) (local $l12 i32)
    block $B0
      block $B1
        block $B2
          local.get $p2
          i32.const 3
          i32.ne
          br_if $B2
          i32.const 0
          local.set $l6
          i32.const 0
          local.set $l7
          local.get $p0
          i32.load
          local.tee $l8
          i32.load offset=20
          i32.load
          local.tee $l9
          i32.const 1
          i32.eq
          local.tee $l10
          br_if $B0
          i32.const 1
          local.set $l7
          local.get $l8
          i32.load offset=24
          local.tee $p2
          br_if $B1
          br $B0
        end
        i32.const 4
        call $env.TVMAPISetLastError
        i32.const -1
        return
      end
      local.get $p2
      i32.load
      local.set $l7
    end
    local.get $p0
    i32.load offset=8
    local.set $p2
    block $B3
      local.get $l10
      br_if $B3
      block $B4
        local.get $p2
        i32.load offset=24
        local.tee $l10
        br_if $B4
        i32.const 1
        local.set $l6
        br $B3
      end
      local.get $l10
      i32.load
      local.set $l6
    end
    local.get $p0
    i32.load offset=16
    local.set $p0
    local.get $p1
    i32.load
    local.set $l10
    i32.const 0
    local.set $l11
    block $B5
      local.get $l9
      i32.const 1
      i32.eq
      br_if $B5
      i32.const 1
      local.set $l11
      local.get $p0
      i32.load offset=24
      local.tee $l12
      i32.eqz
      br_if $B5
      local.get $l12
      i32.load
      local.set $l11
    end
    block $B6
      block $B7
        block $B8
          block $B9
            block $B10
              block $B11
                block $B12
                  block $B13
                    block $B14
                      block $B15
                        block $B16
                          block $B17
                            block $B18
                              block $B19
                                block $B20
                                  block $B21
                                    block $B22
                                      block $B23
                                        block $B24
                                          local.get $l10
                                          i32.const 13
                                          i32.gt_u
                                          br_if $B24
                                          i32.const 1
                                          local.get $l10
                                          i32.shl
                                          i32.const 8344
                                          i32.and
                                          i32.eqz
                                          br_if $B24
                                          local.get $p1
                                          i32.load offset=4
                                          local.tee $l10
                                          i32.const 13
                                          i32.gt_u
                                          br_if $B23
                                          i32.const 1
                                          local.get $l10
                                          i32.shl
                                          i32.const 8344
                                          i32.and
                                          i32.eqz
                                          br_if $B23
                                          local.get $p1
                                          i32.load offset=8
                                          local.tee $p1
                                          i32.const 13
                                          i32.gt_u
                                          br_if $B22
                                          i32.const 1
                                          local.get $p1
                                          i32.shl
                                          i32.const 8344
                                          i32.and
                                          i32.eqz
                                          br_if $B22
                                          local.get $l8
                                          i32.load offset=12
                                          i32.const 1
                                          i32.ne
                                          br_if $B21
                                          local.get $l8
                                          i32.const 18
                                          i32.add
                                          i32.load16_u
                                          i32.const 1
                                          i32.ne
                                          br_if $B20
                                          local.get $l8
                                          i32.const 17
                                          i32.add
                                          i32.load8_u
                                          i32.const 255
                                          i32.and
                                          i32.const 32
                                          i32.ne
                                          br_if $B20
                                          local.get $l8
                                          i32.load8_u offset=16
                                          i32.const 255
                                          i32.and
                                          i32.const 2
                                          i32.ne
                                          br_if $B20
                                          local.get $l8
                                          i64.load offset=32
                                          i64.eqz
                                          i32.eqz
                                          br_if $B19
                                          local.get $l8
                                          i32.load offset=4
                                          i32.const 1
                                          i32.ne
                                          br_if $B18
                                          local.get $p2
                                          i32.load offset=12
                                          i32.const 1
                                          i32.ne
                                          br_if $B17
                                          local.get $p2
                                          i32.const 18
                                          i32.add
                                          i32.load16_u
                                          i32.const 1
                                          i32.ne
                                          br_if $B16
                                          local.get $p2
                                          i32.const 17
                                          i32.add
                                          i32.load8_u
                                          i32.const 255
                                          i32.and
                                          i32.const 32
                                          i32.ne
                                          br_if $B16
                                          local.get $p2
                                          i32.load8_u offset=16
                                          i32.const 255
                                          i32.and
                                          i32.const 2
                                          i32.ne
                                          br_if $B16
                                          local.get $l9
                                          local.get $p2
                                          i32.load offset=20
                                          i32.load
                                          i32.ne
                                          br_if $B15
                                          local.get $p2
                                          i64.load offset=32
                                          i64.eqz
                                          i32.eqz
                                          br_if $B14
                                          local.get $p2
                                          i32.load offset=4
                                          i32.const 1
                                          i32.ne
                                          br_if $B13
                                          local.get $l8
                                          i32.const 8
                                          i32.add
                                          i32.load
                                          local.tee $p1
                                          local.get $p2
                                          i32.const 8
                                          i32.add
                                          i32.load
                                          i32.ne
                                          br_if $B12
                                          local.get $p0
                                          i32.load offset=12
                                          i32.const 1
                                          i32.ne
                                          br_if $B11
                                          local.get $p0
                                          i32.const 18
                                          i32.add
                                          i32.load16_u
                                          i32.const 1
                                          i32.ne
                                          br_if $B10
                                          local.get $p0
                                          i32.const 17
                                          i32.add
                                          i32.load8_u
                                          i32.const 255
                                          i32.and
                                          i32.const 32
                                          i32.ne
                                          br_if $B10
                                          local.get $p0
                                          i32.load8_u offset=16
                                          i32.const 255
                                          i32.and
                                          i32.const 2
                                          i32.ne
                                          br_if $B10
                                          local.get $l9
                                          local.get $p0
                                          i32.load offset=20
                                          i32.load
                                          i32.ne
                                          br_if $B9
                                          local.get $p0
                                          i64.load offset=32
                                          i64.eqz
                                          i32.eqz
                                          br_if $B8
                                          local.get $p0
                                          i32.load offset=4
                                          i32.const 1
                                          i32.ne
                                          br_if $B7
                                          local.get $p1
                                          local.get $p0
                                          i32.const 8
                                          i32.add
                                          i32.load
                                          i32.ne
                                          br_if $B6
                                          local.get $l9
                                          local.get $p0
                                          i32.load
                                          local.get $l8
                                          i32.load
                                          local.get $l7
                                          local.get $p2
                                          i32.load
                                          local.get $l6
                                          local.get $l11
                                          call $f4
                                          return
                                        end
                                        i32.const 73
                                        call $env.TVMAPISetLastError
                                        i32.const -1
                                        return
                                      end
                                      i32.const 217
                                      call $env.TVMAPISetLastError
                                      i32.const -1
                                      return
                                    end
                                    i32.const 361
                                    call $env.TVMAPISetLastError
                                    i32.const -1
                                    return
                                  end
                                  i32.const 505
                                  call $env.TVMAPISetLastError
                                  i32.const -1
                                  return
                                end
                                i32.const 590
                                call $env.TVMAPISetLastError
                                i32.const -1
                                return
                              end
                              i32.const 788
                              call $env.TVMAPISetLastError
                              i32.const -1
                              return
                            end
                            i32.const 951
                            call $env.TVMAPISetLastError
                            i32.const -1
                            return
                          end
                          i32.const 1100
                          call $env.TVMAPISetLastError
                          i32.const -1
                          return
                        end
                        i32.const 1185
                        call $env.TVMAPISetLastError
                        i32.const -1
                        return
                      end
                      i32.const 1383
                      call $env.TVMAPISetLastError
                      i32.const -1
                      return
                    end
                    i32.const 1507
                    call $env.TVMAPISetLastError
                    i32.const -1
                    return
                  end
                  i32.const 1670
                  call $env.TVMAPISetLastError
                  i32.const -1
                  return
                end
                i32.const 1819
                call $env.TVMAPISetLastError
                i32.const -1
                return
              end
              i32.const 1974
              call $env.TVMAPISetLastError
              i32.const -1
              return
            end
            i32.const 2059
            call $env.TVMAPISetLastError
            i32.const -1
            return
          end
          i32.const 2257
          call $env.TVMAPISetLastError
          i32.const -1
          return
        end
        i32.const 2381
        call $env.TVMAPISetLastError
        i32.const -1
        return
      end
      i32.const 2544
      call $env.TVMAPISetLastError
      i32.const -1
      return
    end
    i32.const 2693
    call $env.TVMAPISetLastError
    i32.const -1)
  (func $f4 (type $t2) (param $p0 i32) (param $p1 i32) (param $p2 i32) (param $p3 i32) (param $p4 i32) (param $p5 i32) (param $p6 i32) (result i32)
    (local $l7 i32)
    global.get $env.__stack_pointer
    i32.const 32
    i32.sub
    local.tee $l7
    global.set $env.__stack_pointer
    local.get $l7
    local.get $p6
    i32.store offset=24
    local.get $l7
    local.get $p5
    i32.store offset=20
    local.get $l7
    local.get $p4
    i32.store offset=16
    local.get $l7
    local.get $p3
    i32.store offset=12
    local.get $l7
    local.get $p2
    i32.store offset=8
    local.get $l7
    local.get $p1
    i32.store offset=4
    local.get $l7
    local.get $p0
    i32.store
    i32.const 1
    local.get $l7
    i32.const 0
    call $env.TVMBackendParallelLaunch
    local.set $p0
    local.get $l7
    i32.const 32
    i32.add
    global.set $env.__stack_pointer
    local.get $p0)
  (func $f5 (type $t3) (param $p0 i32) (param $p1 i32) (param $p2 i32) (result i32)
    (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32) (local $l8 i32) (local $l9 i32)
    block $B0
      local.get $p2
      i32.load
      local.tee $l3
      local.get $p1
      i32.load offset=4
      local.tee $p1
      i32.add
      i32.const -1
      i32.add
      local.get $p1
      i32.div_s
      local.tee $p1
      local.get $p0
      i32.mul
      local.tee $l4
      local.get $l3
      local.get $l4
      local.get $l3
      i32.lt_s
      select
      local.tee $l5
      local.get $p1
      local.get $p0
      i32.const 1
      i32.add
      i32.mul
      local.tee $p0
      local.get $l3
      local.get $p0
      local.get $l3
      i32.lt_s
      select
      local.tee $l3
      i32.ge_s
      br_if $B0
      local.get $p2
      i32.load offset=24
      local.tee $p0
      i32.const 2
      i32.shl
      local.set $l4
      local.get $p2
      i32.load offset=20
      local.tee $l6
      i32.const 2
      i32.shl
      local.set $l7
      local.get $p2
      i32.load offset=12
      local.tee $l8
      i32.const 2
      i32.shl
      local.set $l9
      local.get $l3
      local.get $l5
      i32.sub
      local.set $p1
      local.get $p2
      i32.load offset=4
      local.get $p0
      local.get $l5
      i32.mul
      i32.const 2
      i32.shl
      i32.add
      local.set $l3
      local.get $p2
      i32.load offset=16
      local.get $l6
      local.get $l5
      i32.mul
      i32.const 2
      i32.shl
      i32.add
      local.set $p0
      local.get $p2
      i32.load offset=8
      local.get $l8
      local.get $l5
      i32.mul
      i32.const 2
      i32.shl
      i32.add
      local.set $p2
      loop $L1
        local.get $l3
        local.get $p0
        f32.load
        local.get $p2
        f32.load
        f32.add
        f32.store
        local.get $l3
        local.get $l4
        i32.add
        local.set $l3
        local.get $p0
        local.get $l7
        i32.add
        local.set $p0
        local.get $p2
        local.get $l9
        i32.add
        local.set $p2
        local.get $p1
        i32.const -1
        i32.add
        local.tee $p1
        br_if $L1
      end
    end
    i32.const 0)
  (func $f6 (type $t4)
    i32.const 2865
    i32.const 0
    call $env.TVMBackendRegisterSystemLibSymbol
    drop
    i32.const 2882
    i32.const 2
    call $env.TVMBackendRegisterSystemLibSymbol
    drop)
  (elem $e0 (i32.const 1) $f5 $f3)
  (data $d0 (i32.const 0) "\00\00\00\00")
  (data $d1 (i32.const 4) "Assert fail: (num_args == 3), default_function: num_args should be 3\00")
  (data $d2 (i32.const 73) "Assert fail: ((((arg0.code == 3) || (arg0.code == 13)) || (arg0.code == 7)) || (arg0.code == 4)), default_function: Expect arg[0] to be pointer\00")
  (data $d3 (i32.const 217) "Assert fail: ((((arg1.code == 3) || (arg1.code == 13)) || (arg1.code == 7)) || (arg1.code == 4)), default_function: Expect arg[1] to be pointer\00")
  (data $d4 (i32.const 361) "Assert fail: ((((arg2.code == 3) || (arg2.code == 13)) || (arg2.code == 7)) || (arg2.code == 4)), default_function: Expect arg[2] to be pointer\00")
  (data $d5 (i32.const 505) "Assert fail: (1 == tir.tvm_struct_get(arg0, 0, 4)), arg0.ndim is expected to equal 1\00")
  (data $d6 (i32.const 590) "Assert fail: (((tir.tvm_struct_get(arg0, 0, 5) == (uint8)2) && (tir.tvm_struct_get(arg0, 0, 6) == (uint8)32)) && (tir.tvm_struct_get(arg0, 0, 7) == (uint16)1)), arg0.dtype is expected to be float32\00")
  (data $d7 (i32.const 788) "Assert fail: ((uint64)0 == tir.tvm_struct_get(arg0, 0, 8)), Argument arg0.byte_offset has an unsatisfied constraint: ((uint64)0 == tir.tvm_struct_get(arg0, 0, 8))\00")
  (data $d8 (i32.const 951) "Assert fail: (1 == tir.tvm_struct_get(arg0, 0, 10)), Argument arg0.device_type has an unsatisfied constraint: (1 == tir.tvm_struct_get(arg0, 0, 10))\00")
  (data $d9 (i32.const 1100) "Assert fail: (1 == tir.tvm_struct_get(arg1, 0, 4)), arg1.ndim is expected to equal 1\00")
  (data $d10 (i32.const 1185) "Assert fail: (((tir.tvm_struct_get(arg1, 0, 5) == (uint8)2) && (tir.tvm_struct_get(arg1, 0, 6) == (uint8)32)) && (tir.tvm_struct_get(arg1, 0, 7) == (uint16)1)), arg1.dtype is expected to be float32\00")
  (data $d11 (i32.const 1383) "Assert fail: (n == int32(arg1.shape[0])), Argument arg1.shape[0] has an unsatisfied constraint: (n == int32(arg1.shape[0]))\00")
  (data $d12 (i32.const 1507) "Assert fail: ((uint64)0 == tir.tvm_struct_get(arg1, 0, 8)), Argument arg1.byte_offset has an unsatisfied constraint: ((uint64)0 == tir.tvm_struct_get(arg1, 0, 8))\00")
  (data $d13 (i32.const 1670) "Assert fail: (1 == tir.tvm_struct_get(arg1, 0, 10)), Argument arg1.device_type has an unsatisfied constraint: (1 == tir.tvm_struct_get(arg1, 0, 10))\00")
  (data $d14 (i32.const 1819) "Assert fail: (dev_id == tir.tvm_struct_get(arg1, 0, 9)), Argument arg1.device_id has an unsatisfied constraint: (dev_id == tir.tvm_struct_get(arg1, 0, 9))\00")
  (data $d15 (i32.const 1974) "Assert fail: (1 == tir.tvm_struct_get(arg2, 0, 4)), arg2.ndim is expected to equal 1\00")
  (data $d16 (i32.const 2059) "Assert fail: (((tir.tvm_struct_get(arg2, 0, 5) == (uint8)2) && (tir.tvm_struct_get(arg2, 0, 6) == (uint8)32)) && (tir.tvm_struct_get(arg2, 0, 7) == (uint16)1)), arg2.dtype is expected to be float32\00")
  (data $d17 (i32.const 2257) "Assert fail: (n == int32(arg2.shape[0])), Argument arg2.shape[0] has an unsatisfied constraint: (n == int32(arg2.shape[0]))\00")
  (data $d18 (i32.const 2381) "Assert fail: ((uint64)0 == tir.tvm_struct_get(arg2, 0, 8)), Argument arg2.byte_offset has an unsatisfied constraint: ((uint64)0 == tir.tvm_struct_get(arg2, 0, 8))\00")
  (data $d19 (i32.const 2544) "Assert fail: (1 == tir.tvm_struct_get(arg2, 0, 10)), Argument arg2.device_type has an unsatisfied constraint: (1 == tir.tvm_struct_get(arg2, 0, 10))\00")
  (data $d20 (i32.const 2693) "Assert fail: (dev_id == tir.tvm_struct_get(arg2, 0, 9)), Argument arg2.device_id has an unsatisfied constraint: (dev_id == tir.tvm_struct_get(arg2, 0, 9))\00")
  (data $d21 (i32.const 2848) "default_function\00")
  (data $d22 (i32.const 2865) "__tvm_module_ctx\00")
  (data $d23 (i32.const 2882) "default_function\00"))