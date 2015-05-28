; ModuleID = 'accumulate.ll'
; Optimizations applied: -mem2reg -loop-simplify -indvars -dce -constprop
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

;void accumulate_2d_addr(const int_type_t** in, int_type_t** out,
;                        const int_type_t y, const int_type_t x, const int_type_t w_size)
;{
;    int_type_t w_size_half = w_size / 2;
;
;    int_type_t acc = 0;
;
;    // accumulate over filter window
;    for (int_type_t j = -w_size_half; j <= w_size_half; j++)
;        for (int_type_t i = -w_size_half; i <= w_size_half; i++)
;            acc += in[y+j][x+i];
;
;    out[y][x] = acc;
;}

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
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc9 ], [ %3, %entry ]	; first index variable: j
  %acc.0 = phi i32 [ 0, %entry ], [ %acc.1.lcssa, %for.inc9 ]	; final accumulator variable in case for condition is false
  %cmp = icmp sle i64 %indvars.iv2, %4		; indvars.iv2 
  br i1 %cmp, label %for.body, label %for.end11

for.body:                                         ; preds = %for.cond
  br label %for.cond2							  ; branch to inner loop

for.cond2:                                        ; preds = %for.inc, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ %0, %for.body ]	; second index variable: i
  %acc.1 = phi i32 [ %acc.0, %for.body ], [ %add8, %for.inc ] ; final accumulator variable in case for condition is false
  %cmp3 = icmp sle i64 %indvars.iv, %1
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %6 = add nsw i64 %2, %indvars.iv				  ; x + i
  %7 = add nsw i64 %5, %indvars.iv2				  ; y + j
  %arrayidx = getelementptr inbounds i32** %in, i64 %7
  %8 = load i32** %arrayidx, align 8
  %arrayidx7 = getelementptr inbounds i32* %8, i64 %6
  %9 = load i32* %arrayidx7, align 4
  %add8 = add nsw i32 %acc.1, %9	; accumulator variable: acc
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
  %acc.0.lcssa = phi i32 [ %acc.0, %for.cond ]	  ; result of the accumulation
  %idxprom12 = sext i32 %x to i64
  %idxprom13 = sext i32 %y to i64
  %arrayidx14 = getelementptr inbounds i32** %out, i64 %idxprom13
  %10 = load i32** %arrayidx14, align 8
  %arrayidx15 = getelementptr inbounds i32* %10, i64 %idxprom12
  store i32 %acc.0.lcssa, i32* %arrayidx15, align 4
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)"}
