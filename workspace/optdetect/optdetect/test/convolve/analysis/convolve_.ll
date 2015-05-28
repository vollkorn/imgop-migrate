; ModuleID = 'convolve.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @convolve(i8* %in, i8* %out, float* %kernel, i32 %nx, i32 %ny, i32 %kn) #0 {
entry:
  %div = sdiv i32 %kn, 2
  %sub = sub nsw i32 %nx, %div
  %sub2 = sub nsw i32 %ny, %div
  %sub5 = sub nsw i32 0, %div
  %sub9 = sub nsw i32 0, %div
  br label %for.cond

for.cond:                                         ; preds = %for.inc32, %entry
  %m.0 = phi i32 [ %div, %entry ], [ %inc33, %for.inc32 ]
  %cmp = icmp slt i32 %m.0, %sub
  br i1 %cmp, label %for.body, label %for.end34

for.body:                                         ; preds = %for.cond
  br label %for.cond1

for.cond1:                                        ; preds = %for.end23, %for.body
  %n.0 = phi i32 [ %div, %for.body ], [ %inc30, %for.end23 ]
  %cmp3 = icmp slt i32 %n.0, %sub2
  br i1 %cmp3, label %for.body4, label %for.inc32

for.body4:                                        ; preds = %for.cond1
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc21, %for.body4
  %pixel.0 = phi float [ 0.000000e+00, %for.body4 ], [ %pixel.1.lcssa, %for.inc21 ]
  %c.0 = phi i32 [ 0, %for.body4 ], [ %c.1.lcssa, %for.inc21 ]
  %j.0 = phi i32 [ %sub5, %for.body4 ], [ %inc22, %for.inc21 ]
  %cmp7 = icmp sle i32 %j.0, %div
  br i1 %cmp7, label %for.body8, label %for.end23

for.body8:                                        ; preds = %for.cond6
  %sub13 = sub nsw i32 %n.0, %j.0
  %mul = mul nsw i32 %sub13, %nx
  %add = add nsw i32 %mul, %m.0
  br label %for.cond10

for.cond10:                                       ; preds = %for.body12, %for.body8
  %pixel.1 = phi float [ %pixel.0, %for.body8 ], [ %add19, %for.body12 ]
  %c.1 = phi i32 [ %c.0, %for.body8 ], [ %inc, %for.body12 ]
  %i.0 = phi i32 [ %sub9, %for.body8 ], [ %inc20, %for.body12 ]
  %cmp11 = icmp sle i32 %i.0, %div
  br i1 %cmp11, label %for.body12, label %for.inc21

for.body12:                                       ; preds = %for.cond10
  %sub14 = sub nsw i32 %add, %i.0
  %idxprom = sext i32 %sub14 to i64
  %arrayidx = getelementptr inbounds i8* %in, i64 %idxprom
  %0 = load i8* %arrayidx, align 1
  %conv = zext i8 %0 to i32
  %conv15 = sitofp i32 %conv to float
  %inc = add nsw i32 %c.1, 1
  %idxprom16 = sext i32 %c.1 to i64
  %arrayidx17 = getelementptr inbounds float* %kernel, i64 %idxprom16
  %1 = load float* %arrayidx17, align 4
  %mul18 = fmul float %conv15, %1
  %add19 = fadd float %pixel.1, %mul18
  %inc20 = add nsw i32 %i.0, 1
  br label %for.cond10

for.inc21:                                        ; preds = %for.cond10
  %c.1.lcssa = phi i32 [ %c.1, %for.cond10 ]
  %pixel.1.lcssa = phi float [ %pixel.1, %for.cond10 ]
  %inc22 = add nsw i32 %j.0, 1
  br label %for.cond6

for.end23:                                        ; preds = %for.cond6
  %pixel.0.lcssa = phi float [ %pixel.0, %for.cond6 ]
  %conv24 = fptoui float %pixel.0.lcssa to i8
  %mul25 = mul nsw i32 %n.0, %nx
  %add26 = add nsw i32 %mul25, %m.0
  %idxprom27 = sext i32 %add26 to i64
  %arrayidx28 = getelementptr inbounds i8* %out, i64 %idxprom27
  store i8 %conv24, i8* %arrayidx28, align 1
  %inc30 = add nsw i32 %n.0, 1
  br label %for.cond1

for.inc32:                                        ; preds = %for.cond1
  %inc33 = add nsw i32 %m.0, 1
  br label %for.cond

for.end34:                                        ; preds = %for.cond
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (http://llvm.org/git/clang.git 33947ed22c57e11e7aa88e803bfdd664fe50412f) (http://llvm.org/git/llvm.git 186332c0c98aab21acb91ae11055e44ec1acb95a)"}
