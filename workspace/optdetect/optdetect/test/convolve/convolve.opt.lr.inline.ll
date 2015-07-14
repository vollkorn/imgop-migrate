; ModuleID = 'convolve.opt.lr.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @filter_kernel(i8* %in, i8* %out, float* %kernel, i32 %kn, i32 %m, i32 %n, i32 %size_x, i32 %size_y) #0 {
entry:
  call void @llvm.dbg.value(metadata i8* %in, i64 0, metadata !33, metadata !34), !dbg !35
  call void @llvm.dbg.value(metadata i8* %out, i64 0, metadata !36, metadata !34), !dbg !37
  call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !38, metadata !34), !dbg !39
  call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !40, metadata !34), !dbg !41
  call void @llvm.dbg.value(metadata i32 %m, i64 0, metadata !42, metadata !34), !dbg !43
  call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !44, metadata !34), !dbg !45
  call void @llvm.dbg.value(metadata i32 %size_x, i64 0, metadata !46, metadata !34), !dbg !47
  call void @llvm.dbg.value(metadata i32 %size_y, i64 0, metadata !48, metadata !34), !dbg !49
  %div = sdiv i32 %kn, 2, !dbg !50
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !51, metadata !34), !dbg !52
  call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !53, metadata !34), !dbg !54
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !55, metadata !34), !dbg !56
  %sub = sub nsw i32 0, %div, !dbg !57
  call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !59, metadata !34), !dbg !60
  %0 = sext i32 %sub to i64
  %1 = sext i32 %div to i64, !dbg !61
  %2 = sext i32 %sub to i64
  %3 = sext i32 %div to i64, !dbg !61
  %4 = sext i32 %n to i64, !dbg !61
  %5 = sext i32 %size_x to i64, !dbg !61
  %6 = sext i32 %m to i64, !dbg !61
  %7 = sext i32 %kn to i64, !dbg !61
  %cmp15 = icmp sle i64 %2, %3, !dbg !62
  br i1 %cmp15, label %for.body.lr.ph, label %for.end18, !dbg !64

for.body.lr.ph:                                   ; preds = %entry
  %cmp33 = icmp sle i64 %0, %1, !dbg !65
  br label %for.body, !dbg !64

for.body:                                         ; preds = %for.inc16, %for.body.lr.ph
  %pixel.018 = phi float [ 0.000000e+00, %for.body.lr.ph ], [ %pixel.1.lcssa, %for.inc16 ]
  %indvars.iv16 = phi i64 [ %2, %for.body.lr.ph ], [ %indvars.iv.next6, %for.inc16 ]
  br i1 %cmp33, label %for.body4.lr.ph, label %for.end, !dbg !68

for.body4.lr.ph:                                  ; preds = %for.body
  %8 = sub nsw i64 %4, %indvars.iv16, !dbg !69
  %9 = mul nsw i64 %8, %5, !dbg !70
  %10 = add nsw i64 %9, %6, !dbg !70
  %11 = mul nsw i64 %indvars.iv16, %7, !dbg !71
  %12 = sub nsw i64 1, %11, !dbg !72
  %13 = add nsw i64 %12, 1, !dbg !72
  br label %for.body4, !dbg !68

for.body4:                                        ; preds = %for.inc, %for.body4.lr.ph
  %pixel.15 = phi float [ %pixel.018, %for.body4.lr.ph ], [ %add15, %for.inc ]
  %indvars.iv4 = phi i64 [ %0, %for.body4.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %14 = sub nsw i64 %10, %indvars.iv4, !dbg !70
  %arrayidx = getelementptr inbounds i8* %in, i64 %14, !dbg !73
  %15 = load i8* %arrayidx, align 1, !dbg !73
  %conv = zext i8 %15 to i32, !dbg !73
  %conv7 = sitofp i32 %conv to float, !dbg !73
  %16 = sub nsw i64 %13, %indvars.iv4, !dbg !72
  %arrayidx13 = getelementptr inbounds float* %kernel, i64 %16, !dbg !74
  %17 = load float* %arrayidx13, align 4, !dbg !74
  %mul14 = fmul float %conv7, %17, !dbg !73
  %add15 = fadd float %pixel.15, %mul14, !dbg !75
  call void @llvm.dbg.value(metadata float %add15, i64 0, metadata !53, metadata !34), !dbg !54
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body4
  %indvars.iv.next = add nsw i64 %indvars.iv4, 1, !dbg !76
  %cmp3 = icmp sle i64 %indvars.iv.next, %1, !dbg !65
  br i1 %cmp3, label %for.body4, label %for.cond2.for.end_crit_edge, !dbg !68

for.cond2.for.end_crit_edge:                      ; preds = %for.inc
  %split = phi float [ %add15, %for.inc ]
  br label %for.end, !dbg !68

for.end:                                          ; preds = %for.cond2.for.end_crit_edge, %for.body
  %indvars.iv17 = phi i64 [ %indvars.iv16, %for.cond2.for.end_crit_edge ], [ %indvars.iv16, %for.body ]
  %pixel.1.lcssa = phi float [ %split, %for.cond2.for.end_crit_edge ], [ %pixel.018, %for.body ]
  br label %for.inc16, !dbg !77

for.inc16:                                        ; preds = %for.end
  %indvars.iv.next6 = add nsw i64 %indvars.iv17, 1, !dbg !78
  %cmp = icmp sle i64 %indvars.iv.next6, %3, !dbg !62
  br i1 %cmp, label %for.body, label %for.cond.for.end18_crit_edge, !dbg !64

for.cond.for.end18_crit_edge:                     ; preds = %for.inc16
  %split19 = phi float [ %pixel.1.lcssa, %for.inc16 ]
  br label %for.end18, !dbg !64

for.end18:                                        ; preds = %for.cond.for.end18_crit_edge, %entry
  %pixel.0.lcssa = phi float [ %split19, %for.cond.for.end18_crit_edge ], [ 0.000000e+00, %entry ]
  %conv19 = fptoui float %pixel.0.lcssa to i8, !dbg !79
  %mul20 = mul nsw i32 %n, %size_x, !dbg !80
  %add21 = add nsw i32 %mul20, %m, !dbg !80
  %idxprom22 = sext i32 %add21 to i64, !dbg !81
  %arrayidx23 = getelementptr inbounds i8* %out, i64 %idxprom22, !dbg !81
  store i8 %conv19, i8* %arrayidx23, align 1, !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @filter_kernel_2d(i8** %in, i8** %out, float* %kernel, i32 %kn, i32 %x, i32 %y) #0 {
entry:
  call void @llvm.dbg.value(metadata i8** %in, i64 0, metadata !83, metadata !34), !dbg !84
  call void @llvm.dbg.value(metadata i8** %out, i64 0, metadata !85, metadata !34), !dbg !86
  call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !87, metadata !34), !dbg !88
  call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !89, metadata !34), !dbg !90
  call void @llvm.dbg.value(metadata i32 %x, i64 0, metadata !91, metadata !34), !dbg !92
  call void @llvm.dbg.value(metadata i32 %y, i64 0, metadata !93, metadata !34), !dbg !94
  %div = sdiv i32 %kn, 2, !dbg !95
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !96, metadata !34), !dbg !97
  call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !98, metadata !34), !dbg !99
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !100, metadata !34), !dbg !101
  %sub = sub nsw i32 0, %div, !dbg !102
  call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !104, metadata !34), !dbg !105
  %0 = sext i32 %sub to i64
  %1 = sext i32 %div to i64, !dbg !106
  %2 = sext i32 %x to i64, !dbg !106
  %3 = sext i32 %sub to i64
  %4 = sext i32 %div to i64, !dbg !106
  %5 = sext i32 %y to i64, !dbg !106
  %cmp11 = icmp sle i64 %3, %4, !dbg !107
  br i1 %cmp11, label %for.body.lr.ph, label %for.end15, !dbg !109

for.body.lr.ph:                                   ; preds = %entry
  %cmp34 = icmp sle i64 %0, %1, !dbg !110
  br label %for.body, !dbg !109

for.body:                                         ; preds = %for.inc13, %for.body.lr.ph
  %c.015 = phi i32 [ 0, %for.body.lr.ph ], [ %12, %for.inc13 ]
  %pixel.014 = phi float [ 0.000000e+00, %for.body.lr.ph ], [ %pixel.1.lcssa, %for.inc13 ]
  %indvars.iv12 = phi i64 [ %3, %for.body.lr.ph ], [ %indvars.iv.next9, %for.inc13 ]
  %6 = sext i32 %c.015 to i64
  br i1 %cmp34, label %for.body4.lr.ph, label %for.end, !dbg !113

for.body4.lr.ph:                                  ; preds = %for.body
  %7 = add nsw i64 %5, %indvars.iv12, !dbg !114
  %arrayidx = getelementptr inbounds i8** %in, i64 %7, !dbg !115
  %8 = load i8** %arrayidx, align 8, !dbg !115
  br label %for.body4, !dbg !113

for.body4:                                        ; preds = %for.inc, %for.body4.lr.ph
  %pixel.17 = phi float [ %pixel.014, %for.body4.lr.ph ], [ %add11, %for.inc ]
  %indvars.iv6 = phi i64 [ %6, %for.body4.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %indvars.iv15 = phi i64 [ %0, %for.body4.lr.ph ], [ %indvars.iv.next2, %for.inc ]
  %9 = add nsw i64 %2, %indvars.iv15, !dbg !116
  %arrayidx7 = getelementptr inbounds i8* %8, i64 %9, !dbg !115
  %10 = load i8* %arrayidx7, align 1, !dbg !115
  %conv = zext i8 %10 to i32, !dbg !115
  %conv8 = sitofp i32 %conv to float, !dbg !115
  %indvars.iv.next = add nsw i64 %indvars.iv6, 1, !dbg !117
  %arrayidx10 = getelementptr inbounds float* %kernel, i64 %indvars.iv6, !dbg !118
  %11 = load float* %arrayidx10, align 4, !dbg !118
  %mul = fmul float %conv8, %11, !dbg !115
  %add11 = fadd float %pixel.17, %mul, !dbg !119
  call void @llvm.dbg.value(metadata float %add11, i64 0, metadata !98, metadata !34), !dbg !99
  br label %for.inc, !dbg !119

for.inc:                                          ; preds = %for.body4
  %indvars.iv.next2 = add nsw i64 %indvars.iv15, 1, !dbg !117
  %cmp3 = icmp sle i64 %indvars.iv.next2, %1, !dbg !110
  br i1 %cmp3, label %for.body4, label %for.cond2.for.end_crit_edge, !dbg !113

for.cond2.for.end_crit_edge:                      ; preds = %for.inc
  %split = phi i64 [ %indvars.iv.next, %for.inc ]
  %split8 = phi float [ %add11, %for.inc ]
  br label %for.end, !dbg !113

for.end:                                          ; preds = %for.cond2.for.end_crit_edge, %for.body
  %indvars.iv13 = phi i64 [ %indvars.iv12, %for.cond2.for.end_crit_edge ], [ %indvars.iv12, %for.body ]
  %c.1.lcssa.wide = phi i64 [ %split, %for.cond2.for.end_crit_edge ], [ %6, %for.body ]
  %pixel.1.lcssa = phi float [ %split8, %for.cond2.for.end_crit_edge ], [ %pixel.014, %for.body ]
  %12 = trunc i64 %c.1.lcssa.wide to i32, !dbg !120
  br label %for.inc13, !dbg !120

for.inc13:                                        ; preds = %for.end
  %indvars.iv.next9 = add nsw i64 %indvars.iv13, 1, !dbg !121
  %cmp = icmp sle i64 %indvars.iv.next9, %4, !dbg !107
  br i1 %cmp, label %for.body, label %for.cond.for.end15_crit_edge, !dbg !109

for.cond.for.end15_crit_edge:                     ; preds = %for.inc13
  %split16 = phi float [ %pixel.1.lcssa, %for.inc13 ]
  br label %for.end15, !dbg !109

for.end15:                                        ; preds = %for.cond.for.end15_crit_edge, %entry
  %pixel.0.lcssa = phi float [ %split16, %for.cond.for.end15_crit_edge ], [ 0.000000e+00, %entry ]
  %conv16 = fptoui float %pixel.0.lcssa to i8, !dbg !122
  %idxprom17 = sext i32 %x to i64, !dbg !123
  %idxprom18 = sext i32 %y to i64, !dbg !123
  %arrayidx19 = getelementptr inbounds i8** %out, i64 %idxprom18, !dbg !123
  %13 = load i8** %arrayidx19, align 8, !dbg !123
  %arrayidx20 = getelementptr inbounds i8* %13, i64 %idxprom17, !dbg !123
  store i8 %conv16, i8* %arrayidx20, align 1, !dbg !123
  ret void, !dbg !124
}

; Function Attrs: nounwind uwtable
define void @convolve_arr_linear(i8* %in, i8* %out, float* %kernel, i32 %kn, i32 %dim_x, i32 %dim_y) #0 {
entry:
  call void @llvm.dbg.value(metadata i8* %in, i64 0, metadata !125, metadata !34), !dbg !126
  call void @llvm.dbg.value(metadata i8* %out, i64 0, metadata !127, metadata !34), !dbg !128
  call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !129, metadata !34), !dbg !130
  call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !131, metadata !34), !dbg !132
  call void @llvm.dbg.value(metadata i32 %dim_x, i64 0, metadata !133, metadata !34), !dbg !134
  call void @llvm.dbg.value(metadata i32 %dim_y, i64 0, metadata !135, metadata !34), !dbg !136
  %div = sdiv i32 %kn, 2, !dbg !137
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !138, metadata !34), !dbg !139
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !140, metadata !34), !dbg !142
  %sub = sub nsw i32 %dim_x, %div, !dbg !143
  %cmp4 = icmp slt i32 %div, %sub, !dbg !145
  br i1 %cmp4, label %for.body.lr.ph, label %for.end7, !dbg !146

for.body.lr.ph:                                   ; preds = %entry
  %sub2 = sub nsw i32 %dim_y, %div, !dbg !147
  %cmp31 = icmp slt i32 %div, %sub2, !dbg !150
  %div.i = sdiv i32 %kn, 2, !dbg !151
  %sub.i = sub nsw i32 0, %div.i, !dbg !153
  %0 = sext i32 %sub.i to i64, !dbg !152
  %1 = sext i32 %div.i to i64, !dbg !154
  %2 = sext i32 %sub.i to i64, !dbg !152
  %3 = sext i32 %div.i to i64, !dbg !154
  %4 = sext i32 %dim_x to i64, !dbg !154
  %5 = sext i32 %kn to i64, !dbg !154
  %cmp15.i = icmp sle i64 %2, %3, !dbg !155
  %cmp33.i = icmp sle i64 %0, %1, !dbg !156
  br label %for.body, !dbg !146

for.body:                                         ; preds = %for.inc5, %for.body.lr.ph
  %m.05 = phi i32 [ %div, %for.body.lr.ph ], [ %inc6, %for.inc5 ]
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !157, metadata !34), !dbg !158
  br i1 %cmp31, label %for.body4.lr.ph, label %for.end, !dbg !159

for.body4.lr.ph:                                  ; preds = %for.body
  %6 = sext i32 %m.05 to i64, !dbg !154
  br label %for.body4, !dbg !159

for.body4:                                        ; preds = %for.inc, %for.body4.lr.ph
  %n.02 = phi i32 [ %div, %for.body4.lr.ph ], [ %inc, %for.inc ]
  call void @llvm.dbg.value(metadata i8* %in, i64 0, metadata !160, metadata !34), !dbg !161
  call void @llvm.dbg.value(metadata i8* %out, i64 0, metadata !162, metadata !34), !dbg !163
  call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !164, metadata !34), !dbg !165
  call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !166, metadata !34), !dbg !167
  call void @llvm.dbg.value(metadata i32 %m.05, i64 0, metadata !168, metadata !34), !dbg !169
  call void @llvm.dbg.value(metadata i32 %n.02, i64 0, metadata !170, metadata !34), !dbg !171
  call void @llvm.dbg.value(metadata i32 %dim_x, i64 0, metadata !172, metadata !34), !dbg !173
  call void @llvm.dbg.value(metadata i32 %dim_y, i64 0, metadata !174, metadata !34), !dbg !175
  call void @llvm.dbg.value(metadata i32 %div.i, i64 0, metadata !176, metadata !34), !dbg !177
  call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !178, metadata !34), !dbg !179
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !180, metadata !34), !dbg !181
  call void @llvm.dbg.value(metadata i32 %sub.i, i64 0, metadata !182, metadata !34), !dbg !183
  %7 = sext i32 %n.02 to i64, !dbg !154
  br i1 %cmp15.i, label %for.body.lr.ph.i, label %filter_kernel.exit, !dbg !184

for.body.lr.ph.i:                                 ; preds = %for.body4
  br label %for.body.i, !dbg !184

for.body.i:                                       ; preds = %for.end.i, %for.body.lr.ph.i
  %pixel.018.i = phi float [ 0.000000e+00, %for.body.lr.ph.i ], [ %pixel.1.lcssa.i, %for.end.i ], !dbg !152
  %indvars.iv16.i = phi i64 [ %2, %for.body.lr.ph.i ], [ %indvars.iv.next6.i, %for.end.i ], !dbg !152
  br i1 %cmp33.i, label %for.body4.lr.ph.i, label %for.end.i, !dbg !185

for.body4.lr.ph.i:                                ; preds = %for.body.i
  %8 = sub nsw i64 %7, %indvars.iv16.i, !dbg !186
  %9 = mul nsw i64 %8, %4, !dbg !187
  %10 = add nsw i64 %9, %6, !dbg !187
  %11 = mul nsw i64 %indvars.iv16.i, %5, !dbg !188
  %12 = sub nsw i64 1, %11, !dbg !189
  %13 = add nsw i64 %12, 1, !dbg !189
  br label %for.body4.i, !dbg !185

for.body4.i:                                      ; preds = %for.body4.i, %for.body4.lr.ph.i
  %pixel.15.i = phi float [ %pixel.018.i, %for.body4.lr.ph.i ], [ %add15.i, %for.body4.i ], !dbg !152
  %indvars.iv4.i = phi i64 [ %0, %for.body4.lr.ph.i ], [ %indvars.iv.next.i, %for.body4.i ], !dbg !152
  %14 = sub nsw i64 %10, %indvars.iv4.i, !dbg !187
  %arrayidx.i = getelementptr inbounds i8* %in, i64 %14, !dbg !190
  %15 = load i8* %arrayidx.i, align 1, !dbg !190
  %conv.i = zext i8 %15 to i32, !dbg !190
  %conv7.i = sitofp i32 %conv.i to float, !dbg !190
  %16 = sub nsw i64 %13, %indvars.iv4.i, !dbg !189
  %arrayidx13.i = getelementptr inbounds float* %kernel, i64 %16, !dbg !191
  %17 = load float* %arrayidx13.i, align 4, !dbg !191
  %mul14.i = fmul float %conv7.i, %17, !dbg !190
  %add15.i = fadd float %pixel.15.i, %mul14.i, !dbg !192
  call void @llvm.dbg.value(metadata float %add15.i, i64 0, metadata !178, metadata !34), !dbg !179
  %indvars.iv.next.i = add nsw i64 %indvars.iv4.i, 1, !dbg !193
  %cmp3.i = icmp sle i64 %indvars.iv.next.i, %1, !dbg !156
  br i1 %cmp3.i, label %for.body4.i, label %for.cond2.for.end_crit_edge.i, !dbg !185

for.cond2.for.end_crit_edge.i:                    ; preds = %for.body4.i
  %add15.i.lcssa = phi float [ %add15.i, %for.body4.i ]
  br label %for.end.i, !dbg !185

for.end.i:                                        ; preds = %for.cond2.for.end_crit_edge.i, %for.body.i
  %pixel.1.lcssa.i = phi float [ %add15.i.lcssa, %for.cond2.for.end_crit_edge.i ], [ %pixel.018.i, %for.body.i ], !dbg !152
  %indvars.iv.next6.i = add nsw i64 %indvars.iv16.i, 1, !dbg !194
  %cmp.i = icmp sle i64 %indvars.iv.next6.i, %3, !dbg !155
  br i1 %cmp.i, label %for.body.i, label %for.cond.for.end18_crit_edge.i, !dbg !184

for.cond.for.end18_crit_edge.i:                   ; preds = %for.end.i
  %pixel.1.lcssa.i.lcssa = phi float [ %pixel.1.lcssa.i, %for.end.i ]
  br label %filter_kernel.exit, !dbg !184

filter_kernel.exit:                               ; preds = %for.body4, %for.cond.for.end18_crit_edge.i
  %pixel.0.lcssa.i = phi float [ %pixel.1.lcssa.i.lcssa, %for.cond.for.end18_crit_edge.i ], [ 0.000000e+00, %for.body4 ], !dbg !152
  %conv19.i = fptoui float %pixel.0.lcssa.i to i8, !dbg !195
  %mul20.i = mul nsw i32 %n.02, %dim_x, !dbg !196
  %add21.i = add nsw i32 %mul20.i, %m.05, !dbg !196
  %idxprom22.i = sext i32 %add21.i to i64, !dbg !197
  %arrayidx23.i = getelementptr inbounds i8* %out, i64 %idxprom22.i, !dbg !197
  store i8 %conv19.i, i8* %arrayidx23.i, align 1, !dbg !197
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %filter_kernel.exit
  %inc = add nsw i32 %n.02, 1, !dbg !198
  call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !157, metadata !34), !dbg !158
  %cmp3 = icmp slt i32 %inc, %sub2, !dbg !150
  br i1 %cmp3, label %for.body4, label %for.cond1.for.end_crit_edge, !dbg !159

for.cond1.for.end_crit_edge:                      ; preds = %for.inc
  br label %for.end, !dbg !159

for.end:                                          ; preds = %for.cond1.for.end_crit_edge, %for.body
  br label %for.inc5, !dbg !199

for.inc5:                                         ; preds = %for.end
  %inc6 = add nsw i32 %m.05, 1, !dbg !200
  call void @llvm.dbg.value(metadata i32 %inc6, i64 0, metadata !140, metadata !34), !dbg !142
  %cmp = icmp slt i32 %inc6, %sub, !dbg !145
  br i1 %cmp, label %for.body, label %for.cond.for.end7_crit_edge, !dbg !146

for.cond.for.end7_crit_edge:                      ; preds = %for.inc5
  br label %for.end7, !dbg !146

for.end7:                                         ; preds = %for.cond.for.end7_crit_edge, %entry
  ret void, !dbg !201
}

; Function Attrs: nounwind uwtable
define void @convolve_arr_indirection(i8** %in, i8** %out, float* %kernel, i32 %kn, i32 %dim_x, i32 %dim_y) #0 {
entry:
  call void @llvm.dbg.value(metadata i8** %in, i64 0, metadata !202, metadata !34), !dbg !203
  call void @llvm.dbg.value(metadata i8** %out, i64 0, metadata !204, metadata !34), !dbg !205
  call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !206, metadata !34), !dbg !207
  call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !208, metadata !34), !dbg !209
  call void @llvm.dbg.value(metadata i32 %dim_x, i64 0, metadata !210, metadata !34), !dbg !211
  call void @llvm.dbg.value(metadata i32 %dim_y, i64 0, metadata !212, metadata !34), !dbg !213
  %div = sdiv i32 %kn, 2, !dbg !214
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !215, metadata !34), !dbg !216
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !217, metadata !34), !dbg !219
  %sub = sub nsw i32 %dim_x, %div, !dbg !220
  %cmp4 = icmp slt i32 %div, %sub, !dbg !222
  br i1 %cmp4, label %for.body.lr.ph, label %for.end7, !dbg !223

for.body.lr.ph:                                   ; preds = %entry
  %sub2 = sub nsw i32 %dim_y, %div, !dbg !224
  %cmp31 = icmp slt i32 %div, %sub2, !dbg !227
  %div.i = sdiv i32 %kn, 2, !dbg !228
  %sub.i = sub nsw i32 0, %div.i, !dbg !230
  %0 = sext i32 %sub.i to i64, !dbg !229
  %1 = sext i32 %div.i to i64, !dbg !231
  %2 = sext i32 %sub.i to i64, !dbg !229
  %3 = sext i32 %div.i to i64, !dbg !231
  %cmp11.i = icmp sle i64 %2, %3, !dbg !232
  %cmp34.i = icmp sle i64 %0, %1, !dbg !233
  br label %for.body, !dbg !223

for.body:                                         ; preds = %for.inc5, %for.body.lr.ph
  %m.05 = phi i32 [ %div, %for.body.lr.ph ], [ %inc6, %for.inc5 ]
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !234, metadata !34), !dbg !235
  br i1 %cmp31, label %for.body4.lr.ph, label %for.end, !dbg !236

for.body4.lr.ph:                                  ; preds = %for.body
  %4 = sext i32 %m.05 to i64, !dbg !231
  %idxprom18.i = sext i32 %m.05 to i64, !dbg !237
  %arrayidx19.i = getelementptr inbounds i8** %out, i64 %idxprom18.i, !dbg !237
  br label %for.body4, !dbg !236

for.body4:                                        ; preds = %for.inc, %for.body4.lr.ph
  %n.02 = phi i32 [ %div, %for.body4.lr.ph ], [ %inc, %for.inc ]
  call void @llvm.dbg.value(metadata i8** %in, i64 0, metadata !238, metadata !34), !dbg !239
  call void @llvm.dbg.value(metadata i8** %out, i64 0, metadata !240, metadata !34), !dbg !241
  call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !242, metadata !34), !dbg !243
  call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !244, metadata !34), !dbg !245
  call void @llvm.dbg.value(metadata i32 %n.02, i64 0, metadata !246, metadata !34), !dbg !247
  call void @llvm.dbg.value(metadata i32 %m.05, i64 0, metadata !248, metadata !34), !dbg !249
  call void @llvm.dbg.value(metadata i32 %div.i, i64 0, metadata !250, metadata !34), !dbg !251
  call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !252, metadata !34), !dbg !253
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !254, metadata !34), !dbg !255
  call void @llvm.dbg.value(metadata i32 %sub.i, i64 0, metadata !256, metadata !34), !dbg !257
  %5 = sext i32 %n.02 to i64, !dbg !231
  br i1 %cmp11.i, label %for.body.lr.ph.i, label %filter_kernel_2d.exit, !dbg !258

for.body.lr.ph.i:                                 ; preds = %for.body4
  br label %for.body.i, !dbg !258

for.body.i:                                       ; preds = %for.end.i, %for.body.lr.ph.i
  %c.015.i = phi i32 [ 0, %for.body.lr.ph.i ], [ %12, %for.end.i ], !dbg !229
  %pixel.014.i = phi float [ 0.000000e+00, %for.body.lr.ph.i ], [ %pixel.1.lcssa.i, %for.end.i ], !dbg !229
  %indvars.iv12.i = phi i64 [ %2, %for.body.lr.ph.i ], [ %indvars.iv.next9.i, %for.end.i ], !dbg !229
  %6 = sext i32 %c.015.i to i64, !dbg !229
  br i1 %cmp34.i, label %for.body4.lr.ph.i, label %for.end.i, !dbg !259

for.body4.lr.ph.i:                                ; preds = %for.body.i
  %7 = add nsw i64 %4, %indvars.iv12.i, !dbg !260
  %arrayidx.i = getelementptr inbounds i8** %in, i64 %7, !dbg !261
  %8 = load i8** %arrayidx.i, align 8, !dbg !261
  br label %for.body4.i, !dbg !259

for.body4.i:                                      ; preds = %for.body4.i, %for.body4.lr.ph.i
  %pixel.17.i = phi float [ %pixel.014.i, %for.body4.lr.ph.i ], [ %add11.i, %for.body4.i ], !dbg !229
  %indvars.iv6.i = phi i64 [ %6, %for.body4.lr.ph.i ], [ %indvars.iv.next.i, %for.body4.i ], !dbg !229
  %indvars.iv15.i = phi i64 [ %0, %for.body4.lr.ph.i ], [ %indvars.iv.next2.i, %for.body4.i ], !dbg !229
  %9 = add nsw i64 %5, %indvars.iv15.i, !dbg !262
  %arrayidx7.i = getelementptr inbounds i8* %8, i64 %9, !dbg !261
  %10 = load i8* %arrayidx7.i, align 1, !dbg !261
  %conv.i = zext i8 %10 to i32, !dbg !261
  %conv8.i = sitofp i32 %conv.i to float, !dbg !261
  %indvars.iv.next.i = add nsw i64 %indvars.iv6.i, 1, !dbg !263
  %arrayidx10.i = getelementptr inbounds float* %kernel, i64 %indvars.iv6.i, !dbg !264
  %11 = load float* %arrayidx10.i, align 4, !dbg !264
  %mul.i = fmul float %conv8.i, %11, !dbg !261
  %add11.i = fadd float %pixel.17.i, %mul.i, !dbg !265
  call void @llvm.dbg.value(metadata float %add11.i, i64 0, metadata !252, metadata !34), !dbg !253
  %indvars.iv.next2.i = add nsw i64 %indvars.iv15.i, 1, !dbg !263
  %cmp3.i = icmp sle i64 %indvars.iv.next2.i, %1, !dbg !233
  br i1 %cmp3.i, label %for.body4.i, label %for.cond2.for.end_crit_edge.i, !dbg !259

for.cond2.for.end_crit_edge.i:                    ; preds = %for.body4.i
  %add11.i.lcssa = phi float [ %add11.i, %for.body4.i ]
  %indvars.iv.next.i.lcssa = phi i64 [ %indvars.iv.next.i, %for.body4.i ]
  br label %for.end.i, !dbg !259

for.end.i:                                        ; preds = %for.cond2.for.end_crit_edge.i, %for.body.i
  %c.1.lcssa.wide.i = phi i64 [ %indvars.iv.next.i.lcssa, %for.cond2.for.end_crit_edge.i ], [ %6, %for.body.i ], !dbg !229
  %pixel.1.lcssa.i = phi float [ %add11.i.lcssa, %for.cond2.for.end_crit_edge.i ], [ %pixel.014.i, %for.body.i ], !dbg !229
  %12 = trunc i64 %c.1.lcssa.wide.i to i32, !dbg !266
  %indvars.iv.next9.i = add nsw i64 %indvars.iv12.i, 1, !dbg !267
  %cmp.i = icmp sle i64 %indvars.iv.next9.i, %3, !dbg !232
  br i1 %cmp.i, label %for.body.i, label %for.cond.for.end15_crit_edge.i, !dbg !258

for.cond.for.end15_crit_edge.i:                   ; preds = %for.end.i
  %pixel.1.lcssa.i.lcssa = phi float [ %pixel.1.lcssa.i, %for.end.i ]
  br label %filter_kernel_2d.exit, !dbg !258

filter_kernel_2d.exit:                            ; preds = %for.body4, %for.cond.for.end15_crit_edge.i
  %pixel.0.lcssa.i = phi float [ %pixel.1.lcssa.i.lcssa, %for.cond.for.end15_crit_edge.i ], [ 0.000000e+00, %for.body4 ], !dbg !229
  %conv16.i = fptoui float %pixel.0.lcssa.i to i8, !dbg !268
  %idxprom17.i = sext i32 %n.02 to i64, !dbg !237
  %13 = load i8** %arrayidx19.i, align 8, !dbg !237
  %arrayidx20.i = getelementptr inbounds i8* %13, i64 %idxprom17.i, !dbg !237
  store i8 %conv16.i, i8* %arrayidx20.i, align 1, !dbg !237
  br label %for.inc, !dbg !229

for.inc:                                          ; preds = %filter_kernel_2d.exit
  %inc = add nsw i32 %n.02, 1, !dbg !269
  call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !234, metadata !34), !dbg !235
  %cmp3 = icmp slt i32 %inc, %sub2, !dbg !227
  br i1 %cmp3, label %for.body4, label %for.cond1.for.end_crit_edge, !dbg !236

for.cond1.for.end_crit_edge:                      ; preds = %for.inc
  br label %for.end, !dbg !236

for.end:                                          ; preds = %for.cond1.for.end_crit_edge, %for.body
  br label %for.inc5, !dbg !270

for.inc5:                                         ; preds = %for.end
  %inc6 = add nsw i32 %m.05, 1, !dbg !271
  call void @llvm.dbg.value(metadata i32 %inc6, i64 0, metadata !217, metadata !34), !dbg !219
  %cmp = icmp slt i32 %inc6, %sub, !dbg !222
  br i1 %cmp, label %for.body, label %for.cond.for.end7_crit_edge, !dbg !223

for.cond.for.end7_crit_edge:                      ; preds = %for.inc5
  br label %for.end7, !dbg !223

for.end7:                                         ; preds = %for.cond.for.end7_crit_edge, %entry
  ret void, !dbg !272
}

; Function Attrs: nounwind uwtable
define void @convolve_loop_nest(i8** %in, i8** %out, float* %kernel, i32 %kn, i32 %dim_x, i32 %dim_y) #0 {
entry:
  call void @llvm.dbg.value(metadata i8** %in, i64 0, metadata !273, metadata !34), !dbg !274
  call void @llvm.dbg.value(metadata i8** %out, i64 0, metadata !275, metadata !34), !dbg !276
  call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !277, metadata !34), !dbg !278
  call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !279, metadata !34), !dbg !280
  call void @llvm.dbg.value(metadata i32 %dim_x, i64 0, metadata !281, metadata !34), !dbg !282
  call void @llvm.dbg.value(metadata i32 %dim_y, i64 0, metadata !283, metadata !34), !dbg !284
  %div = sdiv i32 %kn, 2, !dbg !285
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !286, metadata !34), !dbg !287
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !288, metadata !34), !dbg !290
  %0 = sub i32 0, %div, !dbg !291
  %1 = sext i32 %0 to i64
  %2 = sext i32 %div to i64, !dbg !291
  %3 = sext i32 %0 to i64
  %4 = sext i32 %div to i64, !dbg !291
  %5 = sext i32 %div to i64
  %6 = sext i32 %div to i64
  %sub = sub nsw i32 %dim_x, %div, !dbg !292
  %7 = sext i32 %sub to i64, !dbg !294
  %cmp22 = icmp slt i64 %6, %7, !dbg !294
  br i1 %cmp22, label %for.body.lr.ph, label %for.end34, !dbg !295

for.body.lr.ph:                                   ; preds = %entry
  %sub2 = sub nsw i32 %dim_y, %div, !dbg !296
  %8 = sext i32 %sub2 to i64, !dbg !299
  %cmp318 = icmp slt i64 %5, %8, !dbg !299
  %cmp711 = icmp sle i64 %3, %4, !dbg !300
  %cmp114 = icmp sle i64 %1, %2, !dbg !304
  br label %for.body, !dbg !295

for.body:                                         ; preds = %for.inc32, %for.body.lr.ph
  %indvars.iv23 = phi i64 [ %6, %for.body.lr.ph ], [ %indvars.iv.next21, %for.inc32 ]
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !307, metadata !34), !dbg !308
  br i1 %cmp318, label %for.body4.lr.ph, label %for.end31, !dbg !309

for.body4.lr.ph:                                  ; preds = %for.body
  br label %for.body4, !dbg !309

for.body4:                                        ; preds = %for.inc29, %for.body4.lr.ph
  %indvars.iv19 = phi i64 [ %5, %for.body4.lr.ph ], [ %indvars.iv.next17, %for.inc29 ]
  call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !310, metadata !34), !dbg !311
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !312, metadata !34), !dbg !313
  br i1 %cmp711, label %for.body8.lr.ph, label %for.end23, !dbg !314

for.body8.lr.ph:                                  ; preds = %for.body4
  br label %for.body8, !dbg !314

for.body8:                                        ; preds = %for.inc21, %for.body8.lr.ph
  %c.015 = phi i32 [ 0, %for.body8.lr.ph ], [ %15, %for.inc21 ]
  %pixel.014 = phi float [ 0.000000e+00, %for.body8.lr.ph ], [ %pixel.1.lcssa, %for.inc21 ]
  %indvars.iv12 = phi i64 [ %3, %for.body8.lr.ph ], [ %indvars.iv.next9, %for.inc21 ]
  %9 = sext i32 %c.015 to i64
  br i1 %cmp114, label %for.body12.lr.ph, label %for.end, !dbg !315

for.body12.lr.ph:                                 ; preds = %for.body8
  %10 = add nsw i64 %indvars.iv19, %indvars.iv12, !dbg !316
  %arrayidx = getelementptr inbounds i8** %in, i64 %10, !dbg !317
  %11 = load i8** %arrayidx, align 8, !dbg !317
  br label %for.body12, !dbg !315

for.body12:                                       ; preds = %for.inc, %for.body12.lr.ph
  %pixel.17 = phi float [ %pixel.014, %for.body12.lr.ph ], [ %add19, %for.inc ]
  %indvars.iv6 = phi i64 [ %9, %for.body12.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %indvars.iv15 = phi i64 [ %1, %for.body12.lr.ph ], [ %indvars.iv.next2, %for.inc ]
  %12 = add nsw i64 %indvars.iv23, %indvars.iv15, !dbg !318
  %arrayidx15 = getelementptr inbounds i8* %11, i64 %12, !dbg !317
  %13 = load i8* %arrayidx15, align 1, !dbg !317
  %conv = zext i8 %13 to i32, !dbg !317
  %conv16 = sitofp i32 %conv to float, !dbg !317
  %indvars.iv.next = add nsw i64 %indvars.iv6, 1, !dbg !319
  %arrayidx18 = getelementptr inbounds float* %kernel, i64 %indvars.iv6, !dbg !320
  %14 = load float* %arrayidx18, align 4, !dbg !320
  %mul = fmul float %conv16, %14, !dbg !317
  %add19 = fadd float %pixel.17, %mul, !dbg !321
  call void @llvm.dbg.value(metadata float %add19, i64 0, metadata !310, metadata !34), !dbg !311
  br label %for.inc, !dbg !321

for.inc:                                          ; preds = %for.body12
  %indvars.iv.next2 = add nsw i64 %indvars.iv15, 1, !dbg !319
  %cmp11 = icmp sle i64 %indvars.iv.next2, %2, !dbg !304
  br i1 %cmp11, label %for.body12, label %for.cond10.for.end_crit_edge, !dbg !315

for.cond10.for.end_crit_edge:                     ; preds = %for.inc
  %split = phi i64 [ %indvars.iv.next, %for.inc ]
  %split8 = phi float [ %add19, %for.inc ]
  br label %for.end, !dbg !315

for.end:                                          ; preds = %for.cond10.for.end_crit_edge, %for.body8
  %indvars.iv13 = phi i64 [ %indvars.iv12, %for.cond10.for.end_crit_edge ], [ %indvars.iv12, %for.body8 ]
  %c.1.lcssa.wide = phi i64 [ %split, %for.cond10.for.end_crit_edge ], [ %9, %for.body8 ]
  %pixel.1.lcssa = phi float [ %split8, %for.cond10.for.end_crit_edge ], [ %pixel.014, %for.body8 ]
  %15 = trunc i64 %c.1.lcssa.wide to i32, !dbg !322
  br label %for.inc21, !dbg !322

for.inc21:                                        ; preds = %for.end
  %indvars.iv.next9 = add nsw i64 %indvars.iv13, 1, !dbg !323
  %cmp7 = icmp sle i64 %indvars.iv.next9, %4, !dbg !300
  br i1 %cmp7, label %for.body8, label %for.cond6.for.end23_crit_edge, !dbg !314

for.cond6.for.end23_crit_edge:                    ; preds = %for.inc21
  %split16 = phi float [ %pixel.1.lcssa, %for.inc21 ]
  br label %for.end23, !dbg !314

for.end23:                                        ; preds = %for.cond6.for.end23_crit_edge, %for.body4
  %indvars.iv20 = phi i64 [ %indvars.iv19, %for.cond6.for.end23_crit_edge ], [ %indvars.iv19, %for.body4 ]
  %pixel.0.lcssa = phi float [ %split16, %for.cond6.for.end23_crit_edge ], [ 0.000000e+00, %for.body4 ]
  %conv24 = fptoui float %pixel.0.lcssa to i8, !dbg !324
  %arrayidx27 = getelementptr inbounds i8** %out, i64 %indvars.iv20, !dbg !325
  %16 = load i8** %arrayidx27, align 8, !dbg !325
  %arrayidx28 = getelementptr inbounds i8* %16, i64 %indvars.iv23, !dbg !325
  store i8 %conv24, i8* %arrayidx28, align 1, !dbg !325
  br label %for.inc29, !dbg !326

for.inc29:                                        ; preds = %for.end23
  %indvars.iv.next17 = add nsw i64 %indvars.iv20, 1, !dbg !327
  %cmp3 = icmp slt i64 %indvars.iv.next17, %8, !dbg !299
  br i1 %cmp3, label %for.body4, label %for.cond1.for.end31_crit_edge, !dbg !309

for.cond1.for.end31_crit_edge:                    ; preds = %for.inc29
  br label %for.end31, !dbg !309

for.end31:                                        ; preds = %for.cond1.for.end31_crit_edge, %for.body
  %indvars.iv24 = phi i64 [ %indvars.iv23, %for.cond1.for.end31_crit_edge ], [ %indvars.iv23, %for.body ]
  br label %for.inc32, !dbg !328

for.inc32:                                        ; preds = %for.end31
  %indvars.iv.next21 = add nsw i64 %indvars.iv24, 1, !dbg !329
  %cmp = icmp slt i64 %indvars.iv.next21, %7, !dbg !294
  br i1 %cmp, label %for.body, label %for.cond.for.end34_crit_edge, !dbg !295

for.cond.for.end34_crit_edge:                     ; preds = %for.inc32
  br label %for.end34, !dbg !295

for.end34:                                        ; preds = %for.cond.for.end34_crit_edge, %entry
  ret void, !dbg !330
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!30, !31}
!llvm.ident = !{!32}

!0 = !{!"0x11\0012\00clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)\000\00\000\00\001", !1, !2, !3, !7, !2, !2} ; [ DW_TAG_compile_unit ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c] [DW_LANG_C99]
!1 = !{!"convolve.c", !"/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x16\00u_int8_t\00200\000\000\000\000", !5, null, !6} ; [ DW_TAG_typedef ] [u_int8_t] [line 200, size 0, align 0, offset 0] [from unsigned char]
!5 = !{!"/usr/include/x86_64-linux-gnu/sys/types.h", !"/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve"}
!6 = !{!"0x24\00unsigned char\000\008\008\000\000\008", null, null} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!7 = !{!8, !20, !25, !28, !29}
!8 = !{!"0x2e\00filter_kernel\00filter_kernel\00\0014\000\001\000\000\00256\000\0022", !1, !9, !10, null, void (i8*, i8*, float*, i32, i32, i32, i32, i32)* @filter_kernel, null, null, !2} ; [ DW_TAG_subprogram ] [line 14] [def] [scope 22] [filter_kernel]
!9 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!10 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !11, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = !{null, !12, !14, !15, !18, !18, !18, !18, !18}
!12 = !{!"0xf\00\000\0064\0064\000\000", null, null, !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!13 = !{!"0x26\00\000\000\000\000\000", null, null, !4} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from u_int8_t]
!14 = !{!"0xf\00\000\0064\0064\000\000", null, null, !4} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from u_int8_t]
!15 = !{!"0xf\00\000\0064\0064\000\000", null, null, !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!16 = !{!"0x26\00\000\000\000\000\000", null, null, !17} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from float]
!17 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!18 = !{!"0x26\00\000\000\000\000\000", null, null, !19} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!19 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!20 = !{!"0x2e\00filter_kernel_2d\00filter_kernel_2d\00\0037\000\001\000\000\00256\000\0043", !1, !9, !21, null, void (i8**, i8**, float*, i32, i32, i32)* @filter_kernel_2d, null, null, !2} ; [ DW_TAG_subprogram ] [line 37] [def] [scope 43] [filter_kernel_2d]
!21 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !22, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = !{null, !23, !24, !15, !18, !18, !18}
!23 = !{!"0xf\00\000\0064\0064\000\000", null, null, !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!24 = !{!"0xf\00\000\0064\0064\000\000", null, null, !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!25 = !{!"0x2e\00convolve_arr_linear\00convolve_arr_linear\00\0083\000\001\000\000\00256\000\0091", !1, !9, !26, null, void (i8*, i8*, float*, i32, i32, i32)* @convolve_arr_linear, null, null, !2} ; [ DW_TAG_subprogram ] [line 83] [def] [scope 91] [convolve_arr_linear]
!26 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !27, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = !{null, !12, !14, !15, !18, !18, !18}
!28 = !{!"0x2e\00convolve_arr_indirection\00convolve_arr_indirection\00\0099\000\001\000\000\00256\000\00106", !1, !9, !21, null, void (i8**, i8**, float*, i32, i32, i32)* @convolve_arr_indirection, null, null, !2} ; [ DW_TAG_subprogram ] [line 99] [def] [scope 106] [convolve_arr_indirection]
!29 = !{!"0x2e\00convolve_loop_nest\00convolve_loop_nest\00\00114\000\001\000\000\00256\000\00121", !1, !9, !21, null, void (i8**, i8**, float*, i32, i32, i32)* @convolve_loop_nest, null, null, !2} ; [ DW_TAG_subprogram ] [line 114] [def] [scope 121] [convolve_loop_nest]
!30 = !{i32 2, !"Dwarf Version", i32 4}
!31 = !{i32 2, !"Debug Info Version", i32 2}
!32 = !{!"clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)"}
!33 = !{!"0x101\00in\0016777230\000", !8, !9, !12} ; [ DW_TAG_arg_variable ] [in] [line 14]
!34 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!35 = !MDLocation(line: 14, column: 36, scope: !8)
!36 = !{!"0x101\00out\0033554447\000", !8, !9, !14} ; [ DW_TAG_arg_variable ] [out] [line 15]
!37 = !MDLocation(line: 15, column: 19, scope: !8)
!38 = !{!"0x101\00kernel\0050331664\000", !8, !9, !15} ; [ DW_TAG_arg_variable ] [kernel] [line 16]
!39 = !MDLocation(line: 16, column: 22, scope: !8)
!40 = !{!"0x101\00kn\0067108881\000", !8, !9, !18} ; [ DW_TAG_arg_variable ] [kn] [line 17]
!41 = !MDLocation(line: 17, column: 13, scope: !8)
!42 = !{!"0x101\00m\0083886098\000", !8, !9, !18} ; [ DW_TAG_arg_variable ] [m] [line 18]
!43 = !MDLocation(line: 18, column: 19, scope: !8)
!44 = !{!"0x101\00n\00100663315\000", !8, !9, !18} ; [ DW_TAG_arg_variable ] [n] [line 19]
!45 = !MDLocation(line: 19, column: 19, scope: !8)
!46 = !{!"0x101\00size_x\00117440532\000", !8, !9, !18} ; [ DW_TAG_arg_variable ] [size_x] [line 20]
!47 = !MDLocation(line: 20, column: 19, scope: !8)
!48 = !{!"0x101\00size_y\00134217749\000", !8, !9, !18} ; [ DW_TAG_arg_variable ] [size_y] [line 21]
!49 = !MDLocation(line: 21, column: 19, scope: !8)
!50 = !MDLocation(line: 23, column: 23, scope: !8)
!51 = !{!"0x100\00khalf\0023\000", !8, !9, !18}   ; [ DW_TAG_auto_variable ] [khalf] [line 23]
!52 = !MDLocation(line: 23, column: 15, scope: !8)
!53 = !{!"0x100\00pixel\0025\000", !8, !9, !17}   ; [ DW_TAG_auto_variable ] [pixel] [line 25]
!54 = !MDLocation(line: 25, column: 11, scope: !8)
!55 = !{!"0x100\00c\0026\000", !8, !9, !19}       ; [ DW_TAG_auto_variable ] [c] [line 26]
!56 = !MDLocation(line: 26, column: 9, scope: !8)
!57 = !MDLocation(line: 29, column: 18, scope: !58)
!58 = !{!"0xb\0029\005\000", !1, !8}              ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!59 = !{!"0x100\00j\0029\000", !58, !9, !19}      ; [ DW_TAG_auto_variable ] [j] [line 29]
!60 = !MDLocation(line: 29, column: 14, scope: !58)
!61 = !MDLocation(line: 29, column: 10, scope: !58)
!62 = !MDLocation(line: 29, column: 26, scope: !63)
!63 = !{!"0xb\0029\005\001", !1, !58}             ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!64 = !MDLocation(line: 29, column: 5, scope: !58)
!65 = !MDLocation(line: 30, column: 30, scope: !66)
!66 = !{!"0xb\0030\009\003", !1, !67}             ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!67 = !{!"0xb\0030\009\002", !1, !63}             ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!68 = !MDLocation(line: 30, column: 9, scope: !67)
!69 = !MDLocation(line: 31, column: 26, scope: !66)
!70 = !MDLocation(line: 31, column: 25, scope: !66)
!71 = !MDLocation(line: 31, column: 62, scope: !66)
!72 = !MDLocation(line: 31, column: 60, scope: !66)
!73 = !MDLocation(line: 31, column: 22, scope: !66)
!74 = !MDLocation(line: 31, column: 53, scope: !66)
!75 = !MDLocation(line: 31, column: 13, scope: !66)
!76 = !MDLocation(line: 30, column: 9, scope: !66)
!77 = !MDLocation(line: 31, column: 75, scope: !67)
!78 = !MDLocation(line: 29, column: 5, scope: !63)
!79 = !MDLocation(line: 33, column: 27, scope: !8)
!80 = !MDLocation(line: 33, column: 9, scope: !8)
!81 = !MDLocation(line: 33, column: 5, scope: !8)
!82 = !MDLocation(line: 35, column: 1, scope: !8)
!83 = !{!"0x101\00in\0016777253\000", !20, !9, !23} ; [ DW_TAG_arg_variable ] [in] [line 37]
!84 = !MDLocation(line: 37, column: 40, scope: !20)
!85 = !{!"0x101\00out\0033554470\000", !20, !9, !24} ; [ DW_TAG_arg_variable ] [out] [line 38]
!86 = !MDLocation(line: 38, column: 20, scope: !20)
!87 = !{!"0x101\00kernel\0050331687\000", !20, !9, !15} ; [ DW_TAG_arg_variable ] [kernel] [line 39]
!88 = !MDLocation(line: 39, column: 22, scope: !20)
!89 = !{!"0x101\00kn\0067108904\000", !20, !9, !18} ; [ DW_TAG_arg_variable ] [kn] [line 40]
!90 = !MDLocation(line: 40, column: 13, scope: !20)
!91 = !{!"0x101\00x\0083886121\000", !20, !9, !18} ; [ DW_TAG_arg_variable ] [x] [line 41]
!92 = !MDLocation(line: 41, column: 19, scope: !20)
!93 = !{!"0x101\00y\00100663338\000", !20, !9, !18} ; [ DW_TAG_arg_variable ] [y] [line 42]
!94 = !MDLocation(line: 42, column: 19, scope: !20)
!95 = !MDLocation(line: 44, column: 23, scope: !20)
!96 = !{!"0x100\00khalf\0044\000", !20, !9, !18}  ; [ DW_TAG_auto_variable ] [khalf] [line 44]
!97 = !MDLocation(line: 44, column: 15, scope: !20)
!98 = !{!"0x100\00pixel\0046\000", !20, !9, !17}  ; [ DW_TAG_auto_variable ] [pixel] [line 46]
!99 = !MDLocation(line: 46, column: 11, scope: !20)
!100 = !{!"0x100\00c\0047\000", !20, !9, !19}     ; [ DW_TAG_auto_variable ] [c] [line 47]
!101 = !MDLocation(line: 47, column: 9, scope: !20)
!102 = !MDLocation(line: 50, column: 18, scope: !103)
!103 = !{!"0xb\0050\005\004", !1, !20}            ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!104 = !{!"0x100\00j\0050\000", !103, !9, !19}    ; [ DW_TAG_auto_variable ] [j] [line 50]
!105 = !MDLocation(line: 50, column: 14, scope: !103)
!106 = !MDLocation(line: 50, column: 10, scope: !103)
!107 = !MDLocation(line: 50, column: 26, scope: !108)
!108 = !{!"0xb\0050\005\005", !1, !103}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!109 = !MDLocation(line: 50, column: 5, scope: !103)
!110 = !MDLocation(line: 51, column: 30, scope: !111)
!111 = !{!"0xb\0051\009\007", !1, !112}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!112 = !{!"0xb\0051\009\006", !1, !108}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!113 = !MDLocation(line: 51, column: 9, scope: !112)
!114 = !MDLocation(line: 52, column: 25, scope: !111)
!115 = !MDLocation(line: 52, column: 22, scope: !111)
!116 = !MDLocation(line: 52, column: 30, scope: !111)
!117 = !MDLocation(line: 51, column: 9, scope: !111)
!118 = !MDLocation(line: 52, column: 37, scope: !111)
!119 = !MDLocation(line: 52, column: 13, scope: !111)
!120 = !MDLocation(line: 52, column: 47, scope: !112)
!121 = !MDLocation(line: 50, column: 5, scope: !108)
!122 = !MDLocation(line: 54, column: 17, scope: !20)
!123 = !MDLocation(line: 54, column: 5, scope: !20)
!124 = !MDLocation(line: 56, column: 1, scope: !20)
!125 = !{!"0x101\00in\0016777300\000", !25, !9, !12} ; [ DW_TAG_arg_variable ] [in] [line 84]
!126 = !MDLocation(line: 84, column: 25, scope: !25)
!127 = !{!"0x101\00out\0033554517\000", !25, !9, !14} ; [ DW_TAG_arg_variable ] [out] [line 85]
!128 = !MDLocation(line: 85, column: 19, scope: !25)
!129 = !{!"0x101\00kernel\0050331734\000", !25, !9, !15} ; [ DW_TAG_arg_variable ] [kernel] [line 86]
!130 = !MDLocation(line: 86, column: 22, scope: !25)
!131 = !{!"0x101\00kn\0067108951\000", !25, !9, !18} ; [ DW_TAG_arg_variable ] [kn] [line 87]
!132 = !MDLocation(line: 87, column: 19, scope: !25)
!133 = !{!"0x101\00dim_x\0083886168\000", !25, !9, !18} ; [ DW_TAG_arg_variable ] [dim_x] [line 88]
!134 = !MDLocation(line: 88, column: 19, scope: !25)
!135 = !{!"0x101\00dim_y\00100663385\000", !25, !9, !18} ; [ DW_TAG_arg_variable ] [dim_y] [line 89]
!136 = !MDLocation(line: 89, column: 19, scope: !25)
!137 = !MDLocation(line: 92, column: 23, scope: !25)
!138 = !{!"0x100\00khalf\0092\000", !25, !9, !18} ; [ DW_TAG_auto_variable ] [khalf] [line 92]
!139 = !MDLocation(line: 92, column: 15, scope: !25)
!140 = !{!"0x100\00m\0094\000", !141, !9, !19}    ; [ DW_TAG_auto_variable ] [m] [line 94]
!141 = !{!"0xb\0094\005\008", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!142 = !MDLocation(line: 94, column: 14, scope: !141)
!143 = !MDLocation(line: 94, column: 29, scope: !144)
!144 = !{!"0xb\0094\005\009", !1, !141}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!145 = !MDLocation(line: 94, column: 25, scope: !144)
!146 = !MDLocation(line: 94, column: 5, scope: !141)
!147 = !MDLocation(line: 95, column: 33, scope: !148)
!148 = !{!"0xb\0095\009\0011", !1, !149}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!149 = !{!"0xb\0095\009\0010", !1, !144}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!150 = !MDLocation(line: 95, column: 29, scope: !148)
!151 = !MDLocation(line: 23, column: 23, scope: !8, inlinedAt: !152)
!152 = !MDLocation(line: 96, column: 13, scope: !148)
!153 = !MDLocation(line: 29, column: 18, scope: !58, inlinedAt: !152)
!154 = !MDLocation(line: 29, column: 10, scope: !58, inlinedAt: !152)
!155 = !MDLocation(line: 29, column: 26, scope: !63, inlinedAt: !152)
!156 = !MDLocation(line: 30, column: 30, scope: !66, inlinedAt: !152)
!157 = !{!"0x100\00n\0095\000", !149, !9, !19}    ; [ DW_TAG_auto_variable ] [n] [line 95]
!158 = !MDLocation(line: 95, column: 18, scope: !149)
!159 = !MDLocation(line: 95, column: 9, scope: !149)
!160 = !{!"0x101\00in\0016777230\000", !8, !9, !12, !152} ; [ DW_TAG_arg_variable ] [in] [line 14]
!161 = !MDLocation(line: 14, column: 36, scope: !8, inlinedAt: !152)
!162 = !{!"0x101\00out\0033554447\000", !8, !9, !14, !152} ; [ DW_TAG_arg_variable ] [out] [line 15]
!163 = !MDLocation(line: 15, column: 19, scope: !8, inlinedAt: !152)
!164 = !{!"0x101\00kernel\0050331664\000", !8, !9, !15, !152} ; [ DW_TAG_arg_variable ] [kernel] [line 16]
!165 = !MDLocation(line: 16, column: 22, scope: !8, inlinedAt: !152)
!166 = !{!"0x101\00kn\0067108881\000", !8, !9, !18, !152} ; [ DW_TAG_arg_variable ] [kn] [line 17]
!167 = !MDLocation(line: 17, column: 13, scope: !8, inlinedAt: !152)
!168 = !{!"0x101\00m\0083886098\000", !8, !9, !18, !152} ; [ DW_TAG_arg_variable ] [m] [line 18]
!169 = !MDLocation(line: 18, column: 19, scope: !8, inlinedAt: !152)
!170 = !{!"0x101\00n\00100663315\000", !8, !9, !18, !152} ; [ DW_TAG_arg_variable ] [n] [line 19]
!171 = !MDLocation(line: 19, column: 19, scope: !8, inlinedAt: !152)
!172 = !{!"0x101\00size_x\00117440532\000", !8, !9, !18, !152} ; [ DW_TAG_arg_variable ] [size_x] [line 20]
!173 = !MDLocation(line: 20, column: 19, scope: !8, inlinedAt: !152)
!174 = !{!"0x101\00size_y\00134217749\000", !8, !9, !18, !152} ; [ DW_TAG_arg_variable ] [size_y] [line 21]
!175 = !MDLocation(line: 21, column: 19, scope: !8, inlinedAt: !152)
!176 = !{!"0x100\00khalf\0023\000", !8, !9, !18, !152} ; [ DW_TAG_auto_variable ] [khalf] [line 23]
!177 = !MDLocation(line: 23, column: 15, scope: !8, inlinedAt: !152)
!178 = !{!"0x100\00pixel\0025\000", !8, !9, !17, !152} ; [ DW_TAG_auto_variable ] [pixel] [line 25]
!179 = !MDLocation(line: 25, column: 11, scope: !8, inlinedAt: !152)
!180 = !{!"0x100\00c\0026\000", !8, !9, !19, !152} ; [ DW_TAG_auto_variable ] [c] [line 26]
!181 = !MDLocation(line: 26, column: 9, scope: !8, inlinedAt: !152)
!182 = !{!"0x100\00j\0029\000", !58, !9, !19, !152} ; [ DW_TAG_auto_variable ] [j] [line 29]
!183 = !MDLocation(line: 29, column: 14, scope: !58, inlinedAt: !152)
!184 = !MDLocation(line: 29, column: 5, scope: !58, inlinedAt: !152)
!185 = !MDLocation(line: 30, column: 9, scope: !67, inlinedAt: !152)
!186 = !MDLocation(line: 31, column: 26, scope: !66, inlinedAt: !152)
!187 = !MDLocation(line: 31, column: 25, scope: !66, inlinedAt: !152)
!188 = !MDLocation(line: 31, column: 62, scope: !66, inlinedAt: !152)
!189 = !MDLocation(line: 31, column: 60, scope: !66, inlinedAt: !152)
!190 = !MDLocation(line: 31, column: 22, scope: !66, inlinedAt: !152)
!191 = !MDLocation(line: 31, column: 53, scope: !66, inlinedAt: !152)
!192 = !MDLocation(line: 31, column: 13, scope: !66, inlinedAt: !152)
!193 = !MDLocation(line: 30, column: 9, scope: !66, inlinedAt: !152)
!194 = !MDLocation(line: 29, column: 5, scope: !63, inlinedAt: !152)
!195 = !MDLocation(line: 33, column: 27, scope: !8, inlinedAt: !152)
!196 = !MDLocation(line: 33, column: 9, scope: !8, inlinedAt: !152)
!197 = !MDLocation(line: 33, column: 5, scope: !8, inlinedAt: !152)
!198 = !MDLocation(line: 95, column: 48, scope: !148)
!199 = !MDLocation(line: 96, column: 66, scope: !149)
!200 = !MDLocation(line: 94, column: 44, scope: !144)
!201 = !MDLocation(line: 97, column: 1, scope: !25)
!202 = !{!"0x101\00in\0016777316\000", !28, !9, !23} ; [ DW_TAG_arg_variable ] [in] [line 100]
!203 = !MDLocation(line: 100, column: 26, scope: !28)
!204 = !{!"0x101\00out\0033554533\000", !28, !9, !24} ; [ DW_TAG_arg_variable ] [out] [line 101]
!205 = !MDLocation(line: 101, column: 20, scope: !28)
!206 = !{!"0x101\00kernel\0050331750\000", !28, !9, !15} ; [ DW_TAG_arg_variable ] [kernel] [line 102]
!207 = !MDLocation(line: 102, column: 22, scope: !28)
!208 = !{!"0x101\00kn\0067108967\000", !28, !9, !18} ; [ DW_TAG_arg_variable ] [kn] [line 103]
!209 = !MDLocation(line: 103, column: 19, scope: !28)
!210 = !{!"0x101\00dim_x\0083886184\000", !28, !9, !18} ; [ DW_TAG_arg_variable ] [dim_x] [line 104]
!211 = !MDLocation(line: 104, column: 19, scope: !28)
!212 = !{!"0x101\00dim_y\00100663401\000", !28, !9, !18} ; [ DW_TAG_arg_variable ] [dim_y] [line 105]
!213 = !MDLocation(line: 105, column: 19, scope: !28)
!214 = !MDLocation(line: 107, column: 23, scope: !28)
!215 = !{!"0x100\00khalf\00107\000", !28, !9, !18} ; [ DW_TAG_auto_variable ] [khalf] [line 107]
!216 = !MDLocation(line: 107, column: 15, scope: !28)
!217 = !{!"0x100\00m\00109\000", !218, !9, !19}   ; [ DW_TAG_auto_variable ] [m] [line 109]
!218 = !{!"0xb\00109\005\0012", !1, !28}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!219 = !MDLocation(line: 109, column: 14, scope: !218)
!220 = !MDLocation(line: 109, column: 29, scope: !221)
!221 = !{!"0xb\00109\005\0013", !1, !218}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!222 = !MDLocation(line: 109, column: 25, scope: !221)
!223 = !MDLocation(line: 109, column: 5, scope: !218)
!224 = !MDLocation(line: 110, column: 33, scope: !225)
!225 = !{!"0xb\00110\009\0015", !1, !226}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!226 = !{!"0xb\00110\009\0014", !1, !221}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!227 = !MDLocation(line: 110, column: 29, scope: !225)
!228 = !MDLocation(line: 44, column: 23, scope: !20, inlinedAt: !229)
!229 = !MDLocation(line: 111, column: 10, scope: !225)
!230 = !MDLocation(line: 50, column: 18, scope: !103, inlinedAt: !229)
!231 = !MDLocation(line: 50, column: 10, scope: !103, inlinedAt: !229)
!232 = !MDLocation(line: 50, column: 26, scope: !108, inlinedAt: !229)
!233 = !MDLocation(line: 51, column: 30, scope: !111, inlinedAt: !229)
!234 = !{!"0x100\00n\00110\000", !226, !9, !19}   ; [ DW_TAG_auto_variable ] [n] [line 110]
!235 = !MDLocation(line: 110, column: 18, scope: !226)
!236 = !MDLocation(line: 110, column: 9, scope: !226)
!237 = !MDLocation(line: 54, column: 5, scope: !20, inlinedAt: !229)
!238 = !{!"0x101\00in\0016777253\000", !20, !9, !23, !229} ; [ DW_TAG_arg_variable ] [in] [line 37]
!239 = !MDLocation(line: 37, column: 40, scope: !20, inlinedAt: !229)
!240 = !{!"0x101\00out\0033554470\000", !20, !9, !24, !229} ; [ DW_TAG_arg_variable ] [out] [line 38]
!241 = !MDLocation(line: 38, column: 20, scope: !20, inlinedAt: !229)
!242 = !{!"0x101\00kernel\0050331687\000", !20, !9, !15, !229} ; [ DW_TAG_arg_variable ] [kernel] [line 39]
!243 = !MDLocation(line: 39, column: 22, scope: !20, inlinedAt: !229)
!244 = !{!"0x101\00kn\0067108904\000", !20, !9, !18, !229} ; [ DW_TAG_arg_variable ] [kn] [line 40]
!245 = !MDLocation(line: 40, column: 13, scope: !20, inlinedAt: !229)
!246 = !{!"0x101\00x\0083886121\000", !20, !9, !18, !229} ; [ DW_TAG_arg_variable ] [x] [line 41]
!247 = !MDLocation(line: 41, column: 19, scope: !20, inlinedAt: !229)
!248 = !{!"0x101\00y\00100663338\000", !20, !9, !18, !229} ; [ DW_TAG_arg_variable ] [y] [line 42]
!249 = !MDLocation(line: 42, column: 19, scope: !20, inlinedAt: !229)
!250 = !{!"0x100\00khalf\0044\000", !20, !9, !18, !229} ; [ DW_TAG_auto_variable ] [khalf] [line 44]
!251 = !MDLocation(line: 44, column: 15, scope: !20, inlinedAt: !229)
!252 = !{!"0x100\00pixel\0046\000", !20, !9, !17, !229} ; [ DW_TAG_auto_variable ] [pixel] [line 46]
!253 = !MDLocation(line: 46, column: 11, scope: !20, inlinedAt: !229)
!254 = !{!"0x100\00c\0047\000", !20, !9, !19, !229} ; [ DW_TAG_auto_variable ] [c] [line 47]
!255 = !MDLocation(line: 47, column: 9, scope: !20, inlinedAt: !229)
!256 = !{!"0x100\00j\0050\000", !103, !9, !19, !229} ; [ DW_TAG_auto_variable ] [j] [line 50]
!257 = !MDLocation(line: 50, column: 14, scope: !103, inlinedAt: !229)
!258 = !MDLocation(line: 50, column: 5, scope: !103, inlinedAt: !229)
!259 = !MDLocation(line: 51, column: 9, scope: !112, inlinedAt: !229)
!260 = !MDLocation(line: 52, column: 25, scope: !111, inlinedAt: !229)
!261 = !MDLocation(line: 52, column: 22, scope: !111, inlinedAt: !229)
!262 = !MDLocation(line: 52, column: 30, scope: !111, inlinedAt: !229)
!263 = !MDLocation(line: 51, column: 9, scope: !111, inlinedAt: !229)
!264 = !MDLocation(line: 52, column: 37, scope: !111, inlinedAt: !229)
!265 = !MDLocation(line: 52, column: 13, scope: !111, inlinedAt: !229)
!266 = !MDLocation(line: 52, column: 47, scope: !112, inlinedAt: !229)
!267 = !MDLocation(line: 50, column: 5, scope: !108, inlinedAt: !229)
!268 = !MDLocation(line: 54, column: 17, scope: !20, inlinedAt: !229)
!269 = !MDLocation(line: 110, column: 48, scope: !225)
!270 = !MDLocation(line: 111, column: 52, scope: !226)
!271 = !MDLocation(line: 109, column: 44, scope: !221)
!272 = !MDLocation(line: 112, column: 1, scope: !28)
!273 = !{!"0x101\00in\0016777331\000", !29, !9, !23} ; [ DW_TAG_arg_variable ] [in] [line 115]
!274 = !MDLocation(line: 115, column: 26, scope: !29)
!275 = !{!"0x101\00out\0033554548\000", !29, !9, !24} ; [ DW_TAG_arg_variable ] [out] [line 116]
!276 = !MDLocation(line: 116, column: 20, scope: !29)
!277 = !{!"0x101\00kernel\0050331765\000", !29, !9, !15} ; [ DW_TAG_arg_variable ] [kernel] [line 117]
!278 = !MDLocation(line: 117, column: 22, scope: !29)
!279 = !{!"0x101\00kn\0067108982\000", !29, !9, !18} ; [ DW_TAG_arg_variable ] [kn] [line 118]
!280 = !MDLocation(line: 118, column: 19, scope: !29)
!281 = !{!"0x101\00dim_x\0083886199\000", !29, !9, !18} ; [ DW_TAG_arg_variable ] [dim_x] [line 119]
!282 = !MDLocation(line: 119, column: 19, scope: !29)
!283 = !{!"0x101\00dim_y\00100663416\000", !29, !9, !18} ; [ DW_TAG_arg_variable ] [dim_y] [line 120]
!284 = !MDLocation(line: 120, column: 19, scope: !29)
!285 = !MDLocation(line: 122, column: 23, scope: !29)
!286 = !{!"0x100\00khalf\00122\000", !29, !9, !18} ; [ DW_TAG_auto_variable ] [khalf] [line 122]
!287 = !MDLocation(line: 122, column: 15, scope: !29)
!288 = !{!"0x100\00y\00124\000", !289, !9, !19}   ; [ DW_TAG_auto_variable ] [y] [line 124]
!289 = !{!"0xb\00124\005\0016", !1, !29}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!290 = !MDLocation(line: 124, column: 14, scope: !289)
!291 = !MDLocation(line: 124, column: 10, scope: !289)
!292 = !MDLocation(line: 124, column: 29, scope: !293)
!293 = !{!"0xb\00124\005\0017", !1, !289}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!294 = !MDLocation(line: 124, column: 25, scope: !293)
!295 = !MDLocation(line: 124, column: 5, scope: !289)
!296 = !MDLocation(line: 125, column: 31, scope: !297)
!297 = !{!"0xb\00125\007\0019", !1, !298}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!298 = !{!"0xb\00125\007\0018", !1, !293}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!299 = !MDLocation(line: 125, column: 27, scope: !297)
!300 = !MDLocation(line: 130, column: 30, scope: !301)
!301 = !{!"0xb\00130\009\0022", !1, !302}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!302 = !{!"0xb\00130\009\0021", !1, !303}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!303 = !{!"0xb\00125\0051\0020", !1, !297}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!304 = !MDLocation(line: 131, column: 32, scope: !305)
!305 = !{!"0xb\00131\0011\0024", !1, !306}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!306 = !{!"0xb\00131\0011\0023", !1, !301}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!307 = !{!"0x100\00x\00125\000", !298, !9, !19}   ; [ DW_TAG_auto_variable ] [x] [line 125]
!308 = !MDLocation(line: 125, column: 16, scope: !298)
!309 = !MDLocation(line: 125, column: 7, scope: !298)
!310 = !{!"0x100\00pixel\00126\000", !303, !9, !17} ; [ DW_TAG_auto_variable ] [pixel] [line 126]
!311 = !MDLocation(line: 126, column: 15, scope: !303)
!312 = !{!"0x100\00c\00127\000", !303, !9, !19}   ; [ DW_TAG_auto_variable ] [c] [line 127]
!313 = !MDLocation(line: 127, column: 13, scope: !303)
!314 = !MDLocation(line: 130, column: 9, scope: !302)
!315 = !MDLocation(line: 131, column: 11, scope: !306)
!316 = !MDLocation(line: 132, column: 25, scope: !305)
!317 = !MDLocation(line: 132, column: 22, scope: !305)
!318 = !MDLocation(line: 132, column: 32, scope: !305)
!319 = !MDLocation(line: 131, column: 11, scope: !305)
!320 = !MDLocation(line: 132, column: 41, scope: !305)
!321 = !MDLocation(line: 132, column: 13, scope: !305)
!322 = !MDLocation(line: 132, column: 51, scope: !306)
!323 = !MDLocation(line: 130, column: 9, scope: !301)
!324 = !MDLocation(line: 134, column: 21, scope: !303)
!325 = !MDLocation(line: 134, column: 9, scope: !303)
!326 = !MDLocation(line: 135, column: 7, scope: !303)
!327 = !MDLocation(line: 125, column: 7, scope: !297)
!328 = !MDLocation(line: 135, column: 7, scope: !298)
!329 = !MDLocation(line: 124, column: 5, scope: !293)
!330 = !MDLocation(line: 136, column: 1, scope: !29)
