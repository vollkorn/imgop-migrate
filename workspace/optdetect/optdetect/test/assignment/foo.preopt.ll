; ModuleID = 'foo.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @foo(float* %A) #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %entry, %for.inc
  %i.05 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %indvars.iv4 = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc ]
  %0 = add nuw nsw i64 %indvars.iv4, 5
  %add = add nuw nsw i32 %i.05, 5
  %mul = mul nsw i32 %add, 3
  %1 = sext i32 %mul to i64
  %2 = mul nsw i64 %1, %indvars.iv4
  %3 = trunc i64 %2 to i32
  %conv = sitofp i32 %3 to float
  %arrayidx = getelementptr inbounds float* %A, i64 %indvars.iv4
  store float %conv, float* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %indvars.iv.next = add nuw nsw i64 %indvars.iv4, 1
  %inc = add nuw nsw i32 %i.05, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 10
  br i1 %exitcond, label %for.body, label %for.end

for.end:                                          ; preds = %for.inc
  ret void
}

; Function Attrs: nounwind uwtable
define void @bar([10 x float]* %A, i32 %a, i32 %b) #0 {
entry:
  %0 = sext i32 %a to i64
  br label %for.body

for.body:                                         ; preds = %entry, %for.inc16
  %indvars.iv711 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.inc16 ]
  br label %for.body3

for.body3:                                        ; preds = %for.body, %for.inc
  %indvars.iv10 = phi i64 [ 0, %for.body ], [ %indvars.iv.next, %for.inc ]
  %cmp4 = icmp sgt i32 %a, %b
  br i1 %cmp4, label %if.then, label %if.else

if.then:                                          ; preds = %for.body3
  %1 = add nuw nsw i64 %indvars.iv10, 5
  %2 = mul nsw i64 %1, 3
  %3 = mul nsw i64 %2, %indvars.iv711
  %4 = trunc i64 %3 to i32
  %conv = sitofp i32 %4 to float
  %arrayidx = getelementptr inbounds [10 x float]* %A, i64 %indvars.iv10
  %arrayidx7 = getelementptr inbounds [10 x float]* %arrayidx, i32 0, i64 %indvars.iv711
  store float %conv, float* %arrayidx7, align 4
  br label %if.end

if.else:                                          ; preds = %for.body3
  %5 = add nuw nsw i64 %indvars.iv10, 5
  %6 = mul nsw i64 %5, %0
  %7 = mul nsw i64 %6, %indvars.iv711
  %8 = trunc i64 %7 to i32
  %conv11 = sitofp i32 %8 to float
  %arrayidx14 = getelementptr inbounds [10 x float]* %A, i64 %indvars.iv10
  %arrayidx15 = getelementptr inbounds [10 x float]* %arrayidx14, i32 0, i64 %indvars.iv711
  store float %conv11, float* %arrayidx15, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %indvars.iv.next = add nuw nsw i64 %indvars.iv10, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 10
  br i1 %exitcond, label %for.body3, label %for.end

for.end:                                          ; preds = %for.inc
  br label %for.inc16

for.inc16:                                        ; preds = %for.end
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv711, 1
  %exitcond9 = icmp ne i64 %indvars.iv.next8, 10
  br i1 %exitcond9, label %for.body, label %for.end18

for.end18:                                        ; preds = %for.inc16
  ret void
}

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

; Function Attrs: nounwind uwtable
define void @matrix_multiply(i32 %l, i32 %m, i32 %n, float* %A, float* %B, float* %C) #0 {
entry:
  %0 = zext i32 %m to i64
  %1 = zext i32 %n to i64
  %2 = sext i32 %m to i64
  %3 = sext i32 %n to i64
  %4 = sext i32 %l to i64
  %cmp10 = icmp slt i64 0, %4
  br i1 %cmp10, label %for.body.lr.ph, label %for.end30

for.body.lr.ph:                                   ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.inc28
  %indvars.iv311 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next4, %for.inc28 ]
  %cmp27 = icmp slt i64 0, %3
  br i1 %cmp27, label %for.body3.lr.ph, label %for.end27

for.body3.lr.ph:                                  ; preds = %for.body
  br label %for.body3

for.body3:                                        ; preds = %for.body3.lr.ph, %for.inc25
  %indvars.iv18 = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next2, %for.inc25 ]
  %5 = mul nsw i64 %indvars.iv311, %1
  %arrayidx = getelementptr inbounds float* %C, i64 %5
  %arrayidx5 = getelementptr inbounds float* %arrayidx, i64 %indvars.iv18
  store float 0.000000e+00, float* %arrayidx5, align 4
  %cmp75 = icmp slt i64 0, %2
  br i1 %cmp75, label %for.body8.lr.ph, label %for.end

for.body8.lr.ph:                                  ; preds = %for.body3
  br label %for.body8

for.body8:                                        ; preds = %for.body8.lr.ph, %for.inc
  %indvars.iv6 = phi i64 [ 0, %for.body8.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %6 = load float* %arrayidx5, align 4
  %7 = mul nsw i64 %indvars.iv311, %0
  %arrayidx15 = getelementptr inbounds float* %A, i64 %7
  %arrayidx16 = getelementptr inbounds float* %arrayidx15, i64 %indvars.iv6
  %8 = load float* %arrayidx16, align 4
  %9 = mul nsw i64 %indvars.iv18, %1
  %arrayidx19 = getelementptr inbounds float* %B, i64 %9
  %arrayidx20 = getelementptr inbounds float* %arrayidx19, i64 %indvars.iv6
  %10 = load float* %arrayidx20, align 4
  %mul = fmul float %8, %10
  %add = fadd float %6, %mul
  store float %add, float* %arrayidx5, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %cmp7 = icmp slt i64 %indvars.iv.next, %2
  br i1 %cmp7, label %for.body8, label %for.cond6.for.end_crit_edge

for.cond6.for.end_crit_edge:                      ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.cond6.for.end_crit_edge, %for.body3
  br label %for.inc25

for.inc25:                                        ; preds = %for.end
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv18, 1
  %cmp2 = icmp slt i64 %indvars.iv.next2, %3
  br i1 %cmp2, label %for.body3, label %for.cond1.for.end27_crit_edge

for.cond1.for.end27_crit_edge:                    ; preds = %for.inc25
  br label %for.end27

for.end27:                                        ; preds = %for.cond1.for.end27_crit_edge, %for.body
  br label %for.inc28

for.inc28:                                        ; preds = %for.end27
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv311, 1
  %cmp = icmp slt i64 %indvars.iv.next4, %4
  br i1 %cmp, label %for.body, label %for.cond.for.end30_crit_edge

for.cond.for.end30_crit_edge:                     ; preds = %for.inc28
  br label %for.end30

for.end30:                                        ; preds = %for.cond.for.end30_crit_edge, %entry
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)"}
