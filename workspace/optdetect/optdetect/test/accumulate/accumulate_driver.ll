; ModuleID = 'accumulate_driver.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [9 x i8] c"Acc: %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @free_array_2d(i64 %nrows, i32** %arr) #0 {
entry:
  %nrows.addr = alloca i64, align 8
  %arr.addr = alloca i32**, align 8
  %i = alloca i32, align 4
  store i64 %nrows, i64* %nrows.addr, align 8
  store i32** %arr, i32*** %arr.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %conv = sext i32 %0 to i64
  %1 = load i64* %nrows.addr, align 8
  %cmp = icmp ult i64 %conv, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %3 = load i32*** %arr.addr, align 8
  %arrayidx = getelementptr inbounds i32** %3, i64 %idxprom
  %4 = load i32** %arrayidx, align 8
  %5 = bitcast i32* %4 to i8*
  call void @free(i8* %5) #4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %7 = load i32*** %arr.addr, align 8
  %8 = bitcast i32** %7 to i8*
  call void @free(i8* %8) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define i32** @create_array_2d(i64 %nrows, i64 %ncols, i32 %init) #0 {
entry:
  %nrows.addr = alloca i64, align 8
  %ncols.addr = alloca i64, align 8
  %init.addr = alloca i32, align 4
  %foo = alloca i32**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i64 %nrows, i64* %nrows.addr, align 8
  store i64 %ncols, i64* %ncols.addr, align 8
  store i32 %init, i32* %init.addr, align 4
  %0 = load i64* %nrows.addr, align 8
  %mul = mul i64 8, %0
  %call = call noalias i8* @malloc(i64 %mul) #4
  %1 = bitcast i8* %call to i32**
  store i32** %1, i32*** %foo, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc13, %entry
  %2 = load i32* %i, align 4
  %conv = sext i32 %2 to i64
  %3 = load i64* %nrows.addr, align 8
  %cmp = icmp ult i64 %conv, %3
  br i1 %cmp, label %for.body, label %for.end15

for.body:                                         ; preds = %for.cond
  %4 = load i64* %ncols.addr, align 8
  %mul2 = mul i64 4, %4
  %call3 = call noalias i8* @malloc(i64 %mul2) #4
  %5 = bitcast i8* %call3 to i32*
  %6 = load i32* %i, align 4
  %idxprom = sext i32 %6 to i64
  %7 = load i32*** %foo, align 8
  %arrayidx = getelementptr inbounds i32** %7, i64 %idxprom
  store i32* %5, i32** %arrayidx, align 8
  store i32 0, i32* %j, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body
  %8 = load i32* %j, align 4
  %conv5 = sext i32 %8 to i64
  %9 = load i64* %ncols.addr, align 8
  %cmp6 = icmp ult i64 %conv5, %9
  br i1 %cmp6, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond4
  %10 = load i32* %init.addr, align 4
  %11 = load i32* %j, align 4
  %idxprom9 = sext i32 %11 to i64
  %12 = load i32* %i, align 4
  %idxprom10 = sext i32 %12 to i64
  %13 = load i32*** %foo, align 8
  %arrayidx11 = getelementptr inbounds i32** %13, i64 %idxprom10
  %14 = load i32** %arrayidx11, align 8
  %arrayidx12 = getelementptr inbounds i32* %14, i64 %idxprom9
  store i32 %10, i32* %arrayidx12, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body8
  %15 = load i32* %j, align 4
  %inc = add nsw i32 %15, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  br label %for.inc13

for.inc13:                                        ; preds = %for.end
  %16 = load i32* %i, align 4
  %inc14 = add nsw i32 %16, 1
  store i32 %inc14, i32* %i, align 4
  br label %for.cond

for.end15:                                        ; preds = %for.cond
  %17 = load i32*** %foo, align 8
  ret i32** %17
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %_size_arr = alloca i32, align 4
  %_size_window = alloca i32, align 4
  %nrows = alloca i64, align 8
  %ncols = alloca i64, align 8
  %foo = alloca i32**, align 8
  %bar = alloca i32**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8** %0, i64 1
  %1 = load i8** %arrayidx, align 8
  %call = call i32 @atoi(i8* %1) #5
  store i32 %call, i32* %_size_arr, align 4
  %2 = load i8*** %argv.addr, align 8
  %arrayidx1 = getelementptr inbounds i8** %2, i64 2
  %3 = load i8** %arrayidx1, align 8
  %call2 = call i32 @atoi(i8* %3) #5
  store i32 %call2, i32* %_size_window, align 4
  %4 = load i32* %_size_arr, align 4
  %5 = load i32* %_size_window, align 4
  %cmp = icmp slt i32 %4, %5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %6 = load i32* %_size_arr, align 4
  %conv = sext i32 %6 to i64
  store i64 %conv, i64* %ncols, align 8
  store i64 %conv, i64* %nrows, align 8
  %7 = load i64* %nrows, align 8
  %8 = load i64* %ncols, align 8
  %call3 = call i32** @create_array_2d(i64 %7, i64 %8, i32 1)
  store i32** %call3, i32*** %foo, align 8
  %9 = load i64* %nrows, align 8
  %10 = load i64* %ncols, align 8
  %call4 = call i32** @create_array_2d(i64 %9, i64 %10, i32 1)
  store i32** %call4, i32*** %bar, align 8
  %11 = load i32*** %foo, align 8
  %12 = load i32*** %bar, align 8
  %13 = load i32* %_size_window, align 4
  %add = add nsw i32 %13, 1
  %14 = load i32* %_size_window, align 4
  %add5 = add nsw i32 %14, 1
  %15 = load i32* %_size_window, align 4
  call void @accumulate_2d_addr(i32** %11, i32** %12, i32 %add, i32 %add5, i32 %15)
  %16 = load i32* %_size_window, align 4
  %add6 = add nsw i32 %16, 1
  %idxprom = sext i32 %add6 to i64
  %17 = load i32* %_size_window, align 4
  %add7 = add nsw i32 %17, 1
  %idxprom8 = sext i32 %add7 to i64
  %18 = load i32*** %bar, align 8
  %arrayidx9 = getelementptr inbounds i32** %18, i64 %idxprom8
  %19 = load i32** %arrayidx9, align 8
  %arrayidx10 = getelementptr inbounds i32* %19, i64 %idxprom
  %20 = load i32* %arrayidx10, align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), i32 %20)
  %21 = load i64* %nrows, align 8
  %22 = load i32*** %foo, align 8
  call void @free_array_2d(i64 %21, i32** %22)
  %23 = load i64* %nrows, align 8
  %24 = load i32*** %bar, align 8
  call void @free_array_2d(i64 %23, i32** %24)
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %25 = load i32* %retval
  ret i32 %25
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #2

declare void @accumulate_2d_addr(i32**, i32**, i32, i32, i32) #3

declare i32 @printf(i8*, ...) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)"}
