; ModuleID = 'convolve.opt0.ll'
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
  %cmp4 = icmp sle i32 %sub, %div, !dbg !61
  br i1 %cmp4, label %for.body.lr.ph, label %for.end18, !dbg !63

for.body.lr.ph:                                   ; preds = %entry
  br label %for.body, !dbg !63

for.body:                                         ; preds = %for.inc16, %for.body.lr.ph
  %j.06 = phi i32 [ %sub, %for.body.lr.ph ], [ %inc17, %for.inc16 ]
  %pixel.05 = phi float [ 0.000000e+00, %for.body.lr.ph ], [ %pixel.1.lcssa, %for.inc16 ]
  %sub1 = sub nsw i32 0, %div, !dbg !64
  call void @llvm.dbg.value(metadata i32 %sub1, i64 0, metadata !66, metadata !34), !dbg !67
  %cmp31 = icmp sle i32 %sub1, %div, !dbg !68
  br i1 %cmp31, label %for.body4.lr.ph, label %for.end, !dbg !70

for.body4.lr.ph:                                  ; preds = %for.body
  br label %for.body4, !dbg !70

for.body4:                                        ; preds = %for.inc, %for.body4.lr.ph
  %i.03 = phi i32 [ %sub1, %for.body4.lr.ph ], [ %inc, %for.inc ]
  %pixel.12 = phi float [ %pixel.05, %for.body4.lr.ph ], [ %add15, %for.inc ]
  %sub5 = sub nsw i32 %n, %j.06, !dbg !71
  %mul = mul nsw i32 %sub5, %size_x, !dbg !72
  %add = add nsw i32 %mul, %m, !dbg !72
  %sub6 = sub nsw i32 %add, %i.03, !dbg !72
  %idxprom = sext i32 %sub6 to i64, !dbg !73
  %arrayidx = getelementptr inbounds i8* %in, i64 %idxprom, !dbg !73
  %0 = load i8* %arrayidx, align 1, !dbg !73
  %conv = zext i8 %0 to i32, !dbg !73
  %conv7 = sitofp i32 %conv to float, !dbg !73
  %mul8 = mul nsw i32 %j.06, %kn, !dbg !74
  %sub9 = sub nsw i32 1, %mul8, !dbg !75
  %add10 = add nsw i32 %sub9, 1, !dbg !75
  %sub11 = sub nsw i32 %add10, %i.03, !dbg !75
  %idxprom12 = sext i32 %sub11 to i64, !dbg !76
  %arrayidx13 = getelementptr inbounds float* %kernel, i64 %idxprom12, !dbg !76
  %1 = load float* %arrayidx13, align 4, !dbg !76
  %mul14 = fmul float %conv7, %1, !dbg !73
  %add15 = fadd float %pixel.12, %mul14, !dbg !77
  call void @llvm.dbg.value(metadata float %add15, i64 0, metadata !53, metadata !34), !dbg !54
  br label %for.inc, !dbg !77

for.inc:                                          ; preds = %for.body4
  %inc = add nsw i32 %i.03, 1, !dbg !78
  call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !66, metadata !34), !dbg !67
  %cmp3 = icmp sle i32 %inc, %div, !dbg !68
  br i1 %cmp3, label %for.body4, label %for.cond2.for.end_crit_edge, !dbg !70

for.cond2.for.end_crit_edge:                      ; preds = %for.inc
  %split = phi float [ %add15, %for.inc ]
  br label %for.end, !dbg !70

for.end:                                          ; preds = %for.cond2.for.end_crit_edge, %for.body
  %pixel.1.lcssa = phi float [ %split, %for.cond2.for.end_crit_edge ], [ %pixel.05, %for.body ]
  br label %for.inc16, !dbg !79

for.inc16:                                        ; preds = %for.end
  %inc17 = add nsw i32 %j.06, 1, !dbg !80
  call void @llvm.dbg.value(metadata i32 %inc17, i64 0, metadata !59, metadata !34), !dbg !60
  %cmp = icmp sle i32 %inc17, %div, !dbg !61
  br i1 %cmp, label %for.body, label %for.cond.for.end18_crit_edge, !dbg !63

for.cond.for.end18_crit_edge:                     ; preds = %for.inc16
  %split7 = phi float [ %pixel.1.lcssa, %for.inc16 ]
  br label %for.end18, !dbg !63

for.end18:                                        ; preds = %for.cond.for.end18_crit_edge, %entry
  %pixel.0.lcssa = phi float [ %split7, %for.cond.for.end18_crit_edge ], [ 0.000000e+00, %entry ]
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
  %cmp6 = icmp sle i32 %sub, %div, !dbg !108
  br i1 %cmp6, label %for.body.lr.ph, label %for.end15, !dbg !110

for.body.lr.ph:                                   ; preds = %entry
  br label %for.body, !dbg !110

for.body:                                         ; preds = %for.inc13, %for.body.lr.ph
  %j.09 = phi i32 [ %sub, %for.body.lr.ph ], [ %inc14, %for.inc13 ]
  %c.08 = phi i32 [ 0, %for.body.lr.ph ], [ %c.1.lcssa, %for.inc13 ]
  %pixel.07 = phi float [ 0.000000e+00, %for.body.lr.ph ], [ %pixel.1.lcssa, %for.inc13 ]
  %sub1 = sub nsw i32 0, %div, !dbg !111
  call void @llvm.dbg.value(metadata i32 %sub1, i64 0, metadata !113, metadata !34), !dbg !114
  %cmp31 = icmp sle i32 %sub1, %div, !dbg !115
  br i1 %cmp31, label %for.body4.lr.ph, label %for.end, !dbg !117

for.body4.lr.ph:                                  ; preds = %for.body
  br label %for.body4, !dbg !117

for.body4:                                        ; preds = %for.inc, %for.body4.lr.ph
  %i.04 = phi i32 [ %sub1, %for.body4.lr.ph ], [ %inc12, %for.inc ]
  %c.13 = phi i32 [ %c.08, %for.body4.lr.ph ], [ %inc, %for.inc ]
  %pixel.12 = phi float [ %pixel.07, %for.body4.lr.ph ], [ %add11, %for.inc ]
  %add = add nsw i32 %x, %i.04, !dbg !118
  %idxprom = sext i32 %add to i64, !dbg !119
  %add5 = add nsw i32 %y, %j.09, !dbg !120
  %idxprom6 = sext i32 %add5 to i64, !dbg !119
  %arrayidx = getelementptr inbounds i8** %in, i64 %idxprom6, !dbg !119
  %0 = load i8** %arrayidx, align 8, !dbg !119
  %arrayidx7 = getelementptr inbounds i8* %0, i64 %idxprom, !dbg !119
  %1 = load i8* %arrayidx7, align 1, !dbg !119
  %conv = zext i8 %1 to i32, !dbg !119
  %conv8 = sitofp i32 %conv to float, !dbg !119
  %inc = add nsw i32 %c.13, 1, !dbg !121
  call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !102, metadata !34), !dbg !103
  %idxprom9 = sext i32 %c.13 to i64, !dbg !122
  %arrayidx10 = getelementptr inbounds float* %kernel, i64 %idxprom9, !dbg !122
  %2 = load float* %arrayidx10, align 4, !dbg !122
  %mul = fmul float %conv8, %2, !dbg !119
  %add11 = fadd float %pixel.12, %mul, !dbg !123
  call void @llvm.dbg.value(metadata float %add11, i64 0, metadata !100, metadata !34), !dbg !101
  br label %for.inc, !dbg !123

for.inc:                                          ; preds = %for.body4
  %inc12 = add nsw i32 %i.04, 1, !dbg !124
  call void @llvm.dbg.value(metadata i32 %inc12, i64 0, metadata !113, metadata !34), !dbg !114
  %cmp3 = icmp sle i32 %inc12, %div, !dbg !115
  br i1 %cmp3, label %for.body4, label %for.cond2.for.end_crit_edge, !dbg !117

for.cond2.for.end_crit_edge:                      ; preds = %for.inc
  %split = phi i32 [ %inc, %for.inc ]
  %split5 = phi float [ %add11, %for.inc ]
  br label %for.end, !dbg !117

for.end:                                          ; preds = %for.cond2.for.end_crit_edge, %for.body
  %c.1.lcssa = phi i32 [ %split, %for.cond2.for.end_crit_edge ], [ %c.08, %for.body ]
  %pixel.1.lcssa = phi float [ %split5, %for.cond2.for.end_crit_edge ], [ %pixel.07, %for.body ]
  br label %for.inc13, !dbg !125

for.inc13:                                        ; preds = %for.end
  %inc14 = add nsw i32 %j.09, 1, !dbg !126
  call void @llvm.dbg.value(metadata i32 %inc14, i64 0, metadata !106, metadata !34), !dbg !107
  %cmp = icmp sle i32 %inc14, %div, !dbg !108
  br i1 %cmp, label %for.body, label %for.cond.for.end15_crit_edge, !dbg !110

for.cond.for.end15_crit_edge:                     ; preds = %for.inc13
  %split10 = phi float [ %pixel.1.lcssa, %for.inc13 ]
  br label %for.end15, !dbg !110

for.end15:                                        ; preds = %for.cond.for.end15_crit_edge, %entry
  %pixel.0.lcssa = phi float [ %split10, %for.cond.for.end15_crit_edge ], [ 0.000000e+00, %entry ]
  %conv16 = fptoui float %pixel.0.lcssa to i8, !dbg !127
  %idxprom17 = sext i32 %x to i64, !dbg !128
  %idxprom18 = sext i32 %y to i64, !dbg !128
  %arrayidx19 = getelementptr inbounds i8** %out, i64 %idxprom18, !dbg !128
  %3 = load i8** %arrayidx19, align 8, !dbg !128
  %arrayidx20 = getelementptr inbounds i8* %3, i64 %idxprom17, !dbg !128
  store i8 %conv16, i8* %arrayidx20, align 1, !dbg !128
  ret void, !dbg !129
}

; Function Attrs: nounwind uwtable
define void @convolve_arr_linear(i8* %in, i8* %out, float* %kernel, i32 %kn, i32 %dim_x, i32 %dim_y) #0 {
entry:
  call void @llvm.dbg.value(metadata i8* %in, i64 0, metadata !130, metadata !34), !dbg !131
  call void @llvm.dbg.value(metadata i8* %out, i64 0, metadata !132, metadata !34), !dbg !133
  call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !134, metadata !34), !dbg !135
  call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !136, metadata !34), !dbg !137
  call void @llvm.dbg.value(metadata i32 %dim_x, i64 0, metadata !138, metadata !34), !dbg !139
  call void @llvm.dbg.value(metadata i32 %dim_y, i64 0, metadata !140, metadata !34), !dbg !141
  %div = sdiv i32 %kn, 2, !dbg !142
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !143, metadata !34), !dbg !144
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !145, metadata !34), !dbg !147
  %sub = sub nsw i32 %dim_x, %div, !dbg !148
  %cmp4 = icmp slt i32 %div, %sub, !dbg !150
  br i1 %cmp4, label %for.body.lr.ph, label %for.end7, !dbg !151

for.body.lr.ph:                                   ; preds = %entry
  br label %for.body, !dbg !151

for.body:                                         ; preds = %for.inc5, %for.body.lr.ph
  %m.05 = phi i32 [ %div, %for.body.lr.ph ], [ %inc6, %for.inc5 ]
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !152, metadata !34), !dbg !154
  %sub2 = sub nsw i32 %dim_y, %div, !dbg !155
  %cmp31 = icmp slt i32 %div, %sub2, !dbg !157
  br i1 %cmp31, label %for.body4.lr.ph, label %for.end, !dbg !158

for.body4.lr.ph:                                  ; preds = %for.body
  br label %for.body4, !dbg !158

for.body4:                                        ; preds = %for.inc, %for.body4.lr.ph
  %n.02 = phi i32 [ %div, %for.body4.lr.ph ], [ %inc, %for.inc ]
  call void @filter_kernel(i8* %in, i8* %out, float* %kernel, i32 %kn, i32 %m.05, i32 %n.02, i32 %dim_x, i32 %dim_y), !dbg !159
  br label %for.inc, !dbg !159

for.inc:                                          ; preds = %for.body4
  %inc = add nsw i32 %n.02, 1, !dbg !160
  call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !152, metadata !34), !dbg !154
  %cmp3 = icmp slt i32 %inc, %sub2, !dbg !157
  br i1 %cmp3, label %for.body4, label %for.cond1.for.end_crit_edge, !dbg !158

for.cond1.for.end_crit_edge:                      ; preds = %for.inc
  br label %for.end, !dbg !158

for.end:                                          ; preds = %for.cond1.for.end_crit_edge, %for.body
  br label %for.inc5, !dbg !161

for.inc5:                                         ; preds = %for.end
  %inc6 = add nsw i32 %m.05, 1, !dbg !162
  call void @llvm.dbg.value(metadata i32 %inc6, i64 0, metadata !145, metadata !34), !dbg !147
  %cmp = icmp slt i32 %inc6, %sub, !dbg !150
  br i1 %cmp, label %for.body, label %for.cond.for.end7_crit_edge, !dbg !151

for.cond.for.end7_crit_edge:                      ; preds = %for.inc5
  br label %for.end7, !dbg !151

for.end7:                                         ; preds = %for.cond.for.end7_crit_edge, %entry
  ret void, !dbg !163
}

; Function Attrs: nounwind uwtable
define void @convolve_arr_indirection(i8** %in, i8** %out, float* %kernel, i32 %kn, i32 %dim_x, i32 %dim_y) #0 {
entry:
  call void @llvm.dbg.value(metadata i8** %in, i64 0, metadata !164, metadata !34), !dbg !165
  call void @llvm.dbg.value(metadata i8** %out, i64 0, metadata !166, metadata !34), !dbg !167
  call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !168, metadata !34), !dbg !169
  call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !170, metadata !34), !dbg !171
  call void @llvm.dbg.value(metadata i32 %dim_x, i64 0, metadata !172, metadata !34), !dbg !173
  call void @llvm.dbg.value(metadata i32 %dim_y, i64 0, metadata !174, metadata !34), !dbg !175
  %div = sdiv i32 %kn, 2, !dbg !176
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !177, metadata !34), !dbg !178
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !179, metadata !34), !dbg !181
  %sub = sub nsw i32 %dim_x, %div, !dbg !182
  %cmp4 = icmp slt i32 %div, %sub, !dbg !184
  br i1 %cmp4, label %for.body.lr.ph, label %for.end7, !dbg !185

for.body.lr.ph:                                   ; preds = %entry
  br label %for.body, !dbg !185

for.body:                                         ; preds = %for.inc5, %for.body.lr.ph
  %m.05 = phi i32 [ %div, %for.body.lr.ph ], [ %inc6, %for.inc5 ]
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !186, metadata !34), !dbg !188
  %sub2 = sub nsw i32 %dim_y, %div, !dbg !189
  %cmp31 = icmp slt i32 %div, %sub2, !dbg !191
  br i1 %cmp31, label %for.body4.lr.ph, label %for.end, !dbg !192

for.body4.lr.ph:                                  ; preds = %for.body
  br label %for.body4, !dbg !192

for.body4:                                        ; preds = %for.inc, %for.body4.lr.ph
  %n.02 = phi i32 [ %div, %for.body4.lr.ph ], [ %inc, %for.inc ]
  call void @filter_kernel_2d(i8** %in, i8** %out, float* %kernel, i32 %kn, i32 %n.02, i32 %m.05), !dbg !193
  br label %for.inc, !dbg !193

for.inc:                                          ; preds = %for.body4
  %inc = add nsw i32 %n.02, 1, !dbg !194
  call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !186, metadata !34), !dbg !188
  %cmp3 = icmp slt i32 %inc, %sub2, !dbg !191
  br i1 %cmp3, label %for.body4, label %for.cond1.for.end_crit_edge, !dbg !192

for.cond1.for.end_crit_edge:                      ; preds = %for.inc
  br label %for.end, !dbg !192

for.end:                                          ; preds = %for.cond1.for.end_crit_edge, %for.body
  br label %for.inc5, !dbg !195

for.inc5:                                         ; preds = %for.end
  %inc6 = add nsw i32 %m.05, 1, !dbg !196
  call void @llvm.dbg.value(metadata i32 %inc6, i64 0, metadata !179, metadata !34), !dbg !181
  %cmp = icmp slt i32 %inc6, %sub, !dbg !184
  br i1 %cmp, label %for.body, label %for.cond.for.end7_crit_edge, !dbg !185

for.cond.for.end7_crit_edge:                      ; preds = %for.inc5
  br label %for.end7, !dbg !185

for.end7:                                         ; preds = %for.cond.for.end7_crit_edge, %entry
  ret void, !dbg !197
}

; Function Attrs: nounwind uwtable
define void @convolve_loop_nest(i8** %in, i8** %out, float* %kernel, i32 %kn, i32 %dim_x, i32 %dim_y) #0 {
entry:
  call void @llvm.dbg.value(metadata i8** %in, i64 0, metadata !198, metadata !34), !dbg !199
  call void @llvm.dbg.value(metadata i8** %out, i64 0, metadata !200, metadata !34), !dbg !201
  call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !202, metadata !34), !dbg !203
  call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !204, metadata !34), !dbg !205
  call void @llvm.dbg.value(metadata i32 %dim_x, i64 0, metadata !206, metadata !34), !dbg !207
  call void @llvm.dbg.value(metadata i32 %dim_y, i64 0, metadata !208, metadata !34), !dbg !209
  %div = sdiv i32 %kn, 2, !dbg !210
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !211, metadata !34), !dbg !212
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !213, metadata !34), !dbg !215
  %sub = sub nsw i32 %dim_x, %div, !dbg !216
  %cmp13 = icmp slt i32 %div, %sub, !dbg !218
  br i1 %cmp13, label %for.body.lr.ph, label %for.end34, !dbg !219

for.body.lr.ph:                                   ; preds = %entry
  br label %for.body, !dbg !219

for.body:                                         ; preds = %for.inc32, %for.body.lr.ph
  %y.014 = phi i32 [ %div, %for.body.lr.ph ], [ %inc33, %for.inc32 ]
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !220, metadata !34), !dbg !222
  %sub2 = sub nsw i32 %dim_y, %div, !dbg !223
  %cmp311 = icmp slt i32 %div, %sub2, !dbg !225
  br i1 %cmp311, label %for.body4.lr.ph, label %for.end31, !dbg !226

for.body4.lr.ph:                                  ; preds = %for.body
  br label %for.body4, !dbg !226

for.body4:                                        ; preds = %for.inc29, %for.body4.lr.ph
  %x.012 = phi i32 [ %div, %for.body4.lr.ph ], [ %inc30, %for.inc29 ]
  call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !227, metadata !34), !dbg !229
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !230, metadata !34), !dbg !231
  %sub5 = sub nsw i32 0, %div, !dbg !232
  call void @llvm.dbg.value(metadata i32 %sub5, i64 0, metadata !234, metadata !34), !dbg !235
  %cmp76 = icmp sle i32 %sub5, %div, !dbg !236
  br i1 %cmp76, label %for.body8.lr.ph, label %for.end23, !dbg !238

for.body8.lr.ph:                                  ; preds = %for.body4
  br label %for.body8, !dbg !238

for.body8:                                        ; preds = %for.inc21, %for.body8.lr.ph
  %j.09 = phi i32 [ %sub5, %for.body8.lr.ph ], [ %inc22, %for.inc21 ]
  %c.08 = phi i32 [ 0, %for.body8.lr.ph ], [ %c.1.lcssa, %for.inc21 ]
  %pixel.07 = phi float [ 0.000000e+00, %for.body8.lr.ph ], [ %pixel.1.lcssa, %for.inc21 ]
  %sub9 = sub nsw i32 0, %div, !dbg !239
  call void @llvm.dbg.value(metadata i32 %sub9, i64 0, metadata !241, metadata !34), !dbg !242
  %cmp111 = icmp sle i32 %sub9, %div, !dbg !243
  br i1 %cmp111, label %for.body12.lr.ph, label %for.end, !dbg !245

for.body12.lr.ph:                                 ; preds = %for.body8
  br label %for.body12, !dbg !245

for.body12:                                       ; preds = %for.inc, %for.body12.lr.ph
  %i.04 = phi i32 [ %sub9, %for.body12.lr.ph ], [ %inc20, %for.inc ]
  %c.13 = phi i32 [ %c.08, %for.body12.lr.ph ], [ %inc, %for.inc ]
  %pixel.12 = phi float [ %pixel.07, %for.body12.lr.ph ], [ %add19, %for.inc ]
  %add = add nsw i32 %y.014, %i.04, !dbg !246
  %idxprom = sext i32 %add to i64, !dbg !247
  %add13 = add nsw i32 %x.012, %j.09, !dbg !248
  %idxprom14 = sext i32 %add13 to i64, !dbg !247
  %arrayidx = getelementptr inbounds i8** %in, i64 %idxprom14, !dbg !247
  %0 = load i8** %arrayidx, align 8, !dbg !247
  %arrayidx15 = getelementptr inbounds i8* %0, i64 %idxprom, !dbg !247
  %1 = load i8* %arrayidx15, align 1, !dbg !247
  %conv = zext i8 %1 to i32, !dbg !247
  %conv16 = sitofp i32 %conv to float, !dbg !247
  %inc = add nsw i32 %c.13, 1, !dbg !249
  call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !230, metadata !34), !dbg !231
  %idxprom17 = sext i32 %c.13 to i64, !dbg !250
  %arrayidx18 = getelementptr inbounds float* %kernel, i64 %idxprom17, !dbg !250
  %2 = load float* %arrayidx18, align 4, !dbg !250
  %mul = fmul float %conv16, %2, !dbg !247
  %add19 = fadd float %pixel.12, %mul, !dbg !251
  call void @llvm.dbg.value(metadata float %add19, i64 0, metadata !227, metadata !34), !dbg !229
  br label %for.inc, !dbg !251

for.inc:                                          ; preds = %for.body12
  %inc20 = add nsw i32 %i.04, 1, !dbg !252
  call void @llvm.dbg.value(metadata i32 %inc20, i64 0, metadata !241, metadata !34), !dbg !242
  %cmp11 = icmp sle i32 %inc20, %div, !dbg !243
  br i1 %cmp11, label %for.body12, label %for.cond10.for.end_crit_edge, !dbg !245

for.cond10.for.end_crit_edge:                     ; preds = %for.inc
  %split = phi i32 [ %inc, %for.inc ]
  %split5 = phi float [ %add19, %for.inc ]
  br label %for.end, !dbg !245

for.end:                                          ; preds = %for.cond10.for.end_crit_edge, %for.body8
  %c.1.lcssa = phi i32 [ %split, %for.cond10.for.end_crit_edge ], [ %c.08, %for.body8 ]
  %pixel.1.lcssa = phi float [ %split5, %for.cond10.for.end_crit_edge ], [ %pixel.07, %for.body8 ]
  br label %for.inc21, !dbg !253

for.inc21:                                        ; preds = %for.end
  %inc22 = add nsw i32 %j.09, 1, !dbg !254
  call void @llvm.dbg.value(metadata i32 %inc22, i64 0, metadata !234, metadata !34), !dbg !235
  %cmp7 = icmp sle i32 %inc22, %div, !dbg !236
  br i1 %cmp7, label %for.body8, label %for.cond6.for.end23_crit_edge, !dbg !238

for.cond6.for.end23_crit_edge:                    ; preds = %for.inc21
  %split10 = phi float [ %pixel.1.lcssa, %for.inc21 ]
  br label %for.end23, !dbg !238

for.end23:                                        ; preds = %for.cond6.for.end23_crit_edge, %for.body4
  %pixel.0.lcssa = phi float [ %split10, %for.cond6.for.end23_crit_edge ], [ 0.000000e+00, %for.body4 ]
  %conv24 = fptoui float %pixel.0.lcssa to i8, !dbg !255
  %idxprom25 = sext i32 %y.014 to i64, !dbg !256
  %idxprom26 = sext i32 %x.012 to i64, !dbg !256
  %arrayidx27 = getelementptr inbounds i8** %out, i64 %idxprom26, !dbg !256
  %3 = load i8** %arrayidx27, align 8, !dbg !256
  %arrayidx28 = getelementptr inbounds i8* %3, i64 %idxprom25, !dbg !256
  store i8 %conv24, i8* %arrayidx28, align 1, !dbg !256
  br label %for.inc29, !dbg !257

for.inc29:                                        ; preds = %for.end23
  %inc30 = add nsw i32 %x.012, 1, !dbg !258
  call void @llvm.dbg.value(metadata i32 %inc30, i64 0, metadata !220, metadata !34), !dbg !222
  %cmp3 = icmp slt i32 %inc30, %sub2, !dbg !225
  br i1 %cmp3, label %for.body4, label %for.cond1.for.end31_crit_edge, !dbg !226

for.cond1.for.end31_crit_edge:                    ; preds = %for.inc29
  br label %for.end31, !dbg !226

for.end31:                                        ; preds = %for.cond1.for.end31_crit_edge, %for.body
  br label %for.inc32, !dbg !259

for.inc32:                                        ; preds = %for.end31
  %inc33 = add nsw i32 %y.014, 1, !dbg !260
  call void @llvm.dbg.value(metadata i32 %inc33, i64 0, metadata !213, metadata !34), !dbg !215
  %cmp = icmp slt i32 %inc33, %sub, !dbg !218
  br i1 %cmp, label %for.body, label %for.cond.for.end34_crit_edge, !dbg !219

for.cond.for.end34_crit_edge:                     ; preds = %for.inc32
  br label %for.end34, !dbg !219

for.end34:                                        ; preds = %for.cond.for.end34_crit_edge, %entry
  ret void, !dbg !261
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
!61 = !MDLocation(line: 29, column: 26, scope: !62)
!62 = !{!"0xb\0029\005\001", !1, !58}             ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!63 = !MDLocation(line: 29, column: 5, scope: !58)
!64 = !MDLocation(line: 30, column: 22, scope: !65)
!65 = !{!"0xb\0030\009\002", !1, !62}             ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!66 = !{!"0x100\00i\0030\000", !65, !9, !19}      ; [ DW_TAG_auto_variable ] [i] [line 30]
!67 = !MDLocation(line: 30, column: 18, scope: !65)
!68 = !MDLocation(line: 30, column: 30, scope: !69)
!69 = !{!"0xb\0030\009\003", !1, !65}             ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!70 = !MDLocation(line: 30, column: 9, scope: !65)
!71 = !MDLocation(line: 31, column: 26, scope: !69)
!72 = !MDLocation(line: 31, column: 25, scope: !69)
!73 = !MDLocation(line: 31, column: 22, scope: !69)
!74 = !MDLocation(line: 31, column: 62, scope: !69)
!75 = !MDLocation(line: 31, column: 60, scope: !69)
!76 = !MDLocation(line: 31, column: 53, scope: !69)
!77 = !MDLocation(line: 31, column: 13, scope: !69)
!78 = !MDLocation(line: 30, column: 42, scope: !69)
!79 = !MDLocation(line: 31, column: 75, scope: !65)
!80 = !MDLocation(line: 29, column: 38, scope: !62)
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
!108 = !MDLocation(line: 50, column: 26, scope: !109)
!109 = !{!"0xb\0050\005\005", !1, !105}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!110 = !MDLocation(line: 50, column: 5, scope: !105)
!111 = !MDLocation(line: 51, column: 22, scope: !112)
!112 = !{!"0xb\0051\009\006", !1, !109}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!113 = !{!"0x100\00i\0051\000", !112, !9, !19}    ; [ DW_TAG_auto_variable ] [i] [line 51]
!114 = !MDLocation(line: 51, column: 18, scope: !112)
!115 = !MDLocation(line: 51, column: 30, scope: !116)
!116 = !{!"0xb\0051\009\007", !1, !112}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!117 = !MDLocation(line: 51, column: 9, scope: !112)
!118 = !MDLocation(line: 52, column: 30, scope: !116)
!119 = !MDLocation(line: 52, column: 22, scope: !116)
!120 = !MDLocation(line: 52, column: 25, scope: !116)
!121 = !MDLocation(line: 52, column: 44, scope: !116)
!122 = !MDLocation(line: 52, column: 37, scope: !116)
!123 = !MDLocation(line: 52, column: 13, scope: !116)
!124 = !MDLocation(line: 51, column: 42, scope: !116)
!125 = !MDLocation(line: 52, column: 47, scope: !112)
!126 = !MDLocation(line: 50, column: 38, scope: !109)
!127 = !MDLocation(line: 54, column: 17, scope: !20)
!128 = !MDLocation(line: 54, column: 5, scope: !20)
!129 = !MDLocation(line: 56, column: 1, scope: !20)
!130 = !{!"0x101\00in\0016777300\000", !25, !9, !12} ; [ DW_TAG_arg_variable ] [in] [line 84]
!131 = !MDLocation(line: 84, column: 25, scope: !25)
!132 = !{!"0x101\00out\0033554517\000", !25, !9, !14} ; [ DW_TAG_arg_variable ] [out] [line 85]
!133 = !MDLocation(line: 85, column: 19, scope: !25)
!134 = !{!"0x101\00kernel\0050331734\000", !25, !9, !15} ; [ DW_TAG_arg_variable ] [kernel] [line 86]
!135 = !MDLocation(line: 86, column: 22, scope: !25)
!136 = !{!"0x101\00kn\0067108951\000", !25, !9, !18} ; [ DW_TAG_arg_variable ] [kn] [line 87]
!137 = !MDLocation(line: 87, column: 19, scope: !25)
!138 = !{!"0x101\00dim_x\0083886168\000", !25, !9, !18} ; [ DW_TAG_arg_variable ] [dim_x] [line 88]
!139 = !MDLocation(line: 88, column: 19, scope: !25)
!140 = !{!"0x101\00dim_y\00100663385\000", !25, !9, !18} ; [ DW_TAG_arg_variable ] [dim_y] [line 89]
!141 = !MDLocation(line: 89, column: 19, scope: !25)
!142 = !MDLocation(line: 92, column: 23, scope: !25)
!143 = !{!"0x100\00khalf\0092\000", !25, !9, !18} ; [ DW_TAG_auto_variable ] [khalf] [line 92]
!144 = !MDLocation(line: 92, column: 15, scope: !25)
!145 = !{!"0x100\00m\0094\000", !146, !9, !19}    ; [ DW_TAG_auto_variable ] [m] [line 94]
!146 = !{!"0xb\0094\005\008", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!147 = !MDLocation(line: 94, column: 14, scope: !146)
!148 = !MDLocation(line: 94, column: 29, scope: !149)
!149 = !{!"0xb\0094\005\009", !1, !146}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!150 = !MDLocation(line: 94, column: 25, scope: !149)
!151 = !MDLocation(line: 94, column: 5, scope: !146)
!152 = !{!"0x100\00n\0095\000", !153, !9, !19}    ; [ DW_TAG_auto_variable ] [n] [line 95]
!153 = !{!"0xb\0095\009\0010", !1, !149}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!154 = !MDLocation(line: 95, column: 18, scope: !153)
!155 = !MDLocation(line: 95, column: 33, scope: !156)
!156 = !{!"0xb\0095\009\0011", !1, !153}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!157 = !MDLocation(line: 95, column: 29, scope: !156)
!158 = !MDLocation(line: 95, column: 9, scope: !153)
!159 = !MDLocation(line: 96, column: 13, scope: !156)
!160 = !MDLocation(line: 95, column: 48, scope: !156)
!161 = !MDLocation(line: 96, column: 66, scope: !153)
!162 = !MDLocation(line: 94, column: 44, scope: !149)
!163 = !MDLocation(line: 97, column: 1, scope: !25)
!164 = !{!"0x101\00in\0016777316\000", !28, !9, !23} ; [ DW_TAG_arg_variable ] [in] [line 100]
!165 = !MDLocation(line: 100, column: 26, scope: !28)
!166 = !{!"0x101\00out\0033554533\000", !28, !9, !24} ; [ DW_TAG_arg_variable ] [out] [line 101]
!167 = !MDLocation(line: 101, column: 20, scope: !28)
!168 = !{!"0x101\00kernel\0050331750\000", !28, !9, !15} ; [ DW_TAG_arg_variable ] [kernel] [line 102]
!169 = !MDLocation(line: 102, column: 22, scope: !28)
!170 = !{!"0x101\00kn\0067108967\000", !28, !9, !18} ; [ DW_TAG_arg_variable ] [kn] [line 103]
!171 = !MDLocation(line: 103, column: 19, scope: !28)
!172 = !{!"0x101\00dim_x\0083886184\000", !28, !9, !18} ; [ DW_TAG_arg_variable ] [dim_x] [line 104]
!173 = !MDLocation(line: 104, column: 19, scope: !28)
!174 = !{!"0x101\00dim_y\00100663401\000", !28, !9, !18} ; [ DW_TAG_arg_variable ] [dim_y] [line 105]
!175 = !MDLocation(line: 105, column: 19, scope: !28)
!176 = !MDLocation(line: 107, column: 23, scope: !28)
!177 = !{!"0x100\00khalf\00107\000", !28, !9, !18} ; [ DW_TAG_auto_variable ] [khalf] [line 107]
!178 = !MDLocation(line: 107, column: 15, scope: !28)
!179 = !{!"0x100\00m\00109\000", !180, !9, !19}   ; [ DW_TAG_auto_variable ] [m] [line 109]
!180 = !{!"0xb\00109\005\0012", !1, !28}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!181 = !MDLocation(line: 109, column: 14, scope: !180)
!182 = !MDLocation(line: 109, column: 29, scope: !183)
!183 = !{!"0xb\00109\005\0013", !1, !180}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!184 = !MDLocation(line: 109, column: 25, scope: !183)
!185 = !MDLocation(line: 109, column: 5, scope: !180)
!186 = !{!"0x100\00n\00110\000", !187, !9, !19}   ; [ DW_TAG_auto_variable ] [n] [line 110]
!187 = !{!"0xb\00110\009\0014", !1, !183}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!188 = !MDLocation(line: 110, column: 18, scope: !187)
!189 = !MDLocation(line: 110, column: 33, scope: !190)
!190 = !{!"0xb\00110\009\0015", !1, !187}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!191 = !MDLocation(line: 110, column: 29, scope: !190)
!192 = !MDLocation(line: 110, column: 9, scope: !187)
!193 = !MDLocation(line: 111, column: 10, scope: !190)
!194 = !MDLocation(line: 110, column: 48, scope: !190)
!195 = !MDLocation(line: 111, column: 52, scope: !187)
!196 = !MDLocation(line: 109, column: 44, scope: !183)
!197 = !MDLocation(line: 112, column: 1, scope: !28)
!198 = !{!"0x101\00in\0016777331\000", !29, !9, !23} ; [ DW_TAG_arg_variable ] [in] [line 115]
!199 = !MDLocation(line: 115, column: 26, scope: !29)
!200 = !{!"0x101\00out\0033554548\000", !29, !9, !24} ; [ DW_TAG_arg_variable ] [out] [line 116]
!201 = !MDLocation(line: 116, column: 20, scope: !29)
!202 = !{!"0x101\00kernel\0050331765\000", !29, !9, !15} ; [ DW_TAG_arg_variable ] [kernel] [line 117]
!203 = !MDLocation(line: 117, column: 22, scope: !29)
!204 = !{!"0x101\00kn\0067108982\000", !29, !9, !18} ; [ DW_TAG_arg_variable ] [kn] [line 118]
!205 = !MDLocation(line: 118, column: 19, scope: !29)
!206 = !{!"0x101\00dim_x\0083886199\000", !29, !9, !18} ; [ DW_TAG_arg_variable ] [dim_x] [line 119]
!207 = !MDLocation(line: 119, column: 19, scope: !29)
!208 = !{!"0x101\00dim_y\00100663416\000", !29, !9, !18} ; [ DW_TAG_arg_variable ] [dim_y] [line 120]
!209 = !MDLocation(line: 120, column: 19, scope: !29)
!210 = !MDLocation(line: 122, column: 23, scope: !29)
!211 = !{!"0x100\00khalf\00122\000", !29, !9, !18} ; [ DW_TAG_auto_variable ] [khalf] [line 122]
!212 = !MDLocation(line: 122, column: 15, scope: !29)
!213 = !{!"0x100\00y\00124\000", !214, !9, !19}   ; [ DW_TAG_auto_variable ] [y] [line 124]
!214 = !{!"0xb\00124\005\0016", !1, !29}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!215 = !MDLocation(line: 124, column: 14, scope: !214)
!216 = !MDLocation(line: 124, column: 29, scope: !217)
!217 = !{!"0xb\00124\005\0017", !1, !214}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!218 = !MDLocation(line: 124, column: 25, scope: !217)
!219 = !MDLocation(line: 124, column: 5, scope: !214)
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
!232 = !MDLocation(line: 130, column: 22, scope: !233)
!233 = !{!"0xb\00130\009\0021", !1, !228}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!234 = !{!"0x100\00j\00130\000", !233, !9, !19}   ; [ DW_TAG_auto_variable ] [j] [line 130]
!235 = !MDLocation(line: 130, column: 18, scope: !233)
!236 = !MDLocation(line: 130, column: 30, scope: !237)
!237 = !{!"0xb\00130\009\0022", !1, !233}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!238 = !MDLocation(line: 130, column: 9, scope: !233)
!239 = !MDLocation(line: 131, column: 24, scope: !240)
!240 = !{!"0xb\00131\0011\0023", !1, !237}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!241 = !{!"0x100\00i\00131\000", !240, !9, !19}   ; [ DW_TAG_auto_variable ] [i] [line 131]
!242 = !MDLocation(line: 131, column: 20, scope: !240)
!243 = !MDLocation(line: 131, column: 32, scope: !244)
!244 = !{!"0xb\00131\0011\0024", !1, !240}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!245 = !MDLocation(line: 131, column: 11, scope: !240)
!246 = !MDLocation(line: 132, column: 32, scope: !244)
!247 = !MDLocation(line: 132, column: 22, scope: !244)
!248 = !MDLocation(line: 132, column: 25, scope: !244)
!249 = !MDLocation(line: 132, column: 48, scope: !244)
!250 = !MDLocation(line: 132, column: 41, scope: !244)
!251 = !MDLocation(line: 132, column: 13, scope: !244)
!252 = !MDLocation(line: 131, column: 44, scope: !244)
!253 = !MDLocation(line: 132, column: 51, scope: !240)
!254 = !MDLocation(line: 130, column: 42, scope: !237)
!255 = !MDLocation(line: 134, column: 21, scope: !228)
!256 = !MDLocation(line: 134, column: 9, scope: !228)
!257 = !MDLocation(line: 135, column: 7, scope: !228)
!258 = !MDLocation(line: 125, column: 46, scope: !224)
!259 = !MDLocation(line: 135, column: 7, scope: !221)
!260 = !MDLocation(line: 124, column: 44, scope: !217)
!261 = !MDLocation(line: 136, column: 1, scope: !29)
