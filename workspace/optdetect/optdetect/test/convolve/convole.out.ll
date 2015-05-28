; ModuleID = 'convolve.opt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @filter_kernel(i8* %in, i8* %out, float* %kernel, i32 %m, i32 %n, i32 %size_x, i32 %size_y, i32 %s, i32 %kn) #0 {
entry:
  %div = sdiv i32 %kn, 2
  %sub = sub nsw i32 0, %div
  %cmp6 = icmp sle i32 %sub, %div
  br i1 %cmp6, label %for.body.lr.ph, label %for.end15

for.body.lr.ph:                                   ; preds = %entry
  %0 = sub i32 0, %div
  %1 = sext i32 %0 to i64
  %2 = sext i32 %div to i64
  %3 = sext i32 %0 to i64
  %4 = sext i32 %div to i64
  %5 = sext i32 %n to i64
  %6 = sext i32 %size_x to i64
  %7 = sext i32 %m to i64
  br label %for.body

for.body:                                         ; preds = %for.inc13, %for.body.lr.ph
  %indvars.iv14 = phi i64 [ %3, %for.body.lr.ph ], [ %indvars.iv.next15, %for.inc13 ]
  %c.08 = phi i32 [ 0, %for.body.lr.ph ], [ %c.1.lcssa, %for.inc13 ]
  %pixel.07 = phi float [ 0.000000e+00, %for.body.lr.ph ], [ %pixel.1.lcssa, %for.inc13 ]
  %sub1 = sub nsw i32 0, %div
  %cmp31 = icmp sle i32 %sub1, %div
  br i1 %cmp31, label %for.body4.lr.ph, label %for.end

for.body4.lr.ph:                                  ; preds = %for.body
  %8 = sext i32 %c.08 to i64
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.body4.lr.ph
  %indvars.iv12 = phi i64 [ %8, %for.body4.lr.ph ], [ %indvars.iv.next13, %for.inc ]
  %indvars.iv = phi i64 [ %1, %for.body4.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %pixel.12 = phi float [ %pixel.07, %for.body4.lr.ph ], [ %add11, %for.inc ]
  %9 = sub nsw i64 %5, %indvars.iv14
  %10 = mul nsw i64 %9, %6
  %11 = add nsw i64 %10, %7
  %12 = sub nsw i64 %11, %indvars.iv
  %arrayidx = getelementptr inbounds i8* %in, i64 %12
  %13 = load i8* %arrayidx, align 1
  %conv = zext i8 %13 to i32
  %conv7 = sitofp i32 %conv to float
  %indvars.iv.next13 = add nsw i64 %indvars.iv12, 1
  %arrayidx9 = getelementptr inbounds float* %kernel, i64 %indvars.iv12
  %14 = load float* %arrayidx9, align 4
  %mul10 = fmul float %conv7, %14
  %add11 = fadd float %pixel.12, %mul10
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp3 = icmp sle i64 %indvars.iv.next, %2
  br i1 %cmp3, label %for.body4, label %for.cond2.for.end_crit_edge

for.cond2.for.end_crit_edge:                      ; preds = %for.inc
  %split.wide = phi i64 [ %indvars.iv.next13, %for.inc ]
  %split5 = phi float [ %add11, %for.inc ]
  %15 = trunc i64 %split.wide to i32
  br label %for.end

for.end:                                          ; preds = %for.cond2.for.end_crit_edge, %for.body
  %c.1.lcssa = phi i32 [ %15, %for.cond2.for.end_crit_edge ], [ %c.08, %for.body ]
  %pixel.1.lcssa = phi float [ %split5, %for.cond2.for.end_crit_edge ], [ %pixel.07, %for.body ]
  br label %for.inc13

for.inc13:                                        ; preds = %for.end
  %indvars.iv.next15 = add nsw i64 %indvars.iv14, 1
  %cmp = icmp sle i64 %indvars.iv.next15, %4
  br i1 %cmp, label %for.body, label %for.cond.for.end15_crit_edge

for.cond.for.end15_crit_edge:                     ; preds = %for.inc13
  %split10 = phi float [ %pixel.1.lcssa, %for.inc13 ]
  br label %for.end15

for.end15:                                        ; preds = %for.cond.for.end15_crit_edge, %entry
  %pixel.0.lcssa = phi float [ %split10, %for.cond.for.end15_crit_edge ], [ 0.000000e+00, %entry ]
  %conv16 = sitofp i32 %s to float
  %div17 = fdiv float %pixel.0.lcssa, %conv16
  %conv18 = fptoui float %div17 to i8
  %mul19 = mul nsw i32 %n, %size_x
  %add20 = add nsw i32 %mul19, %m
  %idxprom21 = sext i32 %add20 to i64
  %arrayidx22 = getelementptr inbounds i8* %out, i64 %idxprom21
  store i8 %conv18, i8* %arrayidx22, align 1
  ret void
}

; Function Attrs: nounwind uwtable
define void @filter_kernel_2d(i8** %in, i8** %out, float* %kernel, i32 %m, i32 %n, i32 %x, i32 %y, i32 %s, i32 %kn) #0 {
entry:
  %div = sdiv i32 %kn, 2
  %sub = sub nsw i32 0, %div
  %cmp6 = icmp sle i32 %sub, %div
  br i1 %cmp6, label %for.body.lr.ph, label %for.end15

for.body.lr.ph:                                   ; preds = %entry
  %0 = sub i32 0, %div
  %1 = sext i32 %0 to i64
  %2 = sext i32 %div to i64
  %3 = sext i32 %x to i64
  %4 = sext i32 %0 to i64
  %5 = sext i32 %div to i64
  %6 = sext i32 %y to i64
  br label %for.body

for.body:                                         ; preds = %for.inc13, %for.body.lr.ph
  %indvars.iv15 = phi i64 [ %4, %for.body.lr.ph ], [ %indvars.iv.next16, %for.inc13 ]
  %c.08 = phi i32 [ 0, %for.body.lr.ph ], [ %c.1.lcssa, %for.inc13 ]
  %pixel.07 = phi float [ 0.000000e+00, %for.body.lr.ph ], [ %pixel.1.lcssa, %for.inc13 ]
  %sub1 = sub nsw i32 0, %div
  %cmp31 = icmp sle i32 %sub1, %div
  br i1 %cmp31, label %for.body4.lr.ph, label %for.end

for.body4.lr.ph:                                  ; preds = %for.body
  %7 = sext i32 %c.08 to i64
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.body4.lr.ph
  %indvars.iv13 = phi i64 [ %7, %for.body4.lr.ph ], [ %indvars.iv.next14, %for.inc ]
  %indvars.iv = phi i64 [ %1, %for.body4.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %pixel.12 = phi float [ %pixel.07, %for.body4.lr.ph ], [ %add11, %for.inc ]
  %8 = add nsw i64 %3, %indvars.iv
  %9 = add nsw i64 %6, %indvars.iv15
  %arrayidx = getelementptr inbounds i8** %in, i64 %9
  %10 = load i8** %arrayidx, align 8
  %arrayidx7 = getelementptr inbounds i8* %10, i64 %8
  %11 = load i8* %arrayidx7, align 1
  %conv = zext i8 %11 to i32
  %conv8 = sitofp i32 %conv to float
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %arrayidx10 = getelementptr inbounds float* %kernel, i64 %indvars.iv13
  %12 = load float* %arrayidx10, align 4
  %mul = fmul float %conv8, %12
  %add11 = fadd float %pixel.12, %mul
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp3 = icmp sle i64 %indvars.iv.next, %2
  br i1 %cmp3, label %for.body4, label %for.cond2.for.end_crit_edge

for.cond2.for.end_crit_edge:                      ; preds = %for.inc
  %split.wide = phi i64 [ %indvars.iv.next14, %for.inc ]
  %split5 = phi float [ %add11, %for.inc ]
  %13 = trunc i64 %split.wide to i32
  br label %for.end

for.end:                                          ; preds = %for.cond2.for.end_crit_edge, %for.body
  %c.1.lcssa = phi i32 [ %13, %for.cond2.for.end_crit_edge ], [ %c.08, %for.body ]
  %pixel.1.lcssa = phi float [ %split5, %for.cond2.for.end_crit_edge ], [ %pixel.07, %for.body ]
  br label %for.inc13

for.inc13:                                        ; preds = %for.end
  %indvars.iv.next16 = add nsw i64 %indvars.iv15, 1
  %cmp = icmp sle i64 %indvars.iv.next16, %5
  br i1 %cmp, label %for.body, label %for.cond.for.end15_crit_edge

for.cond.for.end15_crit_edge:                     ; preds = %for.inc13
  %split10 = phi float [ %pixel.1.lcssa, %for.inc13 ]
  br label %for.end15

for.end15:                                        ; preds = %for.cond.for.end15_crit_edge, %entry
  %pixel.0.lcssa = phi float [ %split10, %for.cond.for.end15_crit_edge ], [ 0.000000e+00, %entry ]
  %conv16 = sitofp i32 %s to float
  %div17 = fdiv float %pixel.0.lcssa, %conv16
  %conv18 = fptoui float %div17 to i8
  %idxprom19 = sext i32 %x to i64
  %idxprom20 = sext i32 %y to i64
  %arrayidx21 = getelementptr inbounds i8** %out, i64 %idxprom20
  %14 = load i8** %arrayidx21, align 8
  %arrayidx22 = getelementptr inbounds i8* %14, i64 %idxprom19
  store i8 %conv18, i8* %arrayidx22, align 1
  ret void
}

; Function Attrs: nounwind uwtable
define void @filter_kernel_2d_no_indirection(i32 %m, i32 %n, i8* %in, i8* %out, float* %kernel, i32 %x, i32 %y, i32 %s, i32 %kn) #0 {
entry:
  %0 = zext i32 %m to i64
  %1 = zext i32 %n to i64
  %2 = zext i32 %m to i64
  %3 = zext i32 %n to i64
  %div = sdiv i32 %kn, 2
  %sub = sub nsw i32 0, %div
  %cmp6 = icmp sle i32 %sub, %div
  br i1 %cmp6, label %for.body.lr.ph, label %for.end15

for.body.lr.ph:                                   ; preds = %entry
  %4 = sub i32 0, %div
  %5 = sext i32 %4 to i64
  %6 = sext i32 %div to i64
  %7 = sext i32 %x to i64
  %8 = sext i32 %4 to i64
  %9 = sext i32 %div to i64
  %10 = sext i32 %y to i64
  br label %for.body

for.body:                                         ; preds = %for.inc13, %for.body.lr.ph
  %indvars.iv15 = phi i64 [ %8, %for.body.lr.ph ], [ %indvars.iv.next16, %for.inc13 ]
  %c.08 = phi i32 [ 0, %for.body.lr.ph ], [ %c.1.lcssa, %for.inc13 ]
  %pixel.07 = phi float [ 0.000000e+00, %for.body.lr.ph ], [ %pixel.1.lcssa, %for.inc13 ]
  %sub1 = sub nsw i32 0, %div
  %cmp31 = icmp sle i32 %sub1, %div
  br i1 %cmp31, label %for.body4.lr.ph, label %for.end

for.body4.lr.ph:                                  ; preds = %for.body
  %11 = sext i32 %c.08 to i64
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.body4.lr.ph
  %indvars.iv13 = phi i64 [ %11, %for.body4.lr.ph ], [ %indvars.iv.next14, %for.inc ]
  %indvars.iv = phi i64 [ %5, %for.body4.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %pixel.12 = phi float [ %pixel.07, %for.body4.lr.ph ], [ %add11, %for.inc ]
  %12 = add nsw i64 %7, %indvars.iv
  %13 = add nsw i64 %10, %indvars.iv15
  %14 = mul nsw i64 %13, %1
  %arrayidx = getelementptr inbounds i8* %in, i64 %14
  %arrayidx7 = getelementptr inbounds i8* %arrayidx, i64 %12
  %15 = load i8* %arrayidx7, align 1
  %conv = zext i8 %15 to i32
  %conv8 = sitofp i32 %conv to float
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %arrayidx10 = getelementptr inbounds float* %kernel, i64 %indvars.iv13
  %16 = load float* %arrayidx10, align 4
  %mul = fmul float %conv8, %16
  %add11 = fadd float %pixel.12, %mul
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp3 = icmp sle i64 %indvars.iv.next, %6
  br i1 %cmp3, label %for.body4, label %for.cond2.for.end_crit_edge

for.cond2.for.end_crit_edge:                      ; preds = %for.inc
  %split.wide = phi i64 [ %indvars.iv.next14, %for.inc ]
  %split5 = phi float [ %add11, %for.inc ]
  %17 = trunc i64 %split.wide to i32
  br label %for.end

for.end:                                          ; preds = %for.cond2.for.end_crit_edge, %for.body
  %c.1.lcssa = phi i32 [ %17, %for.cond2.for.end_crit_edge ], [ %c.08, %for.body ]
  %pixel.1.lcssa = phi float [ %split5, %for.cond2.for.end_crit_edge ], [ %pixel.07, %for.body ]
  br label %for.inc13

for.inc13:                                        ; preds = %for.end
  %indvars.iv.next16 = add nsw i64 %indvars.iv15, 1
  %cmp = icmp sle i64 %indvars.iv.next16, %9
  br i1 %cmp, label %for.body, label %for.cond.for.end15_crit_edge

for.cond.for.end15_crit_edge:                     ; preds = %for.inc13
  %split10 = phi float [ %pixel.1.lcssa, %for.inc13 ]
  br label %for.end15

for.end15:                                        ; preds = %for.cond.for.end15_crit_edge, %entry
  %pixel.0.lcssa = phi float [ %split10, %for.cond.for.end15_crit_edge ], [ 0.000000e+00, %entry ]
  %conv16 = sitofp i32 %s to float
  %div17 = fdiv float %pixel.0.lcssa, %conv16
  %conv18 = fptoui float %div17 to i8
  %idxprom19 = sext i32 %x to i64
  %idxprom20 = sext i32 %y to i64
  %18 = mul nsw i64 %idxprom20, %3
  %arrayidx21 = getelementptr inbounds i8* %out, i64 %18
  %arrayidx22 = getelementptr inbounds i8* %arrayidx21, i64 %idxprom19
  store i8 %conv18, i8* %arrayidx22, align 1
  ret void
}

; Function Attrs: nounwind uwtable
define void @convolve(i8* %in, i8* %out, float* %kernel, i32 %nx, i32 %ny, i32 %kn) #0 {
entry:
  %div = sdiv i32 %kn, 2
  %sub = sub nsw i32 0, %div
  %cmp10 = icmp sle i32 %sub, %div
  br i1 %cmp10, label %for.body.lr.ph, label %for.end9

for.body.lr.ph:                                   ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.inc7, %for.body.lr.ph
  %j.013 = phi i32 [ %sub, %for.body.lr.ph ], [ %inc8, %for.inc7 ]
  %k.012 = phi i32 [ 0, %for.body.lr.ph ], [ %k.1.lcssa, %for.inc7 ]
  %s.011 = phi i32 [ 0, %for.body.lr.ph ], [ %s.1.lcssa, %for.inc7 ]
  %sub1 = sub nsw i32 0, %div
  %cmp35 = icmp sle i32 %sub1, %div
  br i1 %cmp35, label %for.body4.lr.ph, label %for.end

for.body4.lr.ph:                                  ; preds = %for.body
  %0 = sext i32 %k.012 to i64
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.body4.lr.ph
  %indvars.iv = phi i64 [ %0, %for.body4.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %i.08 = phi i32 [ %sub1, %for.body4.lr.ph ], [ %inc6, %for.inc ]
  %s.16 = phi i32 [ %s.011, %for.body4.lr.ph ], [ %conv5, %for.inc ]
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %arrayidx = getelementptr inbounds float* %kernel, i64 %indvars.iv
  %1 = load float* %arrayidx, align 4
  %conv = sitofp i32 %s.16 to float
  %add = fadd float %conv, %1
  %conv5 = fptosi float %add to i32
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %inc6 = add nsw i32 %i.08, 1
  %cmp3 = icmp sle i32 %inc6, %div
  br i1 %cmp3, label %for.body4, label %for.cond2.for.end_crit_edge

for.cond2.for.end_crit_edge:                      ; preds = %for.inc
  %split.wide = phi i64 [ %indvars.iv.next, %for.inc ]
  %split9 = phi i32 [ %conv5, %for.inc ]
  %2 = trunc i64 %split.wide to i32
  br label %for.end

for.end:                                          ; preds = %for.cond2.for.end_crit_edge, %for.body
  %k.1.lcssa = phi i32 [ %2, %for.cond2.for.end_crit_edge ], [ %k.012, %for.body ]
  %s.1.lcssa = phi i32 [ %split9, %for.cond2.for.end_crit_edge ], [ %s.011, %for.body ]
  br label %for.inc7

for.inc7:                                         ; preds = %for.end
  %inc8 = add nsw i32 %j.013, 1
  %cmp = icmp sle i32 %inc8, %div
  br i1 %cmp, label %for.body, label %for.cond.for.end9_crit_edge

for.cond.for.end9_crit_edge:                      ; preds = %for.inc7
  %split14 = phi i32 [ %s.1.lcssa, %for.inc7 ]
  br label %for.end9

for.end9:                                         ; preds = %for.cond.for.end9_crit_edge, %entry
  %s.0.lcssa = phi i32 [ %split14, %for.cond.for.end9_crit_edge ], [ 0, %entry ]
  %sub11 = sub nsw i32 %nx, %div
  %cmp123 = icmp slt i32 %div, %sub11
  br i1 %cmp123, label %for.body14.lr.ph, label %for.end25

for.body14.lr.ph:                                 ; preds = %for.end9
  %3 = add i32 %ny, -1
  %4 = sub i32 %3, %div
  %5 = add i32 %nx, -1
  %6 = sub i32 %5, %div
  br label %for.body14

for.body14:                                       ; preds = %for.inc23, %for.body14.lr.ph
  %m.04 = phi i32 [ %div, %for.body14.lr.ph ], [ %inc24, %for.inc23 ]
  %sub16 = sub nsw i32 %ny, %div
  %cmp171 = icmp slt i32 %div, %sub16
  br i1 %cmp171, label %for.body19.lr.ph, label %for.end22

for.body19.lr.ph:                                 ; preds = %for.body14
  br label %for.body19

for.body19:                                       ; preds = %for.inc20, %for.body19.lr.ph
  %n.02 = phi i32 [ %div, %for.body19.lr.ph ], [ %inc21, %for.inc20 ]
  call void @filter_kernel(i8* %in, i8* %out, float* %kernel, i32 %m.04, i32 %n.02, i32 %nx, i32 %ny, i32 %s.0.lcssa, i32 %kn)
  br label %for.inc20

for.inc20:                                        ; preds = %for.body19
  %inc21 = add nsw i32 %n.02, 1
  %exitcond = icmp ne i32 %n.02, %4
  br i1 %exitcond, label %for.body19, label %for.cond15.for.end22_crit_edge

for.cond15.for.end22_crit_edge:                   ; preds = %for.inc20
  br label %for.end22

for.end22:                                        ; preds = %for.cond15.for.end22_crit_edge, %for.body14
  br label %for.inc23

for.inc23:                                        ; preds = %for.end22
  %inc24 = add nsw i32 %m.04, 1
  %exitcond15 = icmp ne i32 %m.04, %6
  br i1 %exitcond15, label %for.body14, label %for.cond10.for.end25_crit_edge

for.cond10.for.end25_crit_edge:                   ; preds = %for.inc23
  br label %for.end25

for.end25:                                        ; preds = %for.cond10.for.end25_crit_edge, %for.end9
  ret void
}

define i1 @UseAccelerator() {
entry:
  ret i1 true
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)"}
