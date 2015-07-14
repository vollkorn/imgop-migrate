; ModuleID = 'foo.opt.lr.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @foo(float* nocapture %A) #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %0 = mul i64 %indvars.iv, 3
  %1 = add nuw nsw i64 %0, 15
  %2 = mul nsw i64 %1, %indvars.iv
  %3 = trunc i64 %2 to i32
  %conv = sitofp i32 %3 to float
  %arrayidx = getelementptr inbounds float* %A, i64 %indvars.iv
  store float %conv, float* %arrayidx, align 4, !tbaa !1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 10
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  ret void
}

; Function Attrs: nounwind uwtable
define void @bar([10 x float]* nocapture %A, i32 %a, i32 %b) #0 {
entry:
  %cmp4 = icmp sgt i32 %a, %b
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc16, %entry
  %indvars.iv34 = phi i64 [ 0, %entry ], [ %indvars.iv.next35, %for.inc16 ]
  %0 = mul i64 %indvars.iv34, 3
  %1 = trunc i64 %indvars.iv34 to i32
  %mul9 = mul i32 %1, %a
  br label %for.body3

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %2 = add nuw nsw i64 %indvars.iv, 5
  br i1 %cmp4, label %if.then, label %if.else

if.then:                                          ; preds = %for.body3
  %3 = mul i64 %0, %2
  %4 = trunc i64 %3 to i32
  %conv = sitofp i32 %4 to float
  %arrayidx7 = getelementptr inbounds [10 x float]* %A, i64 %indvars.iv, i64 %indvars.iv34
  store float %conv, float* %arrayidx7, align 4, !tbaa !1
  br label %for.inc

if.else:                                          ; preds = %for.body3
  %5 = trunc i64 %2 to i32
  %mul10 = mul i32 %mul9, %5
  %conv11 = sitofp i32 %mul10 to float
  %arrayidx15 = getelementptr inbounds [10 x float]* %A, i64 %indvars.iv, i64 %indvars.iv34
  store float %conv11, float* %arrayidx15, align 4, !tbaa !1
  br label %for.inc

for.inc:                                          ; preds = %if.else, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 10
  br i1 %exitcond, label %for.inc16, label %for.body3

for.inc16:                                        ; preds = %for.inc
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, 10
  br i1 %exitcond37, label %for.end18, label %for.cond1.preheader

for.end18:                                        ; preds = %for.inc16
  ret void
}

; Function Attrs: nounwind uwtable
define void @foobar(i32 %n, i32 %m, float* nocapture %A) #0 {
entry:
  %0 = zext i32 %m to i64
  %cmp20 = icmp sgt i32 %n, 0
  br i1 %cmp20, label %for.cond1.preheader.lr.ph, label %for.end9

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp218 = icmp sgt i32 %m, 0
  %1 = add i32 %m, -1
  %2 = add i32 %n, -1
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc7, %for.cond1.preheader.lr.ph
  %indvars.iv23 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next24, %for.inc7 ]
  br i1 %cmp218, label %for.body3, label %for.inc7

for.body3:                                        ; preds = %for.cond1.preheader, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3 ], [ 0, %for.cond1.preheader ]
  %3 = trunc i64 %indvars.iv to i32
  %4 = mul i32 %3, 3
  %mul = add i32 %4, 15
  %5 = trunc i64 %indvars.iv23 to i32
  %mul4 = mul nsw i32 %mul, %5
  %conv = sitofp i32 %mul4 to float
  %6 = mul nsw i64 %indvars.iv, %0
  %arrayidx.sum = add nuw nsw i64 %6, %indvars.iv23
  %arrayidx6 = getelementptr inbounds float* %A, i64 %arrayidx.sum
  store float %conv, float* %arrayidx6, align 4, !tbaa !1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv1 = trunc i64 %indvars.iv to i32
  %exitcond2 = icmp eq i32 %lftr.wideiv1, %1
  br i1 %exitcond2, label %for.inc7, label %for.body3

for.inc7:                                         ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %lftr.wideiv = trunc i64 %indvars.iv23 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %2
  br i1 %exitcond, label %for.end9, label %for.cond1.preheader

for.end9:                                         ; preds = %for.inc7, %entry
  ret void
}

; Function Attrs: nounwind uwtable
define void @matrix_multiply(i32 %l, i32 %m, i32 %n, float* nocapture readonly %A, float* nocapture readonly %B, float* nocapture %C) #0 {
entry:
  %0 = zext i32 %m to i64
  %1 = zext i32 %n to i64
  %cmp55 = icmp sgt i32 %l, 0
  br i1 %cmp55, label %for.cond1.preheader.lr.ph, label %for.end30

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp253 = icmp sgt i32 %n, 0
  %cmp751 = icmp sgt i32 %m, 0
  %2 = add i32 %m, -1
  %3 = add i32 %n, -1
  %4 = add i32 %l, -1
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc28, %for.cond1.preheader.lr.ph
  %indvars.iv62 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next63, %for.inc28 ]
  br i1 %cmp253, label %for.body3.lr.ph, label %for.inc28

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  %5 = mul nsw i64 %indvars.iv62, %1
  %6 = mul nsw i64 %indvars.iv62, %0
  br label %for.body3

for.body3:                                        ; preds = %for.inc25, %for.body3.lr.ph
  %indvars.iv57 = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next58, %for.inc25 ]
  %arrayidx.sum = add nuw nsw i64 %indvars.iv57, %5
  %arrayidx5 = getelementptr inbounds float* %C, i64 %arrayidx.sum
  store float 0.000000e+00, float* %arrayidx5, align 4, !tbaa !1
  br i1 %cmp751, label %for.body8.lr.ph, label %for.inc25

for.body8.lr.ph:                                  ; preds = %for.body3
  %7 = mul nsw i64 %indvars.iv57, %1
  br label %for.body8

for.body8:                                        ; preds = %for.body8, %for.body8.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body8.lr.ph ], [ %indvars.iv.next, %for.body8 ]
  %8 = load float* %arrayidx5, align 4, !tbaa !1
  %arrayidx15.sum = add nuw nsw i64 %indvars.iv, %6
  %arrayidx16 = getelementptr inbounds float* %A, i64 %arrayidx15.sum
  %9 = load float* %arrayidx16, align 4, !tbaa !1
  %arrayidx19.sum = add nuw nsw i64 %indvars.iv, %7
  %arrayidx20 = getelementptr inbounds float* %B, i64 %arrayidx19.sum
  %10 = load float* %arrayidx20, align 4, !tbaa !1
  %mul = fmul float %9, %10
  %add = fadd float %8, %mul
  store float %add, float* %arrayidx5, align 4, !tbaa !1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv1 = trunc i64 %indvars.iv to i32
  %exitcond2 = icmp eq i32 %lftr.wideiv1, %2
  br i1 %exitcond2, label %for.inc25, label %for.body8

for.inc25:                                        ; preds = %for.body8, %for.body3
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %lftr.wideiv = trunc i64 %indvars.iv57 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %3
  br i1 %exitcond, label %for.inc28, label %for.body3

for.inc28:                                        ; preds = %for.inc25, %for.cond1.preheader
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %lftr.wideiv3 = trunc i64 %indvars.iv62 to i32
  %exitcond4 = icmp eq i32 %lftr.wideiv3, %4
  br i1 %exitcond4, label %for.end30, label %for.cond1.preheader

for.end30:                                        ; preds = %for.inc28, %entry
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"float", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
