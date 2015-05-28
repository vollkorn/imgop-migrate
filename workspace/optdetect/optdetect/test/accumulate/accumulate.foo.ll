; ModuleID = 'accumulate.foo.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @accumulate_1d_addr(i32* %in, i32* %out, i32 %y, i32 %x, i32 %rowstride, i32 %s, i32 %w_size) #0 {
entry:
  %div = sdiv i32 %w_size, 2
  %sub = sub nsw i32 0, %div
  %cmp2 = icmp sle i32 %sub, %div
  br i1 %cmp2, label %for.body.lr.ph, label %for.end10

for.body.lr.ph:                                   ; preds = %entry
  %0 = sub i32 0, %div
  %1 = sext i32 %0 to i64
  %2 = sext i32 %div to i64
  %3 = sext i32 %0 to i64
  %4 = sext i32 %x to i64
  %5 = sext i32 %rowstride to i64
  %6 = sext i32 %y to i64
  %7 = sext i32 %div to i64
  br label %for.body

for.body:                                         ; preds = %for.inc8, %for.body.lr.ph
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc8 ], [ %3, %for.body.lr.ph ]
  %acc.0 = phi i32 [ 0, %for.body.lr.ph ], [ %acc.2, %for.inc8 ]
  %sub1 = sub nsw i32 0, %div
  %cmp31 = icmp sle i32 %sub1, %div
  br i1 %cmp31, label %for.body4.lr.ph, label %for.end

for.body4.lr.ph:                                  ; preds = %for.body
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.body4.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ %1, %for.body4.lr.ph ]
  %acc.1 = phi i32 [ %acc.0, %for.body4.lr.ph ], [ %add7, %for.inc ]
  %8 = sub nsw i64 %4, %indvars.iv2
  %9 = mul nsw i64 %8, %5
  %10 = add nsw i64 %9, %6
  %11 = sub nsw i64 %10, %indvars.iv
  %arrayidx = getelementptr inbounds i32* %in, i64 %11
  %12 = load i32* %arrayidx, align 4
  %add7 = add nsw i32 %acc.1, %12
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp3 = icmp sle i64 %indvars.iv.next, %2
  br i1 %cmp3, label %for.body4, label %for.cond2.for.end_crit_edge

for.cond2.for.end_crit_edge:                      ; preds = %for.inc
  %add7.lcssa = phi i32 [ %add7, %for.inc ]
  br label %for.end

for.end:                                          ; preds = %for.cond2.for.end_crit_edge, %for.body
  %acc.2 = phi i32 [ %add7.lcssa, %for.cond2.for.end_crit_edge ], [ %acc.0, %for.body ]
  br label %for.inc8

for.inc8:                                         ; preds = %for.end
  %indvars.iv.next3 = add nsw i64 %indvars.iv2, 1
  %cmp = icmp sle i64 %indvars.iv.next3, %7
  br i1 %cmp, label %for.body, label %for.cond.for.end10_crit_edge

for.cond.for.end10_crit_edge:                     ; preds = %for.inc8
  %acc.2.lcssa = phi i32 [ %acc.2, %for.inc8 ]
  br label %for.end10

for.end10:                                        ; preds = %for.cond.for.end10_crit_edge, %entry
  %acc.3 = phi i32 [ %acc.2.lcssa, %for.cond.for.end10_crit_edge ], [ 0, %entry ]
  %mul11 = mul nsw i32 %x, %rowstride
  %add12 = add nsw i32 %mul11, %y
  %idxprom13 = sext i32 %add12 to i64
  %arrayidx14 = getelementptr inbounds i32* %out, i64 %idxprom13
  store i32 %acc.3, i32* %arrayidx14, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @accumulate_2d_addr(i32** %in, i32** %out, i32 %y, i32 %x, i32 %w_size) #0 {
entry:
  %div = sdiv i32 %w_size, 2
  %sub = sub nsw i32 0, %div
  %cmp2 = icmp sle i32 %sub, %div
  br i1 %cmp2, label %for.body.lr.ph, label %for.end11

for.body.lr.ph:                                   ; preds = %entry
  %0 = sub i32 0, %div
  %1 = sext i32 %0 to i64
  %2 = sext i32 %x to i64
  %3 = sext i32 %div to i64
  %4 = sext i32 %0 to i64
  %5 = sext i32 %y to i64
  %6 = sext i32 %div to i64
  br label %for.body

for.body:                                         ; preds = %for.inc9, %for.body.lr.ph
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc9 ], [ %4, %for.body.lr.ph ]
  %acc.0 = phi i32 [ 0, %for.body.lr.ph ], [ %acc.2, %for.inc9 ]
  %sub1 = sub nsw i32 0, %div
  %cmp31 = icmp sle i32 %sub1, %div
  br i1 %cmp31, label %for.body4.lr.ph, label %for.end

for.body4.lr.ph:                                  ; preds = %for.body
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.body4.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ %1, %for.body4.lr.ph ]
  %acc.1 = phi i32 [ %acc.0, %for.body4.lr.ph ], [ %add8, %for.inc ]
  %7 = add nsw i64 %2, %indvars.iv
  %8 = add nsw i64 %5, %indvars.iv2
  %arrayidx = getelementptr inbounds i32** %in, i64 %8
  %9 = load i32** %arrayidx, align 8
  %arrayidx7 = getelementptr inbounds i32* %9, i64 %7
  %10 = load i32* %arrayidx7, align 4
  %add8 = add nsw i32 %acc.1, %10
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp3 = icmp sle i64 %indvars.iv.next, %3
  br i1 %cmp3, label %for.body4, label %for.cond2.for.end_crit_edge

for.cond2.for.end_crit_edge:                      ; preds = %for.inc
  %add8.lcssa = phi i32 [ %add8, %for.inc ]
  br label %for.end

for.end:                                          ; preds = %for.cond2.for.end_crit_edge, %for.body
  %acc.2 = phi i32 [ %add8.lcssa, %for.cond2.for.end_crit_edge ], [ %acc.0, %for.body ]
  br label %for.inc9

for.inc9:                                         ; preds = %for.end
  %indvars.iv.next3 = add nsw i64 %indvars.iv2, 1
  %cmp = icmp sle i64 %indvars.iv.next3, %6
  br i1 %cmp, label %for.body, label %for.cond.for.end11_crit_edge

for.cond.for.end11_crit_edge:                     ; preds = %for.inc9
  %acc.2.lcssa = phi i32 [ %acc.2, %for.inc9 ]
  br label %for.end11

for.end11:                                        ; preds = %for.cond.for.end11_crit_edge, %entry
  %acc.3 = phi i32 [ %acc.2.lcssa, %for.cond.for.end11_crit_edge ], [ 0, %entry ]
  %idxprom12 = sext i32 %x to i64
  %idxprom13 = sext i32 %y to i64
  %arrayidx14 = getelementptr inbounds i32** %out, i64 %idxprom13
  %11 = load i32** %arrayidx14, align 8
  %arrayidx15 = getelementptr inbounds i32* %11, i64 %idxprom12
  store i32 %acc.3, i32* %arrayidx15, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @accumulate_2d_addr_arr(i32 %y, i32 %x, i32* %in, i32** %out, i32 %w_size) #0 {
entry:
  %0 = zext i32 %y to i64
  %div = sdiv i32 %w_size, 2
  %sub = sub nsw i32 0, %div
  %cmp2 = icmp sle i32 %sub, %div
  br i1 %cmp2, label %for.body.lr.ph, label %for.end11

for.body.lr.ph:                                   ; preds = %entry
  %1 = sub i32 0, %div
  %2 = sext i32 %1 to i64
  %3 = sext i32 %x to i64
  %4 = sext i32 %div to i64
  %5 = sext i32 %1 to i64
  %6 = sext i32 %y to i64
  %7 = sext i32 %div to i64
  br label %for.body

for.body:                                         ; preds = %for.inc9, %for.body.lr.ph
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc9 ], [ %5, %for.body.lr.ph ]
  %acc.0 = phi i32 [ 0, %for.body.lr.ph ], [ %acc.2, %for.inc9 ]
  %sub1 = sub nsw i32 0, %div
  %cmp31 = icmp sle i32 %sub1, %div
  br i1 %cmp31, label %for.body4.lr.ph, label %for.end

for.body4.lr.ph:                                  ; preds = %for.body
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.body4.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ %2, %for.body4.lr.ph ]
  %acc.1 = phi i32 [ %acc.0, %for.body4.lr.ph ], [ %add8, %for.inc ]
  %8 = add nsw i64 %3, %indvars.iv
  %9 = add nsw i64 %6, %indvars.iv2
  %10 = mul nsw i64 %9, %0
  %arrayidx = getelementptr inbounds i32* %in, i64 %10
  %arrayidx7 = getelementptr inbounds i32* %arrayidx, i64 %8
  %11 = load i32* %arrayidx7, align 4
  %add8 = add nsw i32 %acc.1, %11
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp3 = icmp sle i64 %indvars.iv.next, %4
  br i1 %cmp3, label %for.body4, label %for.cond2.for.end_crit_edge

for.cond2.for.end_crit_edge:                      ; preds = %for.inc
  %add8.lcssa = phi i32 [ %add8, %for.inc ]
  br label %for.end

for.end:                                          ; preds = %for.cond2.for.end_crit_edge, %for.body
  %acc.2 = phi i32 [ %add8.lcssa, %for.cond2.for.end_crit_edge ], [ %acc.0, %for.body ]
  br label %for.inc9

for.inc9:                                         ; preds = %for.end
  %indvars.iv.next3 = add nsw i64 %indvars.iv2, 1
  %cmp = icmp sle i64 %indvars.iv.next3, %7
  br i1 %cmp, label %for.body, label %for.cond.for.end11_crit_edge

for.cond.for.end11_crit_edge:                     ; preds = %for.inc9
  %acc.2.lcssa = phi i32 [ %acc.2, %for.inc9 ]
  br label %for.end11

for.end11:                                        ; preds = %for.cond.for.end11_crit_edge, %entry
  %acc.3 = phi i32 [ %acc.2.lcssa, %for.cond.for.end11_crit_edge ], [ 0, %entry ]
  %idxprom12 = sext i32 %x to i64
  %idxprom13 = sext i32 %y to i64
  %arrayidx14 = getelementptr inbounds i32** %out, i64 %idxprom13
  %12 = load i32** %arrayidx14, align 8
  %arrayidx15 = getelementptr inbounds i32* %12, i64 %idxprom12
  store i32 %acc.3, i32* %arrayidx15, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @accumulate_1d_linear(i32* %in, i32 %n, i32 %m) #0 {
entry:
  %cmp1 = icmp sle i32 %n, %m
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %0 = sext i32 %n to i64
  %1 = sext i32 %m to i64
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ %0, %for.body.lr.ph ]
  %acc.0 = phi i32 [ 0, %for.body.lr.ph ], [ %add, %for.inc ]
  %arrayidx = getelementptr inbounds i32* %in, i64 %indvars.iv
  %2 = load i32* %arrayidx, align 4
  %add = add nsw i32 %acc.0, %2
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp = icmp sle i64 %indvars.iv.next, %1
  br i1 %cmp, label %for.body, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %for.inc
  %add.lcssa = phi i32 [ %add, %for.inc ]
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry
  %acc.1 = phi i32 [ %add.lcssa, %for.cond.for.end_crit_edge ], [ 0, %entry ]
  ret i32 %acc.1
}

; Function Attrs: nounwind uwtable
define i32 @foo(i32* %A, i32* %B, i32 %n) #0 {
entry:
  %cmp1 = icmp slt i32 0, %n
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %0 = add i32 %n, -1
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body.lr.ph ]
  %sum.0 = phi i32 [ 0, %for.body.lr.ph ], [ %sum.1, %for.inc ]
  %arrayidx = getelementptr inbounds i32* %A, i64 %indvars.iv
  %1 = load i32* %arrayidx, align 4
  %arrayidx2 = getelementptr inbounds i32* %B, i64 %indvars.iv
  %2 = load i32* %arrayidx2, align 4
  %cmp3 = icmp sgt i32 %1, %2
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %arrayidx5 = getelementptr inbounds i32* %A, i64 %indvars.iv
  %3 = load i32* %arrayidx5, align 4
  %add = add nsw i32 %3, 5
  %add6 = add i32 %sum.0, %add
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %sum.1 = phi i32 [ %add6, %if.then ], [ %sum.0, %for.body ]
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv to i32
  %exitcond = icmp ne i32 %lftr.wideiv, %0
  br i1 %exitcond, label %for.body, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %for.inc
  %sum.1.lcssa = phi i32 [ %sum.1, %for.inc ]
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry
  %sum.2 = phi i32 [ %sum.1.lcssa, %for.cond.for.end_crit_edge ], [ 0, %entry ]
  ret i32 %sum.2
}

; Function Attrs: nounwind uwtable
define i32 @accumulate_2d_addr_fixed(i32** %in, i32 %y, i32 %x) #0 {
entry:
  %cmp3 = icmp sle i32 -8, 8
  br i1 %cmp3, label %for.body.lr.ph, label %for.end10

for.body.lr.ph:                                   ; preds = %entry
  %0 = sext i32 %x to i64
  %1 = sext i32 %y to i64
  br label %for.body

for.body:                                         ; preds = %for.inc8, %for.body.lr.ph
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc8 ], [ -8, %for.body.lr.ph ]
  %acc.0 = phi i32 [ 0, %for.body.lr.ph ], [ %acc.2, %for.inc8 ]
  %cmp21 = icmp sle i32 -8, 8
  br i1 %cmp21, label %for.body3.lr.ph, label %for.end

for.body3.lr.ph:                                  ; preds = %for.body
  br label %for.body3

for.body3:                                        ; preds = %for.inc, %for.body3.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ -8, %for.body3.lr.ph ]
  %acc.1 = phi i32 [ %acc.0, %for.body3.lr.ph ], [ %add7, %for.inc ]
  %2 = add nsw i64 %0, %indvars.iv
  %3 = add nsw i64 %1, %indvars.iv2
  %arrayidx = getelementptr inbounds i32** %in, i64 %3
  %4 = load i32** %arrayidx, align 8
  %arrayidx6 = getelementptr inbounds i32* %4, i64 %2
  %5 = load i32* %arrayidx6, align 4
  %add7 = add nsw i32 %acc.1, %5
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 9
  br i1 %exitcond, label %for.body3, label %for.cond1.for.end_crit_edge

for.cond1.for.end_crit_edge:                      ; preds = %for.inc
  %add7.lcssa = phi i32 [ %add7, %for.inc ]
  br label %for.end

for.end:                                          ; preds = %for.cond1.for.end_crit_edge, %for.body
  %acc.2 = phi i32 [ %add7.lcssa, %for.cond1.for.end_crit_edge ], [ %acc.0, %for.body ]
  br label %for.inc8

for.inc8:                                         ; preds = %for.end
  %indvars.iv.next3 = add nsw i64 %indvars.iv2, 1
  %exitcond5 = icmp ne i64 %indvars.iv.next3, 9
  br i1 %exitcond5, label %for.body, label %for.cond.for.end10_crit_edge

for.cond.for.end10_crit_edge:                     ; preds = %for.inc8
  %acc.2.lcssa = phi i32 [ %acc.2, %for.inc8 ]
  br label %for.end10

for.end10:                                        ; preds = %for.cond.for.end10_crit_edge, %entry
  %acc.3 = phi i32 [ %acc.2.lcssa, %for.cond.for.end10_crit_edge ], [ 0, %entry ]
  ret i32 %acc.3
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)"}
