; ModuleID = 'accumulate.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @accumulate_1d_addr(i32* %in, i32* %out, i32 %y, i32 %x, i32 %rowstride, i32 %s, i32 %w_size) #0 {
entry:
  %in.addr = alloca i32*, align 8
  %out.addr = alloca i32*, align 8
  %y.addr = alloca i32, align 4
  %x.addr = alloca i32, align 4
  %rowstride.addr = alloca i32, align 4
  %s.addr = alloca i32, align 4
  %w_size.addr = alloca i32, align 4
  %w_size_half = alloca i32, align 4
  %acc = alloca i32, align 4
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %in, i32** %in.addr, align 8
  store i32* %out, i32** %out.addr, align 8
  store i32 %y, i32* %y.addr, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %rowstride, i32* %rowstride.addr, align 4
  store i32 %s, i32* %s.addr, align 4
  store i32 %w_size, i32* %w_size.addr, align 4
  %0 = load i32* %w_size.addr, align 4
  %div = sdiv i32 %0, 2
  store i32 %div, i32* %w_size_half, align 4
  store i32 0, i32* %acc, align 4
  %1 = load i32* %w_size_half, align 4
  %sub = sub nsw i32 0, %1
  store i32 %sub, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc8, %entry
  %2 = load i32* %j, align 4
  %3 = load i32* %w_size_half, align 4
  %cmp = icmp sle i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end10

for.body:                                         ; preds = %for.cond
  %4 = load i32* %w_size_half, align 4
  %sub1 = sub nsw i32 0, %4
  store i32 %sub1, i32* %i, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %5 = load i32* %i, align 4
  %6 = load i32* %w_size_half, align 4
  %cmp3 = icmp sle i32 %5, %6
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %7 = load i32* %x.addr, align 4
  %8 = load i32* %j, align 4
  %sub5 = sub nsw i32 %7, %8
  %9 = load i32* %rowstride.addr, align 4
  %mul = mul nsw i32 %sub5, %9
  %10 = load i32* %y.addr, align 4
  %add = add nsw i32 %mul, %10
  %11 = load i32* %i, align 4
  %sub6 = sub nsw i32 %add, %11
  %idxprom = sext i32 %sub6 to i64
  %12 = load i32** %in.addr, align 8
  %arrayidx = getelementptr inbounds i32* %12, i64 %idxprom
  %13 = load i32* %arrayidx, align 4
  %14 = load i32* %acc, align 4
  %add7 = add nsw i32 %14, %13
  store i32 %add7, i32* %acc, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %15 = load i32* %i, align 4
  %inc = add nsw i32 %15, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc8

for.inc8:                                         ; preds = %for.end
  %16 = load i32* %j, align 4
  %inc9 = add nsw i32 %16, 1
  store i32 %inc9, i32* %j, align 4
  br label %for.cond

for.end10:                                        ; preds = %for.cond
  %17 = load i32* %acc, align 4
  %18 = load i32* %x.addr, align 4
  %19 = load i32* %rowstride.addr, align 4
  %mul11 = mul nsw i32 %18, %19
  %20 = load i32* %y.addr, align 4
  %add12 = add nsw i32 %mul11, %20
  %idxprom13 = sext i32 %add12 to i64
  %21 = load i32** %out.addr, align 8
  %arrayidx14 = getelementptr inbounds i32* %21, i64 %idxprom13
  store i32 %17, i32* %arrayidx14, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @accumulate_2d_addr(i32** %in, i32** %out, i32 %y, i32 %x, i32 %w_size) #0 {
entry:
  %in.addr = alloca i32**, align 8
  %out.addr = alloca i32**, align 8
  %y.addr = alloca i32, align 4
  %x.addr = alloca i32, align 4
  %w_size.addr = alloca i32, align 4
  %w_size_half = alloca i32, align 4
  %acc = alloca i32, align 4
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  store i32** %in, i32*** %in.addr, align 8
  store i32** %out, i32*** %out.addr, align 8
  store i32 %y, i32* %y.addr, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %w_size, i32* %w_size.addr, align 4
  %0 = load i32* %w_size.addr, align 4
  %div = sdiv i32 %0, 2
  store i32 %div, i32* %w_size_half, align 4
  store i32 0, i32* %acc, align 4
  %1 = load i32* %w_size_half, align 4
  %sub = sub nsw i32 0, %1
  store i32 %sub, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc9, %entry
  %2 = load i32* %j, align 4
  %3 = load i32* %w_size_half, align 4
  %cmp = icmp sle i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end11

for.body:                                         ; preds = %for.cond
  %4 = load i32* %w_size_half, align 4
  %sub1 = sub nsw i32 0, %4
  store i32 %sub1, i32* %i, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %5 = load i32* %i, align 4
  %6 = load i32* %w_size_half, align 4
  %cmp3 = icmp sle i32 %5, %6
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %7 = load i32* %x.addr, align 4
  %8 = load i32* %i, align 4
  %add = add nsw i32 %7, %8
  %idxprom = sext i32 %add to i64
  %9 = load i32* %y.addr, align 4
  %10 = load i32* %j, align 4
  %add5 = add nsw i32 %9, %10
  %idxprom6 = sext i32 %add5 to i64
  %11 = load i32*** %in.addr, align 8
  %arrayidx = getelementptr inbounds i32** %11, i64 %idxprom6
  %12 = load i32** %arrayidx, align 8
  %arrayidx7 = getelementptr inbounds i32* %12, i64 %idxprom
  %13 = load i32* %arrayidx7, align 4
  %14 = load i32* %acc, align 4
  %add8 = add nsw i32 %14, %13
  store i32 %add8, i32* %acc, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %15 = load i32* %i, align 4
  %inc = add nsw i32 %15, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc9

for.inc9:                                         ; preds = %for.end
  %16 = load i32* %j, align 4
  %inc10 = add nsw i32 %16, 1
  store i32 %inc10, i32* %j, align 4
  br label %for.cond

for.end11:                                        ; preds = %for.cond
  %17 = load i32* %acc, align 4
  %18 = load i32* %x.addr, align 4
  %idxprom12 = sext i32 %18 to i64
  %19 = load i32* %y.addr, align 4
  %idxprom13 = sext i32 %19 to i64
  %20 = load i32*** %out.addr, align 8
  %arrayidx14 = getelementptr inbounds i32** %20, i64 %idxprom13
  %21 = load i32** %arrayidx14, align 8
  %arrayidx15 = getelementptr inbounds i32* %21, i64 %idxprom12
  store i32 %17, i32* %arrayidx15, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @accumulate_2d_no_indirection(i32 %n, i32 %m, i32* %in, i32* %out, i32 %y, i32 %x, i32 %w_size) #0 {
entry:
  %n.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %in.addr = alloca i32*, align 8
  %out.addr = alloca i32*, align 8
  %y.addr = alloca i32, align 4
  %x.addr = alloca i32, align 4
  %w_size.addr = alloca i32, align 4
  %w_size_half = alloca i32, align 4
  %acc = alloca i32, align 4
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32* %in, i32** %in.addr, align 8
  store i32* %out, i32** %out.addr, align 8
  store i32 %y, i32* %y.addr, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %w_size, i32* %w_size.addr, align 4
  %0 = load i32* %n.addr, align 4
  %1 = zext i32 %0 to i64
  %2 = load i32* %m.addr, align 4
  %3 = zext i32 %2 to i64
  %4 = load i32* %n.addr, align 4
  %5 = zext i32 %4 to i64
  %6 = load i32* %m.addr, align 4
  %7 = zext i32 %6 to i64
  %8 = load i32* %w_size.addr, align 4
  %div = sdiv i32 %8, 2
  store i32 %div, i32* %w_size_half, align 4
  store i32 0, i32* %acc, align 4
  %9 = load i32* %w_size_half, align 4
  %sub = sub nsw i32 0, %9
  store i32 %sub, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc9, %entry
  %10 = load i32* %j, align 4
  %11 = load i32* %w_size_half, align 4
  %cmp = icmp sle i32 %10, %11
  br i1 %cmp, label %for.body, label %for.end11

for.body:                                         ; preds = %for.cond
  %12 = load i32* %w_size_half, align 4
  %sub1 = sub nsw i32 0, %12
  store i32 %sub1, i32* %i, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %13 = load i32* %i, align 4
  %14 = load i32* %w_size_half, align 4
  %cmp3 = icmp sle i32 %13, %14
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %15 = load i32* %x.addr, align 4
  %16 = load i32* %i, align 4
  %add = add nsw i32 %15, %16
  %idxprom = sext i32 %add to i64
  %17 = load i32* %y.addr, align 4
  %18 = load i32* %j, align 4
  %add5 = add nsw i32 %17, %18
  %idxprom6 = sext i32 %add5 to i64
  %19 = load i32** %in.addr, align 8
  %20 = mul nsw i64 %idxprom6, %3
  %arrayidx = getelementptr inbounds i32* %19, i64 %20
  %arrayidx7 = getelementptr inbounds i32* %arrayidx, i64 %idxprom
  %21 = load i32* %arrayidx7, align 4
  %22 = load i32* %acc, align 4
  %add8 = add nsw i32 %22, %21
  store i32 %add8, i32* %acc, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %23 = load i32* %i, align 4
  %inc = add nsw i32 %23, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc9

for.inc9:                                         ; preds = %for.end
  %24 = load i32* %j, align 4
  %inc10 = add nsw i32 %24, 1
  store i32 %inc10, i32* %j, align 4
  br label %for.cond

for.end11:                                        ; preds = %for.cond
  %25 = load i32* %acc, align 4
  %26 = load i32* %x.addr, align 4
  %idxprom12 = sext i32 %26 to i64
  %27 = load i32* %y.addr, align 4
  %idxprom13 = sext i32 %27 to i64
  %28 = load i32** %out.addr, align 8
  %29 = mul nsw i64 %idxprom13, %7
  %arrayidx14 = getelementptr inbounds i32* %28, i64 %29
  %arrayidx15 = getelementptr inbounds i32* %arrayidx14, i64 %idxprom12
  store i32 %25, i32* %arrayidx15, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @accumulate_2d_addr_arr(i32 %y, i32 %x, i32* %in, i32** %out, i32 %w_size) #0 {
entry:
  %y.addr = alloca i32, align 4
  %x.addr = alloca i32, align 4
  %in.addr = alloca i32*, align 8
  %out.addr = alloca i32**, align 8
  %w_size.addr = alloca i32, align 4
  %w_size_half = alloca i32, align 4
  %acc = alloca i32, align 4
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %y, i32* %y.addr, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32* %in, i32** %in.addr, align 8
  store i32** %out, i32*** %out.addr, align 8
  store i32 %w_size, i32* %w_size.addr, align 4
  %0 = load i32* %y.addr, align 4
  %1 = zext i32 %0 to i64
  %2 = load i32* %w_size.addr, align 4
  %div = sdiv i32 %2, 2
  store i32 %div, i32* %w_size_half, align 4
  store i32 0, i32* %acc, align 4
  %3 = load i32* %w_size_half, align 4
  %sub = sub nsw i32 0, %3
  store i32 %sub, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc9, %entry
  %4 = load i32* %j, align 4
  %5 = load i32* %w_size_half, align 4
  %cmp = icmp sle i32 %4, %5
  br i1 %cmp, label %for.body, label %for.end11

for.body:                                         ; preds = %for.cond
  %6 = load i32* %w_size_half, align 4
  %sub1 = sub nsw i32 0, %6
  store i32 %sub1, i32* %i, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %7 = load i32* %i, align 4
  %8 = load i32* %w_size_half, align 4
  %cmp3 = icmp sle i32 %7, %8
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %9 = load i32* %x.addr, align 4
  %10 = load i32* %i, align 4
  %add = add nsw i32 %9, %10
  %idxprom = sext i32 %add to i64
  %11 = load i32* %y.addr, align 4
  %12 = load i32* %j, align 4
  %add5 = add nsw i32 %11, %12
  %idxprom6 = sext i32 %add5 to i64
  %13 = load i32** %in.addr, align 8
  %14 = mul nsw i64 %idxprom6, %1
  %arrayidx = getelementptr inbounds i32* %13, i64 %14
  %arrayidx7 = getelementptr inbounds i32* %arrayidx, i64 %idxprom
  %15 = load i32* %arrayidx7, align 4
  %16 = load i32* %acc, align 4
  %add8 = add nsw i32 %16, %15
  store i32 %add8, i32* %acc, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %17 = load i32* %i, align 4
  %inc = add nsw i32 %17, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc9

for.inc9:                                         ; preds = %for.end
  %18 = load i32* %j, align 4
  %inc10 = add nsw i32 %18, 1
  store i32 %inc10, i32* %j, align 4
  br label %for.cond

for.end11:                                        ; preds = %for.cond
  %19 = load i32* %acc, align 4
  %20 = load i32* %x.addr, align 4
  %idxprom12 = sext i32 %20 to i64
  %21 = load i32* %y.addr, align 4
  %idxprom13 = sext i32 %21 to i64
  %22 = load i32*** %out.addr, align 8
  %arrayidx14 = getelementptr inbounds i32** %22, i64 %idxprom13
  %23 = load i32** %arrayidx14, align 8
  %arrayidx15 = getelementptr inbounds i32* %23, i64 %idxprom12
  store i32 %19, i32* %arrayidx15, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @accumulate_1d_linear(i32* %in, i32 %n, i32 %m) #0 {
entry:
  %in.addr = alloca i32*, align 8
  %n.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %acc = alloca i32, align 4
  %j = alloca i32, align 4
  store i32* %in, i32** %in.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 0, i32* %acc, align 4
  %0 = load i32* %n.addr, align 4
  store i32 %0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* %j, align 4
  %2 = load i32* %m.addr, align 4
  %cmp = icmp sle i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32* %j, align 4
  %idxprom = sext i32 %3 to i64
  %4 = load i32** %in.addr, align 8
  %arrayidx = getelementptr inbounds i32* %4, i64 %idxprom
  %5 = load i32* %arrayidx, align 4
  %6 = load i32* %acc, align 4
  %add = add nsw i32 %6, %5
  store i32 %add, i32* %acc, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32* %j, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %8 = load i32* %acc, align 4
  ret i32 %8
}

; Function Attrs: nounwind uwtable
define i32 @foo(i32* %A, i32* %B, i32 %n) #0 {
entry:
  %A.addr = alloca i32*, align 8
  %B.addr = alloca i32*, align 8
  %n.addr = alloca i32, align 4
  %sum = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %A, i32** %A.addr, align 8
  store i32* %B, i32** %B.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i32 0, i32* %sum, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %1 = load i32* %n.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %3 = load i32** %A.addr, align 8
  %arrayidx = getelementptr inbounds i32* %3, i64 %idxprom
  %4 = load i32* %arrayidx, align 4
  %5 = load i32* %i, align 4
  %idxprom1 = sext i32 %5 to i64
  %6 = load i32** %B.addr, align 8
  %arrayidx2 = getelementptr inbounds i32* %6, i64 %idxprom1
  %7 = load i32* %arrayidx2, align 4
  %cmp3 = icmp sgt i32 %4, %7
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %8 = load i32* %i, align 4
  %idxprom4 = sext i32 %8 to i64
  %9 = load i32** %A.addr, align 8
  %arrayidx5 = getelementptr inbounds i32* %9, i64 %idxprom4
  %10 = load i32* %arrayidx5, align 4
  %add = add nsw i32 %10, 5
  %11 = load i32* %sum, align 4
  %add6 = add i32 %11, %add
  store i32 %add6, i32* %sum, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %12 = load i32* %i, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %13 = load i32* %sum, align 4
  ret i32 %13
}

; Function Attrs: nounwind uwtable
define i32 @accumulate_2d_addr_fixed(i32** %in, i32 %y, i32 %x) #0 {
entry:
  %in.addr = alloca i32**, align 8
  %y.addr = alloca i32, align 4
  %x.addr = alloca i32, align 4
  %w_size_half = alloca i32, align 4
  %acc = alloca i32, align 4
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  store i32** %in, i32*** %in.addr, align 8
  store i32 %y, i32* %y.addr, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 8, i32* %w_size_half, align 4
  store i32 0, i32* %acc, align 4
  store i32 -8, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc8, %entry
  %0 = load i32* %j, align 4
  %cmp = icmp sle i32 %0, 8
  br i1 %cmp, label %for.body, label %for.end10

for.body:                                         ; preds = %for.cond
  store i32 -8, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32* %i, align 4
  %cmp2 = icmp sle i32 %1, 8
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %2 = load i32* %x.addr, align 4
  %3 = load i32* %i, align 4
  %add = add nsw i32 %2, %3
  %idxprom = sext i32 %add to i64
  %4 = load i32* %y.addr, align 4
  %5 = load i32* %j, align 4
  %add4 = add nsw i32 %4, %5
  %idxprom5 = sext i32 %add4 to i64
  %6 = load i32*** %in.addr, align 8
  %arrayidx = getelementptr inbounds i32** %6, i64 %idxprom5
  %7 = load i32** %arrayidx, align 8
  %arrayidx6 = getelementptr inbounds i32* %7, i64 %idxprom
  %8 = load i32* %arrayidx6, align 4
  %9 = load i32* %acc, align 4
  %add7 = add nsw i32 %9, %8
  store i32 %add7, i32* %acc, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %10 = load i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc8

for.inc8:                                         ; preds = %for.end
  %11 = load i32* %j, align 4
  %inc9 = add nsw i32 %11, 1
  store i32 %inc9, i32* %j, align 4
  br label %for.cond

for.end10:                                        ; preds = %for.cond
  %12 = load i32* %acc, align 4
  ret i32 %12
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)"}
