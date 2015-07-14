; ModuleID = 'transformation.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @foo(i32 %l, i32 %n, i32 %m, i32* %R) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %cmp6 = icmp sgt i32 %l, 0
  br i1 %cmp6, label %for.cond1.preheader.lr.ph, label %for.end12

for.cond1.preheader.lr.ph:                        ; preds = %entry.split
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.inc10
  %i.07 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc11, %for.inc10 ]
  %cmp23 = icmp sgt i32 %n, 0
  br i1 %cmp23, label %for.cond4.preheader.lr.ph, label %for.inc10

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.cond4.preheader.lr.ph, %for.inc7
  %k.04 = phi i32 [ 0, %for.cond4.preheader.lr.ph ], [ %inc8, %for.inc7 ]
  %cmp51 = icmp sgt i32 %m, 0
  br i1 %cmp51, label %for.body6.lr.ph, label %for.inc7

for.body6.lr.ph:                                  ; preds = %for.cond4.preheader
  br label %for.body6

for.body6:                                        ; preds = %for.body6.lr.ph, %for.body6
  %j.02 = phi i32 [ 0, %for.body6.lr.ph ], [ %inc, %for.body6 ]
  %0 = load i32* %R, align 4
  %add = add nsw i32 %0, 1
  store i32 %add, i32* %R, align 4
  %inc = add nsw i32 %j.02, 1
  %cmp5 = icmp slt i32 %inc, %m
  br i1 %cmp5, label %for.body6, label %for.cond4.for.inc7_crit_edge

for.cond4.for.inc7_crit_edge:                     ; preds = %for.body6
  br label %for.inc7

for.inc7:                                         ; preds = %for.cond4.for.inc7_crit_edge, %for.cond4.preheader
  %inc8 = add nsw i32 %k.04, 1
  %cmp2 = icmp slt i32 %inc8, %n
  br i1 %cmp2, label %for.cond4.preheader, label %for.cond1.for.inc10_crit_edge

for.cond1.for.inc10_crit_edge:                    ; preds = %for.inc7
  br label %for.inc10

for.inc10:                                        ; preds = %for.cond1.for.inc10_crit_edge, %for.cond1.preheader
  %inc11 = add nsw i32 %i.07, 1
  %cmp = icmp slt i32 %inc11, %l
  br i1 %cmp, label %for.cond1.preheader, label %for.cond.for.end12_crit_edge

for.cond.for.end12_crit_edge:                     ; preds = %for.inc10
  br label %for.end12

for.end12:                                        ; preds = %for.cond.for.end12_crit_edge, %entry.split
  ret void
}

; Function Attrs: nounwind uwtable
define void @matrix_multiply(i32 %l, i32 %m, i32 %n, float* %A, float* %B, float* %C) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %0 = zext i32 %m to i64
  %1 = zext i32 %n to i64
  %2 = zext i32 %n to i64
  %cmp9 = icmp sgt i32 %l, 0
  br i1 %cmp9, label %for.cond1.preheader.lr.ph, label %for.cond9.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry.split
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.inc6
  %i.010 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc7, %for.inc6 ]
  %cmp27 = icmp sgt i32 %n, 0
  br i1 %cmp27, label %for.body3.lr.ph, label %for.inc6

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  br label %for.body3

for.cond.for.cond9.preheader_crit_edge:           ; preds = %for.inc6
  br label %for.cond9.preheader

for.cond9.preheader:                              ; preds = %for.cond.for.cond9.preheader_crit_edge, %entry.split
  %cmp105 = icmp sgt i32 %l, 0
  br i1 %cmp105, label %for.cond12.preheader.lr.ph, label %for.end46

for.cond12.preheader.lr.ph:                       ; preds = %for.cond9.preheader
  br label %for.cond12.preheader

for.body3:                                        ; preds = %for.body3.lr.ph, %for.body3
  %k.08 = phi i32 [ 0, %for.body3.lr.ph ], [ %inc, %for.body3 ]
  %idxprom = sext i32 %k.08 to i64
  %idxprom4 = sext i32 %i.010 to i64
  %3 = mul nsw i64 %idxprom4, %2
  %arrayidx.sum = add i64 %idxprom, %3
  %arrayidx5 = getelementptr inbounds float* %C, i64 %arrayidx.sum
  store float 0.000000e+00, float* %arrayidx5, align 4
  %inc = add nsw i32 %k.08, 1
  %cmp2 = icmp slt i32 %inc, %n
  br i1 %cmp2, label %for.body3, label %for.cond1.for.inc6_crit_edge

for.cond1.for.inc6_crit_edge:                     ; preds = %for.body3
  br label %for.inc6

for.inc6:                                         ; preds = %for.cond1.for.inc6_crit_edge, %for.cond1.preheader
  %inc7 = add nsw i32 %i.010, 1
  %cmp = icmp slt i32 %inc7, %l
  br i1 %cmp, label %for.cond1.preheader, label %for.cond.for.cond9.preheader_crit_edge

for.cond12.preheader:                             ; preds = %for.cond12.preheader.lr.ph, %for.inc44
  %i.16 = phi i32 [ 0, %for.cond12.preheader.lr.ph ], [ %inc45, %for.inc44 ]
  %cmp133 = icmp sgt i32 %l, 0
  br i1 %cmp133, label %for.body14.lr.ph, label %for.inc44

for.body14.lr.ph:                                 ; preds = %for.cond12.preheader
  br label %for.body14

for.body14:                                       ; preds = %for.body14.lr.ph, %for.inc41
  %j.04 = phi i32 [ 0, %for.body14.lr.ph ], [ %inc42, %for.inc41 ]
  %idxprom15 = sext i32 %j.04 to i64
  %idxprom16 = sext i32 %i.16 to i64
  %4 = mul nsw i64 %idxprom16, %2
  %arrayidx17.sum = add i64 %idxprom15, %4
  %arrayidx18 = getelementptr inbounds float* %C, i64 %arrayidx17.sum
  store float 0.000000e+00, float* %arrayidx18, align 4
  %cmp201 = icmp sgt i32 %l, 0
  br i1 %cmp201, label %for.body21.lr.ph, label %for.inc41

for.body21.lr.ph:                                 ; preds = %for.body14
  br label %for.body21

for.body21:                                       ; preds = %for.body21.lr.ph, %for.body21
  %k.12 = phi i32 [ 0, %for.body21.lr.ph ], [ %inc39, %for.body21 ]
  %idxprom22 = sext i32 %j.04 to i64
  %idxprom23 = sext i32 %i.16 to i64
  %5 = mul nsw i64 %idxprom23, %2
  %arrayidx24.sum = add i64 %idxprom22, %5
  %arrayidx25 = getelementptr inbounds float* %C, i64 %arrayidx24.sum
  %6 = load float* %arrayidx25, align 4
  %idxprom26 = sext i32 %k.12 to i64
  %idxprom27 = sext i32 %i.16 to i64
  %7 = mul nsw i64 %idxprom27, %0
  %arrayidx28.sum = add i64 %idxprom26, %7
  %arrayidx29 = getelementptr inbounds float* %A, i64 %arrayidx28.sum
  %8 = load float* %arrayidx29, align 4
  %idxprom30 = sext i32 %j.04 to i64
  %idxprom31 = sext i32 %k.12 to i64
  %9 = mul nsw i64 %idxprom31, %1
  %arrayidx32.sum = add i64 %9, %idxprom30
  %arrayidx33 = getelementptr inbounds float* %B, i64 %arrayidx32.sum
  %10 = load float* %arrayidx33, align 4
  %mul = fmul float %8, %10
  %add = fadd float %6, %mul
  %idxprom34 = sext i32 %j.04 to i64
  %idxprom35 = sext i32 %i.16 to i64
  %11 = mul nsw i64 %idxprom35, %2
  %arrayidx36.sum = add i64 %idxprom34, %11
  %arrayidx37 = getelementptr inbounds float* %C, i64 %arrayidx36.sum
  store float %add, float* %arrayidx37, align 4
  %inc39 = add nsw i32 %k.12, 1
  %cmp20 = icmp slt i32 %inc39, %l
  br i1 %cmp20, label %for.body21, label %for.cond19.for.inc41_crit_edge

for.cond19.for.inc41_crit_edge:                   ; preds = %for.body21
  br label %for.inc41

for.inc41:                                        ; preds = %for.cond19.for.inc41_crit_edge, %for.body14
  %inc42 = add nsw i32 %j.04, 1
  %cmp13 = icmp slt i32 %inc42, %l
  br i1 %cmp13, label %for.body14, label %for.cond12.for.inc44_crit_edge

for.cond12.for.inc44_crit_edge:                   ; preds = %for.inc41
  br label %for.inc44

for.inc44:                                        ; preds = %for.cond12.for.inc44_crit_edge, %for.cond12.preheader
  %inc45 = add nsw i32 %i.16, 1
  %cmp10 = icmp slt i32 %inc45, %l
  br i1 %cmp10, label %for.cond12.preheader, label %for.cond9.for.end46_crit_edge

for.cond9.for.end46_crit_edge:                    ; preds = %for.inc44
  br label %for.end46

for.end46:                                        ; preds = %for.cond9.for.end46_crit_edge, %for.cond9.preheader
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)"}
