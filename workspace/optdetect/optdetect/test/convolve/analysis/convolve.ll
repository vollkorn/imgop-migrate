; ModuleID = 'convolve.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @convolve(i8* %in, i8* %out, float* %kernel, i32 %nx, i32 %ny, i32 %kn) #0 {
entry:
  %in.addr = alloca i8*, align 8
  %out.addr = alloca i8*, align 8
  %kernel.addr = alloca float*, align 8
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %kn.addr = alloca i32, align 4
  %khalf = alloca i32, align 4
  %s = alloca i32, align 4
  %k = alloca i32, align 4
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  %m = alloca i32, align 4
  %n = alloca i32, align 4
  %pixel = alloca float, align 4
  %c = alloca i32, align 4
  %j20 = alloca i32, align 4
  %i26 = alloca i32, align 4
  store i8* %in, i8** %in.addr, align 8
  store i8* %out, i8** %out.addr, align 8
  store float* %kernel, float** %kernel.addr, align 8
  store i32 %nx, i32* %nx.addr, align 4
  store i32 %ny, i32* %ny.addr, align 4
  store i32 %kn, i32* %kn.addr, align 4
  %0 = load i32* %kn.addr, align 4
  %div = sdiv i32 %0, 2
  store i32 %div, i32* %khalf, align 4
  store i32 0, i32* %s, align 4
  store i32 0, i32* %k, align 4
  %1 = load i32* %khalf, align 4
  %sub = sub nsw i32 0, %1
  store i32 %sub, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc7, %entry
  %2 = load i32* %j, align 4
  %3 = load i32* %khalf, align 4
  %cmp = icmp sle i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end9

for.body:                                         ; preds = %for.cond
  %4 = load i32* %khalf, align 4
  %sub1 = sub nsw i32 0, %4
  store i32 %sub1, i32* %i, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %5 = load i32* %i, align 4
  %6 = load i32* %khalf, align 4
  %cmp3 = icmp sle i32 %5, %6
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %7 = load i32* %k, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %k, align 4
  %idxprom = sext i32 %7 to i64
  %8 = load float** %kernel.addr, align 8
  %arrayidx = getelementptr inbounds float* %8, i64 %idxprom
  %9 = load float* %arrayidx, align 4
  %10 = load i32* %s, align 4
  %conv = sitofp i32 %10 to float
  %add = fadd float %conv, %9
  %conv5 = fptosi float %add to i32
  store i32 %conv5, i32* %s, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %11 = load i32* %i, align 4
  %inc6 = add nsw i32 %11, 1
  store i32 %inc6, i32* %i, align 4
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc7

for.inc7:                                         ; preds = %for.end
  %12 = load i32* %j, align 4
  %inc8 = add nsw i32 %12, 1
  store i32 %inc8, i32* %j, align 4
  br label %for.cond

for.end9:                                         ; preds = %for.cond
  %13 = load i32* %khalf, align 4
  store i32 %13, i32* %m, align 4
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc60, %for.end9
  %14 = load i32* %m, align 4
  %15 = load i32* %nx.addr, align 4
  %16 = load i32* %khalf, align 4
  %sub11 = sub nsw i32 %15, %16
  %cmp12 = icmp slt i32 %14, %sub11
  br i1 %cmp12, label %for.body14, label %for.end62

for.body14:                                       ; preds = %for.cond10
  %17 = load i32* %khalf, align 4
  store i32 %17, i32* %n, align 4
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc57, %for.body14
  %18 = load i32* %n, align 4
  %19 = load i32* %ny.addr, align 4
  %20 = load i32* %khalf, align 4
  %sub16 = sub nsw i32 %19, %20
  %cmp17 = icmp slt i32 %18, %sub16
  br i1 %cmp17, label %for.body19, label %for.end59

for.body19:                                       ; preds = %for.cond15
  store float 0.000000e+00, float* %pixel, align 4
  store i32 0, i32* %c, align 4
  %21 = load i32* %khalf, align 4
  %sub21 = sub nsw i32 0, %21
  store i32 %sub21, i32* %j20, align 4
  br label %for.cond22

for.cond22:                                       ; preds = %for.inc47, %for.body19
  %22 = load i32* %j20, align 4
  %23 = load i32* %khalf, align 4
  %cmp23 = icmp sle i32 %22, %23
  br i1 %cmp23, label %for.body25, label %for.end49

for.body25:                                       ; preds = %for.cond22
  %24 = load i32* %khalf, align 4
  %sub27 = sub nsw i32 0, %24
  store i32 %sub27, i32* %i26, align 4
  br label %for.cond28

for.cond28:                                       ; preds = %for.inc44, %for.body25
  %25 = load i32* %i26, align 4
  %26 = load i32* %khalf, align 4
  %cmp29 = icmp sle i32 %25, %26
  br i1 %cmp29, label %for.body31, label %for.end46

for.body31:                                       ; preds = %for.cond28
  %27 = load i32* %n, align 4
  %28 = load i32* %j20, align 4
  %sub32 = sub nsw i32 %27, %28
  %29 = load i32* %nx.addr, align 4
  %mul = mul nsw i32 %sub32, %29
  %30 = load i32* %m, align 4
  %add33 = add nsw i32 %mul, %30
  %31 = load i32* %i26, align 4
  %sub34 = sub nsw i32 %add33, %31
  %idxprom35 = sext i32 %sub34 to i64
  %32 = load i8** %in.addr, align 8
  %arrayidx36 = getelementptr inbounds i8* %32, i64 %idxprom35
  %33 = load i8* %arrayidx36, align 1
  %conv37 = zext i8 %33 to i32
  %conv38 = sitofp i32 %conv37 to float
  %34 = load i32* %c, align 4
  %inc39 = add nsw i32 %34, 1
  store i32 %inc39, i32* %c, align 4
  %idxprom40 = sext i32 %34 to i64
  %35 = load float** %kernel.addr, align 8
  %arrayidx41 = getelementptr inbounds float* %35, i64 %idxprom40
  %36 = load float* %arrayidx41, align 4
  %mul42 = fmul float %conv38, %36
  %37 = load float* %pixel, align 4
  %add43 = fadd float %37, %mul42
  store float %add43, float* %pixel, align 4
  br label %for.inc44

for.inc44:                                        ; preds = %for.body31
  %38 = load i32* %i26, align 4
  %inc45 = add nsw i32 %38, 1
  store i32 %inc45, i32* %i26, align 4
  br label %for.cond28

for.end46:                                        ; preds = %for.cond28
  br label %for.inc47

for.inc47:                                        ; preds = %for.end46
  %39 = load i32* %j20, align 4
  %inc48 = add nsw i32 %39, 1
  store i32 %inc48, i32* %j20, align 4
  br label %for.cond22

for.end49:                                        ; preds = %for.cond22
  %40 = load float* %pixel, align 4
  %41 = load i32* %s, align 4
  %conv50 = sitofp i32 %41 to float
  %div51 = fdiv float %40, %conv50
  %conv52 = fptoui float %div51 to i8
  %42 = load i32* %n, align 4
  %43 = load i32* %nx.addr, align 4
  %mul53 = mul nsw i32 %42, %43
  %44 = load i32* %m, align 4
  %add54 = add nsw i32 %mul53, %44
  %idxprom55 = sext i32 %add54 to i64
  %45 = load i8** %out.addr, align 8
  %arrayidx56 = getelementptr inbounds i8* %45, i64 %idxprom55
  store i8 %conv52, i8* %arrayidx56, align 1
  br label %for.inc57

for.inc57:                                        ; preds = %for.end49
  %46 = load i32* %n, align 4
  %inc58 = add nsw i32 %46, 1
  store i32 %inc58, i32* %n, align 4
  br label %for.cond15

for.end59:                                        ; preds = %for.cond15
  br label %for.inc60

for.inc60:                                        ; preds = %for.end59
  %47 = load i32* %m, align 4
  %inc61 = add nsw i32 %47, 1
  store i32 %inc61, i32* %m, align 4
  br label %for.cond10

for.end62:                                        ; preds = %for.cond10
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (http://llvm.org/git/clang.git 33947ed22c57e11e7aa88e803bfdd664fe50412f) (http://llvm.org/git/llvm.git 186332c0c98aab21acb91ae11055e44ec1acb95a)"}
