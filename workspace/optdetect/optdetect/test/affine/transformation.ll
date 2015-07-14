; ModuleID = 'transformation.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @foo(i32 %l, i32 %n, i32 %m, i32* %R) #0 {
entry:
  %l.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %R.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %l, i32* %l.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32* %R, i32** %R.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %0 = load i32* %i, align 4
  %1 = load i32* %l.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end12

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %k, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc7, %for.body
  %2 = load i32* %k, align 4
  %3 = load i32* %n.addr, align 4
  %cmp2 = icmp slt i32 %2, %3
  br i1 %cmp2, label %for.body3, label %for.end9

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %j, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body3
  %4 = load i32* %j, align 4
  %5 = load i32* %m.addr, align 4
  %cmp5 = icmp slt i32 %4, %5
  br i1 %cmp5, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond4
  %6 = load i32** %R.addr, align 8
  %7 = load i32* %6, align 4
  %add = add nsw i32 %7, 1
  %8 = load i32** %R.addr, align 8
  store i32 %add, i32* %8, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body6
  %9 = load i32* %j, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  br label %for.inc7

for.inc7:                                         ; preds = %for.end
  %10 = load i32* %k, align 4
  %inc8 = add nsw i32 %10, 1
  store i32 %inc8, i32* %k, align 4
  br label %for.cond1

for.end9:                                         ; preds = %for.cond1
  br label %for.inc10

for.inc10:                                        ; preds = %for.end9
  %11 = load i32* %i, align 4
  %inc11 = add nsw i32 %11, 1
  store i32 %inc11, i32* %i, align 4
  br label %for.cond

for.end12:                                        ; preds = %for.cond
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
  %N = alloca i32, align 4
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

for.cond:                                         ; preds = %for.inc6, %entry
  %12 = load i32* %i, align 4
  %13 = load i32* %l.addr, align 4
  %cmp = icmp slt i32 %12, %13
  br i1 %cmp, label %for.body, label %for.end8

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %k, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %14 = load i32* %k, align 4
  %15 = load i32* %n.addr, align 4
  %cmp2 = icmp slt i32 %14, %15
  br i1 %cmp2, label %for.body3, label %for.end

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
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %20 = load i32* %k, align 4
  %inc = add nsw i32 %20, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc6

for.inc6:                                         ; preds = %for.end
  %21 = load i32* %i, align 4
  %inc7 = add nsw i32 %21, 1
  store i32 %inc7, i32* %i, align 4
  br label %for.cond

for.end8:                                         ; preds = %for.cond
  %22 = load i32* %l.addr, align 4
  store i32 %22, i32* %N, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc44, %for.end8
  %23 = load i32* %i, align 4
  %24 = load i32* %N, align 4
  %cmp10 = icmp slt i32 %23, %24
  br i1 %cmp10, label %for.body11, label %for.end46

for.body11:                                       ; preds = %for.cond9
  store i32 0, i32* %j, align 4
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc41, %for.body11
  %25 = load i32* %j, align 4
  %26 = load i32* %N, align 4
  %cmp13 = icmp slt i32 %25, %26
  br i1 %cmp13, label %for.body14, label %for.end43

for.body14:                                       ; preds = %for.cond12
  %27 = load i32* %j, align 4
  %idxprom15 = sext i32 %27 to i64
  %28 = load i32* %i, align 4
  %idxprom16 = sext i32 %28 to i64
  %29 = load float** %C.addr, align 8
  %30 = mul nsw i64 %idxprom16, %11
  %arrayidx17 = getelementptr inbounds float* %29, i64 %30
  %arrayidx18 = getelementptr inbounds float* %arrayidx17, i64 %idxprom15
  store float 0.000000e+00, float* %arrayidx18, align 4
  store i32 0, i32* %k, align 4
  br label %for.cond19

for.cond19:                                       ; preds = %for.inc38, %for.body14
  %31 = load i32* %k, align 4
  %32 = load i32* %N, align 4
  %cmp20 = icmp slt i32 %31, %32
  br i1 %cmp20, label %for.body21, label %for.end40

for.body21:                                       ; preds = %for.cond19
  %33 = load i32* %j, align 4
  %idxprom22 = sext i32 %33 to i64
  %34 = load i32* %i, align 4
  %idxprom23 = sext i32 %34 to i64
  %35 = load float** %C.addr, align 8
  %36 = mul nsw i64 %idxprom23, %11
  %arrayidx24 = getelementptr inbounds float* %35, i64 %36
  %arrayidx25 = getelementptr inbounds float* %arrayidx24, i64 %idxprom22
  %37 = load float* %arrayidx25, align 4
  %38 = load i32* %k, align 4
  %idxprom26 = sext i32 %38 to i64
  %39 = load i32* %i, align 4
  %idxprom27 = sext i32 %39 to i64
  %40 = load float** %A.addr, align 8
  %41 = mul nsw i64 %idxprom27, %3
  %arrayidx28 = getelementptr inbounds float* %40, i64 %41
  %arrayidx29 = getelementptr inbounds float* %arrayidx28, i64 %idxprom26
  %42 = load float* %arrayidx29, align 4
  %43 = load i32* %j, align 4
  %idxprom30 = sext i32 %43 to i64
  %44 = load i32* %k, align 4
  %idxprom31 = sext i32 %44 to i64
  %45 = load float** %B.addr, align 8
  %46 = mul nsw i64 %idxprom31, %7
  %arrayidx32 = getelementptr inbounds float* %45, i64 %46
  %arrayidx33 = getelementptr inbounds float* %arrayidx32, i64 %idxprom30
  %47 = load float* %arrayidx33, align 4
  %mul = fmul float %42, %47
  %add = fadd float %37, %mul
  %48 = load i32* %j, align 4
  %idxprom34 = sext i32 %48 to i64
  %49 = load i32* %i, align 4
  %idxprom35 = sext i32 %49 to i64
  %50 = load float** %C.addr, align 8
  %51 = mul nsw i64 %idxprom35, %11
  %arrayidx36 = getelementptr inbounds float* %50, i64 %51
  %arrayidx37 = getelementptr inbounds float* %arrayidx36, i64 %idxprom34
  store float %add, float* %arrayidx37, align 4
  br label %for.inc38

for.inc38:                                        ; preds = %for.body21
  %52 = load i32* %k, align 4
  %inc39 = add nsw i32 %52, 1
  store i32 %inc39, i32* %k, align 4
  br label %for.cond19

for.end40:                                        ; preds = %for.cond19
  br label %for.inc41

for.inc41:                                        ; preds = %for.end40
  %53 = load i32* %j, align 4
  %inc42 = add nsw i32 %53, 1
  store i32 %inc42, i32* %j, align 4
  br label %for.cond12

for.end43:                                        ; preds = %for.cond12
  br label %for.inc44

for.inc44:                                        ; preds = %for.end43
  %54 = load i32* %i, align 4
  %inc45 = add nsw i32 %54, 1
  store i32 %inc45, i32* %i, align 4
  br label %for.cond9

for.end46:                                        ; preds = %for.cond9
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)"}
