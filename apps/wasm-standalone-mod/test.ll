; ModuleID = 'TVMMod'
source_filename = "TVMMod"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

%0 = type { i32*, i32 }
%1 = type { i8*, %2, i32, %3, i64*, i64*, i64 }
%2 = type { i32, i32 }
%3 = type { i8, i8, i16 }
%4 = type { i32, i8*, i8*, i32, i8*, i32, i32 }

@__tvm_module_ctx = linkonce dllexport global i8* null, align 4
@.str = private constant [69 x i8] c"Assert fail: (num_args == 3), default_function: num_args should be 3\00", align 1
@.str.1 = private constant [144 x i8] c"Assert fail: ((((arg0.code == 3) || (arg0.code == 13)) || (arg0.code == 7)) || (arg0.code == 4)), default_function: Expect arg[0] to be pointer\00", align 1
@.str.2 = private constant [144 x i8] c"Assert fail: ((((arg1.code == 3) || (arg1.code == 13)) || (arg1.code == 7)) || (arg1.code == 4)), default_function: Expect arg[1] to be pointer\00", align 1
@.str.3 = private constant [144 x i8] c"Assert fail: ((((arg2.code == 3) || (arg2.code == 13)) || (arg2.code == 7)) || (arg2.code == 4)), default_function: Expect arg[2] to be pointer\00", align 1
@.str.4 = private constant [85 x i8] c"Assert fail: (1 == tir.tvm_struct_get(arg0, 0, 4)), arg0.ndim is expected to equal 1\00", align 1
@.str.5 = private constant [198 x i8] c"Assert fail: (((tir.tvm_struct_get(arg0, 0, 5) == (uint8)2) && (tir.tvm_struct_get(arg0, 0, 6) == (uint8)32)) && (tir.tvm_struct_get(arg0, 0, 7) == (uint16)1)), arg0.dtype is expected to be float32\00", align 1
@.str.6 = private constant [163 x i8] c"Assert fail: ((uint64)0 == tir.tvm_struct_get(arg0, 0, 8)), Argument arg0.byte_offset has an unsatisfied constraint: ((uint64)0 == tir.tvm_struct_get(arg0, 0, 8))\00", align 1
@.str.7 = private constant [149 x i8] c"Assert fail: (1 == tir.tvm_struct_get(arg0, 0, 10)), Argument arg0.device_type has an unsatisfied constraint: (1 == tir.tvm_struct_get(arg0, 0, 10))\00", align 1
@.str.8 = private constant [85 x i8] c"Assert fail: (1 == tir.tvm_struct_get(arg1, 0, 4)), arg1.ndim is expected to equal 1\00", align 1
@.str.9 = private constant [198 x i8] c"Assert fail: (((tir.tvm_struct_get(arg1, 0, 5) == (uint8)2) && (tir.tvm_struct_get(arg1, 0, 6) == (uint8)32)) && (tir.tvm_struct_get(arg1, 0, 7) == (uint16)1)), arg1.dtype is expected to be float32\00", align 1
@.str.10 = private constant [124 x i8] c"Assert fail: (n == int32(arg1.shape[0])), Argument arg1.shape[0] has an unsatisfied constraint: (n == int32(arg1.shape[0]))\00", align 1
@.str.11 = private constant [163 x i8] c"Assert fail: ((uint64)0 == tir.tvm_struct_get(arg1, 0, 8)), Argument arg1.byte_offset has an unsatisfied constraint: ((uint64)0 == tir.tvm_struct_get(arg1, 0, 8))\00", align 1
@.str.12 = private constant [149 x i8] c"Assert fail: (1 == tir.tvm_struct_get(arg1, 0, 10)), Argument arg1.device_type has an unsatisfied constraint: (1 == tir.tvm_struct_get(arg1, 0, 10))\00", align 1
@.str.13 = private constant [155 x i8] c"Assert fail: (dev_id == tir.tvm_struct_get(arg1, 0, 9)), Argument arg1.device_id has an unsatisfied constraint: (dev_id == tir.tvm_struct_get(arg1, 0, 9))\00", align 1
@.str.14 = private constant [85 x i8] c"Assert fail: (1 == tir.tvm_struct_get(arg2, 0, 4)), arg2.ndim is expected to equal 1\00", align 1
@.str.15 = private constant [198 x i8] c"Assert fail: (((tir.tvm_struct_get(arg2, 0, 5) == (uint8)2) && (tir.tvm_struct_get(arg2, 0, 6) == (uint8)32)) && (tir.tvm_struct_get(arg2, 0, 7) == (uint16)1)), arg2.dtype is expected to be float32\00", align 1
@.str.16 = private constant [124 x i8] c"Assert fail: (n == int32(arg2.shape[0])), Argument arg2.shape[0] has an unsatisfied constraint: (n == int32(arg2.shape[0]))\00", align 1
@.str.17 = private constant [163 x i8] c"Assert fail: ((uint64)0 == tir.tvm_struct_get(arg2, 0, 8)), Argument arg2.byte_offset has an unsatisfied constraint: ((uint64)0 == tir.tvm_struct_get(arg2, 0, 8))\00", align 1
@.str.18 = private constant [149 x i8] c"Assert fail: (1 == tir.tvm_struct_get(arg2, 0, 10)), Argument arg2.device_type has an unsatisfied constraint: (1 == tir.tvm_struct_get(arg2, 0, 10))\00", align 1
@.str.19 = private constant [155 x i8] c"Assert fail: (dev_id == tir.tvm_struct_get(arg2, 0, 9)), Argument arg2.device_id has an unsatisfied constraint: (dev_id == tir.tvm_struct_get(arg2, 0, 9))\00", align 1
@__tvm_main__ = weak dllexport local_unnamed_addr constant [17 x i8] c"default_function\00", align 1
@.str.20 = private constant [17 x i8] c"__tvm_module_ctx\00", align 1
@.str.21 = private constant [17 x i8] c"default_function\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @__tvm_module_startup, i8* null }]

declare i32 @TVMBackendRegisterSystemLibSymbol(i8*, i8*) local_unnamed_addr

declare void @TVMAPISetLastError(i8*) local_unnamed_addr

declare i32 @TVMBackendParallelLaunch(i32 (i32, %0*, i8*)*, i8*, i32) local_unnamed_addr

define dllexport i32 @default_function(i8* noalias nocapture readonly %0, i8* noalias nocapture readonly %1, i32 %2, i8* noalias nocapture readnone %3, i8* noalias nocapture readnone %4, i8* noalias nocapture readnone %5) {
entry:
  %6 = icmp eq i32 %2, 3
  br i1 %6, label %assert_end, label %assert_fail, !prof !5

assert_fail:                                      ; preds = %entry
  tail call void @TVMAPISetLastError(i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str, i32 0, i32 0))
  ret i32 -1

assert_end:                                       ; preds = %entry
  %7 = bitcast i8* %0 to %1**
  %8 = load %1*, %1** %7, align 4
  %9 = bitcast i8* %1 to i32*
  %10 = load i32, i32* %9, align 4, !tbaa !6
  %11 = getelementptr inbounds i8, i8* %0, i32 8
  %12 = bitcast i8* %11 to %1**
  %13 = load %1*, %1** %12, align 4
  %14 = getelementptr inbounds i8, i8* %1, i32 4
  %15 = bitcast i8* %14 to i32*
  %16 = load i32, i32* %15, align 4, !tbaa !21
  %17 = getelementptr inbounds i8, i8* %0, i32 16
  %18 = bitcast i8* %17 to %1**
  %19 = load %1*, %1** %18, align 4
  %20 = getelementptr inbounds i8, i8* %1, i32 8
  %21 = bitcast i8* %20 to i32*
  %22 = load i32, i32* %21, align 4, !tbaa !23
  %23 = getelementptr inbounds %1, %1* %8, i32 0, i32 0
  %24 = load i8*, i8** %23, align 4
  %ptrint = ptrtoint i8* %24 to i32
  %maskedptr = and i32 %ptrint, 127
  %maskcond = icmp eq i32 %maskedptr, 0
  tail call void @llvm.assume(i1 %maskcond)
  %25 = getelementptr inbounds %1, %1* %8, i32 0, i32 4
  %26 = load i64*, i64** %25, align 4
  %27 = load i64, i64* %26, align 8, !tbaa !26
  %28 = trunc i64 %27 to i32
  %29 = getelementptr inbounds %1, %1* %8, i32 0, i32 5
  %30 = load i64*, i64** %29, align 4
  %31 = icmp eq i32 %28, 1
  br i1 %31, label %if_end, label %if_else

if_else:                                          ; preds = %assert_end
  %32 = icmp eq i64* %30, null
  br i1 %32, label %if_end, label %if_else2

if_end:                                           ; preds = %if_else2, %if_else, %assert_end
  %33 = phi i32 [ 0, %assert_end ], [ %43, %if_else2 ], [ 1, %if_else ]
  %34 = getelementptr inbounds %1, %1* %8, i32 0, i32 1, i32 1
  %35 = load i32, i32* %34, align 4
  %36 = getelementptr inbounds %1, %1* %13, i32 0, i32 0
  %37 = load i8*, i8** %36, align 4
  %ptrint4 = ptrtoint i8* %37 to i32
  %maskedptr5 = and i32 %ptrint4, 127
  %maskcond6 = icmp eq i32 %maskedptr5, 0
  tail call void @llvm.assume(i1 %maskcond6)
  %38 = getelementptr inbounds %1, %1* %13, i32 0, i32 4
  %39 = load i64*, i64** %38, align 4
  %40 = getelementptr inbounds %1, %1* %13, i32 0, i32 5
  %41 = load i64*, i64** %40, align 4
  br i1 %31, label %if_end9, label %if_else8

if_else2:                                         ; preds = %if_else
  %42 = load i64, i64* %30, align 8, !tbaa !40
  %43 = trunc i64 %42 to i32
  br label %if_end

if_else8:                                         ; preds = %if_end
  %44 = icmp eq i64* %41, null
  br i1 %44, label %if_end9, label %if_else11

if_end9:                                          ; preds = %if_else11, %if_else8, %if_end
  %45 = phi i32 [ 0, %if_end ], [ %53, %if_else11 ], [ 1, %if_else8 ]
  %46 = getelementptr inbounds %1, %1* %19, i32 0, i32 0
  %47 = load i8*, i8** %46, align 4
  %ptrint13 = ptrtoint i8* %47 to i32
  %maskedptr14 = and i32 %ptrint13, 127
  %maskcond15 = icmp eq i32 %maskedptr14, 0
  tail call void @llvm.assume(i1 %maskcond15)
  %48 = getelementptr inbounds %1, %1* %19, i32 0, i32 4
  %49 = load i64*, i64** %48, align 4
  %50 = getelementptr inbounds %1, %1* %19, i32 0, i32 5
  %51 = load i64*, i64** %50, align 4
  br i1 %31, label %if_end18, label %if_else17

if_else11:                                        ; preds = %if_else8
  %52 = load i64, i64* %41, align 8, !tbaa !54
  %53 = trunc i64 %52 to i32
  br label %if_end9

if_else17:                                        ; preds = %if_end9
  %54 = icmp eq i64* %51, null
  br i1 %54, label %if_end18, label %if_else20

if_end18:                                         ; preds = %if_else20, %if_else17, %if_end9
  %55 = phi i32 [ 0, %if_end9 ], [ %57, %if_else20 ], [ 1, %if_else17 ]
  switch i32 %10, label %assert_fail22 [
    i32 13, label %assert_end23
    i32 7, label %assert_end23
    i32 4, label %assert_end23
    i32 3, label %assert_end23
  ]

if_else20:                                        ; preds = %if_else17
  %56 = load i64, i64* %51, align 8, !tbaa !68
  %57 = trunc i64 %56 to i32
  br label %if_end18

assert_fail22:                                    ; preds = %if_end18
  tail call void @TVMAPISetLastError(i8* getelementptr inbounds ([144 x i8], [144 x i8]* @.str.1, i32 0, i32 0))
  ret i32 -1

assert_end23:                                     ; preds = %if_end18, %if_end18, %if_end18, %if_end18
  switch i32 %16, label %assert_fail24 [
    i32 13, label %assert_end25
    i32 7, label %assert_end25
    i32 4, label %assert_end25
    i32 3, label %assert_end25
  ]

assert_fail24:                                    ; preds = %assert_end23
  tail call void @TVMAPISetLastError(i8* getelementptr inbounds ([144 x i8], [144 x i8]* @.str.2, i32 0, i32 0))
  ret i32 -1

assert_end25:                                     ; preds = %assert_end23, %assert_end23, %assert_end23, %assert_end23
  switch i32 %22, label %assert_fail26 [
    i32 13, label %assert_end27
    i32 7, label %assert_end27
    i32 4, label %assert_end27
    i32 3, label %assert_end27
  ]

assert_fail26:                                    ; preds = %assert_end25
  tail call void @TVMAPISetLastError(i8* getelementptr inbounds ([144 x i8], [144 x i8]* @.str.3, i32 0, i32 0))
  ret i32 -1

assert_end27:                                     ; preds = %assert_end25, %assert_end25, %assert_end25, %assert_end25
  %58 = getelementptr inbounds %1, %1* %8, i32 0, i32 2
  %59 = load i32, i32* %58, align 4
  %60 = icmp eq i32 %59, 1
  br i1 %60, label %assert_end31, label %assert_fail28, !prof !5

assert_fail28:                                    ; preds = %assert_end27
  tail call void @TVMAPISetLastError(i8* getelementptr inbounds ([85 x i8], [85 x i8]* @.str.4, i32 0, i32 0))
  ret i32 -1

assert_end31:                                     ; preds = %assert_end27
  %61 = getelementptr inbounds %1, %1* %8, i32 0, i32 3, i32 2
  %62 = load i16, i16* %61, align 2
  %63 = icmp eq i16 %62, 1
  %64 = getelementptr inbounds %1, %1* %8, i32 0, i32 3, i32 1
  %65 = load i8, i8* %64, align 1
  %66 = icmp eq i8 %65, 32
  %67 = getelementptr inbounds %1, %1* %8, i32 0, i32 3, i32 0
  %68 = load i8, i8* %67, align 1
  %69 = icmp eq i8 %68, 2
  %70 = and i1 %66, %69
  %71 = and i1 %63, %70
  br i1 %71, label %assert_end33, label %assert_fail32, !prof !5

assert_fail32:                                    ; preds = %assert_end31
  tail call void @TVMAPISetLastError(i8* getelementptr inbounds ([198 x i8], [198 x i8]* @.str.5, i32 0, i32 0))
  ret i32 -1

assert_end33:                                     ; preds = %assert_end31
  %72 = getelementptr inbounds %1, %1* %8, i32 0, i32 6
  %73 = load i64, i64* %72, align 8
  %74 = icmp eq i64 %73, 0
  br i1 %74, label %assert_end35, label %assert_fail34, !prof !5

assert_fail34:                                    ; preds = %assert_end33
  tail call void @TVMAPISetLastError(i8* getelementptr inbounds ([163 x i8], [163 x i8]* @.str.6, i32 0, i32 0))
  ret i32 -1

assert_end35:                                     ; preds = %assert_end33
  %75 = getelementptr inbounds %1, %1* %8, i32 0, i32 1, i32 0
  %76 = load i32, i32* %75, align 4
  %77 = icmp eq i32 %76, 1
  br i1 %77, label %assert_end37, label %assert_fail36, !prof !5

assert_fail36:                                    ; preds = %assert_end35
  tail call void @TVMAPISetLastError(i8* getelementptr inbounds ([149 x i8], [149 x i8]* @.str.7, i32 0, i32 0))
  ret i32 -1

assert_end37:                                     ; preds = %assert_end35
  %78 = getelementptr inbounds %1, %1* %13, i32 0, i32 2
  %79 = load i32, i32* %78, align 4
  %80 = icmp eq i32 %79, 1
  br i1 %80, label %assert_end41, label %assert_fail38, !prof !5

assert_fail38:                                    ; preds = %assert_end37
  tail call void @TVMAPISetLastError(i8* getelementptr inbounds ([85 x i8], [85 x i8]* @.str.8, i32 0, i32 0))
  ret i32 -1

assert_end41:                                     ; preds = %assert_end37
  %81 = getelementptr inbounds %1, %1* %13, i32 0, i32 3, i32 2
  %82 = load i16, i16* %81, align 2
  %83 = icmp eq i16 %82, 1
  %84 = getelementptr inbounds %1, %1* %13, i32 0, i32 3, i32 1
  %85 = load i8, i8* %84, align 1
  %86 = icmp eq i8 %85, 32
  %87 = getelementptr inbounds %1, %1* %13, i32 0, i32 3, i32 0
  %88 = load i8, i8* %87, align 1
  %89 = icmp eq i8 %88, 2
  %90 = and i1 %86, %89
  %91 = and i1 %83, %90
  br i1 %91, label %assert_end43, label %assert_fail42, !prof !5

assert_fail42:                                    ; preds = %assert_end41
  tail call void @TVMAPISetLastError(i8* getelementptr inbounds ([198 x i8], [198 x i8]* @.str.9, i32 0, i32 0))
  ret i32 -1

assert_end43:                                     ; preds = %assert_end41
  %92 = load i64, i64* %39, align 8, !tbaa !82
  %93 = trunc i64 %92 to i32
  %94 = icmp eq i32 %28, %93
  br i1 %94, label %assert_end45, label %assert_fail44, !prof !5

assert_fail44:                                    ; preds = %assert_end43
  tail call void @TVMAPISetLastError(i8* getelementptr inbounds ([124 x i8], [124 x i8]* @.str.10, i32 0, i32 0))
  ret i32 -1

assert_end45:                                     ; preds = %assert_end43
  %95 = getelementptr inbounds %1, %1* %13, i32 0, i32 6
  %96 = load i64, i64* %95, align 8
  %97 = icmp eq i64 %96, 0
  br i1 %97, label %assert_end47, label %assert_fail46, !prof !5

assert_fail46:                                    ; preds = %assert_end45
  tail call void @TVMAPISetLastError(i8* getelementptr inbounds ([163 x i8], [163 x i8]* @.str.11, i32 0, i32 0))
  ret i32 -1

assert_end47:                                     ; preds = %assert_end45
  %98 = getelementptr inbounds %1, %1* %13, i32 0, i32 1, i32 0
  %99 = load i32, i32* %98, align 4
  %100 = icmp eq i32 %99, 1
  br i1 %100, label %assert_end49, label %assert_fail48, !prof !5

assert_fail48:                                    ; preds = %assert_end47
  tail call void @TVMAPISetLastError(i8* getelementptr inbounds ([149 x i8], [149 x i8]* @.str.12, i32 0, i32 0))
  ret i32 -1

assert_end49:                                     ; preds = %assert_end47
  %101 = getelementptr inbounds %1, %1* %13, i32 0, i32 1, i32 1
  %102 = load i32, i32* %101, align 4
  %103 = icmp eq i32 %35, %102
  br i1 %103, label %assert_end51, label %assert_fail50, !prof !5

assert_fail50:                                    ; preds = %assert_end49
  tail call void @TVMAPISetLastError(i8* getelementptr inbounds ([155 x i8], [155 x i8]* @.str.13, i32 0, i32 0))
  ret i32 -1

assert_end51:                                     ; preds = %assert_end49
  %104 = getelementptr inbounds %1, %1* %19, i32 0, i32 2
  %105 = load i32, i32* %104, align 4
  %106 = icmp eq i32 %105, 1
  br i1 %106, label %assert_end55, label %assert_fail52, !prof !5

assert_fail52:                                    ; preds = %assert_end51
  tail call void @TVMAPISetLastError(i8* getelementptr inbounds ([85 x i8], [85 x i8]* @.str.14, i32 0, i32 0))
  ret i32 -1

assert_end55:                                     ; preds = %assert_end51
  %107 = getelementptr inbounds %1, %1* %19, i32 0, i32 3, i32 2
  %108 = load i16, i16* %107, align 2
  %109 = icmp eq i16 %108, 1
  %110 = getelementptr inbounds %1, %1* %19, i32 0, i32 3, i32 1
  %111 = load i8, i8* %110, align 1
  %112 = icmp eq i8 %111, 32
  %113 = getelementptr inbounds %1, %1* %19, i32 0, i32 3, i32 0
  %114 = load i8, i8* %113, align 1
  %115 = icmp eq i8 %114, 2
  %116 = and i1 %112, %115
  %117 = and i1 %109, %116
  br i1 %117, label %assert_end57, label %assert_fail56, !prof !5

assert_fail56:                                    ; preds = %assert_end55
  tail call void @TVMAPISetLastError(i8* getelementptr inbounds ([198 x i8], [198 x i8]* @.str.15, i32 0, i32 0))
  ret i32 -1

assert_end57:                                     ; preds = %assert_end55
  %118 = load i64, i64* %49, align 8, !tbaa !96
  %119 = trunc i64 %118 to i32
  %120 = icmp eq i32 %28, %119
  br i1 %120, label %assert_end59, label %assert_fail58, !prof !5

assert_fail58:                                    ; preds = %assert_end57
  tail call void @TVMAPISetLastError(i8* getelementptr inbounds ([124 x i8], [124 x i8]* @.str.16, i32 0, i32 0))
  ret i32 -1

assert_end59:                                     ; preds = %assert_end57
  %121 = getelementptr inbounds %1, %1* %19, i32 0, i32 6
  %122 = load i64, i64* %121, align 8
  %123 = icmp eq i64 %122, 0
  br i1 %123, label %assert_end61, label %assert_fail60, !prof !5

assert_fail60:                                    ; preds = %assert_end59
  tail call void @TVMAPISetLastError(i8* getelementptr inbounds ([163 x i8], [163 x i8]* @.str.17, i32 0, i32 0))
  ret i32 -1

assert_end61:                                     ; preds = %assert_end59
  %124 = getelementptr inbounds %1, %1* %19, i32 0, i32 1, i32 0
  %125 = load i32, i32* %124, align 4
  %126 = icmp eq i32 %125, 1
  br i1 %126, label %assert_end63, label %assert_fail62, !prof !5

assert_fail62:                                    ; preds = %assert_end61
  tail call void @TVMAPISetLastError(i8* getelementptr inbounds ([149 x i8], [149 x i8]* @.str.18, i32 0, i32 0))
  ret i32 -1

assert_end63:                                     ; preds = %assert_end61
  %127 = getelementptr inbounds %1, %1* %19, i32 0, i32 1, i32 1
  %128 = load i32, i32* %127, align 4
  %129 = icmp eq i32 %35, %128
  br i1 %129, label %assert_end65, label %assert_fail64, !prof !5

assert_fail64:                                    ; preds = %assert_end63
  tail call void @TVMAPISetLastError(i8* getelementptr inbounds ([155 x i8], [155 x i8]* @.str.19, i32 0, i32 0))
  ret i32 -1

assert_end65:                                     ; preds = %assert_end63
  %130 = tail call fastcc i32 @default_function_compute_(i32 %28, i8* %47, i8* %24, i32 %33, i8* %37, i32 %45, i32 %55)
  ret i32 %130
}

; Function Attrs: nounwind willreturn
declare void @llvm.assume(i1) #0

; Function Attrs: noinline
define internal fastcc i32 @default_function_compute_(i32 %0, i8* noalias align 128 %1, i8* noalias align 128 %2, i32 %3, i8* noalias align 128 %4, i32 %5, i32 %6) unnamed_addr #1 {
entry:
  %7 = alloca %4, align 8
  %8 = getelementptr inbounds %4, %4* %7, i32 0, i32 0
  store i32 %0, i32* %8, align 8
  %9 = getelementptr inbounds %4, %4* %7, i32 0, i32 1
  store i8* %1, i8** %9, align 4
  %10 = getelementptr inbounds %4, %4* %7, i32 0, i32 2
  store i8* %2, i8** %10, align 8
  %11 = getelementptr inbounds %4, %4* %7, i32 0, i32 3
  store i32 %3, i32* %11, align 4
  %12 = getelementptr inbounds %4, %4* %7, i32 0, i32 4
  store i8* %4, i8** %12, align 8
  %13 = getelementptr inbounds %4, %4* %7, i32 0, i32 5
  store i32 %5, i32* %13, align 4
  %14 = getelementptr inbounds %4, %4* %7, i32 0, i32 6
  store i32 %6, i32* %14, align 8
  %15 = bitcast %4* %7 to i8*
  %16 = call i32 @TVMBackendParallelLaunch(i32 (i32, %0*, i8*)* nonnull @__tvm_parallel_lambda, i8* nonnull %15, i32 0)
  ret i32 %16
}

; Function Attrs: nofree norecurse nounwind
define private i32 @__tvm_parallel_lambda(i32 %0, %0* nocapture readonly %1, i8* nocapture readonly %2) #2 {
entry:
  %3 = bitcast i8* %2 to i32*
  %4 = load i32, i32* %3, align 4
  %5 = getelementptr inbounds i8, i8* %2, i32 4
  %6 = bitcast i8* %5 to float**
  %7 = load float*, float** %6, align 4
  %8 = getelementptr inbounds i8, i8* %2, i32 8
  %9 = bitcast i8* %8 to float**
  %10 = load float*, float** %9, align 4
  %11 = getelementptr inbounds i8, i8* %2, i32 12
  %12 = bitcast i8* %11 to i32*
  %13 = load i32, i32* %12, align 4
  %14 = getelementptr inbounds i8, i8* %2, i32 16
  %15 = bitcast i8* %14 to float**
  %16 = load float*, float** %15, align 4
  %17 = getelementptr inbounds i8, i8* %2, i32 20
  %18 = bitcast i8* %17 to i32*
  %19 = load i32, i32* %18, align 4
  %20 = getelementptr inbounds i8, i8* %2, i32 24
  %21 = bitcast i8* %20 to i32*
  %22 = load i32, i32* %21, align 4
  %23 = getelementptr inbounds %0, %0* %1, i32 0, i32 1
  %24 = load i32, i32* %23, align 4
  %25 = add i32 %4, -1
  %26 = add i32 %25, %24
  %27 = sdiv i32 %26, %24
  %28 = add nsw i32 %0, 1
  %29 = mul nsw i32 %27, %28
  %30 = icmp slt i32 %29, %4
  %31 = select i1 %30, i32 %29, i32 %4
  %32 = mul nsw i32 %27, %0
  %33 = icmp slt i32 %32, %4
  %34 = select i1 %33, i32 %32, i32 %4
  %35 = icmp slt i32 %34, %31
  br i1 %35, label %for_body, label %for_end, !prof !5

for_body:                                         ; preds = %entry, %for_body
  %36 = phi i32 [ %46, %for_body ], [ %34, %entry ]
  %37 = mul nsw i32 %36, %22
  %38 = mul nsw i32 %36, %19
  %39 = getelementptr inbounds float, float* %16, i32 %38
  %40 = load float, float* %39, align 4, !tbaa !110
  %41 = mul nsw i32 %36, %13
  %42 = getelementptr inbounds float, float* %10, i32 %41
  %43 = load float, float* %42, align 4, !tbaa !113
  %44 = fadd float %40, %43
  %45 = getelementptr inbounds float, float* %7, i32 %37
  store float %44, float* %45, align 4, !tbaa !116
  %46 = add nsw i32 %36, 1
  %47 = icmp slt i32 %46, %31
  br i1 %47, label %for_body, label %for_end, !prof !5

for_end:                                          ; preds = %for_body, %entry
  ret i32 0
}

define internal void @__tvm_module_startup() {
entry:
  %0 = tail call i32 @TVMBackendRegisterSystemLibSymbol(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.20, i32 0, i32 0), i8* bitcast (i8** @__tvm_module_ctx to i8*))
  %1 = tail call i32 @TVMBackendRegisterSystemLibSymbol(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.21, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*, i32, i8*, i8*, i8*)* @default_function to i8*))
  ret void
}

attributes #0 = { nounwind willreturn }
attributes #1 = { noinline }
attributes #2 = { nofree norecurse nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "TVM", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, dwoId: 1)
!1 = !DIFile(filename: "model.tvm", directory: "/tmp/")
!2 = !{}
!3 = !{i32 2, !"tvm_target", !"llvm -mtriple=wasm32-unknown-unknown"}
!4 = !{i32 4, !"Debug Info Version", i32 3}
!5 = !{!"branch_weights", i32 1048576, i32 1}
!6 = !{!7, !7, i64 0}
!7 = !{!"0x1741c10.w1.b0", !8, i64 0}
!8 = !{!"0x1741c10.w2.b0", !9, i64 0}
!9 = !{!"0x1741c10.w4.b0", !10, i64 0}
!10 = !{!"0x1741c10.w8.b0", !11, i64 0}
!11 = !{!"0x1741c10.w16.b0", !12, i64 0}
!12 = !{!"0x1741c10.w32.b0", !13, i64 0}
!13 = !{!"0x1741c10.w64.b0", !14, i64 0}
!14 = !{!"0x1741c10.w128.b0", !15, i64 0}
!15 = !{!"0x1741c10.w256.b0", !16, i64 0}
!16 = !{!"0x1741c10.w512.b0", !17, i64 0}
!17 = !{!"0x1741c10.w1024.b0", !18, i64 0}
!18 = !{!"i8", !19, i64 0}
!19 = !{!"0x1741c10", !20, i64 0}
!20 = !{!"tvm-tbaa"}
!21 = !{!22, !22, i64 0}
!22 = !{!"0x1741c10.w1.b1", !8, i64 0}
!23 = !{!24, !24, i64 0}
!24 = !{!"0x1741c10.w1.b2", !25, i64 0}
!25 = !{!"0x1741c10.w2.b2", !9, i64 0}
!26 = !{!27, !27, i64 0}
!27 = !{!"0x176f2f0.w1.b0", !28, i64 0}
!28 = !{!"0x176f2f0.w2.b0", !29, i64 0}
!29 = !{!"0x176f2f0.w4.b0", !30, i64 0}
!30 = !{!"0x176f2f0.w8.b0", !31, i64 0}
!31 = !{!"0x176f2f0.w16.b0", !32, i64 0}
!32 = !{!"0x176f2f0.w32.b0", !33, i64 0}
!33 = !{!"0x176f2f0.w64.b0", !34, i64 0}
!34 = !{!"0x176f2f0.w128.b0", !35, i64 0}
!35 = !{!"0x176f2f0.w256.b0", !36, i64 0}
!36 = !{!"0x176f2f0.w512.b0", !37, i64 0}
!37 = !{!"0x176f2f0.w1024.b0", !38, i64 0}
!38 = !{!"i64", !39, i64 0}
!39 = !{!"0x176f2f0", !20, i64 0}
!40 = !{!41, !41, i64 0}
!41 = !{!"0x176ef70.w1.b0", !42, i64 0}
!42 = !{!"0x176ef70.w2.b0", !43, i64 0}
!43 = !{!"0x176ef70.w4.b0", !44, i64 0}
!44 = !{!"0x176ef70.w8.b0", !45, i64 0}
!45 = !{!"0x176ef70.w16.b0", !46, i64 0}
!46 = !{!"0x176ef70.w32.b0", !47, i64 0}
!47 = !{!"0x176ef70.w64.b0", !48, i64 0}
!48 = !{!"0x176ef70.w128.b0", !49, i64 0}
!49 = !{!"0x176ef70.w256.b0", !50, i64 0}
!50 = !{!"0x176ef70.w512.b0", !51, i64 0}
!51 = !{!"0x176ef70.w1024.b0", !52, i64 0}
!52 = !{!"i64", !53, i64 0}
!53 = !{!"0x176ef70", !20, i64 0}
!54 = !{!55, !55, i64 0}
!55 = !{!"0x1743b30.w1.b0", !56, i64 0}
!56 = !{!"0x1743b30.w2.b0", !57, i64 0}
!57 = !{!"0x1743b30.w4.b0", !58, i64 0}
!58 = !{!"0x1743b30.w8.b0", !59, i64 0}
!59 = !{!"0x1743b30.w16.b0", !60, i64 0}
!60 = !{!"0x1743b30.w32.b0", !61, i64 0}
!61 = !{!"0x1743b30.w64.b0", !62, i64 0}
!62 = !{!"0x1743b30.w128.b0", !63, i64 0}
!63 = !{!"0x1743b30.w256.b0", !64, i64 0}
!64 = !{!"0x1743b30.w512.b0", !65, i64 0}
!65 = !{!"0x1743b30.w1024.b0", !66, i64 0}
!66 = !{!"i64", !67, i64 0}
!67 = !{!"0x1743b30", !20, i64 0}
!68 = !{!69, !69, i64 0}
!69 = !{!"0x176e910.w1.b0", !70, i64 0}
!70 = !{!"0x176e910.w2.b0", !71, i64 0}
!71 = !{!"0x176e910.w4.b0", !72, i64 0}
!72 = !{!"0x176e910.w8.b0", !73, i64 0}
!73 = !{!"0x176e910.w16.b0", !74, i64 0}
!74 = !{!"0x176e910.w32.b0", !75, i64 0}
!75 = !{!"0x176e910.w64.b0", !76, i64 0}
!76 = !{!"0x176e910.w128.b0", !77, i64 0}
!77 = !{!"0x176e910.w256.b0", !78, i64 0}
!78 = !{!"0x176e910.w512.b0", !79, i64 0}
!79 = !{!"0x176e910.w1024.b0", !80, i64 0}
!80 = !{!"i64", !81, i64 0}
!81 = !{!"0x176e910", !20, i64 0}
!82 = !{!83, !83, i64 0}
!83 = !{!"0x1744b30.w1.b0", !84, i64 0}
!84 = !{!"0x1744b30.w2.b0", !85, i64 0}
!85 = !{!"0x1744b30.w4.b0", !86, i64 0}
!86 = !{!"0x1744b30.w8.b0", !87, i64 0}
!87 = !{!"0x1744b30.w16.b0", !88, i64 0}
!88 = !{!"0x1744b30.w32.b0", !89, i64 0}
!89 = !{!"0x1744b30.w64.b0", !90, i64 0}
!90 = !{!"0x1744b30.w128.b0", !91, i64 0}
!91 = !{!"0x1744b30.w256.b0", !92, i64 0}
!92 = !{!"0x1744b30.w512.b0", !93, i64 0}
!93 = !{!"0x1744b30.w1024.b0", !94, i64 0}
!94 = !{!"i64", !95, i64 0}
!95 = !{!"0x1744b30", !20, i64 0}
!96 = !{!97, !97, i64 0}
!97 = !{!"0x176f3b0.w1.b0", !98, i64 0}
!98 = !{!"0x176f3b0.w2.b0", !99, i64 0}
!99 = !{!"0x176f3b0.w4.b0", !100, i64 0}
!100 = !{!"0x176f3b0.w8.b0", !101, i64 0}
!101 = !{!"0x176f3b0.w16.b0", !102, i64 0}
!102 = !{!"0x176f3b0.w32.b0", !103, i64 0}
!103 = !{!"0x176f3b0.w64.b0", !104, i64 0}
!104 = !{!"0x176f3b0.w128.b0", !105, i64 0}
!105 = !{!"0x176f3b0.w256.b0", !106, i64 0}
!106 = !{!"0x176f3b0.w512.b0", !107, i64 0}
!107 = !{!"0x176f3b0.w1024.b0", !108, i64 0}
!108 = !{!"i64", !109, i64 0}
!109 = !{!"0x176f3b0", !20, i64 0}
!110 = !{!111, !111, i64 0}
!111 = !{!"i8", !112, i64 0}
!112 = !{!"0x1744560", !20, i64 0}
!113 = !{!114, !114, i64 0}
!114 = !{!"i8", !115, i64 0}
!115 = !{!"0x1744520", !20, i64 0}
!116 = !{!117, !117, i64 0}
!117 = !{!"i8", !118, i64 0}
!118 = !{!"0x1744760", !20, i64 0}