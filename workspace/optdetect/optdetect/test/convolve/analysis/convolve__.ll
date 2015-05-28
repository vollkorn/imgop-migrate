; ModuleID = 'convolve_.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @convolve(i8* %in, i8* %out, float* %kernel, i32 %nx, i32 %ny, i32 %kn) #0 {
  %1 = sdiv i32 %kn, 2
  %2 = sub nsw i32 %nx, %1
  %3 = sub nsw i32 %ny, %1
  %4 = sub nsw i32 0, %1
  %5 = sub nsw i32 0, %1
  br label %6

; <label>:6                                       ; preds = %Flow2, %0
  %m.0 = phi i32 [ %1, %0 ], [ %40, %Flow2 ]
  %7 = icmp slt i32 %m.0, %2
  br i1 %7, label %8, label %Flow3

; <label>:8                                       ; preds = %6
  br label %9

; <label>:9                                       ; preds = %Flow1, %8
  %n.0 = phi i32 [ %1, %8 ], [ %39, %Flow1 ]
  %10 = icmp slt i32 %n.0, %3
  br i1 %10, label %11, label %Flow2

; <label>:11                                      ; preds = %9
  br label %12

; <label>:12                                      ; preds = %Flow, %11
  %pixel.0 = phi float [ 0.000000e+00, %11 ], [ %pixel.1, %Flow ]
  %c.0 = phi i32 [ 0, %11 ], [ %c.1, %Flow ]
  %j.0 = phi i32 [ %4, %11 ], [ %33, %Flow ]
  %13 = icmp sle i32 %j.0, %1
  br i1 %13, label %14, label %Flow1

; <label>:14                                      ; preds = %12
  %15 = sub nsw i32 %n.0, %j.0
  %16 = mul nsw i32 %15, %nx
  %17 = add nsw i32 %16, %m.0
  br label %18

; <label>:18                                      ; preds = %.critedge6, %14
  %pixel.1 = phi float [ %pixel.0, %14 ], [ %31, %.critedge6 ]
  %c.1 = phi i32 [ %c.0, %14 ], [ %26, %.critedge6 ]
  %i.0 = phi i32 [ %5, %14 ], [ %32, %.critedge6 ]
  %19 = icmp sle i32 %i.0, %1
  br i1 %19, label %.critedge6, label %Flow

.critedge6:                                       ; preds = %18
  %20 = sub nsw i32 %17, %i.0
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i8* %in, i64 %21
  %23 = load i8* %22, align 1
  %24 = zext i8 %23 to i32
  %25 = sitofp i32 %24 to float
  %26 = add nsw i32 %c.1, 1
  %27 = sext i32 %c.1 to i64
  %28 = getelementptr inbounds float* %kernel, i64 %27
  %29 = load float* %28, align 4
  %30 = fmul float %25, %29
  %31 = fadd float %pixel.1, %30
  %32 = add nsw i32 %i.0, 1
  br label %18

Flow:                                             ; preds = %18
  %33 = add nsw i32 %j.0, 1
  br label %12

Flow1:                                            ; preds = %12
  %34 = fptoui float %pixel.0 to i8
  %35 = mul nsw i32 %n.0, %nx
  %36 = add nsw i32 %35, %m.0
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i8* %out, i64 %37
  store i8 %34, i8* %38, align 1
  %39 = add nsw i32 %n.0, 1
  br label %9

Flow2:                                            ; preds = %9
  %40 = add nsw i32 %m.0, 1
  br label %6

Flow3:                                            ; preds = %6
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)"}
