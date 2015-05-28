; ModuleID = 'convolve_dual_array.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @convolve_dual_array(i8** nocapture readonly %in, i8** nocapture readonly %out, float** nocapture readonly %kernel, i32 %nx, i32 %ny, i32 %kn) #0 {
entry:
  %div = sdiv i32 %kn, 2
  %sub = sub i32 0, %div
  %cmp46 = icmp slt i32 %div, %sub
  br i1 %cmp46, label %for.cond13.preheader, label %for.cond2.preheader.lr.ph

for.cond2.preheader.lr.ph:                        ; preds = %entry
  %0 = sext i32 %sub to i64
  %1 = sext i32 %div to i64
  br label %for.body4.lr.ph

for.body4.lr.ph:                                  ; preds = %for.cond2.preheader.lr.ph, %for.inc10
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.inc10 ], [ %0, %for.cond2.preheader.lr.ph ]
  %s.048 = phi i32 [ %conv9.lcssa, %for.inc10 ], [ 0, %for.cond2.preheader.lr.ph ]
  %2 = add nsw i64 %indvars.iv63, %1
  br label %for.body4

for.cond13.preheader.loopexit:                    ; preds = %for.inc10
  %conv9.lcssa.lcssa = phi i32 [ %conv9.lcssa, %for.inc10 ]
  %phitmp = sitofp i32 %conv9.lcssa.lcssa to float
  br label %for.cond13.preheader

for.cond13.preheader:                             ; preds = %for.cond13.preheader.loopexit, %entry
  %s.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %phitmp, %for.cond13.preheader.loopexit ]
  %sub14 = sub nsw i32 %nx, %div
  %cmp1540 = icmp slt i32 %div, %sub14
  br i1 %cmp1540, label %for.cond18.preheader.lr.ph, label %for.end66

for.cond18.preheader.lr.ph:                       ; preds = %for.cond13.preheader
  %sub19 = sub nsw i32 %ny, %div
  %cmp2038 = icmp slt i32 %div, %sub19
  %3 = sext i32 %sub to i64
  %4 = sext i32 %div to i64
  %5 = add i32 %ny, -1
  %6 = sub i32 %5, %div
  %7 = add i32 %nx, -1
  %8 = sub i32 %7, %div
  br label %for.cond18.preheader

for.body4:                                        ; preds = %for.body4, %for.body4.lr.ph
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.body4 ], [ %0, %for.body4.lr.ph ]
  %s.144 = phi i32 [ %conv9, %for.body4 ], [ %s.048, %for.body4.lr.ph ]
  %9 = add nsw i64 %indvars.iv60, %1
  %arrayidx = getelementptr inbounds float** %kernel, i64 %9
  %10 = load float** %arrayidx, align 8
  %arrayidx7 = getelementptr inbounds float* %10, i64 %2
  %11 = load float* %arrayidx7, align 4
  %conv = sitofp i32 %s.144 to float
  %add8 = fadd float %conv, %11
  %conv9 = fptosi float %add8 to i32
  %indvars.iv.next61 = add nsw i64 %indvars.iv60, 1
  %cmp3 = icmp slt i64 %indvars.iv60, %1
  br i1 %cmp3, label %for.body4, label %for.inc10

for.inc10:                                        ; preds = %for.body4
  %conv9.lcssa = phi i32 [ %conv9, %for.body4 ]
  %indvars.iv.next64 = add nsw i64 %indvars.iv63, 1
  %cmp = icmp slt i64 %indvars.iv63, %1
  br i1 %cmp, label %for.body4.lr.ph, label %for.cond13.preheader.loopexit

for.cond18.preheader:                             ; preds = %for.inc64, %for.cond18.preheader.lr.ph
  %indvars.iv56 = phi i64 [ %4, %for.cond18.preheader.lr.ph ], [ %indvars.iv.next57, %for.inc64 ]
  br i1 %cmp2038, label %for.cond25.preheader.lr.ph, label %for.inc64

for.cond25.preheader.lr.ph:                       ; preds = %for.cond18.preheader
  %arrayidx59 = getelementptr inbounds i8** %out, i64 %indvars.iv56
  %arrayidx37 = getelementptr inbounds i8** %in, i64 %indvars.iv56
  br label %for.cond25.preheader

for.cond25.preheader:                             ; preds = %for.end53, %for.cond25.preheader.lr.ph
  %indvars.iv54 = phi i64 [ %4, %for.cond25.preheader.lr.ph ], [ %indvars.iv.next55, %for.end53 ]
  br i1 %cmp46, label %for.end53, label %for.body34.lr.ph.preheader

for.body34.lr.ph.preheader:                       ; preds = %for.cond25.preheader
  br label %for.body34.lr.ph

for.body34.lr.ph:                                 ; preds = %for.body34.lr.ph.preheader, %for.inc51
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %for.inc51 ], [ %3, %for.body34.lr.ph.preheader ]
  %pixel.035 = phi float [ %add47.lcssa, %for.inc51 ], [ 0.000000e+00, %for.body34.lr.ph.preheader ]
  %12 = load i8** %arrayidx37, align 8
  %arrayidx38 = getelementptr inbounds i8* %12, i64 %indvars.iv54
  %13 = load i8* %arrayidx38, align 1
  %conv39 = zext i8 %13 to i32
  %conv40 = sitofp i32 %conv39 to float
  %14 = add nsw i64 %indvars.iv51, %4
  br label %for.body34

for.body34:                                       ; preds = %for.body34, %for.body34.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body34 ], [ %3, %for.body34.lr.ph ]
  %pixel.132 = phi float [ %add47, %for.body34 ], [ %pixel.035, %for.body34.lr.ph ]
  %15 = add nsw i64 %indvars.iv, %4
  %arrayidx45 = getelementptr inbounds float** %kernel, i64 %15
  %16 = load float** %arrayidx45, align 8
  %arrayidx46 = getelementptr inbounds float* %16, i64 %14
  %17 = load float* %arrayidx46, align 4
  %mul = fmul float %conv40, %17
  %add47 = fadd float %pixel.132, %mul
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp32 = icmp slt i64 %indvars.iv, %4
  br i1 %cmp32, label %for.body34, label %for.inc51

for.inc51:                                        ; preds = %for.body34
  %add47.lcssa = phi float [ %add47, %for.body34 ]
  %indvars.iv.next52 = add nsw i64 %indvars.iv51, 1
  %cmp26 = icmp slt i64 %indvars.iv51, %4
  br i1 %cmp26, label %for.body34.lr.ph, label %for.end53.loopexit

for.end53.loopexit:                               ; preds = %for.inc51
  %add47.lcssa.lcssa = phi float [ %add47.lcssa, %for.inc51 ]
  br label %for.end53

for.end53:                                        ; preds = %for.end53.loopexit, %for.cond25.preheader
  %pixel.0.lcssa = phi float [ 0.000000e+00, %for.cond25.preheader ], [ %add47.lcssa.lcssa, %for.end53.loopexit ]
  %div55 = fdiv float %pixel.0.lcssa, %s.0.lcssa
  %conv56 = fptoui float %div55 to i8
  %18 = load i8** %arrayidx59, align 8
  %arrayidx60 = getelementptr inbounds i8* %18, i64 %indvars.iv54
  store i8 %conv56, i8* %arrayidx60, align 1
  %indvars.iv.next55 = add nsw i64 %indvars.iv54, 1
  %lftr.wideiv = trunc i64 %indvars.iv54 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %6
  br i1 %exitcond, label %for.inc64.loopexit, label %for.cond25.preheader

for.inc64.loopexit:                               ; preds = %for.end53
  br label %for.inc64

for.inc64:                                        ; preds = %for.inc64.loopexit, %for.cond18.preheader
  %indvars.iv.next57 = add nsw i64 %indvars.iv56, 1
  %lftr.wideiv58 = trunc i64 %indvars.iv56 to i32
  %exitcond59 = icmp eq i32 %lftr.wideiv58, %8
  br i1 %exitcond59, label %for.end66.loopexit, label %for.cond18.preheader

for.end66.loopexit:                               ; preds = %for.inc64
  br label %for.end66

for.end66:                                        ; preds = %for.end66.loopexit, %for.cond13.preheader
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (http://llvm.org/git/clang.git 33947ed22c57e11e7aa88e803bfdd664fe50412f) (http://llvm.org/git/llvm.git 186332c0c98aab21acb91ae11055e44ec1acb95a)"}
