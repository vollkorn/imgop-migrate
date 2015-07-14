; ModuleID = 'convolve.ll'
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
  br label %for.body, !dbg !64

for.body:                                         ; preds = %for.body.lr.ph, %for.inc16
  %pixel.018 = phi float [ 0.000000e+00, %for.body.lr.ph ], [ %pixel.1.lcssa, %for.inc16 ]
  %indvars.iv16 = phi i64 [ %2, %for.body.lr.ph ], [ %indvars.iv.next6, %for.inc16 ]
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !65, metadata !34), !dbg !67
  %cmp33 = icmp sle i64 %0, %1, !dbg !68
  br i1 %cmp33, label %for.body4.lr.ph, label %for.end, !dbg !70

for.body4.lr.ph:                                  ; preds = %for.body
  br label %for.body4, !dbg !70

for.body4:                                        ; preds = %for.body4.lr.ph, %for.inc
  %pixel.15 = phi float [ %pixel.018, %for.body4.lr.ph ], [ %add15, %for.inc ]
  %indvars.iv4 = phi i64 [ %0, %for.body4.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %8 = sub nsw i64 %4, %indvars.iv16, !dbg !71
  %9 = mul nsw i64 %8, %5, !dbg !72
  %10 = add nsw i64 %9, %6, !dbg !72
  %11 = sub nsw i64 %10, %indvars.iv4, !dbg !72
  %arrayidx = getelementptr inbounds i8* %in, i64 %11, !dbg !73
  %12 = load i8* %arrayidx, align 1, !dbg !73
  %conv = zext i8 %12 to i32, !dbg !73
  %conv7 = sitofp i32 %conv to float, !dbg !73
  %13 = mul nsw i64 %indvars.iv16, %7, !dbg !74
  %14 = sub nsw i64 1, %13, !dbg !75
  %15 = add nsw i64 %14, 1, !dbg !75
  %16 = sub nsw i64 %15, %indvars.iv4, !dbg !75
  %arrayidx13 = getelementptr inbounds float* %kernel, i64 %16, !dbg !76
  %17 = load float* %arrayidx13, align 4, !dbg !76
  %mul14 = fmul float %conv7, %17, !dbg !73
  %add15 = fadd float %pixel.15, %mul14, !dbg !77
  call void @llvm.dbg.value(metadata float %add15, i64 0, metadata !53, metadata !34), !dbg !54
  br label %for.inc, !dbg !77

for.inc:                                          ; preds = %for.body4
  %indvars.iv.next = add nsw i64 %indvars.iv4, 1, !dbg !78
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !65, metadata !34), !dbg !67
  %cmp3 = icmp sle i64 %indvars.iv.next, %1, !dbg !68
  br i1 %cmp3, label %for.body4, label %for.cond2.for.end_crit_edge, !dbg !70

for.cond2.for.end_crit_edge:                      ; preds = %for.inc
  %split = phi float [ %add15, %for.inc ]
  br label %for.end, !dbg !70

for.end:                                          ; preds = %for.cond2.for.end_crit_edge, %for.body
  %indvars.iv17 = phi i64 [ %indvars.iv16, %for.cond2.for.end_crit_edge ], [ %indvars.iv16, %for.body ]
  %pixel.1.lcssa = phi float [ %split, %for.cond2.for.end_crit_edge ], [ %pixel.018, %for.body ]
  br label %for.inc16, !dbg !79

for.inc16:                                        ; preds = %for.end
  %indvars.iv.next6 = add nsw i64 %indvars.iv17, 1, !dbg !80
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !59, metadata !34), !dbg !60
  %cmp = icmp sle i64 %indvars.iv.next6, %3, !dbg !62
  br i1 %cmp, label %for.body, label %for.cond.for.end18_crit_edge, !dbg !64

for.cond.for.end18_crit_edge:                     ; preds = %for.inc16
  %split19 = phi float [ %pixel.1.lcssa, %for.inc16 ]
  br label %for.end18, !dbg !64

for.end18:                                        ; preds = %for.cond.for.end18_crit_edge, %entry
  %pixel.0.lcssa = phi float [ %split19, %for.cond.for.end18_crit_edge ], [ 0.000000e+00, %entry ]
  %conv19 = fptoui float %pixel.0.lcssa to i8, !dbg !81
  %mul20 = mul nsw i32 %n, %size_x, !dbg !82
  %add21 = add nsw i32 %mul20, %m, !dbg !82
  %idxprom22 = sext i32 %add21 to i64, !dbg !83
  %arrayidx23 = getelementptr inbounds i8* %out, i64 %idxprom22, !dbg !83
  store i8 %conv19, i8* %arrayidx23, align 1, !dbg !83
  ret void, !dbg !84
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @filter_kernel_2d(i8** %in, i8** %out, float* %kernel, i32 %kn, i32 %x, i32 %y) #0 {
entry:
  call void @llvm.dbg.value(metadata i8** %in, i64 0, metadata !85, metadata !34), !dbg !86
  call void @llvm.dbg.value(metadata i8** %out, i64 0, metadata !87, metadata !34), !dbg !88
  call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !89, metadata !34), !dbg !90
  call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !91, metadata !34), !dbg !92
  call void @llvm.dbg.value(metadata i32 %x, i64 0, metadata !93, metadata !34), !dbg !94
  call void @llvm.dbg.value(metadata i32 %y, i64 0, metadata !95, metadata !34), !dbg !96
  %div = sdiv i32 %kn, 2, !dbg !97
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !98, metadata !34), !dbg !99
  call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !100, metadata !34), !dbg !101
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !102, metadata !34), !dbg !103
  %sub = sub nsw i32 0, %div, !dbg !104
  call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !106, metadata !34), !dbg !107
  %0 = sext i32 %sub to i64
  %1 = sext i32 %div to i64, !dbg !108
  %2 = sext i32 %x to i64, !dbg !108
  %3 = sext i32 %sub to i64
  %4 = sext i32 %div to i64, !dbg !108
  %5 = sext i32 %y to i64, !dbg !108
  %cmp11 = icmp sle i64 %3, %4, !dbg !109
  br i1 %cmp11, label %for.body.lr.ph, label %for.end15, !dbg !111

for.body.lr.ph:                                   ; preds = %entry
  br label %for.body, !dbg !111

for.body:                                         ; preds = %for.body.lr.ph, %for.inc13
  %c.015 = phi i32 [ 0, %for.body.lr.ph ], [ %12, %for.inc13 ]
  %pixel.014 = phi float [ 0.000000e+00, %for.body.lr.ph ], [ %pixel.1.lcssa, %for.inc13 ]
  %indvars.iv12 = phi i64 [ %3, %for.body.lr.ph ], [ %indvars.iv.next9, %for.inc13 ]
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !112, metadata !34), !dbg !114
  %6 = sext i32 %c.015 to i64
  %cmp34 = icmp sle i64 %0, %1, !dbg !115
  br i1 %cmp34, label %for.body4.lr.ph, label %for.end, !dbg !117

for.body4.lr.ph:                                  ; preds = %for.body
  br label %for.body4, !dbg !117

for.body4:                                        ; preds = %for.body4.lr.ph, %for.inc
  %pixel.17 = phi float [ %pixel.014, %for.body4.lr.ph ], [ %add11, %for.inc ]
  %indvars.iv6 = phi i64 [ %6, %for.body4.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %indvars.iv15 = phi i64 [ %0, %for.body4.lr.ph ], [ %indvars.iv.next2, %for.inc ]
  %7 = add nsw i64 %2, %indvars.iv15, !dbg !118
  %8 = add nsw i64 %5, %indvars.iv12, !dbg !119
  %arrayidx = getelementptr inbounds i8** %in, i64 %8, !dbg !120
  %9 = load i8** %arrayidx, align 8, !dbg !120
  %arrayidx7 = getelementptr inbounds i8* %9, i64 %7, !dbg !120
  %10 = load i8* %arrayidx7, align 1, !dbg !120
  %conv = zext i8 %10 to i32, !dbg !120
  %conv8 = sitofp i32 %conv to float, !dbg !120
  %indvars.iv.next = add nsw i64 %indvars.iv6, 1, !dbg !121
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !102, metadata !34), !dbg !103
  %arrayidx10 = getelementptr inbounds float* %kernel, i64 %indvars.iv6, !dbg !122
  %11 = load float* %arrayidx10, align 4, !dbg !122
  %mul = fmul float %conv8, %11, !dbg !120
  %add11 = fadd float %pixel.17, %mul, !dbg !123
  call void @llvm.dbg.value(metadata float %add11, i64 0, metadata !100, metadata !34), !dbg !101
  br label %for.inc, !dbg !123

for.inc:                                          ; preds = %for.body4
  %indvars.iv.next2 = add nsw i64 %indvars.iv15, 1, !dbg !121
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !112, metadata !34), !dbg !114
  %cmp3 = icmp sle i64 %indvars.iv.next2, %1, !dbg !115
  br i1 %cmp3, label %for.body4, label %for.cond2.for.end_crit_edge, !dbg !117

for.cond2.for.end_crit_edge:                      ; preds = %for.inc
  %split = phi i64 [ %indvars.iv.next, %for.inc ]
  %split8 = phi float [ %add11, %for.inc ]
  br label %for.end, !dbg !117

for.end:                                          ; preds = %for.cond2.for.end_crit_edge, %for.body
  %indvars.iv13 = phi i64 [ %indvars.iv12, %for.cond2.for.end_crit_edge ], [ %indvars.iv12, %for.body ]
  %c.1.lcssa.wide = phi i64 [ %split, %for.cond2.for.end_crit_edge ], [ %6, %for.body ]
  %pixel.1.lcssa = phi float [ %split8, %for.cond2.for.end_crit_edge ], [ %pixel.014, %for.body ]
  %12 = trunc i64 %c.1.lcssa.wide to i32, !dbg !124
  br label %for.inc13, !dbg !124

for.inc13:                                        ; preds = %for.end
  %indvars.iv.next9 = add nsw i64 %indvars.iv13, 1, !dbg !125
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !106, metadata !34), !dbg !107
  %cmp = icmp sle i64 %indvars.iv.next9, %4, !dbg !109
  br i1 %cmp, label %for.body, label %for.cond.for.end15_crit_edge, !dbg !111

for.cond.for.end15_crit_edge:                     ; preds = %for.inc13
  %split16 = phi float [ %pixel.1.lcssa, %for.inc13 ]
  br label %for.end15, !dbg !111

for.end15:                                        ; preds = %for.cond.for.end15_crit_edge, %entry
  %pixel.0.lcssa = phi float [ %split16, %for.cond.for.end15_crit_edge ], [ 0.000000e+00, %entry ]
  %conv16 = fptoui float %pixel.0.lcssa to i8, !dbg !126
  %idxprom17 = sext i32 %x to i64, !dbg !127
  %idxprom18 = sext i32 %y to i64, !dbg !127
  %arrayidx19 = getelementptr inbounds i8** %out, i64 %idxprom18, !dbg !127
  %13 = load i8** %arrayidx19, align 8, !dbg !127
  %arrayidx20 = getelementptr inbounds i8* %13, i64 %idxprom17, !dbg !127
  store i8 %conv16, i8* %arrayidx20, align 1, !dbg !127
  ret void, !dbg !128
}

; Function Attrs: nounwind uwtable
define void @convolve_arr_linear(i8* %in, i8* %out, float* %kernel, i32 %kn, i32 %dim_x, i32 %dim_y) #0 {
entry:
  call void @llvm.dbg.value(metadata i8* %in, i64 0, metadata !129, metadata !34), !dbg !130
  call void @llvm.dbg.value(metadata i8* %out, i64 0, metadata !131, metadata !34), !dbg !132
  call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !133, metadata !34), !dbg !134
  call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !135, metadata !34), !dbg !136
  call void @llvm.dbg.value(metadata i32 %dim_x, i64 0, metadata !137, metadata !34), !dbg !138
  call void @llvm.dbg.value(metadata i32 %dim_y, i64 0, metadata !139, metadata !34), !dbg !140
  %div = sdiv i32 %kn, 2, !dbg !141
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !142, metadata !34), !dbg !143
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !144, metadata !34), !dbg !146
  %sub = sub nsw i32 %dim_x, %div, !dbg !147
  %cmp4 = icmp slt i32 %div, %sub, !dbg !149
  br i1 %cmp4, label %for.body.lr.ph, label %for.end7, !dbg !150

for.body.lr.ph:                                   ; preds = %entry
  br label %for.body, !dbg !150

for.body:                                         ; preds = %for.body.lr.ph, %for.inc5
  %m.05 = phi i32 [ %div, %for.body.lr.ph ], [ %inc6, %for.inc5 ]
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !151, metadata !34), !dbg !153
  %sub2 = sub nsw i32 %dim_y, %div, !dbg !154
  %cmp31 = icmp slt i32 %div, %sub2, !dbg !156
  br i1 %cmp31, label %for.body4.lr.ph, label %for.end, !dbg !157

for.body4.lr.ph:                                  ; preds = %for.body
  br label %for.body4, !dbg !157

for.body4:                                        ; preds = %for.body4.lr.ph, %for.inc
  %n.02 = phi i32 [ %div, %for.body4.lr.ph ], [ %inc, %for.inc ]
  call void @filter_kernel(i8* %in, i8* %out, float* %kernel, i32 %kn, i32 %m.05, i32 %n.02, i32 %dim_x, i32 %dim_y), !dbg !158
  br label %for.inc, !dbg !158

for.inc:                                          ; preds = %for.body4
  %inc = add nsw i32 %n.02, 1, !dbg !159
  call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !151, metadata !34), !dbg !153
  %cmp3 = icmp slt i32 %inc, %sub2, !dbg !156
  br i1 %cmp3, label %for.body4, label %for.cond1.for.end_crit_edge, !dbg !157

for.cond1.for.end_crit_edge:                      ; preds = %for.inc
  br label %for.end, !dbg !157

for.end:                                          ; preds = %for.cond1.for.end_crit_edge, %for.body
  br label %for.inc5, !dbg !160

for.inc5:                                         ; preds = %for.end
  %inc6 = add nsw i32 %m.05, 1, !dbg !161
  call void @llvm.dbg.value(metadata i32 %inc6, i64 0, metadata !144, metadata !34), !dbg !146
  %cmp = icmp slt i32 %inc6, %sub, !dbg !149
  br i1 %cmp, label %for.body, label %for.cond.for.end7_crit_edge, !dbg !150

for.cond.for.end7_crit_edge:                      ; preds = %for.inc5
  br label %for.end7, !dbg !150

for.end7:                                         ; preds = %for.cond.for.end7_crit_edge, %entry
  ret void, !dbg !162
}

; Function Attrs: nounwind uwtable
define void @convolve_arr_indirection(i8** %in, i8** %out, float* %kernel, i32 %kn, i32 %dim_x, i32 %dim_y) #0 {
entry:
  call void @llvm.dbg.value(metadata i8** %in, i64 0, metadata !163, metadata !34), !dbg !164
  call void @llvm.dbg.value(metadata i8** %out, i64 0, metadata !165, metadata !34), !dbg !166
  call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !167, metadata !34), !dbg !168
  call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !169, metadata !34), !dbg !170
  call void @llvm.dbg.value(metadata i32 %dim_x, i64 0, metadata !171, metadata !34), !dbg !172
  call void @llvm.dbg.value(metadata i32 %dim_y, i64 0, metadata !173, metadata !34), !dbg !174
  %div = sdiv i32 %kn, 2, !dbg !175
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !176, metadata !34), !dbg !177
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !178, metadata !34), !dbg !180
  %sub = sub nsw i32 %dim_x, %div, !dbg !181
  %cmp4 = icmp slt i32 %div, %sub, !dbg !183
  br i1 %cmp4, label %for.body.lr.ph, label %for.end7, !dbg !184

for.body.lr.ph:                                   ; preds = %entry
  br label %for.body, !dbg !184

for.body:                                         ; preds = %for.body.lr.ph, %for.inc5
  %m.05 = phi i32 [ %div, %for.body.lr.ph ], [ %inc6, %for.inc5 ]
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !185, metadata !34), !dbg !187
  %sub2 = sub nsw i32 %dim_y, %div, !dbg !188
  %cmp31 = icmp slt i32 %div, %sub2, !dbg !190
  br i1 %cmp31, label %for.body4.lr.ph, label %for.end, !dbg !191

for.body4.lr.ph:                                  ; preds = %for.body
  br label %for.body4, !dbg !191

for.body4:                                        ; preds = %for.body4.lr.ph, %for.inc
  %n.02 = phi i32 [ %div, %for.body4.lr.ph ], [ %inc, %for.inc ]
  call void @filter_kernel_2d(i8** %in, i8** %out, float* %kernel, i32 %kn, i32 %n.02, i32 %m.05), !dbg !192
  br label %for.inc, !dbg !192

for.inc:                                          ; preds = %for.body4
  %inc = add nsw i32 %n.02, 1, !dbg !193
  call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !185, metadata !34), !dbg !187
  %cmp3 = icmp slt i32 %inc, %sub2, !dbg !190
  br i1 %cmp3, label %for.body4, label %for.cond1.for.end_crit_edge, !dbg !191

for.cond1.for.end_crit_edge:                      ; preds = %for.inc
  br label %for.end, !dbg !191

for.end:                                          ; preds = %for.cond1.for.end_crit_edge, %for.body
  br label %for.inc5, !dbg !194

for.inc5:                                         ; preds = %for.end
  %inc6 = add nsw i32 %m.05, 1, !dbg !195
  call void @llvm.dbg.value(metadata i32 %inc6, i64 0, metadata !178, metadata !34), !dbg !180
  %cmp = icmp slt i32 %inc6, %sub, !dbg !183
  br i1 %cmp, label %for.body, label %for.cond.for.end7_crit_edge, !dbg !184

for.cond.for.end7_crit_edge:                      ; preds = %for.inc5
  br label %for.end7, !dbg !184

for.end7:                                         ; preds = %for.cond.for.end7_crit_edge, %entry
  ret void, !dbg !196
}

; Function Attrs: nounwind uwtable
define void @convolve_loop_nest(i8** %in, i8** %out, float* %kernel, i32 %kn, i32 %dim_x, i32 %dim_y) #0 {
entry:
  call void @llvm.dbg.value(metadata i8** %in, i64 0, metadata !197, metadata !34), !dbg !198
  call void @llvm.dbg.value(metadata i8** %out, i64 0, metadata !199, metadata !34), !dbg !200
  call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !201, metadata !34), !dbg !202
  call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !203, metadata !34), !dbg !204
  call void @llvm.dbg.value(metadata i32 %dim_x, i64 0, metadata !205, metadata !34), !dbg !206
  call void @llvm.dbg.value(metadata i32 %dim_y, i64 0, metadata !207, metadata !34), !dbg !208
  %div = sdiv i32 %kn, 2, !dbg !209
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !210, metadata !34), !dbg !211
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !212, metadata !34), !dbg !214
  %0 = sub i32 0, %div, !dbg !215
  %1 = sext i32 %0 to i64
  %2 = sext i32 %div to i64, !dbg !215
  %3 = sext i32 %0 to i64
  %4 = sext i32 %div to i64, !dbg !215
  %5 = sext i32 %div to i64
  %6 = sext i32 %div to i64
  %sub = sub nsw i32 %dim_x, %div, !dbg !216
  %7 = sext i32 %sub to i64, !dbg !218
  %cmp22 = icmp slt i64 %6, %7, !dbg !218
  br i1 %cmp22, label %for.body.lr.ph, label %for.end34, !dbg !219

for.body.lr.ph:                                   ; preds = %entry
  br label %for.body, !dbg !219

for.body:                                         ; preds = %for.body.lr.ph, %for.inc32
  %indvars.iv23 = phi i64 [ %6, %for.body.lr.ph ], [ %indvars.iv.next21, %for.inc32 ]
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !220, metadata !34), !dbg !222
  %sub2 = sub nsw i32 %dim_y, %div, !dbg !223
  %8 = sext i32 %sub2 to i64, !dbg !225
  %cmp318 = icmp slt i64 %5, %8, !dbg !225
  br i1 %cmp318, label %for.body4.lr.ph, label %for.end31, !dbg !226

for.body4.lr.ph:                                  ; preds = %for.body
  br label %for.body4, !dbg !226

for.body4:                                        ; preds = %for.body4.lr.ph, %for.inc29
  %indvars.iv19 = phi i64 [ %5, %for.body4.lr.ph ], [ %indvars.iv.next17, %for.inc29 ]
  call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !227, metadata !34), !dbg !229
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !230, metadata !34), !dbg !231
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !232, metadata !34), !dbg !234
  %cmp711 = icmp sle i64 %3, %4, !dbg !235
  br i1 %cmp711, label %for.body8.lr.ph, label %for.end23, !dbg !237

for.body8.lr.ph:                                  ; preds = %for.body4
  br label %for.body8, !dbg !237

for.body8:                                        ; preds = %for.body8.lr.ph, %for.inc21
  %c.015 = phi i32 [ 0, %for.body8.lr.ph ], [ %15, %for.inc21 ]
  %pixel.014 = phi float [ 0.000000e+00, %for.body8.lr.ph ], [ %pixel.1.lcssa, %for.inc21 ]
  %indvars.iv12 = phi i64 [ %3, %for.body8.lr.ph ], [ %indvars.iv.next9, %for.inc21 ]
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !238, metadata !34), !dbg !240
  %9 = sext i32 %c.015 to i64
  %cmp114 = icmp sle i64 %1, %2, !dbg !241
  br i1 %cmp114, label %for.body12.lr.ph, label %for.end, !dbg !243

for.body12.lr.ph:                                 ; preds = %for.body8
  br label %for.body12, !dbg !243

for.body12:                                       ; preds = %for.body12.lr.ph, %for.inc
  %pixel.17 = phi float [ %pixel.014, %for.body12.lr.ph ], [ %add19, %for.inc ]
  %indvars.iv6 = phi i64 [ %9, %for.body12.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %indvars.iv15 = phi i64 [ %1, %for.body12.lr.ph ], [ %indvars.iv.next2, %for.inc ]
  %10 = add nsw i64 %indvars.iv23, %indvars.iv15, !dbg !244
  %11 = add nsw i64 %indvars.iv19, %indvars.iv12, !dbg !245
  %arrayidx = getelementptr inbounds i8** %in, i64 %11, !dbg !246
  %12 = load i8** %arrayidx, align 8, !dbg !246
  %arrayidx15 = getelementptr inbounds i8* %12, i64 %10, !dbg !246
  %13 = load i8* %arrayidx15, align 1, !dbg !246
  %conv = zext i8 %13 to i32, !dbg !246
  %conv16 = sitofp i32 %conv to float, !dbg !246
  %indvars.iv.next = add nsw i64 %indvars.iv6, 1, !dbg !247
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !230, metadata !34), !dbg !231
  %arrayidx18 = getelementptr inbounds float* %kernel, i64 %indvars.iv6, !dbg !248
  %14 = load float* %arrayidx18, align 4, !dbg !248
  %mul = fmul float %conv16, %14, !dbg !246
  %add19 = fadd float %pixel.17, %mul, !dbg !249
  call void @llvm.dbg.value(metadata float %add19, i64 0, metadata !227, metadata !34), !dbg !229
  br label %for.inc, !dbg !249

for.inc:                                          ; preds = %for.body12
  %indvars.iv.next2 = add nsw i64 %indvars.iv15, 1, !dbg !247
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !238, metadata !34), !dbg !240
  %cmp11 = icmp sle i64 %indvars.iv.next2, %2, !dbg !241
  br i1 %cmp11, label %for.body12, label %for.cond10.for.end_crit_edge, !dbg !243

for.cond10.for.end_crit_edge:                     ; preds = %for.inc
  %split = phi i64 [ %indvars.iv.next, %for.inc ]
  %split8 = phi float [ %add19, %for.inc ]
  br label %for.end, !dbg !243

for.end:                                          ; preds = %for.cond10.for.end_crit_edge, %for.body8
  %indvars.iv13 = phi i64 [ %indvars.iv12, %for.cond10.for.end_crit_edge ], [ %indvars.iv12, %for.body8 ]
  %c.1.lcssa.wide = phi i64 [ %split, %for.cond10.for.end_crit_edge ], [ %9, %for.body8 ]
  %pixel.1.lcssa = phi float [ %split8, %for.cond10.for.end_crit_edge ], [ %pixel.014, %for.body8 ]
  %15 = trunc i64 %c.1.lcssa.wide to i32, !dbg !250
  br label %for.inc21, !dbg !250

for.inc21:                                        ; preds = %for.end
  %indvars.iv.next9 = add nsw i64 %indvars.iv13, 1, !dbg !251
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !232, metadata !34), !dbg !234
  %cmp7 = icmp sle i64 %indvars.iv.next9, %4, !dbg !235
  br i1 %cmp7, label %for.body8, label %for.cond6.for.end23_crit_edge, !dbg !237

for.cond6.for.end23_crit_edge:                    ; preds = %for.inc21
  %split16 = phi float [ %pixel.1.lcssa, %for.inc21 ]
  br label %for.end23, !dbg !237

for.end23:                                        ; preds = %for.cond6.for.end23_crit_edge, %for.body4
  %indvars.iv20 = phi i64 [ %indvars.iv19, %for.cond6.for.end23_crit_edge ], [ %indvars.iv19, %for.body4 ]
  %pixel.0.lcssa = phi float [ %split16, %for.cond6.for.end23_crit_edge ], [ 0.000000e+00, %for.body4 ]
  %conv24 = fptoui float %pixel.0.lcssa to i8, !dbg !252
  %arrayidx27 = getelementptr inbounds i8** %out, i64 %indvars.iv20, !dbg !253
  %16 = load i8** %arrayidx27, align 8, !dbg !253
  %arrayidx28 = getelementptr inbounds i8* %16, i64 %indvars.iv23, !dbg !253
  store i8 %conv24, i8* %arrayidx28, align 1, !dbg !253
  br label %for.inc29, !dbg !254

for.inc29:                                        ; preds = %for.end23
  %indvars.iv.next17 = add nsw i64 %indvars.iv20, 1, !dbg !255
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !220, metadata !34), !dbg !222
  %cmp3 = icmp slt i64 %indvars.iv.next17, %8, !dbg !225
  br i1 %cmp3, label %for.body4, label %for.cond1.for.end31_crit_edge, !dbg !226

for.cond1.for.end31_crit_edge:                    ; preds = %for.inc29
  br label %for.end31, !dbg !226

for.end31:                                        ; preds = %for.cond1.for.end31_crit_edge, %for.body
  %indvars.iv24 = phi i64 [ %indvars.iv23, %for.cond1.for.end31_crit_edge ], [ %indvars.iv23, %for.body ]
  br label %for.inc32, !dbg !256

for.inc32:                                        ; preds = %for.end31
  %indvars.iv.next21 = add nsw i64 %indvars.iv24, 1, !dbg !257
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !212, metadata !34), !dbg !214
  %cmp = icmp slt i64 %indvars.iv.next21, %7, !dbg !218
  br i1 %cmp, label %for.body, label %for.cond.for.end34_crit_edge, !dbg !219

for.cond.for.end34_crit_edge:                     ; preds = %for.inc32
  br label %for.end34, !dbg !219

for.end34:                                        ; preds = %for.cond.for.end34_crit_edge, %entry
  ret void, !dbg !258
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
!65 = !{!"0x100\00i\0030\000", !66, !9, !19}      ; [ DW_TAG_auto_variable ] [i] [line 30]
!66 = !{!"0xb\0030\009\002", !1, !63}             ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!67 = !MDLocation(line: 30, column: 18, scope: !66)
!68 = !MDLocation(line: 30, column: 30, scope: !69)
!69 = !{!"0xb\0030\009\003", !1, !66}             ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!70 = !MDLocation(line: 30, column: 9, scope: !66)
!71 = !MDLocation(line: 31, column: 26, scope: !69)
!72 = !MDLocation(line: 31, column: 25, scope: !69)
!73 = !MDLocation(line: 31, column: 22, scope: !69)
!74 = !MDLocation(line: 31, column: 62, scope: !69)
!75 = !MDLocation(line: 31, column: 60, scope: !69)
!76 = !MDLocation(line: 31, column: 53, scope: !69)
!77 = !MDLocation(line: 31, column: 13, scope: !69)
!78 = !MDLocation(line: 30, column: 9, scope: !69)
!79 = !MDLocation(line: 31, column: 75, scope: !66)
!80 = !MDLocation(line: 29, column: 5, scope: !63)
!81 = !MDLocation(line: 33, column: 27, scope: !8)
!82 = !MDLocation(line: 33, column: 9, scope: !8)
!83 = !MDLocation(line: 33, column: 5, scope: !8)
!84 = !MDLocation(line: 35, column: 1, scope: !8)
!85 = !{!"0x101\00in\0016777253\000", !20, !9, !23} ; [ DW_TAG_arg_variable ] [in] [line 37]
!86 = !MDLocation(line: 37, column: 40, scope: !20)
!87 = !{!"0x101\00out\0033554470\000", !20, !9, !24} ; [ DW_TAG_arg_variable ] [out] [line 38]
!88 = !MDLocation(line: 38, column: 20, scope: !20)
!89 = !{!"0x101\00kernel\0050331687\000", !20, !9, !15} ; [ DW_TAG_arg_variable ] [kernel] [line 39]
!90 = !MDLocation(line: 39, column: 22, scope: !20)
!91 = !{!"0x101\00kn\0067108904\000", !20, !9, !18} ; [ DW_TAG_arg_variable ] [kn] [line 40]
!92 = !MDLocation(line: 40, column: 13, scope: !20)
!93 = !{!"0x101\00x\0083886121\000", !20, !9, !18} ; [ DW_TAG_arg_variable ] [x] [line 41]
!94 = !MDLocation(line: 41, column: 19, scope: !20)
!95 = !{!"0x101\00y\00100663338\000", !20, !9, !18} ; [ DW_TAG_arg_variable ] [y] [line 42]
!96 = !MDLocation(line: 42, column: 19, scope: !20)
!97 = !MDLocation(line: 44, column: 23, scope: !20)
!98 = !{!"0x100\00khalf\0044\000", !20, !9, !18}  ; [ DW_TAG_auto_variable ] [khalf] [line 44]
!99 = !MDLocation(line: 44, column: 15, scope: !20)
!100 = !{!"0x100\00pixel\0046\000", !20, !9, !17} ; [ DW_TAG_auto_variable ] [pixel] [line 46]
!101 = !MDLocation(line: 46, column: 11, scope: !20)
!102 = !{!"0x100\00c\0047\000", !20, !9, !19}     ; [ DW_TAG_auto_variable ] [c] [line 47]
!103 = !MDLocation(line: 47, column: 9, scope: !20)
!104 = !MDLocation(line: 50, column: 18, scope: !105)
!105 = !{!"0xb\0050\005\004", !1, !20}            ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!106 = !{!"0x100\00j\0050\000", !105, !9, !19}    ; [ DW_TAG_auto_variable ] [j] [line 50]
!107 = !MDLocation(line: 50, column: 14, scope: !105)
!108 = !MDLocation(line: 50, column: 10, scope: !105)
!109 = !MDLocation(line: 50, column: 26, scope: !110)
!110 = !{!"0xb\0050\005\005", !1, !105}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!111 = !MDLocation(line: 50, column: 5, scope: !105)
!112 = !{!"0x100\00i\0051\000", !113, !9, !19}    ; [ DW_TAG_auto_variable ] [i] [line 51]
!113 = !{!"0xb\0051\009\006", !1, !110}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!114 = !MDLocation(line: 51, column: 18, scope: !113)
!115 = !MDLocation(line: 51, column: 30, scope: !116)
!116 = !{!"0xb\0051\009\007", !1, !113}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!117 = !MDLocation(line: 51, column: 9, scope: !113)
!118 = !MDLocation(line: 52, column: 30, scope: !116)
!119 = !MDLocation(line: 52, column: 25, scope: !116)
!120 = !MDLocation(line: 52, column: 22, scope: !116)
!121 = !MDLocation(line: 51, column: 9, scope: !116)
!122 = !MDLocation(line: 52, column: 37, scope: !116)
!123 = !MDLocation(line: 52, column: 13, scope: !116)
!124 = !MDLocation(line: 52, column: 47, scope: !113)
!125 = !MDLocation(line: 50, column: 5, scope: !110)
!126 = !MDLocation(line: 54, column: 17, scope: !20)
!127 = !MDLocation(line: 54, column: 5, scope: !20)
!128 = !MDLocation(line: 56, column: 1, scope: !20)
!129 = !{!"0x101\00in\0016777300\000", !25, !9, !12} ; [ DW_TAG_arg_variable ] [in] [line 84]
!130 = !MDLocation(line: 84, column: 25, scope: !25)
!131 = !{!"0x101\00out\0033554517\000", !25, !9, !14} ; [ DW_TAG_arg_variable ] [out] [line 85]
!132 = !MDLocation(line: 85, column: 19, scope: !25)
!133 = !{!"0x101\00kernel\0050331734\000", !25, !9, !15} ; [ DW_TAG_arg_variable ] [kernel] [line 86]
!134 = !MDLocation(line: 86, column: 22, scope: !25)
!135 = !{!"0x101\00kn\0067108951\000", !25, !9, !18} ; [ DW_TAG_arg_variable ] [kn] [line 87]
!136 = !MDLocation(line: 87, column: 19, scope: !25)
!137 = !{!"0x101\00dim_x\0083886168\000", !25, !9, !18} ; [ DW_TAG_arg_variable ] [dim_x] [line 88]
!138 = !MDLocation(line: 88, column: 19, scope: !25)
!139 = !{!"0x101\00dim_y\00100663385\000", !25, !9, !18} ; [ DW_TAG_arg_variable ] [dim_y] [line 89]
!140 = !MDLocation(line: 89, column: 19, scope: !25)
!141 = !MDLocation(line: 92, column: 23, scope: !25)
!142 = !{!"0x100\00khalf\0092\000", !25, !9, !18} ; [ DW_TAG_auto_variable ] [khalf] [line 92]
!143 = !MDLocation(line: 92, column: 15, scope: !25)
!144 = !{!"0x100\00m\0094\000", !145, !9, !19}    ; [ DW_TAG_auto_variable ] [m] [line 94]
!145 = !{!"0xb\0094\005\008", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!146 = !MDLocation(line: 94, column: 14, scope: !145)
!147 = !MDLocation(line: 94, column: 29, scope: !148)
!148 = !{!"0xb\0094\005\009", !1, !145}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!149 = !MDLocation(line: 94, column: 25, scope: !148)
!150 = !MDLocation(line: 94, column: 5, scope: !145)
!151 = !{!"0x100\00n\0095\000", !152, !9, !19}    ; [ DW_TAG_auto_variable ] [n] [line 95]
!152 = !{!"0xb\0095\009\0010", !1, !148}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!153 = !MDLocation(line: 95, column: 18, scope: !152)
!154 = !MDLocation(line: 95, column: 33, scope: !155)
!155 = !{!"0xb\0095\009\0011", !1, !152}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!156 = !MDLocation(line: 95, column: 29, scope: !155)
!157 = !MDLocation(line: 95, column: 9, scope: !152)
!158 = !MDLocation(line: 96, column: 13, scope: !155)
!159 = !MDLocation(line: 95, column: 48, scope: !155)
!160 = !MDLocation(line: 96, column: 66, scope: !152)
!161 = !MDLocation(line: 94, column: 44, scope: !148)
!162 = !MDLocation(line: 97, column: 1, scope: !25)
!163 = !{!"0x101\00in\0016777316\000", !28, !9, !23} ; [ DW_TAG_arg_variable ] [in] [line 100]
!164 = !MDLocation(line: 100, column: 26, scope: !28)
!165 = !{!"0x101\00out\0033554533\000", !28, !9, !24} ; [ DW_TAG_arg_variable ] [out] [line 101]
!166 = !MDLocation(line: 101, column: 20, scope: !28)
!167 = !{!"0x101\00kernel\0050331750\000", !28, !9, !15} ; [ DW_TAG_arg_variable ] [kernel] [line 102]
!168 = !MDLocation(line: 102, column: 22, scope: !28)
!169 = !{!"0x101\00kn\0067108967\000", !28, !9, !18} ; [ DW_TAG_arg_variable ] [kn] [line 103]
!170 = !MDLocation(line: 103, column: 19, scope: !28)
!171 = !{!"0x101\00dim_x\0083886184\000", !28, !9, !18} ; [ DW_TAG_arg_variable ] [dim_x] [line 104]
!172 = !MDLocation(line: 104, column: 19, scope: !28)
!173 = !{!"0x101\00dim_y\00100663401\000", !28, !9, !18} ; [ DW_TAG_arg_variable ] [dim_y] [line 105]
!174 = !MDLocation(line: 105, column: 19, scope: !28)
!175 = !MDLocation(line: 107, column: 23, scope: !28)
!176 = !{!"0x100\00khalf\00107\000", !28, !9, !18} ; [ DW_TAG_auto_variable ] [khalf] [line 107]
!177 = !MDLocation(line: 107, column: 15, scope: !28)
!178 = !{!"0x100\00m\00109\000", !179, !9, !19}   ; [ DW_TAG_auto_variable ] [m] [line 109]
!179 = !{!"0xb\00109\005\0012", !1, !28}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!180 = !MDLocation(line: 109, column: 14, scope: !179)
!181 = !MDLocation(line: 109, column: 29, scope: !182)
!182 = !{!"0xb\00109\005\0013", !1, !179}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!183 = !MDLocation(line: 109, column: 25, scope: !182)
!184 = !MDLocation(line: 109, column: 5, scope: !179)
!185 = !{!"0x100\00n\00110\000", !186, !9, !19}   ; [ DW_TAG_auto_variable ] [n] [line 110]
!186 = !{!"0xb\00110\009\0014", !1, !182}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!187 = !MDLocation(line: 110, column: 18, scope: !186)
!188 = !MDLocation(line: 110, column: 33, scope: !189)
!189 = !{!"0xb\00110\009\0015", !1, !186}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!190 = !MDLocation(line: 110, column: 29, scope: !189)
!191 = !MDLocation(line: 110, column: 9, scope: !186)
!192 = !MDLocation(line: 111, column: 10, scope: !189)
!193 = !MDLocation(line: 110, column: 48, scope: !189)
!194 = !MDLocation(line: 111, column: 52, scope: !186)
!195 = !MDLocation(line: 109, column: 44, scope: !182)
!196 = !MDLocation(line: 112, column: 1, scope: !28)
!197 = !{!"0x101\00in\0016777331\000", !29, !9, !23} ; [ DW_TAG_arg_variable ] [in] [line 115]
!198 = !MDLocation(line: 115, column: 26, scope: !29)
!199 = !{!"0x101\00out\0033554548\000", !29, !9, !24} ; [ DW_TAG_arg_variable ] [out] [line 116]
!200 = !MDLocation(line: 116, column: 20, scope: !29)
!201 = !{!"0x101\00kernel\0050331765\000", !29, !9, !15} ; [ DW_TAG_arg_variable ] [kernel] [line 117]
!202 = !MDLocation(line: 117, column: 22, scope: !29)
!203 = !{!"0x101\00kn\0067108982\000", !29, !9, !18} ; [ DW_TAG_arg_variable ] [kn] [line 118]
!204 = !MDLocation(line: 118, column: 19, scope: !29)
!205 = !{!"0x101\00dim_x\0083886199\000", !29, !9, !18} ; [ DW_TAG_arg_variable ] [dim_x] [line 119]
!206 = !MDLocation(line: 119, column: 19, scope: !29)
!207 = !{!"0x101\00dim_y\00100663416\000", !29, !9, !18} ; [ DW_TAG_arg_variable ] [dim_y] [line 120]
!208 = !MDLocation(line: 120, column: 19, scope: !29)
!209 = !MDLocation(line: 122, column: 23, scope: !29)
!210 = !{!"0x100\00khalf\00122\000", !29, !9, !18} ; [ DW_TAG_auto_variable ] [khalf] [line 122]
!211 = !MDLocation(line: 122, column: 15, scope: !29)
!212 = !{!"0x100\00y\00124\000", !213, !9, !19}   ; [ DW_TAG_auto_variable ] [y] [line 124]
!213 = !{!"0xb\00124\005\0016", !1, !29}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!214 = !MDLocation(line: 124, column: 14, scope: !213)
!215 = !MDLocation(line: 124, column: 10, scope: !213)
!216 = !MDLocation(line: 124, column: 29, scope: !217)
!217 = !{!"0xb\00124\005\0017", !1, !213}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!218 = !MDLocation(line: 124, column: 25, scope: !217)
!219 = !MDLocation(line: 124, column: 5, scope: !213)
!220 = !{!"0x100\00x\00125\000", !221, !9, !19}   ; [ DW_TAG_auto_variable ] [x] [line 125]
!221 = !{!"0xb\00125\007\0018", !1, !217}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!222 = !MDLocation(line: 125, column: 16, scope: !221)
!223 = !MDLocation(line: 125, column: 31, scope: !224)
!224 = !{!"0xb\00125\007\0019", !1, !221}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!225 = !MDLocation(line: 125, column: 27, scope: !224)
!226 = !MDLocation(line: 125, column: 7, scope: !221)
!227 = !{!"0x100\00pixel\00126\000", !228, !9, !17} ; [ DW_TAG_auto_variable ] [pixel] [line 126]
!228 = !{!"0xb\00125\0051\0020", !1, !224}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!229 = !MDLocation(line: 126, column: 15, scope: !228)
!230 = !{!"0x100\00c\00127\000", !228, !9, !19}   ; [ DW_TAG_auto_variable ] [c] [line 127]
!231 = !MDLocation(line: 127, column: 13, scope: !228)
!232 = !{!"0x100\00j\00130\000", !233, !9, !19}   ; [ DW_TAG_auto_variable ] [j] [line 130]
!233 = !{!"0xb\00130\009\0021", !1, !228}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!234 = !MDLocation(line: 130, column: 18, scope: !233)
!235 = !MDLocation(line: 130, column: 30, scope: !236)
!236 = !{!"0xb\00130\009\0022", !1, !233}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!237 = !MDLocation(line: 130, column: 9, scope: !233)
!238 = !{!"0x100\00i\00131\000", !239, !9, !19}   ; [ DW_TAG_auto_variable ] [i] [line 131]
!239 = !{!"0xb\00131\0011\0023", !1, !236}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!240 = !MDLocation(line: 131, column: 20, scope: !239)
!241 = !MDLocation(line: 131, column: 32, scope: !242)
!242 = !{!"0xb\00131\0011\0024", !1, !239}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!243 = !MDLocation(line: 131, column: 11, scope: !239)
!244 = !MDLocation(line: 132, column: 32, scope: !242)
!245 = !MDLocation(line: 132, column: 25, scope: !242)
!246 = !MDLocation(line: 132, column: 22, scope: !242)
!247 = !MDLocation(line: 131, column: 11, scope: !242)
!248 = !MDLocation(line: 132, column: 41, scope: !242)
!249 = !MDLocation(line: 132, column: 13, scope: !242)
!250 = !MDLocation(line: 132, column: 51, scope: !239)
!251 = !MDLocation(line: 130, column: 9, scope: !236)
!252 = !MDLocation(line: 134, column: 21, scope: !228)
!253 = !MDLocation(line: 134, column: 9, scope: !228)
!254 = !MDLocation(line: 135, column: 7, scope: !228)
!255 = !MDLocation(line: 125, column: 7, scope: !224)
!256 = !MDLocation(line: 135, column: 7, scope: !221)
!257 = !MDLocation(line: 124, column: 5, scope: !217)
!258 = !MDLocation(line: 136, column: 1, scope: !29)
