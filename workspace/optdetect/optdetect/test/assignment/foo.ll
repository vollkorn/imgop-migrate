; ModuleID = 'foo.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @foo(float* %A) #0 {
entry:
  %A.addr = alloca float*, align 8
  %i = alloca i32, align 4
  store float* %A, float** %A.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %add = add nsw i32 %1, 5
  %mul = mul nsw i32 %add, 3
  %2 = load i32* %i, align 4
  %mul1 = mul nsw i32 %mul, %2
  %conv = sitofp i32 %mul1 to float
  %3 = load i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %4 = load float** %A.addr, align 8
  %arrayidx = getelementptr inbounds float* %4, i64 %idxprom
  store float %conv, float* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind uwtable
define void @bar([10 x float]* %A, i32 %a, i32 %b) #0 {
entry:
  %A.addr = alloca [10 x float]*, align 8
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  store [10 x float]* %A, [10 x float]** %A.addr, align 8
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc16, %entry
  %0 = load i32* %j, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end18

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32* %i, align 4
  %cmp2 = icmp slt i32 %1, 10
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %2 = load i32* %a.addr, align 4
  %3 = load i32* %b.addr, align 4
  %cmp4 = icmp sgt i32 %2, %3
  br i1 %cmp4, label %if.then, label %if.else

if.then:                                          ; preds = %for.body3
  %4 = load i32* %i, align 4
  %add = add nsw i32 %4, 5
  %mul = mul nsw i32 %add, 3
  %5 = load i32* %j, align 4
  %mul5 = mul nsw i32 %mul, %5
  %conv = sitofp i32 %mul5 to float
  %6 = load i32* %j, align 4
  %idxprom = sext i32 %6 to i64
  %7 = load i32* %i, align 4
  %idxprom6 = sext i32 %7 to i64
  %8 = load [10 x float]** %A.addr, align 8
  %arrayidx = getelementptr inbounds [10 x float]* %8, i64 %idxprom6
  %arrayidx7 = getelementptr inbounds [10 x float]* %arrayidx, i32 0, i64 %idxprom
  store float %conv, float* %arrayidx7, align 4
  br label %if.end

if.else:                                          ; preds = %for.body3
  %9 = load i32* %i, align 4
  %add8 = add nsw i32 %9, 5
  %10 = load i32* %a.addr, align 4
  %mul9 = mul nsw i32 %add8, %10
  %11 = load i32* %j, align 4
  %mul10 = mul nsw i32 %mul9, %11
  %conv11 = sitofp i32 %mul10 to float
  %12 = load i32* %j, align 4
  %idxprom12 = sext i32 %12 to i64
  %13 = load i32* %i, align 4
  %idxprom13 = sext i32 %13 to i64
  %14 = load [10 x float]** %A.addr, align 8
  %arrayidx14 = getelementptr inbounds [10 x float]* %14, i64 %idxprom13
  %arrayidx15 = getelementptr inbounds [10 x float]* %arrayidx14, i32 0, i64 %idxprom12
  store float %conv11, float* %arrayidx15, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %15 = load i32* %i, align 4
  %inc = add nsw i32 %15, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc16

for.inc16:                                        ; preds = %for.end
  %16 = load i32* %j, align 4
  %inc17 = add nsw i32 %16, 1
  store i32 %inc17, i32* %j, align 4
  br label %for.cond

for.end18:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind uwtable
define void @foobar(i32 %n, i32 %m, float* %A) #0 {
entry:
  %n.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %A.addr = alloca float*, align 8
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store float* %A, float** %A.addr, align 8
  %0 = load i32* %n.addr, align 4
  %1 = zext i32 %0 to i64
  %2 = load i32* %m.addr, align 4
  %3 = zext i32 %2 to i64
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc7, %entry
  %4 = load i32* %j, align 4
  %5 = load i32* %n.addr, align 4
  %cmp = icmp slt i32 %4, %5
  br i1 %cmp, label %for.body, label %for.end9

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %6 = load i32* %i, align 4
  %7 = load i32* %m.addr, align 4
  %cmp2 = icmp slt i32 %6, %7
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %8 = load i32* %i, align 4
  %add = add nsw i32 %8, 5
  %mul = mul nsw i32 %add, 3
  %9 = load i32* %j, align 4
  %mul4 = mul nsw i32 %mul, %9
  %conv = sitofp i32 %mul4 to float
  %10 = load i32* %j, align 4
  %idxprom = sext i32 %10 to i64
  %11 = load i32* %i, align 4
  %idxprom5 = sext i32 %11 to i64
  %12 = load float** %A.addr, align 8
  %13 = mul nsw i64 %idxprom5, %3
  %arrayidx = getelementptr inbounds float* %12, i64 %13
  %arrayidx6 = getelementptr inbounds float* %arrayidx, i64 %idxprom
  store float %conv, float* %arrayidx6, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %14 = load i32* %i, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc7

for.inc7:                                         ; preds = %for.end
  %15 = load i32* %j, align 4
  %inc8 = add nsw i32 %15, 1
  store i32 %inc8, i32* %j, align 4
  br label %for.cond

for.end9:                                         ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind uwtable
define void @matrix_multiply(i32 %l, i32 %m, i32 %n, float* %A, float* %B, float* %C) #0 {
entry:
  %l.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %A.addr = alloca float*, align 8
  %B.addr = alloca float*, align 8
  %C.addr = alloca float*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %l, i32* %l.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store float* %A, float** %A.addr, align 8
  store float* %B, float** %B.addr, align 8
  store float* %C, float** %C.addr, align 8
  %0 = load i32* %l.addr, align 4
  %1 = zext i32 %0 to i64
  %2 = load i32* %m.addr, align 4
  %3 = zext i32 %2 to i64
  %4 = load i32* %m.addr, align 4
  %5 = zext i32 %4 to i64
  %6 = load i32* %n.addr, align 4
  %7 = zext i32 %6 to i64
  %8 = load i32* %l.addr, align 4
  %9 = zext i32 %8 to i64
  %10 = load i32* %n.addr, align 4
  %11 = zext i32 %10 to i64
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc28, %entry
  %12 = load i32* %i, align 4
  %13 = load i32* %l.addr, align 4
  %cmp = icmp slt i32 %12, %13
  br i1 %cmp, label %for.body, label %for.end30

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %k, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc25, %for.body
  %14 = load i32* %k, align 4
  %15 = load i32* %n.addr, align 4
  %cmp2 = icmp slt i32 %14, %15
  br i1 %cmp2, label %for.body3, label %for.end27

for.body3:                                        ; preds = %for.cond1
  %16 = load i32* %k, align 4
  %idxprom = sext i32 %16 to i64
  %17 = load i32* %i, align 4
  %idxprom4 = sext i32 %17 to i64
  %18 = load float** %C.addr, align 8
  %19 = mul nsw i64 %idxprom4, %11
  %arrayidx = getelementptr inbounds float* %18, i64 %19
  %arrayidx5 = getelementptr inbounds float* %arrayidx, i64 %idxprom
  store float 0.000000e+00, float* %arrayidx5, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc, %for.body3
  %20 = load i32* %j, align 4
  %21 = load i32* %m.addr, align 4
  %cmp7 = icmp slt i32 %20, %21
  br i1 %cmp7, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond6
  %22 = load i32* %k, align 4
  %idxprom9 = sext i32 %22 to i64
  %23 = load i32* %i, align 4
  %idxprom10 = sext i32 %23 to i64
  %24 = load float** %C.addr, align 8
  %25 = mul nsw i64 %idxprom10, %11
  %arrayidx11 = getelementptr inbounds float* %24, i64 %25
  %arrayidx12 = getelementptr inbounds float* %arrayidx11, i64 %idxprom9
  %26 = load float* %arrayidx12, align 4
  %27 = load i32* %j, align 4
  %idxprom13 = sext i32 %27 to i64
  %28 = load i32* %i, align 4
  %idxprom14 = sext i32 %28 to i64
  %29 = load float** %A.addr, align 8
  %30 = mul nsw i64 %idxprom14, %3
  %arrayidx15 = getelementptr inbounds float* %29, i64 %30
  %arrayidx16 = getelementptr inbounds float* %arrayidx15, i64 %idxprom13
  %31 = load float* %arrayidx16, align 4
  %32 = load i32* %j, align 4
  %idxprom17 = sext i32 %32 to i64
  %33 = load i32* %k, align 4
  %idxprom18 = sext i32 %33 to i64
  %34 = load float** %B.addr, align 8
  %35 = mul nsw i64 %idxprom18, %7
  %arrayidx19 = getelementptr inbounds float* %34, i64 %35
  %arrayidx20 = getelementptr inbounds float* %arrayidx19, i64 %idxprom17
  %36 = load float* %arrayidx20, align 4
  %mul = fmul float %31, %36
  %add = fadd float %26, %mul
  %37 = load i32* %k, align 4
  %idxprom21 = sext i32 %37 to i64
  %38 = load i32* %i, align 4
  %idxprom22 = sext i32 %38 to i64
  %39 = load float** %C.addr, align 8
  %40 = mul nsw i64 %idxprom22, %11
  %arrayidx23 = getelementptr inbounds float* %39, i64 %40
  %arrayidx24 = getelementptr inbounds float* %arrayidx23, i64 %idxprom21
  store float %add, float* %arrayidx24, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body8
  %41 = load i32* %j, align 4
  %inc = add nsw i32 %41, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond6

for.end:                                          ; preds = %for.cond6
  br label %for.inc25

for.inc25:                                        ; preds = %for.end
  %42 = load i32* %k, align 4
  %inc26 = add nsw i32 %42, 1
  store i32 %inc26, i32* %k, align 4
  br label %for.cond1

for.end27:                                        ; preds = %for.cond1
  br label %for.inc28

for.inc28:                                        ; preds = %for.end27
  %43 = load i32* %i, align 4
  %inc29 = add nsw i32 %43, 1
  store i32 %inc29, i32* %i, align 4
  br label %for.cond

for.end30:                                        ; preds = %for.cond
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)"}
