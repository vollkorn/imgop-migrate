; ModuleID = 'arraccess.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @foo(i64 %n, i64 %m, double* %A) #0 {
entry:
  %n.addr = alloca i64, align 8
  %m.addr = alloca i64, align 8
  %A.addr = alloca double*, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  store i64 %n, i64* %n.addr, align 8
  store i64 %m, i64* %m.addr, align 8
  store double* %A, double** %A.addr, align 8
  %0 = load i64* %n.addr, align 8
  %1 = load i64* %m.addr, align 8
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc5, %entry
  %2 = load i64* %i, align 8
  %3 = load i64* %n.addr, align 8
  %cmp = icmp slt i64 %2, %3
  br i1 %cmp, label %for.body, label %for.end7

for.body:                                         ; preds = %for.cond
  store i64 0, i64* %j, align 8
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %4 = load i64* %j, align 8
  %5 = load i64* %m.addr, align 8
  %cmp2 = icmp slt i64 %4, %5
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %6 = load i64* %j, align 8
  %7 = load i64* %i, align 8
  %8 = load double** %A.addr, align 8
  %9 = mul nsw i64 %7, %1
  %arrayidx = getelementptr inbounds double* %8, i64 %9
  %arrayidx4 = getelementptr inbounds double* %arrayidx, i64 %6
  store double 1.000000e+00, double* %arrayidx4, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %10 = load i64* %j, align 8
  %inc = add nsw i64 %10, 1
  store i64 %inc, i64* %j, align 8
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc5

for.inc5:                                         ; preds = %for.end
  %11 = load i64* %i, align 8
  %inc6 = add nsw i64 %11, 1
  store i64 %inc6, i64* %i, align 8
  br label %for.cond

for.end7:                                         ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind uwtable
define void @bar(i64 %n, i64 %m, double* %A) #0 {
entry:
  %n.addr = alloca i64, align 8
  %m.addr = alloca i64, align 8
  %A.addr = alloca double*, align 8
  %foo = alloca i64, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  store i64 %n, i64* %n.addr, align 8
  store i64 %m, i64* %m.addr, align 8
  store double* %A, double** %A.addr, align 8
  %0 = load i64* %n.addr, align 8
  %1 = load i64* %m.addr, align 8
  store i64 0, i64* %foo, align 8
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc6, %entry
  %2 = load i64* %i, align 8
  %3 = load i64* %n.addr, align 8
  %cmp = icmp slt i64 %2, %3
  br i1 %cmp, label %for.body, label %for.end8

for.body:                                         ; preds = %for.cond
  store i64 0, i64* %j, align 8
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %4 = load i64* %j, align 8
  %5 = load i64* %m.addr, align 8
  %cmp2 = icmp slt i64 %4, %5
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %6 = load i64* %j, align 8
  %7 = load i64* %i, align 8
  %8 = load double** %A.addr, align 8
  %9 = mul nsw i64 %7, %1
  %arrayidx = getelementptr inbounds double* %8, i64 %9
  %arrayidx4 = getelementptr inbounds double* %arrayidx, i64 %6
  %10 = load double* %arrayidx4, align 8
  %11 = load i64* %foo, align 8
  %conv = sitofp i64 %11 to double
  %add = fadd double %conv, %10
  %conv5 = fptosi double %add to i64
  store i64 %conv5, i64* %foo, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %12 = load i64* %j, align 8
  %inc = add nsw i64 %12, 1
  store i64 %inc, i64* %j, align 8
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc6

for.inc6:                                         ; preds = %for.end
  %13 = load i64* %i, align 8
  %inc7 = add nsw i64 %13, 1
  store i64 %inc7, i64* %i, align 8
  br label %for.cond

for.end8:                                         ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind uwtable
define void @bla(i64 %n, i64 %m, double** %A) #0 {
entry:
  %n.addr = alloca i64, align 8
  %m.addr = alloca i64, align 8
  %A.addr = alloca double**, align 8
  %foo = alloca i64, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  store i64 %n, i64* %n.addr, align 8
  store i64 %m, i64* %m.addr, align 8
  store double** %A, double*** %A.addr, align 8
  store i64 0, i64* %foo, align 8
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc6, %entry
  %0 = load i64* %i, align 8
  %1 = load i64* %n.addr, align 8
  %cmp = icmp slt i64 %0, %1
  br i1 %cmp, label %for.body, label %for.end8

for.body:                                         ; preds = %for.cond
  store i64 0, i64* %j, align 8
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i64* %j, align 8
  %3 = load i64* %m.addr, align 8
  %cmp2 = icmp slt i64 %2, %3
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %4 = load i64* %j, align 8
  %5 = load i64* %i, align 8
  %6 = load double*** %A.addr, align 8
  %arrayidx = getelementptr inbounds double** %6, i64 %5
  %7 = load double** %arrayidx, align 8
  %arrayidx4 = getelementptr inbounds double* %7, i64 %4
  %8 = load double* %arrayidx4, align 8
  %9 = load i64* %foo, align 8
  %conv = sitofp i64 %9 to double
  %add = fadd double %conv, %8
  %conv5 = fptosi double %add to i64
  store i64 %conv5, i64* %foo, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %10 = load i64* %j, align 8
  %inc = add nsw i64 %10, 1
  store i64 %inc, i64* %j, align 8
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc6

for.inc6:                                         ; preds = %for.end
  %11 = load i64* %i, align 8
  %inc7 = add nsw i64 %11, 1
  store i64 %inc7, i64* %i, align 8
  br label %for.cond

for.end8:                                         ; preds = %for.cond
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)"}
