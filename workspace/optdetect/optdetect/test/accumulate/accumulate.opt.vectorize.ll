; ModuleID = 'accumulate.opt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @accumulate_1d_addr(i32* %in, i32* %out, i32 %y, i32 %x, i32 %rowstride, i32 %s, i32 %w_size) #0 {
entry:
  %div = sdiv i32 %w_size, 2
  %sub = sub nsw i32 0, %div
  %0 = sext i32 %sub to i64
  %1 = sext i32 %div to i64
  %2 = sext i32 %sub to i64
  %3 = sext i32 %div to i64
  %4 = sext i32 %x to i64
  %5 = sext i32 %rowstride to i64
  %6 = sext i32 %y to i64
  br label %for.cond

for.cond:                                         ; preds = %for.inc8, %entry
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc8 ], [ %2, %entry ]
  %acc.0 = phi i32 [ 0, %entry ], [ %acc.1.lcssa, %for.inc8 ]
  %cmp = icmp sle i64 %indvars.iv2, %3
  br i1 %cmp, label %for.body, label %for.end10

for.body:                                         ; preds = %for.cond
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ %0, %for.body ]
  %acc.1 = phi i32 [ %acc.0, %for.body ], [ %add7, %for.inc ]
  %cmp3 = icmp sle i64 %indvars.iv, %1
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %7 = sub nsw i64 %4, %indvars.iv2
  %8 = mul nsw i64 %7, %5
  %9 = add nsw i64 %8, %6
  %10 = sub nsw i64 %9, %indvars.iv
  %arrayidx = getelementptr inbounds i32* %in, i64 %10
  %11 = load i32* %arrayidx, align 4
  %add7 = add nsw i32 %acc.1, %11
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  %acc.1.lcssa = phi i32 [ %acc.1, %for.cond2 ]
  br label %for.inc8

for.inc8:                                         ; preds = %for.end
  %indvars.iv.next3 = add nsw i64 %indvars.iv2, 1
  br label %for.cond

for.end10:                                        ; preds = %for.cond
  %acc.0.lcssa = phi i32 [ %acc.0, %for.cond ]
  %mul11 = mul nsw i32 %x, %rowstride
  %add12 = add nsw i32 %mul11, %y
  %idxprom13 = sext i32 %add12 to i64
  %arrayidx14 = getelementptr inbounds i32* %out, i64 %idxprom13
  store i32 %acc.0.lcssa, i32* %arrayidx14, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @accumulate_2d_addr(i32** %in, i32** %out, i32 %y, i32 %x, i32 %w_size) #0 {
entry:
  %div = sdiv i32 %w_size, 2
  %sub = sub nsw i32 0, %div
  %0 = sext i32 %sub to i64
  %1 = sext i32 %div to i64
  %2 = sext i32 %x to i64
  %3 = sext i32 %sub to i64
  %4 = sext i32 %div to i64
  %5 = sext i32 %y to i64
  br label %for.cond

for.cond:                                         ; preds = %for.inc9, %entry
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc9 ], [ %3, %entry ]
  %acc.0 = phi i32 [ 0, %entry ], [ %acc.1.lcssa, %for.inc9 ]
  %cmp = icmp sle i64 %indvars.iv2, %4
  br i1 %cmp, label %for.body, label %for.end11

for.body:                                         ; preds = %for.cond
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ %0, %for.body ]
  %acc.1 = phi i32 [ %acc.0, %for.body ], [ %add8, %for.inc ]
  %cmp3 = icmp sle i64 %indvars.iv, %1
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %6 = add nsw i64 %2, %indvars.iv
  %7 = add nsw i64 %5, %indvars.iv2
  %arrayidx = getelementptr inbounds i32** %in, i64 %7
  %8 = load i32** %arrayidx, align 8
  %arrayidx7 = getelementptr inbounds i32* %8, i64 %6
  %9 = load i32* %arrayidx7, align 4
  %add8 = add nsw i32 %acc.1, %9
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  %acc.1.lcssa = phi i32 [ %acc.1, %for.cond2 ]
  br label %for.inc9

for.inc9:                                         ; preds = %for.end
  %indvars.iv.next3 = add nsw i64 %indvars.iv2, 1
  br label %for.cond

for.end11:                                        ; preds = %for.cond
  %acc.0.lcssa = phi i32 [ %acc.0, %for.cond ]
  %idxprom12 = sext i32 %x to i64
  %idxprom13 = sext i32 %y to i64
  %arrayidx14 = getelementptr inbounds i32** %out, i64 %idxprom13
  %10 = load i32** %arrayidx14, align 8
  %arrayidx15 = getelementptr inbounds i32* %10, i64 %idxprom12
  store i32 %acc.0.lcssa, i32* %arrayidx15, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @accumulate_1d_linear(i32* %in, i32 %n, i32 %m) #0 {
entry:
  %0 = sext i32 %n to i64
  %1 = sext i32 %m to i64
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ %0, %entry ]
  %acc.0 = phi i32 [ 0, %entry ], [ %add, %for.inc ]
  %cmp = icmp sle i64 %indvars.iv, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds i32* %in, i64 %indvars.iv
  %2 = load i32* %arrayidx, align 4
  %add = add nsw i32 %acc.0, %2
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %acc.0.lcssa = phi i32 [ %acc.0, %for.cond ]
  ret i32 %acc.0.lcssa
}

; Function Attrs: nounwind uwtable
define i32 @foo(i32* %A, i32* %B, i32 %n) #0 {
entry:
  %0 = sext i32 %n to i64
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %entry ]
  %sum.0 = phi i32 [ 0, %entry ], [ %sum.1, %for.inc ]
  %cmp = icmp slt i64 %indvars.iv, %0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
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
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %sum.0.lcssa = phi i32 [ %sum.0, %for.cond ]
  ret i32 %sum.0.lcssa
}

; Function Attrs: nounwind uwtable
define i32 @accumulate_2d_addr_fixed(i32** %in, i32 %y, i32 %x) #0 {
entry:
  %0 = sext i32 %x to i64
  %1 = sext i32 %y to i64
  br label %for.cond

for.cond:                                         ; preds = %for.inc8, %entry
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc8 ], [ -8, %entry ]
  %acc.0 = phi i32 [ 0, %entry ], [ %acc.1.lcssa, %for.inc8 ]
  %exitcond5 = icmp ne i64 %indvars.iv2, 9
  br i1 %exitcond5, label %for.body, label %for.end10

for.body:                                         ; preds = %for.cond
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ -8, %for.body ]
  %acc.1 = phi i32 [ %acc.0, %for.body ], [ %add7, %for.inc ]
  %exitcond = icmp ne i64 %indvars.iv, 9
  br i1 %exitcond, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
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
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  %acc.1.lcssa = phi i32 [ %acc.1, %for.cond1 ]
  br label %for.inc8

for.inc8:                                         ; preds = %for.end
  %indvars.iv.next3 = add nsw i64 %indvars.iv2, 1
  br label %for.cond

for.end10:                                        ; preds = %for.cond
  %acc.0.lcssa = phi i32 [ %acc.0, %for.cond ]
  ret i32 %acc.0.lcssa
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)"}
