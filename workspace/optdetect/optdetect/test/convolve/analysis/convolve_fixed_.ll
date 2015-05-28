; ModuleID = 'convolve_fixed.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @convolve_fixed_3_3(i8* %in, i8* %out, float* %kernel, i32 %nx, i32 %ny) #0 {
entry:
  %arrayidx.1 = getelementptr inbounds float* %kernel, i64 1
  %arrayidx.2 = getelementptr inbounds float* %kernel, i64 2
  %sub = add nsw i32 %nx, -1
  %cmp1024 = icmp sgt i32 %sub, 1
  br i1 %cmp1024, label %for.cond13.preheader.lr.ph, label %for.end58

for.cond13.preheader.lr.ph:                       ; preds = %entry
  %0 = load float* %kernel, align 4
  %add = fadd float %0, 0.000000e+00
  %conv4 = fptosi float %add to i32
  %conv.1 = sitofp i32 %conv4 to float
  %1 = load float* %arrayidx.1, align 4
  %add.1 = fadd float %conv.1, %1
  %conv4.1 = fptosi float %add.1 to i32
  %conv.2 = sitofp i32 %conv4.1 to float
  %2 = load float* %arrayidx.2, align 4
  %add.2 = fadd float %conv.2, %2
  %conv4.2 = fptosi float %add.2 to i32
  %conv.147 = sitofp i32 %conv4.2 to float
  %arrayidx.146 = getelementptr inbounds float* %kernel, i64 3
  %3 = load float* %arrayidx.146, align 4
  %add.148 = fadd float %conv.147, %3
  %conv4.149 = fptosi float %add.148 to i32
  %conv.1.1 = sitofp i32 %conv4.149 to float
  %arrayidx.1.1 = getelementptr inbounds float* %kernel, i64 4
  %4 = load float* %arrayidx.1.1, align 4
  %add.1.1 = fadd float %conv.1.1, %4
  %conv4.1.1 = fptosi float %add.1.1 to i32
  %conv.2.1 = sitofp i32 %conv4.1.1 to float
  %arrayidx.2.1 = getelementptr inbounds float* %kernel, i64 5
  %5 = load float* %arrayidx.2.1, align 4
  %add.2.1 = fadd float %conv.2.1, %5
  %conv4.2.1 = fptosi float %add.2.1 to i32
  %conv.253 = sitofp i32 %conv4.2.1 to float
  %arrayidx.252 = getelementptr inbounds float* %kernel, i64 6
  %6 = load float* %arrayidx.252, align 4
  %add.254 = fadd float %conv.253, %6
  %conv4.255 = fptosi float %add.254 to i32
  %conv.1.2 = sitofp i32 %conv4.255 to float
  %arrayidx.1.2 = getelementptr inbounds float* %kernel, i64 7
  %7 = load float* %arrayidx.1.2, align 4
  %add.1.2 = fadd float %conv.1.2, %7
  %conv4.1.2 = fptosi float %add.1.2 to i32
  %conv.2.2 = sitofp i32 %conv4.1.2 to float
  %arrayidx.2.2 = getelementptr inbounds float* %kernel, i64 8
  %8 = load float* %arrayidx.2.2, align 4
  %add.2.2 = fadd float %conv.2.2, %8
  %conv4.2.2 = fptosi float %add.2.2 to i32
  %sub14 = add nsw i32 %ny, -1
  %cmp1522 = icmp sgt i32 %sub14, 1
  %conv47 = sitofp i32 %conv4.2.2 to float
  %9 = sext i32 %nx to i64
  %10 = add i32 %ny, -2
  %11 = add i32 %nx, -2
  br label %for.cond13.preheader

for.cond13.preheader:                             ; preds = %for.inc56, %for.cond13.preheader.lr.ph
  %indvars.iv32 = phi i64 [ 1, %for.cond13.preheader.lr.ph ], [ %indvars.iv.next33, %for.inc56 ]
  br i1 %cmp1522, label %for.body17.preheader, label %for.inc56

for.body17.preheader:                             ; preds = %for.cond13.preheader
  br label %for.body17

for.body17:                                       ; preds = %for.body17.preheader, %for.body17
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body17 ], [ 1, %for.body17.preheader ]
  %arrayidx20 = getelementptr inbounds i8* %in, i64 %indvars.iv
  %12 = load i8* %arrayidx20, align 1
  %conv21 = zext i8 %12 to i32
  %conv22 = sitofp i32 %conv21 to float
  %13 = load float* %kernel, align 4
  %mul = fmul float %13, %conv22
  %add26 = fadd float %mul, 0.000000e+00
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx29 = getelementptr inbounds i8* %in, i64 %indvars.iv.next
  %14 = load i8* %arrayidx29, align 1
  %conv30 = zext i8 %14 to i32
  %conv31 = sitofp i32 %conv30 to float
  %15 = load float* %arrayidx.1, align 4
  %mul35 = fmul float %15, %conv31
  %add36 = fadd float %add26, %mul35
  %16 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx39 = getelementptr inbounds i8* %in, i64 %16
  %17 = load i8* %arrayidx39, align 1
  %conv40 = zext i8 %17 to i32
  %conv41 = sitofp i32 %conv40 to float
  %18 = load float* %arrayidx.2, align 4
  %mul45 = fmul float %18, %conv41
  %add46 = fadd float %add36, %mul45
  %div = fdiv float %add46, %conv47
  %conv48 = fptoui float %div to i8
  %19 = mul nsw i64 %indvars.iv, %9
  %20 = add nsw i64 %19, %indvars.iv32
  %arrayidx52 = getelementptr inbounds i8* %out, i64 %20
  store i8 %conv48, i8* %arrayidx52, align 1
  %lftr.wideiv = trunc i64 %indvars.iv to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %10
  br i1 %exitcond, label %for.inc56.loopexit, label %for.body17

for.inc56.loopexit:                               ; preds = %for.body17
  br label %for.inc56

for.inc56:                                        ; preds = %for.inc56.loopexit, %for.cond13.preheader
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %lftr.wideiv34 = trunc i64 %indvars.iv32 to i32
  %exitcond35 = icmp eq i32 %lftr.wideiv34, %11
  br i1 %exitcond35, label %for.end58.loopexit, label %for.cond13.preheader

for.end58.loopexit:                               ; preds = %for.inc56
  br label %for.end58

for.end58:                                        ; preds = %for.end58.loopexit, %entry
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (http://llvm.org/git/clang.git 33947ed22c57e11e7aa88e803bfdd664fe50412f) (http://llvm.org/git/llvm.git 186332c0c98aab21acb91ae11055e44ec1acb95a)"}
