; ModuleID = 'arraccess.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @foo(i64 %n, i64 %m, double* %A) #0 {
entry:
  %cmp3 = icmp slt i64 0, %n
  br i1 %cmp3, label %for.body.lr.ph, label %for.end7

for.body.lr.ph:                                   ; preds = %entry
  %0 = add i64 %m, -1
  %1 = add i64 %n, -1
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.inc5
  %i.04 = phi i64 [ 0, %for.body.lr.ph ], [ %inc6, %for.inc5 ]
  %cmp21 = icmp slt i64 0, %m
  br i1 %cmp21, label %for.body3.lr.ph, label %for.end

for.body3.lr.ph:                                  ; preds = %for.body
  br label %for.body3

for.body3:                                        ; preds = %for.body3.lr.ph, %for.inc
  %j.02 = phi i64 [ 0, %for.body3.lr.ph ], [ %inc, %for.inc ]
  %2 = mul nsw i64 %i.04, %m
  %arrayidx = getelementptr inbounds double* %A, i64 %2
  %arrayidx4 = getelementptr inbounds double* %arrayidx, i64 %j.02
  store double 1.000000e+00, double* %arrayidx4, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %inc = add nuw nsw i64 %j.02, 1
  %exitcond = icmp ne i64 %j.02, %0
  br i1 %exitcond, label %for.body3, label %for.cond1.for.end_crit_edge

for.cond1.for.end_crit_edge:                      ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.cond1.for.end_crit_edge, %for.body
  br label %for.inc5

for.inc5:                                         ; preds = %for.end
  %inc6 = add nuw nsw i64 %i.04, 1
  %exitcond5 = icmp ne i64 %i.04, %1
  br i1 %exitcond5, label %for.body, label %for.cond.for.end7_crit_edge

for.cond.for.end7_crit_edge:                      ; preds = %for.inc5
  br label %for.end7

for.end7:                                         ; preds = %for.cond.for.end7_crit_edge, %entry
  ret void
}

; Function Attrs: nounwind uwtable
define void @bar(i64 %n, i64 %m, double* %A) #0 {
entry:
  %cmp4 = icmp slt i64 0, %n
  br i1 %cmp4, label %for.body.lr.ph, label %for.end8

for.body.lr.ph:                                   ; preds = %entry
  %0 = add i64 %m, -1
  %1 = add i64 %n, -1
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.inc6
  %i.06 = phi i64 [ 0, %for.body.lr.ph ], [ %inc7, %for.inc6 ]
  %foo.05 = phi i64 [ 0, %for.body.lr.ph ], [ %foo.1.lcssa, %for.inc6 ]
  %cmp21 = icmp slt i64 0, %m
  br i1 %cmp21, label %for.body3.lr.ph, label %for.end

for.body3.lr.ph:                                  ; preds = %for.body
  br label %for.body3

for.body3:                                        ; preds = %for.body3.lr.ph, %for.inc
  %j.03 = phi i64 [ 0, %for.body3.lr.ph ], [ %inc, %for.inc ]
  %foo.12 = phi i64 [ %foo.05, %for.body3.lr.ph ], [ %conv5, %for.inc ]
  %2 = mul nsw i64 %i.06, %m
  %arrayidx = getelementptr inbounds double* %A, i64 %2
  %arrayidx4 = getelementptr inbounds double* %arrayidx, i64 %j.03
  %3 = load double* %arrayidx4, align 8
  %conv = sitofp i64 %foo.12 to double
  %add = fadd double %conv, %3
  %conv5 = fptosi double %add to i64
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %inc = add nuw nsw i64 %j.03, 1
  %exitcond = icmp ne i64 %j.03, %0
  br i1 %exitcond, label %for.body3, label %for.cond1.for.end_crit_edge

for.cond1.for.end_crit_edge:                      ; preds = %for.inc
  %split = phi i64 [ %conv5, %for.inc ]
  br label %for.end

for.end:                                          ; preds = %for.cond1.for.end_crit_edge, %for.body
  %foo.1.lcssa = phi i64 [ %split, %for.cond1.for.end_crit_edge ], [ %foo.05, %for.body ]
  br label %for.inc6

for.inc6:                                         ; preds = %for.end
  %inc7 = add nuw nsw i64 %i.06, 1
  %exitcond7 = icmp ne i64 %i.06, %1
  br i1 %exitcond7, label %for.body, label %for.cond.for.end8_crit_edge

for.cond.for.end8_crit_edge:                      ; preds = %for.inc6
  br label %for.end8

for.end8:                                         ; preds = %for.cond.for.end8_crit_edge, %entry
  ret void
}

; Function Attrs: nounwind uwtable
define void @bla(i64 %n, i64 %m, double** %A) #0 {
entry:
  %cmp4 = icmp slt i64 0, %n
  br i1 %cmp4, label %for.body.lr.ph, label %for.end8

for.body.lr.ph:                                   ; preds = %entry
  %0 = add i64 %m, -1
  %1 = add i64 %n, -1
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.inc6
  %i.06 = phi i64 [ 0, %for.body.lr.ph ], [ %inc7, %for.inc6 ]
  %foo.05 = phi i64 [ 0, %for.body.lr.ph ], [ %foo.1.lcssa, %for.inc6 ]
  %cmp21 = icmp slt i64 0, %m
  br i1 %cmp21, label %for.body3.lr.ph, label %for.end

for.body3.lr.ph:                                  ; preds = %for.body
  br label %for.body3

for.body3:                                        ; preds = %for.body3.lr.ph, %for.inc
  %j.03 = phi i64 [ 0, %for.body3.lr.ph ], [ %inc, %for.inc ]
  %foo.12 = phi i64 [ %foo.05, %for.body3.lr.ph ], [ %conv5, %for.inc ]
  %arrayidx = getelementptr inbounds double** %A, i64 %i.06
  %2 = load double** %arrayidx, align 8
  %arrayidx4 = getelementptr inbounds double* %2, i64 %j.03
  %3 = load double* %arrayidx4, align 8
  %conv = sitofp i64 %foo.12 to double
  %add = fadd double %conv, %3
  %conv5 = fptosi double %add to i64
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %inc = add nuw nsw i64 %j.03, 1
  %exitcond = icmp ne i64 %j.03, %0
  br i1 %exitcond, label %for.body3, label %for.cond1.for.end_crit_edge

for.cond1.for.end_crit_edge:                      ; preds = %for.inc
  %split = phi i64 [ %conv5, %for.inc ]
  br label %for.end

for.end:                                          ; preds = %for.cond1.for.end_crit_edge, %for.body
  %foo.1.lcssa = phi i64 [ %split, %for.cond1.for.end_crit_edge ], [ %foo.05, %for.body ]
  br label %for.inc6

for.inc6:                                         ; preds = %for.end
  %inc7 = add nuw nsw i64 %i.06, 1
  %exitcond7 = icmp ne i64 %i.06, %1
  br i1 %exitcond7, label %for.body, label %for.cond.for.end8_crit_edge

for.cond.for.end8_crit_edge:                      ; preds = %for.inc6
  br label %for.end8

for.end8:                                         ; preds = %for.cond.for.end8_crit_edge, %entry
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)"}
