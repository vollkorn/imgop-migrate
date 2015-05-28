; ModuleID = 'convolve_fixed.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @convolve_fixed_3_3(i8* %in, i8* %out, float* %kernel, i32 %nx, i32 %ny) #0 {
entry:
  %in.addr = alloca i8*, align 8
  %out.addr = alloca i8*, align 8
  %kernel.addr = alloca float*, align 8
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %khalf = alloca i32, align 4
  %s = alloca i32, align 4
  %k = alloca i32, align 4
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  %m = alloca i32, align 4
  %n = alloca i32, align 4
  %pixel = alloca float, align 4
  %c = alloca i32, align 4
  store i8* %in, i8** %in.addr, align 8
  store i8* %out, i8** %out.addr, align 8
  store float* %kernel, float** %kernel.addr, align 8
  store i32 %nx, i32* %nx.addr, align 4
  store i32 %ny, i32* %ny.addr, align 4
  store i32 1, i32* %khalf, align 4
  store i32 0, i32* %s, align 4
  store i32 0, i32* %k, align 4
  store i32 -1, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc6, %entry
  %0 = load i32* %j, align 4
  %cmp = icmp sle i32 %0, 1
  br i1 %cmp, label %for.body, label %for.end8

for.body:                                         ; preds = %for.cond
  store i32 -1, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32* %i, align 4
  %cmp2 = icmp sle i32 %1, 1
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %2 = load i32* %k, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %k, align 4
  %idxprom = sext i32 %2 to i64
  %3 = load float** %kernel.addr, align 8
  %arrayidx = getelementptr inbounds float* %3, i64 %idxprom
  %4 = load float* %arrayidx, align 4
  %5 = load i32* %s, align 4
  %conv = sitofp i32 %5 to float
  %add = fadd float %conv, %4
  %conv4 = fptosi float %add to i32
  store i32 %conv4, i32* %s, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %6 = load i32* %i, align 4
  %inc5 = add nsw i32 %6, 1
  store i32 %inc5, i32* %i, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc6

for.inc6:                                         ; preds = %for.end
  %7 = load i32* %j, align 4
  %inc7 = add nsw i32 %7, 1
  store i32 %inc7, i32* %j, align 4
  br label %for.cond

for.end8:                                         ; preds = %for.cond
  store i32 1, i32* %m, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc143, %for.end8
  %8 = load i32* %m, align 4
  %9 = load i32* %nx.addr, align 4
  %sub = sub nsw i32 %9, 1
  %cmp10 = icmp slt i32 %8, %sub
  br i1 %cmp10, label %for.body12, label %for.end145

for.body12:                                       ; preds = %for.cond9
  store i32 1, i32* %n, align 4
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc140, %for.body12
  %10 = load i32* %n, align 4
  %11 = load i32* %ny.addr, align 4
  %sub14 = sub nsw i32 %11, 1
  %cmp15 = icmp slt i32 %10, %sub14
  br i1 %cmp15, label %for.body17, label %for.end142

for.body17:                                       ; preds = %for.cond13
  store float 0.000000e+00, float* %pixel, align 4
  store i32 0, i32* %c, align 4
  %12 = load i32* %n, align 4
  %sub18 = sub nsw i32 %12, -1
  %13 = load i32* %nx.addr, align 4
  %mul = mul nsw i32 %sub18, %13
  %14 = load i32* %m, align 4
  %add19 = add nsw i32 %mul, %14
  %sub20 = sub nsw i32 %add19, -1
  %idxprom21 = sext i32 %sub20 to i64
  %15 = load i8** %in.addr, align 8
  %arrayidx22 = getelementptr inbounds i8* %15, i64 %idxprom21
  %16 = load i8* %arrayidx22, align 1
  %conv23 = zext i8 %16 to i32
  %conv24 = sitofp i32 %conv23 to float
  %17 = load i32* %c, align 4
  %inc25 = add nsw i32 %17, 1
  store i32 %inc25, i32* %c, align 4
  %idxprom26 = sext i32 %17 to i64
  %18 = load float** %kernel.addr, align 8
  %arrayidx27 = getelementptr inbounds float* %18, i64 %idxprom26
  %19 = load float* %arrayidx27, align 4
  %mul28 = fmul float %conv24, %19
  %20 = load float* %pixel, align 4
  %add29 = fadd float %20, %mul28
  store float %add29, float* %pixel, align 4
  %21 = load i32* %n, align 4
  %sub30 = sub nsw i32 %21, 0
  %22 = load i32* %nx.addr, align 4
  %mul31 = mul nsw i32 %sub30, %22
  %23 = load i32* %m, align 4
  %add32 = add nsw i32 %mul31, %23
  %sub33 = sub nsw i32 %add32, -1
  %idxprom34 = sext i32 %sub33 to i64
  %24 = load i8** %in.addr, align 8
  %arrayidx35 = getelementptr inbounds i8* %24, i64 %idxprom34
  %25 = load i8* %arrayidx35, align 1
  %conv36 = zext i8 %25 to i32
  %conv37 = sitofp i32 %conv36 to float
  %26 = load i32* %c, align 4
  %inc38 = add nsw i32 %26, 1
  store i32 %inc38, i32* %c, align 4
  %idxprom39 = sext i32 %26 to i64
  %27 = load float** %kernel.addr, align 8
  %arrayidx40 = getelementptr inbounds float* %27, i64 %idxprom39
  %28 = load float* %arrayidx40, align 4
  %mul41 = fmul float %conv37, %28
  %29 = load float* %pixel, align 4
  %add42 = fadd float %29, %mul41
  store float %add42, float* %pixel, align 4
  %30 = load i32* %n, align 4
  %sub43 = sub nsw i32 %30, 1
  %31 = load i32* %nx.addr, align 4
  %mul44 = mul nsw i32 %sub43, %31
  %32 = load i32* %m, align 4
  %add45 = add nsw i32 %mul44, %32
  %sub46 = sub nsw i32 %add45, -1
  %idxprom47 = sext i32 %sub46 to i64
  %33 = load i8** %in.addr, align 8
  %arrayidx48 = getelementptr inbounds i8* %33, i64 %idxprom47
  %34 = load i8* %arrayidx48, align 1
  %conv49 = zext i8 %34 to i32
  %conv50 = sitofp i32 %conv49 to float
  %35 = load i32* %c, align 4
  %inc51 = add nsw i32 %35, 1
  store i32 %inc51, i32* %c, align 4
  %idxprom52 = sext i32 %35 to i64
  %36 = load float** %kernel.addr, align 8
  %arrayidx53 = getelementptr inbounds float* %36, i64 %idxprom52
  %37 = load float* %arrayidx53, align 4
  %mul54 = fmul float %conv50, %37
  %38 = load float* %pixel, align 4
  %add55 = fadd float %38, %mul54
  store float %add55, float* %pixel, align 4
  %39 = load i32* %n, align 4
  %sub56 = sub nsw i32 %39, -1
  %40 = load i32* %nx.addr, align 4
  %mul57 = mul nsw i32 %sub56, %40
  %41 = load i32* %m, align 4
  %add58 = add nsw i32 %mul57, %41
  %sub59 = sub nsw i32 %add58, 0
  %idxprom60 = sext i32 %sub59 to i64
  %42 = load i8** %in.addr, align 8
  %arrayidx61 = getelementptr inbounds i8* %42, i64 %idxprom60
  %43 = load i8* %arrayidx61, align 1
  %conv62 = zext i8 %43 to i32
  %conv63 = sitofp i32 %conv62 to float
  %44 = load i32* %c, align 4
  %inc64 = add nsw i32 %44, 1
  store i32 %inc64, i32* %c, align 4
  %idxprom65 = sext i32 %44 to i64
  %45 = load float** %kernel.addr, align 8
  %arrayidx66 = getelementptr inbounds float* %45, i64 %idxprom65
  %46 = load float* %arrayidx66, align 4
  %mul67 = fmul float %conv63, %46
  %47 = load float* %pixel, align 4
  %add68 = fadd float %47, %mul67
  store float %add68, float* %pixel, align 4
  %48 = load i32* %n, align 4
  %sub69 = sub nsw i32 %48, 0
  %49 = load i32* %nx.addr, align 4
  %mul70 = mul nsw i32 %sub69, %49
  %50 = load i32* %m, align 4
  %add71 = add nsw i32 %mul70, %50
  %sub72 = sub nsw i32 %add71, 0
  %idxprom73 = sext i32 %sub72 to i64
  %51 = load i8** %in.addr, align 8
  %arrayidx74 = getelementptr inbounds i8* %51, i64 %idxprom73
  %52 = load i8* %arrayidx74, align 1
  %conv75 = zext i8 %52 to i32
  %conv76 = sitofp i32 %conv75 to float
  %53 = load i32* %c, align 4
  %inc77 = add nsw i32 %53, 1
  store i32 %inc77, i32* %c, align 4
  %idxprom78 = sext i32 %53 to i64
  %54 = load float** %kernel.addr, align 8
  %arrayidx79 = getelementptr inbounds float* %54, i64 %idxprom78
  %55 = load float* %arrayidx79, align 4
  %mul80 = fmul float %conv76, %55
  %56 = load float* %pixel, align 4
  %add81 = fadd float %56, %mul80
  store float %add81, float* %pixel, align 4
  %57 = load i32* %n, align 4
  %sub82 = sub nsw i32 %57, 1
  %58 = load i32* %nx.addr, align 4
  %mul83 = mul nsw i32 %sub82, %58
  %59 = load i32* %m, align 4
  %add84 = add nsw i32 %mul83, %59
  %sub85 = sub nsw i32 %add84, 0
  %idxprom86 = sext i32 %sub85 to i64
  %60 = load i8** %in.addr, align 8
  %arrayidx87 = getelementptr inbounds i8* %60, i64 %idxprom86
  %61 = load i8* %arrayidx87, align 1
  %conv88 = zext i8 %61 to i32
  %conv89 = sitofp i32 %conv88 to float
  %62 = load i32* %c, align 4
  %inc90 = add nsw i32 %62, 1
  store i32 %inc90, i32* %c, align 4
  %idxprom91 = sext i32 %62 to i64
  %63 = load float** %kernel.addr, align 8
  %arrayidx92 = getelementptr inbounds float* %63, i64 %idxprom91
  %64 = load float* %arrayidx92, align 4
  %mul93 = fmul float %conv89, %64
  %65 = load float* %pixel, align 4
  %add94 = fadd float %65, %mul93
  store float %add94, float* %pixel, align 4
  %66 = load i32* %n, align 4
  %sub95 = sub nsw i32 %66, -1
  %67 = load i32* %nx.addr, align 4
  %mul96 = mul nsw i32 %sub95, %67
  %68 = load i32* %m, align 4
  %add97 = add nsw i32 %mul96, %68
  %sub98 = sub nsw i32 %add97, 1
  %idxprom99 = sext i32 %sub98 to i64
  %69 = load i8** %in.addr, align 8
  %arrayidx100 = getelementptr inbounds i8* %69, i64 %idxprom99
  %70 = load i8* %arrayidx100, align 1
  %conv101 = zext i8 %70 to i32
  %conv102 = sitofp i32 %conv101 to float
  %71 = load i32* %c, align 4
  %inc103 = add nsw i32 %71, 1
  store i32 %inc103, i32* %c, align 4
  %idxprom104 = sext i32 %71 to i64
  %72 = load float** %kernel.addr, align 8
  %arrayidx105 = getelementptr inbounds float* %72, i64 %idxprom104
  %73 = load float* %arrayidx105, align 4
  %mul106 = fmul float %conv102, %73
  %74 = load float* %pixel, align 4
  %add107 = fadd float %74, %mul106
  store float %add107, float* %pixel, align 4
  %75 = load i32* %n, align 4
  %sub108 = sub nsw i32 %75, 0
  %76 = load i32* %nx.addr, align 4
  %mul109 = mul nsw i32 %sub108, %76
  %77 = load i32* %m, align 4
  %add110 = add nsw i32 %mul109, %77
  %sub111 = sub nsw i32 %add110, 1
  %idxprom112 = sext i32 %sub111 to i64
  %78 = load i8** %in.addr, align 8
  %arrayidx113 = getelementptr inbounds i8* %78, i64 %idxprom112
  %79 = load i8* %arrayidx113, align 1
  %conv114 = zext i8 %79 to i32
  %conv115 = sitofp i32 %conv114 to float
  %80 = load i32* %c, align 4
  %inc116 = add nsw i32 %80, 1
  store i32 %inc116, i32* %c, align 4
  %idxprom117 = sext i32 %80 to i64
  %81 = load float** %kernel.addr, align 8
  %arrayidx118 = getelementptr inbounds float* %81, i64 %idxprom117
  %82 = load float* %arrayidx118, align 4
  %mul119 = fmul float %conv115, %82
  %83 = load float* %pixel, align 4
  %add120 = fadd float %83, %mul119
  store float %add120, float* %pixel, align 4
  %84 = load i32* %n, align 4
  %sub121 = sub nsw i32 %84, 1
  %85 = load i32* %nx.addr, align 4
  %mul122 = mul nsw i32 %sub121, %85
  %86 = load i32* %m, align 4
  %add123 = add nsw i32 %mul122, %86
  %sub124 = sub nsw i32 %add123, 1
  %idxprom125 = sext i32 %sub124 to i64
  %87 = load i8** %in.addr, align 8
  %arrayidx126 = getelementptr inbounds i8* %87, i64 %idxprom125
  %88 = load i8* %arrayidx126, align 1
  %conv127 = zext i8 %88 to i32
  %conv128 = sitofp i32 %conv127 to float
  %89 = load i32* %c, align 4
  %inc129 = add nsw i32 %89, 1
  store i32 %inc129, i32* %c, align 4
  %idxprom130 = sext i32 %89 to i64
  %90 = load float** %kernel.addr, align 8
  %arrayidx131 = getelementptr inbounds float* %90, i64 %idxprom130
  %91 = load float* %arrayidx131, align 4
  %mul132 = fmul float %conv128, %91
  %92 = load float* %pixel, align 4
  %add133 = fadd float %92, %mul132
  store float %add133, float* %pixel, align 4
  %93 = load float* %pixel, align 4
  %94 = load i32* %s, align 4
  %conv134 = sitofp i32 %94 to float
  %div = fdiv float %93, %conv134
  %conv135 = fptoui float %div to i8
  %95 = load i32* %n, align 4
  %96 = load i32* %nx.addr, align 4
  %mul136 = mul nsw i32 %95, %96
  %97 = load i32* %m, align 4
  %add137 = add nsw i32 %mul136, %97
  %idxprom138 = sext i32 %add137 to i64
  %98 = load i8** %out.addr, align 8
  %arrayidx139 = getelementptr inbounds i8* %98, i64 %idxprom138
  store i8 %conv135, i8* %arrayidx139, align 1
  br label %for.inc140

for.inc140:                                       ; preds = %for.body17
  %99 = load i32* %n, align 4
  %inc141 = add nsw i32 %99, 1
  store i32 %inc141, i32* %n, align 4
  br label %for.cond13

for.end142:                                       ; preds = %for.cond13
  br label %for.inc143

for.inc143:                                       ; preds = %for.end142
  %100 = load i32* %m, align 4
  %inc144 = add nsw i32 %100, 1
  store i32 %inc144, i32* %m, align 4
  br label %for.cond9

for.end145:                                       ; preds = %for.cond9
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (http://llvm.org/git/clang.git 33947ed22c57e11e7aa88e803bfdd664fe50412f) (http://llvm.org/git/llvm.git 186332c0c98aab21acb91ae11055e44ec1acb95a)"}
