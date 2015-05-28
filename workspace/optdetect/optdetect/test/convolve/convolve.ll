; ModuleID = 'convolve.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @filter_kernel(i8* %in, i8* %out, float* %kernel, i32 %m, i32 %n, i32 %size_x, i32 %size_y, i32 %s, i32 %kn) #0 {
entry:
  %div = sdiv i32 %kn, 2
  %sub = sub nsw i32 0, %div
  br label %for.cond

for.cond:                                         ; preds = %for.inc13, %entry
  %pixel.0 = phi float [ 0.000000e+00, %entry ], [ %pixel.1, %for.inc13 ]
  %c.0 = phi i32 [ 0, %entry ], [ %c.1, %for.inc13 ]
  %j.0 = phi i32 [ %sub, %entry ], [ %inc14, %for.inc13 ]
  %cmp = icmp sle i32 %j.0, %div
  br i1 %cmp, label %for.body, label %for.end15

for.body:                                         ; preds = %for.cond
  %sub1 = sub nsw i32 0, %div
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %pixel.1 = phi float [ %pixel.0, %for.body ], [ %add11, %for.inc ]
  %c.1 = phi i32 [ %c.0, %for.body ], [ %inc, %for.inc ]
  %i.0 = phi i32 [ %sub1, %for.body ], [ %inc12, %for.inc ]
  %cmp3 = icmp sle i32 %i.0, %div
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %sub5 = sub nsw i32 %n, %j.0
  %mul = mul nsw i32 %sub5, %size_x
  %add = add nsw i32 %mul, %m
  %sub6 = sub nsw i32 %add, %i.0
  %idxprom = sext i32 %sub6 to i64
  %arrayidx = getelementptr inbounds i8* %in, i64 %idxprom
  %0 = load i8* %arrayidx, align 1
  %conv = zext i8 %0 to i32
  %conv7 = sitofp i32 %conv to float
  %inc = add nsw i32 %c.1, 1
  %idxprom8 = sext i32 %c.1 to i64
  %arrayidx9 = getelementptr inbounds float* %kernel, i64 %idxprom8
  %1 = load float* %arrayidx9, align 4
  %mul10 = fmul float %conv7, %1
  %add11 = fadd float %pixel.1, %mul10
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %inc12 = add nsw i32 %i.0, 1
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc13

for.inc13:                                        ; preds = %for.end
  %inc14 = add nsw i32 %j.0, 1
  br label %for.cond

for.end15:                                        ; preds = %for.cond
  %conv16 = sitofp i32 %s to float
  %div17 = fdiv float %pixel.0, %conv16
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
  br label %for.cond

for.cond:                                         ; preds = %for.inc13, %entry
  %pixel.0 = phi float [ 0.000000e+00, %entry ], [ %pixel.1, %for.inc13 ]
  %c.0 = phi i32 [ 0, %entry ], [ %c.1, %for.inc13 ]
  %j.0 = phi i32 [ %sub, %entry ], [ %inc14, %for.inc13 ]
  %cmp = icmp sle i32 %j.0, %div
  br i1 %cmp, label %for.body, label %for.end15

for.body:                                         ; preds = %for.cond
  %sub1 = sub nsw i32 0, %div
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %pixel.1 = phi float [ %pixel.0, %for.body ], [ %add11, %for.inc ]
  %c.1 = phi i32 [ %c.0, %for.body ], [ %inc, %for.inc ]
  %i.0 = phi i32 [ %sub1, %for.body ], [ %inc12, %for.inc ]
  %cmp3 = icmp sle i32 %i.0, %div
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %add = add nsw i32 %x, %i.0
  %idxprom = sext i32 %add to i64
  %add5 = add nsw i32 %y, %j.0
  %idxprom6 = sext i32 %add5 to i64
  %arrayidx = getelementptr inbounds i8** %in, i64 %idxprom6
  %0 = load i8** %arrayidx, align 8
  %arrayidx7 = getelementptr inbounds i8* %0, i64 %idxprom
  %1 = load i8* %arrayidx7, align 1
  %conv = zext i8 %1 to i32
  %conv8 = sitofp i32 %conv to float
  %inc = add nsw i32 %c.1, 1
  %idxprom9 = sext i32 %c.1 to i64
  %arrayidx10 = getelementptr inbounds float* %kernel, i64 %idxprom9
  %2 = load float* %arrayidx10, align 4
  %mul = fmul float %conv8, %2
  %add11 = fadd float %pixel.1, %mul
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %inc12 = add nsw i32 %i.0, 1
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc13

for.inc13:                                        ; preds = %for.end
  %inc14 = add nsw i32 %j.0, 1
  br label %for.cond

for.end15:                                        ; preds = %for.cond
  %conv16 = sitofp i32 %s to float
  %div17 = fdiv float %pixel.0, %conv16
  %conv18 = fptoui float %div17 to i8
  %idxprom19 = sext i32 %x to i64
  %idxprom20 = sext i32 %y to i64
  %arrayidx21 = getelementptr inbounds i8** %out, i64 %idxprom20
  %3 = load i8** %arrayidx21, align 8
  %arrayidx22 = getelementptr inbounds i8* %3, i64 %idxprom19
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
  br label %for.cond

for.cond:                                         ; preds = %for.inc13, %entry
  %pixel.0 = phi float [ 0.000000e+00, %entry ], [ %pixel.1, %for.inc13 ]
  %c.0 = phi i32 [ 0, %entry ], [ %c.1, %for.inc13 ]
  %j.0 = phi i32 [ %sub, %entry ], [ %inc14, %for.inc13 ]
  %cmp = icmp sle i32 %j.0, %div
  br i1 %cmp, label %for.body, label %for.end15

for.body:                                         ; preds = %for.cond
  %sub1 = sub nsw i32 0, %div
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %pixel.1 = phi float [ %pixel.0, %for.body ], [ %add11, %for.inc ]
  %c.1 = phi i32 [ %c.0, %for.body ], [ %inc, %for.inc ]
  %i.0 = phi i32 [ %sub1, %for.body ], [ %inc12, %for.inc ]
  %cmp3 = icmp sle i32 %i.0, %div
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %add = add nsw i32 %x, %i.0
  %idxprom = sext i32 %add to i64
  %add5 = add nsw i32 %y, %j.0
  %idxprom6 = sext i32 %add5 to i64
  %4 = mul nsw i64 %idxprom6, %1
  %arrayidx = getelementptr inbounds i8* %in, i64 %4
  %arrayidx7 = getelementptr inbounds i8* %arrayidx, i64 %idxprom
  %5 = load i8* %arrayidx7, align 1
  %conv = zext i8 %5 to i32
  %conv8 = sitofp i32 %conv to float
  %inc = add nsw i32 %c.1, 1
  %idxprom9 = sext i32 %c.1 to i64
  %arrayidx10 = getelementptr inbounds float* %kernel, i64 %idxprom9
  %6 = load float* %arrayidx10, align 4
  %mul = fmul float %conv8, %6
  %add11 = fadd float %pixel.1, %mul
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %inc12 = add nsw i32 %i.0, 1
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc13

for.inc13:                                        ; preds = %for.end
  %inc14 = add nsw i32 %j.0, 1
  br label %for.cond

for.end15:                                        ; preds = %for.cond
  %conv16 = sitofp i32 %s to float
  %div17 = fdiv float %pixel.0, %conv16
  %conv18 = fptoui float %div17 to i8
  %idxprom19 = sext i32 %x to i64
  %idxprom20 = sext i32 %y to i64
  %7 = mul nsw i64 %idxprom20, %3
  %arrayidx21 = getelementptr inbounds i8* %out, i64 %7
  %arrayidx22 = getelementptr inbounds i8* %arrayidx21, i64 %idxprom19
  store i8 %conv18, i8* %arrayidx22, align 1
  ret void
}

; Function Attrs: nounwind uwtable
define void @convolve(i8* %in, i8* %out, float* %kernel, i32 %nx, i32 %ny, i32 %kn) #0 {
entry:
  %div = sdiv i32 %kn, 2
  %sub = sub nsw i32 0, %div
  br label %for.cond

for.cond:                                         ; preds = %for.inc7, %entry
  %s.0 = phi i32 [ 0, %entry ], [ %s.1, %for.inc7 ]
  %k.0 = phi i32 [ 0, %entry ], [ %k.1, %for.inc7 ]
  %j.0 = phi i32 [ %sub, %entry ], [ %inc8, %for.inc7 ]
  %cmp = icmp sle i32 %j.0, %div
  br i1 %cmp, label %for.body, label %for.end9

for.body:                                         ; preds = %for.cond
  %sub1 = sub nsw i32 0, %div
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %s.1 = phi i32 [ %s.0, %for.body ], [ %conv5, %for.inc ]
  %k.1 = phi i32 [ %k.0, %for.body ], [ %inc, %for.inc ]
  %i.0 = phi i32 [ %sub1, %for.body ], [ %inc6, %for.inc ]
  %cmp3 = icmp sle i32 %i.0, %div
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %inc = add nsw i32 %k.1, 1
  %idxprom = sext i32 %k.1 to i64
  %arrayidx = getelementptr inbounds float* %kernel, i64 %idxprom
  %0 = load float* %arrayidx, align 4
  %conv = sitofp i32 %s.1 to float
  %add = fadd float %conv, %0
  %conv5 = fptosi float %add to i32
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %inc6 = add nsw i32 %i.0, 1
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc7

for.inc7:                                         ; preds = %for.end
  %inc8 = add nsw i32 %j.0, 1
  br label %for.cond

for.end9:                                         ; preds = %for.cond
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc23, %for.end9
  %m.0 = phi i32 [ %div, %for.end9 ], [ %inc24, %for.inc23 ]
  %sub11 = sub nsw i32 %nx, %div
  %cmp12 = icmp slt i32 %m.0, %sub11
  br i1 %cmp12, label %for.body14, label %for.end25

for.body14:                                       ; preds = %for.cond10
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc20, %for.body14
  %n.0 = phi i32 [ %div, %for.body14 ], [ %inc21, %for.inc20 ]
  %sub16 = sub nsw i32 %ny, %div
  %cmp17 = icmp slt i32 %n.0, %sub16
  br i1 %cmp17, label %for.body19, label %for.end22

for.body19:                                       ; preds = %for.cond15
  call void @filter_kernel(i8* %in, i8* %out, float* %kernel, i32 %m.0, i32 %n.0, i32 %nx, i32 %ny, i32 %s.0, i32 %kn)
  br label %for.inc20

for.inc20:                                        ; preds = %for.body19
  %inc21 = add nsw i32 %n.0, 1
  br label %for.cond15

for.end22:                                        ; preds = %for.cond15
  br label %for.inc23

for.inc23:                                        ; preds = %for.end22
  %inc24 = add nsw i32 %m.0, 1
  br label %for.cond10

for.end25:                                        ; preds = %for.cond10
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)"}
