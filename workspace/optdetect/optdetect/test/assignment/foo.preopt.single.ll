; ModuleID = 'foo.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @foobar(i32 %n, i32 %m, float* %A) #0 {
entry:
  %0 = zext i32 %m to i64
  %1 = sext i32 %m to i64
  %2 = sext i32 %n to i64
  %cmp8 = icmp slt i64 0, %2
  br i1 %cmp8, label %for.body.lr.ph, label %for.end9

for.body.lr.ph:                                   ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.inc7
  %indvars.iv49 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next5, %for.inc7 ]
  %cmp26 = icmp slt i64 0, %1
  br i1 %cmp26, label %for.body3.lr.ph, label %for.end

for.body3.lr.ph:                                  ; preds = %for.body
  br label %for.body3

for.body3:                                        ; preds = %for.body3.lr.ph, %for.inc
  %indvars.iv7 = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %3 = add nuw nsw i64 %indvars.iv7, 5
  %4 = mul nsw i64 %3, 3
  %5 = mul nsw i64 %4, %indvars.iv49
  %6 = trunc i64 %5 to i32
  %conv = sitofp i32 %6 to float
  %7 = mul nsw i64 %indvars.iv7, %0
  %arrayidx = getelementptr inbounds float* %A, i64 %7
  %arrayidx6 = getelementptr inbounds float* %arrayidx, i64 %indvars.iv49
  store float %conv, float* %arrayidx6, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv7, 1
  %cmp2 = icmp slt i64 %indvars.iv.next, %1
  br i1 %cmp2, label %for.body3, label %for.cond1.for.end_crit_edge

for.cond1.for.end_crit_edge:                      ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.cond1.for.end_crit_edge, %for.body
  br label %for.inc7

for.inc7:                                         ; preds = %for.end
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv49, 1
  %cmp = icmp slt i64 %indvars.iv.next5, %2
  br i1 %cmp, label %for.body, label %for.cond.for.end9_crit_edge

for.cond.for.end9_crit_edge:                      ; preds = %for.inc7
  br label %for.end9

for.end9:                                         ; preds = %for.cond.for.end9_crit_edge, %entry
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)"}
