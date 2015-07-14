; ModuleID = 'convolve.opt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @filter_kernel(i8* nocapture readonly %in, i8* nocapture %out, float* nocapture readonly %kernel, i32 %kn, i32 %m, i32 %n, i32 %size_x, i32 %size_y) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i8* %in, i64 0, metadata !33, metadata !34), !dbg !35
  tail call void @llvm.dbg.value(metadata i8* %out, i64 0, metadata !36, metadata !34), !dbg !37
  tail call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !38, metadata !34), !dbg !39
  tail call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !40, metadata !34), !dbg !41
  tail call void @llvm.dbg.value(metadata i32 %m, i64 0, metadata !42, metadata !34), !dbg !43
  tail call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !44, metadata !34), !dbg !45
  tail call void @llvm.dbg.value(metadata i32 %size_x, i64 0, metadata !46, metadata !34), !dbg !47
  tail call void @llvm.dbg.value(metadata i32 %size_y, i64 0, metadata !48, metadata !34), !dbg !49
  %div = sdiv i32 %kn, 2, !dbg !50
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !51, metadata !34), !dbg !52
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !53, metadata !34), !dbg !54
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !55, metadata !34), !dbg !56
  %sub = sub nsw i32 0, %div, !dbg !57
  tail call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !59, metadata !34), !dbg !60
  %0 = sext i32 %sub to i64
  %1 = sext i32 %div to i64, !dbg !61
  %2 = sext i32 %n to i64, !dbg !61
  %3 = sext i32 %size_x to i64, !dbg !61
  %4 = sext i32 %m to i64, !dbg !61
  %5 = sext i32 %kn to i64, !dbg !61
  %cmp14 = icmp slt i32 %div, %sub, !dbg !62
  br i1 %cmp14, label %for.end18, label %for.inc.preheader.preheader, !dbg !64

for.inc.preheader.preheader:                      ; preds = %entry
  br label %for.inc.preheader, !dbg !65

for.inc.preheader:                                ; preds = %for.inc.preheader.preheader, %for.inc16
  %pixel.017 = phi float [ %add15.lcssa, %for.inc16 ], [ 0.000000e+00, %for.inc.preheader.preheader ]
  %indvars.iv315 = phi i64 [ %indvars.iv.next4, %for.inc16 ], [ %0, %for.inc.preheader.preheader ]
  tail call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !67, metadata !34), !dbg !65
  %6 = sub nsw i64 %2, %indvars.iv315, !dbg !68
  %7 = mul nsw i64 %6, %3, !dbg !70
  %8 = add nsw i64 %7, %4, !dbg !70
  %9 = mul nsw i64 %indvars.iv315, %5, !dbg !71
  %10 = sub i64 2, %9, !dbg !72
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %pixel.113 = phi float [ %add15, %for.inc ], [ %pixel.017, %for.inc.preheader ]
  %indvars.iv12 = phi i64 [ %indvars.iv.next, %for.inc ], [ %0, %for.inc.preheader ]
  tail call void @llvm.dbg.value(metadata float %add15, i64 0, metadata !53, metadata !34), !dbg !54
  %11 = sub i64 %8, %indvars.iv12, !dbg !70
  %arrayidx = getelementptr inbounds i8* %in, i64 %11, !dbg !73
  %12 = load i8* %arrayidx, align 1, !dbg !73
  %conv = zext i8 %12 to i32, !dbg !73
  %conv7 = sitofp i32 %conv to float, !dbg !73
  %13 = sub i64 %10, %indvars.iv12, !dbg !72
  %arrayidx13 = getelementptr inbounds float* %kernel, i64 %13, !dbg !74
  %14 = load float* %arrayidx13, align 4, !dbg !74
  %mul14 = fmul float %14, %conv7, !dbg !73
  %add15 = fadd float %pixel.113, %mul14, !dbg !75
  %indvars.iv.next = add nsw i64 %indvars.iv12, 1, !dbg !76
  %cmp3 = icmp slt i64 %indvars.iv12, %1, !dbg !77
  br i1 %cmp3, label %for.inc, label %for.inc16, !dbg !78

for.inc16:                                        ; preds = %for.inc
  %add15.lcssa = phi float [ %add15, %for.inc ]
  %indvars.iv.next4 = add nsw i64 %indvars.iv315, 1, !dbg !79
  %cmp = icmp slt i64 %indvars.iv315, %1, !dbg !62
  br i1 %cmp, label %for.inc.preheader, label %for.end18.loopexit, !dbg !64

for.end18.loopexit:                               ; preds = %for.inc16
  %add15.lcssa.lcssa = phi float [ %add15.lcssa, %for.inc16 ]
  %phitmp = fptoui float %add15.lcssa.lcssa to i8
  br label %for.end18

for.end18:                                        ; preds = %for.end18.loopexit, %entry
  %pixel.0.lcssa = phi i8 [ 0, %entry ], [ %phitmp, %for.end18.loopexit ]
  %mul20 = mul nsw i32 %size_x, %n, !dbg !80
  %add21 = add nsw i32 %mul20, %m, !dbg !80
  %idxprom22 = sext i32 %add21 to i64, !dbg !81
  %arrayidx23 = getelementptr inbounds i8* %out, i64 %idxprom22, !dbg !81
  store i8 %pixel.0.lcssa, i8* %arrayidx23, align 1, !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nounwind uwtable
define void @filter_kernel_2d(i8** nocapture readonly %in, i8** nocapture readonly %out, float* nocapture readonly %kernel, i32 %kn, i32 %x, i32 %y) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i8** %in, i64 0, metadata !83, metadata !34), !dbg !84
  tail call void @llvm.dbg.value(metadata i8** %out, i64 0, metadata !85, metadata !34), !dbg !86
  tail call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !87, metadata !34), !dbg !88
  tail call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !89, metadata !34), !dbg !90
  tail call void @llvm.dbg.value(metadata i32 %x, i64 0, metadata !91, metadata !34), !dbg !92
  tail call void @llvm.dbg.value(metadata i32 %y, i64 0, metadata !93, metadata !34), !dbg !94
  %div = sdiv i32 %kn, 2, !dbg !95
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !96, metadata !34), !dbg !97
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !98, metadata !34), !dbg !99
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !100, metadata !34), !dbg !101
  %sub = sub i32 0, %div, !dbg !102
  tail call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !104, metadata !34), !dbg !105
  %0 = sext i32 %sub to i64
  %1 = sext i32 %div to i64, !dbg !106
  %2 = sext i32 %x to i64, !dbg !106
  %3 = sext i32 %y to i64, !dbg !106
  %cmp12 = icmp slt i32 %div, %sub, !dbg !107
  br i1 %cmp12, label %for.end15, label %for.body.preheader, !dbg !109

for.body.preheader:                               ; preds = %entry
  %4 = add nsw i64 %1, 1, !dbg !99
  %5 = sub nsw i64 %4, %0, !dbg !99
  br label %for.inc.preheader, !dbg !110

for.inc.preheader:                                ; preds = %for.inc13, %for.body.preheader
  %c.016 = phi i64 [ %13, %for.inc13 ], [ 0, %for.body.preheader ]
  %pixel.015 = phi float [ %add11.lcssa, %for.inc13 ], [ 0.000000e+00, %for.body.preheader ]
  %indvars.iv413 = phi i64 [ %indvars.iv.next5, %for.inc13 ], [ %0, %for.body.preheader ]
  tail call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !112, metadata !34), !dbg !110
  %sext = shl i64 %c.016, 32
  %6 = ashr exact i64 %sext, 32
  %7 = add nsw i64 %indvars.iv413, %3, !dbg !113
  %arrayidx = getelementptr inbounds i8** %in, i64 %7, !dbg !115
  %8 = load i8** %arrayidx, align 8, !dbg !115
  %sext1 = shl i64 %c.016, 32
  %9 = ashr exact i64 %sext1, 32
  br label %for.inc, !dbg !99

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %pixel.110 = phi float [ %add11, %for.inc ], [ %pixel.015, %for.inc.preheader ]
  %indvars.iv9 = phi i64 [ %indvars.iv.next, %for.inc ], [ %6, %for.inc.preheader ]
  %indvars.iv18 = phi i64 [ %indvars.iv.next2, %for.inc ], [ %0, %for.inc.preheader ]
  tail call void @llvm.dbg.value(metadata float %add11, i64 0, metadata !98, metadata !34), !dbg !99
  %10 = add nsw i64 %indvars.iv18, %2, !dbg !116
  %arrayidx7 = getelementptr inbounds i8* %8, i64 %10, !dbg !115
  %11 = load i8* %arrayidx7, align 1, !dbg !115
  %conv = zext i8 %11 to i32, !dbg !115
  %conv8 = sitofp i32 %conv to float, !dbg !115
  %arrayidx10 = getelementptr inbounds float* %kernel, i64 %indvars.iv9, !dbg !117
  %12 = load float* %arrayidx10, align 4, !dbg !117
  %mul = fmul float %12, %conv8, !dbg !115
  %add11 = fadd float %pixel.110, %mul, !dbg !118
  %indvars.iv.next = add nsw i64 %indvars.iv9, 1, !dbg !119
  %indvars.iv.next2 = add nsw i64 %indvars.iv18, 1, !dbg !119
  %cmp3 = icmp slt i64 %indvars.iv18, %1, !dbg !120
  br i1 %cmp3, label %for.inc, label %for.inc13, !dbg !121

for.inc13:                                        ; preds = %for.inc
  %add11.lcssa = phi float [ %add11, %for.inc ]
  %13 = add nsw i64 %5, %9, !dbg !99
  %indvars.iv.next5 = add nsw i64 %indvars.iv413, 1, !dbg !122
  %cmp = icmp slt i64 %indvars.iv413, %1, !dbg !107
  br i1 %cmp, label %for.inc.preheader, label %for.end15.loopexit, !dbg !109

for.end15.loopexit:                               ; preds = %for.inc13
  %add11.lcssa.lcssa = phi float [ %add11.lcssa, %for.inc13 ]
  %phitmp = fptoui float %add11.lcssa.lcssa to i8
  br label %for.end15

for.end15:                                        ; preds = %for.end15.loopexit, %entry
  %pixel.0.lcssa = phi i8 [ 0, %entry ], [ %phitmp, %for.end15.loopexit ]
  %arrayidx19 = getelementptr inbounds i8** %out, i64 %3, !dbg !123
  %14 = load i8** %arrayidx19, align 8, !dbg !123
  %arrayidx20 = getelementptr inbounds i8* %14, i64 %2, !dbg !123
  store i8 %pixel.0.lcssa, i8* %arrayidx20, align 1, !dbg !123
  ret void, !dbg !124
}

; Function Attrs: nounwind uwtable
define void @convolve_arr_linear(i8* %in, i8* %out, float* %kernel, i32 %kn, i32 %dim_x, i32 %dim_y) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i8* %in, i64 0, metadata !125, metadata !34), !dbg !126
  tail call void @llvm.dbg.value(metadata i8* %out, i64 0, metadata !127, metadata !34), !dbg !128
  tail call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !129, metadata !34), !dbg !130
  tail call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !131, metadata !34), !dbg !132
  tail call void @llvm.dbg.value(metadata i32 %dim_x, i64 0, metadata !133, metadata !34), !dbg !134
  tail call void @llvm.dbg.value(metadata i32 %dim_y, i64 0, metadata !135, metadata !34), !dbg !136
  %div = sdiv i32 %kn, 2, !dbg !137
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !138, metadata !34), !dbg !139
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !140, metadata !34), !dbg !142
  %0 = sext i32 %div to i64
  %1 = sext i32 %dim_x to i64, !dbg !143
  %sub = sub i32 %dim_x, %div, !dbg !144
  %cmp8 = icmp slt i32 %div, %sub, !dbg !146
  br i1 %cmp8, label %bypassdesc, label %for.end7, !dbg !147

bypassdesc:                                       ; preds = %entry
  %bypass = tail call i1 @convolve_hw_use_accelerator(i32 %kn, i32 %dim_y, i32 %dim_x) #2
  br i1 %bypass, label %acc, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %bypassdesc
  %sub2 = sub i32 %dim_y, %div, !dbg !148
  %cmp36 = icmp slt i32 %div, %sub2, !dbg !151
  %sub.i = sub nsw i32 0, %div, !dbg !152
  %2 = sext i32 %sub.i to i64, !dbg !153
  %3 = sext i32 %kn to i64, !dbg !154
  %cmp14.i = icmp slt i32 %div, %sub.i, !dbg !155
  %4 = sext i32 %sub2 to i64
  %5 = add nsw i64 %4, -1, !dbg !148
  %6 = sext i32 %sub to i64
  %7 = add nsw i64 %6, -1, !dbg !148
  br label %for.cond1.preheader, !dbg !148

for.cond1.preheader:                              ; preds = %for.inc5, %for.cond1.preheader.preheader
  %indvars.iv49 = phi i64 [ %indvars.iv.next5, %for.inc5 ], [ %0, %for.cond1.preheader.preheader ]
  br i1 %cmp36, label %for.body4.preheader, label %for.inc5, !dbg !156

for.body4.preheader:                              ; preds = %for.cond1.preheader
  br label %for.body4, !dbg !157

for.body4:                                        ; preds = %for.body4.preheader, %filter_kernel.exit
  %indvars.iv7 = phi i64 [ %indvars.iv.next, %filter_kernel.exit ], [ %0, %for.body4.preheader ]
  tail call void @llvm.dbg.value(metadata i8* %in, i64 0, metadata !158, metadata !34), !dbg !157
  tail call void @llvm.dbg.value(metadata i8* %out, i64 0, metadata !159, metadata !34), !dbg !160
  tail call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !161, metadata !34), !dbg !162
  tail call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !163, metadata !34), !dbg !164
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !165, metadata !34), !dbg !166
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !167, metadata !34), !dbg !168
  tail call void @llvm.dbg.value(metadata i32 %dim_x, i64 0, metadata !169, metadata !34), !dbg !170
  tail call void @llvm.dbg.value(metadata i32 %dim_y, i64 0, metadata !171, metadata !34), !dbg !172
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !173, metadata !34), !dbg !174
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !175, metadata !34), !dbg !176
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !177, metadata !34), !dbg !178
  tail call void @llvm.dbg.value(metadata i32 %sub.i, i64 0, metadata !179, metadata !34), !dbg !180
  br i1 %cmp14.i, label %filter_kernel.exit, label %for.inc.i.preheader.preheader, !dbg !181

for.inc.i.preheader.preheader:                    ; preds = %for.body4
  br label %for.inc.i.preheader, !dbg !182

for.inc.i.preheader:                              ; preds = %for.inc.i.preheader.preheader, %for.inc16.i
  %pixel.017.i = phi float [ %add15.i.lcssa, %for.inc16.i ], [ 0.000000e+00, %for.inc.i.preheader.preheader ], !dbg !153
  %indvars.iv315.i = phi i64 [ %indvars.iv.next4.i, %for.inc16.i ], [ %2, %for.inc.i.preheader.preheader ], !dbg !153
  tail call void @llvm.dbg.value(metadata i32 %sub.i, i64 0, metadata !183, metadata !34), !dbg !182
  %8 = sub nsw i64 %indvars.iv7, %indvars.iv315.i, !dbg !184
  %9 = mul nsw i64 %8, %1, !dbg !185
  %10 = add nsw i64 %9, %indvars.iv49, !dbg !185
  %11 = mul nsw i64 %indvars.iv315.i, %3, !dbg !186
  %12 = sub i64 2, %11, !dbg !187
  br label %for.inc.i

for.inc.i:                                        ; preds = %for.inc.i.preheader, %for.inc.i
  %pixel.113.i = phi float [ %add15.i, %for.inc.i ], [ %pixel.017.i, %for.inc.i.preheader ], !dbg !153
  %indvars.iv12.i = phi i64 [ %indvars.iv.next.i, %for.inc.i ], [ %2, %for.inc.i.preheader ], !dbg !153
  %13 = sub i64 %10, %indvars.iv12.i, !dbg !185
  %arrayidx.i = getelementptr inbounds i8* %in, i64 %13, !dbg !188
  %14 = load i8* %arrayidx.i, align 1, !dbg !188
  %conv.i = zext i8 %14 to i32, !dbg !188
  %conv7.i = sitofp i32 %conv.i to float, !dbg !188
  %15 = sub i64 %12, %indvars.iv12.i, !dbg !187
  %arrayidx13.i = getelementptr inbounds float* %kernel, i64 %15, !dbg !189
  %16 = load float* %arrayidx13.i, align 4, !dbg !189
  %mul14.i = fmul float %16, %conv7.i, !dbg !188
  %add15.i = fadd float %pixel.113.i, %mul14.i, !dbg !190
  %indvars.iv.next.i = add nsw i64 %indvars.iv12.i, 1, !dbg !191
  %exitcond = icmp eq i64 %indvars.iv12.i, %0, !dbg !192
  br i1 %exitcond, label %for.inc16.i, label %for.inc.i, !dbg !192

for.inc16.i:                                      ; preds = %for.inc.i
  %add15.i.lcssa = phi float [ %add15.i, %for.inc.i ]
  %indvars.iv.next4.i = add nsw i64 %indvars.iv315.i, 1, !dbg !193
  %exitcond1 = icmp eq i64 %indvars.iv315.i, %0, !dbg !181
  br i1 %exitcond1, label %filter_kernel.exit.loopexit, label %for.inc.i.preheader, !dbg !181

filter_kernel.exit.loopexit:                      ; preds = %for.inc16.i
  %add15.i.lcssa.lcssa = phi float [ %add15.i.lcssa, %for.inc16.i ]
  br label %filter_kernel.exit

filter_kernel.exit:                               ; preds = %filter_kernel.exit.loopexit, %for.body4
  %pixel.0.lcssa.i = phi float [ 0.000000e+00, %for.body4 ], [ %add15.i.lcssa.lcssa, %filter_kernel.exit.loopexit ], !dbg !153
  %conv19.i = fptoui float %pixel.0.lcssa.i to i8, !dbg !194
  %17 = mul nsw i64 %indvars.iv7, %1, !dbg !195
  %18 = add nsw i64 %17, %indvars.iv49, !dbg !195
  %arrayidx23.i = getelementptr inbounds i8* %out, i64 %18, !dbg !196
  store i8 %conv19.i, i8* %arrayidx23.i, align 1, !dbg !196
  %indvars.iv.next = add nsw i64 %indvars.iv7, 1, !dbg !197
  %exitcond2 = icmp eq i64 %indvars.iv7, %5, !dbg !156
  br i1 %exitcond2, label %for.inc5.loopexit, label %for.body4, !dbg !156

for.inc5.loopexit:                                ; preds = %filter_kernel.exit
  br label %for.inc5

for.inc5:                                         ; preds = %for.inc5.loopexit, %for.cond1.preheader
  %indvars.iv.next5 = add nsw i64 %indvars.iv49, 1, !dbg !198
  %exitcond3 = icmp eq i64 %indvars.iv49, %7, !dbg !147
  br i1 %exitcond3, label %for.end7.loopexit, label %for.cond1.preheader, !dbg !147

for.end7.loopexit:                                ; preds = %for.inc5
  br label %for.end7

for.end7:                                         ; preds = %for.end7.loopexit, %entry
  ret void, !dbg !199

acc:                                              ; preds = %bypassdesc
  tail call void @convolve_bypass_hw_iface0(i8* %in, i8* %out, float* %kernel, i32 %kn, i32 %dim_y, i32 %dim_x) #2
  ret void
}

; Function Attrs: nounwind uwtable
define void @convolve_arr_indirection(i8** %in, i8** %out, float* %kernel, i32 %kn, i32 %dim_x, i32 %dim_y) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i8** %in, i64 0, metadata !200, metadata !34), !dbg !201
  tail call void @llvm.dbg.value(metadata i8** %out, i64 0, metadata !202, metadata !34), !dbg !203
  tail call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !204, metadata !34), !dbg !205
  tail call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !206, metadata !34), !dbg !207
  tail call void @llvm.dbg.value(metadata i32 %dim_x, i64 0, metadata !208, metadata !34), !dbg !209
  tail call void @llvm.dbg.value(metadata i32 %dim_y, i64 0, metadata !210, metadata !34), !dbg !211
  %div = sdiv i32 %kn, 2, !dbg !212
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !213, metadata !34), !dbg !214
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !215, metadata !34), !dbg !217
  %0 = sext i32 %div to i64
  %1 = add nsw i64 %0, 1, !dbg !218
  %2 = sub i32 0, %div, !dbg !223
  %3 = sext i32 %2 to i64
  %4 = sub nsw i64 %1, %3, !dbg !218
  %sub = sub i32 %dim_x, %div, !dbg !224
  %cmp7 = icmp slt i32 %div, %sub, !dbg !225
  br i1 %cmp7, label %bypassdesc, label %for.end7, !dbg !226

bypassdesc:                                       ; preds = %entry
  %bypass = tail call i1 @convolve_hw_use_accelerator(i32 %kn, i32 %dim_y, i32 %dim_x) #2
  br i1 %bypass, label %acc, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %bypassdesc
  %sub2 = sub nsw i32 %dim_y, %div, !dbg !227
  %cmp34 = icmp slt i32 %div, %sub2, !dbg !228
  %cmp12.i = icmp slt i32 %div, %2, !dbg !229
  %5 = sext i32 %sub2 to i64
  %6 = add nsw i64 %5, -1, !dbg !227
  %7 = sext i32 %sub to i64
  %8 = add nsw i64 %7, -1, !dbg !227
  br label %for.cond1.preheader, !dbg !227

for.cond1.preheader:                              ; preds = %for.inc5, %for.cond1.preheader.preheader
  %indvars.iv28 = phi i64 [ %indvars.iv.next3, %for.inc5 ], [ %0, %for.cond1.preheader.preheader ]
  br i1 %cmp34, label %for.body4.preheader, label %for.inc5, !dbg !230

for.body4.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx19.i = getelementptr inbounds i8** %out, i64 %indvars.iv28, !dbg !231
  br label %for.body4, !dbg !232

for.body4:                                        ; preds = %filter_kernel_2d.exit, %for.body4.preheader
  %indvars.iv5 = phi i64 [ %indvars.iv.next, %filter_kernel_2d.exit ], [ %0, %for.body4.preheader ]
  tail call void @llvm.dbg.value(metadata i8** %in, i64 0, metadata !233, metadata !34), !dbg !232
  tail call void @llvm.dbg.value(metadata i8** %out, i64 0, metadata !234, metadata !34), !dbg !235
  tail call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !236, metadata !34), !dbg !237
  tail call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !238, metadata !34), !dbg !239
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !240, metadata !34), !dbg !241
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !242, metadata !34), !dbg !243
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !244, metadata !34), !dbg !245
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !246, metadata !34), !dbg !247
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !248, metadata !34), !dbg !249
  tail call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !250, metadata !34), !dbg !251
  br i1 %cmp12.i, label %filter_kernel_2d.exit, label %for.inc.i.preheader.preheader, !dbg !252

for.inc.i.preheader.preheader:                    ; preds = %for.body4
  br label %for.inc.i.preheader, !dbg !253

for.inc.i.preheader:                              ; preds = %for.inc.i.preheader.preheader, %for.inc13.i
  %c.016.i = phi i64 [ %15, %for.inc13.i ], [ 0, %for.inc.i.preheader.preheader ], !dbg !219
  %pixel.015.i = phi float [ %add11.i.lcssa, %for.inc13.i ], [ 0.000000e+00, %for.inc.i.preheader.preheader ], !dbg !219
  %indvars.iv413.i = phi i64 [ %indvars.iv.next5.i, %for.inc13.i ], [ %3, %for.inc.i.preheader.preheader ], !dbg !219
  tail call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !254, metadata !34), !dbg !253
  %sext = shl i64 %c.016.i, 32, !dbg !219
  %9 = ashr exact i64 %sext, 32, !dbg !219
  %10 = add nsw i64 %indvars.iv413.i, %indvars.iv28, !dbg !255
  %arrayidx.i = getelementptr inbounds i8** %in, i64 %10, !dbg !256
  %11 = load i8** %arrayidx.i, align 8, !dbg !256
  br label %for.inc.i, !dbg !255

for.inc.i:                                        ; preds = %for.inc.i.preheader, %for.inc.i
  %pixel.110.i = phi float [ %add11.i, %for.inc.i ], [ %pixel.015.i, %for.inc.i.preheader ], !dbg !219
  %indvars.iv9.i = phi i64 [ %indvars.iv.next.i, %for.inc.i ], [ %9, %for.inc.i.preheader ], !dbg !219
  %indvars.iv18.i = phi i64 [ %indvars.iv.next2.i, %for.inc.i ], [ %3, %for.inc.i.preheader ], !dbg !219
  %12 = add nsw i64 %indvars.iv18.i, %indvars.iv5, !dbg !257
  %arrayidx7.i = getelementptr inbounds i8* %11, i64 %12, !dbg !256
  %13 = load i8* %arrayidx7.i, align 1, !dbg !256
  %conv.i = zext i8 %13 to i32, !dbg !256
  %conv8.i = sitofp i32 %conv.i to float, !dbg !256
  %arrayidx10.i = getelementptr inbounds float* %kernel, i64 %indvars.iv9.i, !dbg !258
  %14 = load float* %arrayidx10.i, align 4, !dbg !258
  %mul.i = fmul float %14, %conv8.i, !dbg !256
  %add11.i = fadd float %pixel.110.i, %mul.i, !dbg !259
  %indvars.iv.next.i = add nsw i64 %indvars.iv9.i, 1, !dbg !260
  %indvars.iv.next2.i = add nsw i64 %indvars.iv18.i, 1, !dbg !260
  %exitcond = icmp eq i64 %indvars.iv18.i, %0, !dbg !218
  br i1 %exitcond, label %for.inc13.i, label %for.inc.i, !dbg !218

for.inc13.i:                                      ; preds = %for.inc.i
  %add11.i.lcssa = phi float [ %add11.i, %for.inc.i ]
  %15 = add nsw i64 %4, %9, !dbg !218
  %indvars.iv.next5.i = add nsw i64 %indvars.iv413.i, 1, !dbg !261
  %exitcond1 = icmp eq i64 %indvars.iv413.i, %0, !dbg !252
  br i1 %exitcond1, label %filter_kernel_2d.exit.loopexit, label %for.inc.i.preheader, !dbg !252

filter_kernel_2d.exit.loopexit:                   ; preds = %for.inc13.i
  %add11.i.lcssa.lcssa = phi float [ %add11.i.lcssa, %for.inc13.i ]
  br label %filter_kernel_2d.exit

filter_kernel_2d.exit:                            ; preds = %filter_kernel_2d.exit.loopexit, %for.body4
  %pixel.0.lcssa.i = phi float [ 0.000000e+00, %for.body4 ], [ %add11.i.lcssa.lcssa, %filter_kernel_2d.exit.loopexit ], !dbg !219
  %conv16.i = fptoui float %pixel.0.lcssa.i to i8, !dbg !262
  %16 = load i8** %arrayidx19.i, align 8, !dbg !231
  %arrayidx20.i = getelementptr inbounds i8* %16, i64 %indvars.iv5, !dbg !231
  store i8 %conv16.i, i8* %arrayidx20.i, align 1, !dbg !231
  %indvars.iv.next = add nsw i64 %indvars.iv5, 1, !dbg !263
  %exitcond2 = icmp eq i64 %indvars.iv5, %6, !dbg !230
  br i1 %exitcond2, label %for.inc5.loopexit, label %for.body4, !dbg !230

for.inc5.loopexit:                                ; preds = %filter_kernel_2d.exit
  br label %for.inc5

for.inc5:                                         ; preds = %for.inc5.loopexit, %for.cond1.preheader
  %indvars.iv.next3 = add nsw i64 %indvars.iv28, 1, !dbg !264
  %exitcond3 = icmp eq i64 %indvars.iv28, %8, !dbg !226
  br i1 %exitcond3, label %for.end7.loopexit, label %for.cond1.preheader, !dbg !226

for.end7.loopexit:                                ; preds = %for.inc5
  br label %for.end7

for.end7:                                         ; preds = %for.end7.loopexit, %entry
  ret void, !dbg !265

acc:                                              ; preds = %bypassdesc
  tail call void @convolve_bypass_hw_iface1(i8** %in, i8** %out, float* %kernel, i32 %kn, i32 %dim_y, i32 %dim_x) #2
  ret void
}

; Function Attrs: nounwind uwtable
define void @convolve_loop_nest(i8** %in, i8** %out, float* %kernel, i32 %kn, i32 %dim_x, i32 %dim_y) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i8** %in, i64 0, metadata !266, metadata !34), !dbg !267
  tail call void @llvm.dbg.value(metadata i8** %out, i64 0, metadata !268, metadata !34), !dbg !269
  tail call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !270, metadata !34), !dbg !271
  tail call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !272, metadata !34), !dbg !273
  tail call void @llvm.dbg.value(metadata i32 %dim_x, i64 0, metadata !274, metadata !34), !dbg !275
  tail call void @llvm.dbg.value(metadata i32 %dim_y, i64 0, metadata !276, metadata !34), !dbg !277
  %div = sdiv i32 %kn, 2, !dbg !278
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !279, metadata !34), !dbg !280
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !281, metadata !34), !dbg !283
  %0 = sub i32 0, %div, !dbg !284
  %1 = sext i32 %0 to i64
  %2 = sext i32 %div to i64, !dbg !284
  %sub = sub i32 %dim_x, %div, !dbg !285
  %cmp25 = icmp slt i32 %div, %sub, !dbg !287
  br i1 %cmp25, label %bypassdesc, label %for.end34, !dbg !288

bypassdesc:                                       ; preds = %entry
  %bypass = tail call i1 @convolve_hw_use_accelerator(i32 %kn, i32 %dim_y, i32 %dim_x) #2
  br i1 %bypass, label %acc, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %bypassdesc
  %sub2 = sub i32 %dim_y, %div, !dbg !289
  %cmp322 = icmp slt i32 %div, %sub2, !dbg !292
  %cmp716 = icmp slt i32 %div, %0, !dbg !293
  %3 = add nsw i64 %2, 1, !dbg !297
  %4 = sub nsw i64 %3, %1, !dbg !297
  %5 = sext i32 %sub2 to i64
  %6 = add nsw i64 %5, -1, !dbg !289
  %7 = sext i32 %sub to i64
  %8 = add nsw i64 %7, -1, !dbg !289
  br label %for.cond1.preheader, !dbg !289

for.cond1.preheader:                              ; preds = %for.inc32, %for.cond1.preheader.preheader
  %indvars.iv926 = phi i64 [ %indvars.iv.next10, %for.inc32 ], [ %2, %for.cond1.preheader.preheader ]
  br i1 %cmp322, label %for.body4.preheader, label %for.inc32, !dbg !298

for.body4.preheader:                              ; preds = %for.cond1.preheader
  br label %for.body4, !dbg !297

for.body4:                                        ; preds = %for.body4.preheader, %for.end23
  %indvars.iv723 = phi i64 [ %indvars.iv.next8, %for.end23 ], [ %2, %for.body4.preheader ]
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !299, metadata !34), !dbg !297
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !300, metadata !34), !dbg !301
  br i1 %cmp716, label %for.end23, label %for.inc.preheader.preheader, !dbg !302

for.inc.preheader.preheader:                      ; preds = %for.body4
  br label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.preheader.preheader, %for.inc21
  %c.020 = phi i64 [ %16, %for.inc21 ], [ 0, %for.inc.preheader.preheader ]
  %pixel.019 = phi float [ %add19.lcssa, %for.inc21 ], [ 0.000000e+00, %for.inc.preheader.preheader ]
  %indvars.iv417 = phi i64 [ %indvars.iv.next5, %for.inc21 ], [ %1, %for.inc.preheader.preheader ]
  %sext = shl i64 %c.020, 32
  %9 = ashr exact i64 %sext, 32
  %10 = add nsw i64 %indvars.iv417, %indvars.iv723, !dbg !303
  %arrayidx = getelementptr inbounds i8** %in, i64 %10, !dbg !306
  %11 = load i8** %arrayidx, align 8, !dbg !306
  %sext2 = shl i64 %c.020, 32
  %12 = ashr exact i64 %sext2, 32
  br label %for.inc, !dbg !297

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %pixel.114 = phi float [ %add19, %for.inc ], [ %pixel.019, %for.inc.preheader ]
  %indvars.iv13 = phi i64 [ %indvars.iv.next, %for.inc ], [ %9, %for.inc.preheader ]
  %indvars.iv112 = phi i64 [ %indvars.iv.next2, %for.inc ], [ %1, %for.inc.preheader ]
  tail call void @llvm.dbg.value(metadata float %add19, i64 0, metadata !299, metadata !34), !dbg !297
  %13 = add nsw i64 %indvars.iv112, %indvars.iv926, !dbg !307
  %arrayidx15 = getelementptr inbounds i8* %11, i64 %13, !dbg !306
  %14 = load i8* %arrayidx15, align 1, !dbg !306
  %conv = zext i8 %14 to i32, !dbg !306
  %conv16 = sitofp i32 %conv to float, !dbg !306
  %arrayidx18 = getelementptr inbounds float* %kernel, i64 %indvars.iv13, !dbg !308
  %15 = load float* %arrayidx18, align 4, !dbg !308
  %mul = fmul float %15, %conv16, !dbg !306
  %add19 = fadd float %pixel.114, %mul, !dbg !309
  %indvars.iv.next = add nsw i64 %indvars.iv13, 1, !dbg !310
  %indvars.iv.next2 = add nsw i64 %indvars.iv112, 1, !dbg !310
  %cmp11 = icmp slt i64 %indvars.iv112, %2, !dbg !311
  br i1 %cmp11, label %for.inc, label %for.inc21, !dbg !312

for.inc21:                                        ; preds = %for.inc
  %add19.lcssa = phi float [ %add19, %for.inc ]
  %16 = add nsw i64 %4, %12, !dbg !297
  %indvars.iv.next5 = add nsw i64 %indvars.iv417, 1, !dbg !313
  %cmp7 = icmp slt i64 %indvars.iv417, %2, !dbg !293
  br i1 %cmp7, label %for.inc.preheader, label %for.end23.loopexit, !dbg !302

for.end23.loopexit:                               ; preds = %for.inc21
  %add19.lcssa.lcssa = phi float [ %add19.lcssa, %for.inc21 ]
  br label %for.end23

for.end23:                                        ; preds = %for.end23.loopexit, %for.body4
  %pixel.0.lcssa = phi float [ 0.000000e+00, %for.body4 ], [ %add19.lcssa.lcssa, %for.end23.loopexit ]
  %conv24 = fptoui float %pixel.0.lcssa to i8, !dbg !314
  %arrayidx27 = getelementptr inbounds i8** %out, i64 %indvars.iv723, !dbg !315
  %17 = load i8** %arrayidx27, align 8, !dbg !315
  %arrayidx28 = getelementptr inbounds i8* %17, i64 %indvars.iv926, !dbg !315
  store i8 %conv24, i8* %arrayidx28, align 1, !dbg !315
  %indvars.iv.next8 = add nsw i64 %indvars.iv723, 1, !dbg !316
  %exitcond = icmp eq i64 %indvars.iv723, %6, !dbg !298
  br i1 %exitcond, label %for.inc32.loopexit, label %for.body4, !dbg !298

for.inc32.loopexit:                               ; preds = %for.end23
  br label %for.inc32

for.inc32:                                        ; preds = %for.inc32.loopexit, %for.cond1.preheader
  %indvars.iv.next10 = add nsw i64 %indvars.iv926, 1, !dbg !317
  %exitcond1 = icmp eq i64 %indvars.iv926, %8, !dbg !288
  br i1 %exitcond1, label %for.end34.loopexit, label %for.cond1.preheader, !dbg !288

for.end34.loopexit:                               ; preds = %for.inc32
  br label %for.end34

for.end34:                                        ; preds = %for.end34.loopexit, %entry
  ret void, !dbg !318

acc:                                              ; preds = %bypassdesc
  tail call void @convolve_bypass_hw_iface1(i8** %in, i8** %out, float* %kernel, i32 %kn, i32 %dim_y, i32 %dim_x) #2
  ret void
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

declare i1 @convolve_hw_use_accelerator(i32, i32, i32)

declare void @convolve_bypass_hw_iface0(i8*, i8*, float*, i32, i32, i32)

declare void @convolve_bypass_hw_iface1(i8**, i8**, float*, i32, i32, i32)

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }

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
!65 = !MDLocation(line: 30, column: 18, scope: !66)
!66 = !{!"0xb\0030\009\002", !1, !63}             ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!67 = !{!"0x100\00i\0030\000", !66, !9, !19}      ; [ DW_TAG_auto_variable ] [i] [line 30]
!68 = !MDLocation(line: 31, column: 26, scope: !69)
!69 = !{!"0xb\0030\009\003", !1, !66}             ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!70 = !MDLocation(line: 31, column: 25, scope: !69)
!71 = !MDLocation(line: 31, column: 62, scope: !69)
!72 = !MDLocation(line: 31, column: 60, scope: !69)
!73 = !MDLocation(line: 31, column: 22, scope: !69)
!74 = !MDLocation(line: 31, column: 53, scope: !69)
!75 = !MDLocation(line: 31, column: 13, scope: !69)
!76 = !MDLocation(line: 30, column: 9, scope: !69)
!77 = !MDLocation(line: 30, column: 30, scope: !69)
!78 = !MDLocation(line: 30, column: 9, scope: !66)
!79 = !MDLocation(line: 29, column: 5, scope: !63)
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
!110 = !MDLocation(line: 51, column: 18, scope: !111)
!111 = !{!"0xb\0051\009\006", !1, !108}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!112 = !{!"0x100\00i\0051\000", !111, !9, !19}    ; [ DW_TAG_auto_variable ] [i] [line 51]
!113 = !MDLocation(line: 52, column: 25, scope: !114)
!114 = !{!"0xb\0051\009\007", !1, !111}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!115 = !MDLocation(line: 52, column: 22, scope: !114)
!116 = !MDLocation(line: 52, column: 30, scope: !114)
!117 = !MDLocation(line: 52, column: 37, scope: !114)
!118 = !MDLocation(line: 52, column: 13, scope: !114)
!119 = !MDLocation(line: 51, column: 9, scope: !114)
!120 = !MDLocation(line: 51, column: 30, scope: !114)
!121 = !MDLocation(line: 51, column: 9, scope: !111)
!122 = !MDLocation(line: 50, column: 5, scope: !108)
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
!143 = !MDLocation(line: 94, column: 10, scope: !141)
!144 = !MDLocation(line: 94, column: 29, scope: !145)
!145 = !{!"0xb\0094\005\009", !1, !141}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!146 = !MDLocation(line: 94, column: 25, scope: !145)
!147 = !MDLocation(line: 94, column: 5, scope: !141)
!148 = !MDLocation(line: 95, column: 33, scope: !149)
!149 = !{!"0xb\0095\009\0011", !1, !150}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!150 = !{!"0xb\0095\009\0010", !1, !145}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!151 = !MDLocation(line: 95, column: 29, scope: !149)
!152 = !MDLocation(line: 29, column: 18, scope: !58, inlinedAt: !153)
!153 = !MDLocation(line: 96, column: 13, scope: !149)
!154 = !MDLocation(line: 29, column: 10, scope: !58, inlinedAt: !153)
!155 = !MDLocation(line: 29, column: 26, scope: !63, inlinedAt: !153)
!156 = !MDLocation(line: 95, column: 9, scope: !150)
!157 = !MDLocation(line: 14, column: 36, scope: !8, inlinedAt: !153)
!158 = !{!"0x101\00in\0016777230\000", !8, !9, !12, !153} ; [ DW_TAG_arg_variable ] [in] [line 14]
!159 = !{!"0x101\00out\0033554447\000", !8, !9, !14, !153} ; [ DW_TAG_arg_variable ] [out] [line 15]
!160 = !MDLocation(line: 15, column: 19, scope: !8, inlinedAt: !153)
!161 = !{!"0x101\00kernel\0050331664\000", !8, !9, !15, !153} ; [ DW_TAG_arg_variable ] [kernel] [line 16]
!162 = !MDLocation(line: 16, column: 22, scope: !8, inlinedAt: !153)
!163 = !{!"0x101\00kn\0067108881\000", !8, !9, !18, !153} ; [ DW_TAG_arg_variable ] [kn] [line 17]
!164 = !MDLocation(line: 17, column: 13, scope: !8, inlinedAt: !153)
!165 = !{!"0x101\00m\0083886098\000", !8, !9, !18, !153} ; [ DW_TAG_arg_variable ] [m] [line 18]
!166 = !MDLocation(line: 18, column: 19, scope: !8, inlinedAt: !153)
!167 = !{!"0x101\00n\00100663315\000", !8, !9, !18, !153} ; [ DW_TAG_arg_variable ] [n] [line 19]
!168 = !MDLocation(line: 19, column: 19, scope: !8, inlinedAt: !153)
!169 = !{!"0x101\00size_x\00117440532\000", !8, !9, !18, !153} ; [ DW_TAG_arg_variable ] [size_x] [line 20]
!170 = !MDLocation(line: 20, column: 19, scope: !8, inlinedAt: !153)
!171 = !{!"0x101\00size_y\00134217749\000", !8, !9, !18, !153} ; [ DW_TAG_arg_variable ] [size_y] [line 21]
!172 = !MDLocation(line: 21, column: 19, scope: !8, inlinedAt: !153)
!173 = !{!"0x100\00khalf\0023\000", !8, !9, !18, !153} ; [ DW_TAG_auto_variable ] [khalf] [line 23]
!174 = !MDLocation(line: 23, column: 15, scope: !8, inlinedAt: !153)
!175 = !{!"0x100\00pixel\0025\000", !8, !9, !17, !153} ; [ DW_TAG_auto_variable ] [pixel] [line 25]
!176 = !MDLocation(line: 25, column: 11, scope: !8, inlinedAt: !153)
!177 = !{!"0x100\00c\0026\000", !8, !9, !19, !153} ; [ DW_TAG_auto_variable ] [c] [line 26]
!178 = !MDLocation(line: 26, column: 9, scope: !8, inlinedAt: !153)
!179 = !{!"0x100\00j\0029\000", !58, !9, !19, !153} ; [ DW_TAG_auto_variable ] [j] [line 29]
!180 = !MDLocation(line: 29, column: 14, scope: !58, inlinedAt: !153)
!181 = !MDLocation(line: 29, column: 5, scope: !58, inlinedAt: !153)
!182 = !MDLocation(line: 30, column: 18, scope: !66, inlinedAt: !153)
!183 = !{!"0x100\00i\0030\000", !66, !9, !19, !153} ; [ DW_TAG_auto_variable ] [i] [line 30]
!184 = !MDLocation(line: 31, column: 26, scope: !69, inlinedAt: !153)
!185 = !MDLocation(line: 31, column: 25, scope: !69, inlinedAt: !153)
!186 = !MDLocation(line: 31, column: 62, scope: !69, inlinedAt: !153)
!187 = !MDLocation(line: 31, column: 60, scope: !69, inlinedAt: !153)
!188 = !MDLocation(line: 31, column: 22, scope: !69, inlinedAt: !153)
!189 = !MDLocation(line: 31, column: 53, scope: !69, inlinedAt: !153)
!190 = !MDLocation(line: 31, column: 13, scope: !69, inlinedAt: !153)
!191 = !MDLocation(line: 30, column: 9, scope: !69, inlinedAt: !153)
!192 = !MDLocation(line: 30, column: 9, scope: !66, inlinedAt: !153)
!193 = !MDLocation(line: 29, column: 5, scope: !63, inlinedAt: !153)
!194 = !MDLocation(line: 33, column: 27, scope: !8, inlinedAt: !153)
!195 = !MDLocation(line: 33, column: 9, scope: !8, inlinedAt: !153)
!196 = !MDLocation(line: 33, column: 5, scope: !8, inlinedAt: !153)
!197 = !MDLocation(line: 95, column: 9, scope: !149)
!198 = !MDLocation(line: 94, column: 5, scope: !145)
!199 = !MDLocation(line: 97, column: 1, scope: !25)
!200 = !{!"0x101\00in\0016777316\000", !28, !9, !23} ; [ DW_TAG_arg_variable ] [in] [line 100]
!201 = !MDLocation(line: 100, column: 26, scope: !28)
!202 = !{!"0x101\00out\0033554533\000", !28, !9, !24} ; [ DW_TAG_arg_variable ] [out] [line 101]
!203 = !MDLocation(line: 101, column: 20, scope: !28)
!204 = !{!"0x101\00kernel\0050331750\000", !28, !9, !15} ; [ DW_TAG_arg_variable ] [kernel] [line 102]
!205 = !MDLocation(line: 102, column: 22, scope: !28)
!206 = !{!"0x101\00kn\0067108967\000", !28, !9, !18} ; [ DW_TAG_arg_variable ] [kn] [line 103]
!207 = !MDLocation(line: 103, column: 19, scope: !28)
!208 = !{!"0x101\00dim_x\0083886184\000", !28, !9, !18} ; [ DW_TAG_arg_variable ] [dim_x] [line 104]
!209 = !MDLocation(line: 104, column: 19, scope: !28)
!210 = !{!"0x101\00dim_y\00100663401\000", !28, !9, !18} ; [ DW_TAG_arg_variable ] [dim_y] [line 105]
!211 = !MDLocation(line: 105, column: 19, scope: !28)
!212 = !MDLocation(line: 107, column: 23, scope: !28)
!213 = !{!"0x100\00khalf\00107\000", !28, !9, !18} ; [ DW_TAG_auto_variable ] [khalf] [line 107]
!214 = !MDLocation(line: 107, column: 15, scope: !28)
!215 = !{!"0x100\00m\00109\000", !216, !9, !19}   ; [ DW_TAG_auto_variable ] [m] [line 109]
!216 = !{!"0xb\00109\005\0012", !1, !28}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!217 = !MDLocation(line: 109, column: 14, scope: !216)
!218 = !MDLocation(line: 51, column: 9, scope: !111, inlinedAt: !219)
!219 = !MDLocation(line: 111, column: 10, scope: !220)
!220 = !{!"0xb\00110\009\0015", !1, !221}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!221 = !{!"0xb\00110\009\0014", !1, !222}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!222 = !{!"0xb\00109\005\0013", !1, !216}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!223 = !MDLocation(line: 109, column: 10, scope: !216)
!224 = !MDLocation(line: 109, column: 29, scope: !222)
!225 = !MDLocation(line: 109, column: 25, scope: !222)
!226 = !MDLocation(line: 109, column: 5, scope: !216)
!227 = !MDLocation(line: 110, column: 33, scope: !220)
!228 = !MDLocation(line: 110, column: 29, scope: !220)
!229 = !MDLocation(line: 50, column: 26, scope: !108, inlinedAt: !219)
!230 = !MDLocation(line: 110, column: 9, scope: !221)
!231 = !MDLocation(line: 54, column: 5, scope: !20, inlinedAt: !219)
!232 = !MDLocation(line: 37, column: 40, scope: !20, inlinedAt: !219)
!233 = !{!"0x101\00in\0016777253\000", !20, !9, !23, !219} ; [ DW_TAG_arg_variable ] [in] [line 37]
!234 = !{!"0x101\00out\0033554470\000", !20, !9, !24, !219} ; [ DW_TAG_arg_variable ] [out] [line 38]
!235 = !MDLocation(line: 38, column: 20, scope: !20, inlinedAt: !219)
!236 = !{!"0x101\00kernel\0050331687\000", !20, !9, !15, !219} ; [ DW_TAG_arg_variable ] [kernel] [line 39]
!237 = !MDLocation(line: 39, column: 22, scope: !20, inlinedAt: !219)
!238 = !{!"0x101\00kn\0067108904\000", !20, !9, !18, !219} ; [ DW_TAG_arg_variable ] [kn] [line 40]
!239 = !MDLocation(line: 40, column: 13, scope: !20, inlinedAt: !219)
!240 = !{!"0x101\00x\0083886121\000", !20, !9, !18, !219} ; [ DW_TAG_arg_variable ] [x] [line 41]
!241 = !MDLocation(line: 41, column: 19, scope: !20, inlinedAt: !219)
!242 = !{!"0x101\00y\00100663338\000", !20, !9, !18, !219} ; [ DW_TAG_arg_variable ] [y] [line 42]
!243 = !MDLocation(line: 42, column: 19, scope: !20, inlinedAt: !219)
!244 = !{!"0x100\00khalf\0044\000", !20, !9, !18, !219} ; [ DW_TAG_auto_variable ] [khalf] [line 44]
!245 = !MDLocation(line: 44, column: 15, scope: !20, inlinedAt: !219)
!246 = !{!"0x100\00pixel\0046\000", !20, !9, !17, !219} ; [ DW_TAG_auto_variable ] [pixel] [line 46]
!247 = !MDLocation(line: 46, column: 11, scope: !20, inlinedAt: !219)
!248 = !{!"0x100\00c\0047\000", !20, !9, !19, !219} ; [ DW_TAG_auto_variable ] [c] [line 47]
!249 = !MDLocation(line: 47, column: 9, scope: !20, inlinedAt: !219)
!250 = !{!"0x100\00j\0050\000", !103, !9, !19, !219} ; [ DW_TAG_auto_variable ] [j] [line 50]
!251 = !MDLocation(line: 50, column: 14, scope: !103, inlinedAt: !219)
!252 = !MDLocation(line: 50, column: 5, scope: !103, inlinedAt: !219)
!253 = !MDLocation(line: 51, column: 18, scope: !111, inlinedAt: !219)
!254 = !{!"0x100\00i\0051\000", !111, !9, !19, !219} ; [ DW_TAG_auto_variable ] [i] [line 51]
!255 = !MDLocation(line: 52, column: 25, scope: !114, inlinedAt: !219)
!256 = !MDLocation(line: 52, column: 22, scope: !114, inlinedAt: !219)
!257 = !MDLocation(line: 52, column: 30, scope: !114, inlinedAt: !219)
!258 = !MDLocation(line: 52, column: 37, scope: !114, inlinedAt: !219)
!259 = !MDLocation(line: 52, column: 13, scope: !114, inlinedAt: !219)
!260 = !MDLocation(line: 51, column: 9, scope: !114, inlinedAt: !219)
!261 = !MDLocation(line: 50, column: 5, scope: !108, inlinedAt: !219)
!262 = !MDLocation(line: 54, column: 17, scope: !20, inlinedAt: !219)
!263 = !MDLocation(line: 110, column: 9, scope: !220)
!264 = !MDLocation(line: 109, column: 5, scope: !222)
!265 = !MDLocation(line: 112, column: 1, scope: !28)
!266 = !{!"0x101\00in\0016777331\000", !29, !9, !23} ; [ DW_TAG_arg_variable ] [in] [line 115]
!267 = !MDLocation(line: 115, column: 26, scope: !29)
!268 = !{!"0x101\00out\0033554548\000", !29, !9, !24} ; [ DW_TAG_arg_variable ] [out] [line 116]
!269 = !MDLocation(line: 116, column: 20, scope: !29)
!270 = !{!"0x101\00kernel\0050331765\000", !29, !9, !15} ; [ DW_TAG_arg_variable ] [kernel] [line 117]
!271 = !MDLocation(line: 117, column: 22, scope: !29)
!272 = !{!"0x101\00kn\0067108982\000", !29, !9, !18} ; [ DW_TAG_arg_variable ] [kn] [line 118]
!273 = !MDLocation(line: 118, column: 19, scope: !29)
!274 = !{!"0x101\00dim_x\0083886199\000", !29, !9, !18} ; [ DW_TAG_arg_variable ] [dim_x] [line 119]
!275 = !MDLocation(line: 119, column: 19, scope: !29)
!276 = !{!"0x101\00dim_y\00100663416\000", !29, !9, !18} ; [ DW_TAG_arg_variable ] [dim_y] [line 120]
!277 = !MDLocation(line: 120, column: 19, scope: !29)
!278 = !MDLocation(line: 122, column: 23, scope: !29)
!279 = !{!"0x100\00khalf\00122\000", !29, !9, !18} ; [ DW_TAG_auto_variable ] [khalf] [line 122]
!280 = !MDLocation(line: 122, column: 15, scope: !29)
!281 = !{!"0x100\00y\00124\000", !282, !9, !19}   ; [ DW_TAG_auto_variable ] [y] [line 124]
!282 = !{!"0xb\00124\005\0016", !1, !29}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!283 = !MDLocation(line: 124, column: 14, scope: !282)
!284 = !MDLocation(line: 124, column: 10, scope: !282)
!285 = !MDLocation(line: 124, column: 29, scope: !286)
!286 = !{!"0xb\00124\005\0017", !1, !282}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!287 = !MDLocation(line: 124, column: 25, scope: !286)
!288 = !MDLocation(line: 124, column: 5, scope: !282)
!289 = !MDLocation(line: 125, column: 31, scope: !290)
!290 = !{!"0xb\00125\007\0019", !1, !291}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!291 = !{!"0xb\00125\007\0018", !1, !286}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!292 = !MDLocation(line: 125, column: 27, scope: !290)
!293 = !MDLocation(line: 130, column: 30, scope: !294)
!294 = !{!"0xb\00130\009\0022", !1, !295}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!295 = !{!"0xb\00130\009\0021", !1, !296}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!296 = !{!"0xb\00125\0051\0020", !1, !290}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!297 = !MDLocation(line: 126, column: 15, scope: !296)
!298 = !MDLocation(line: 125, column: 7, scope: !291)
!299 = !{!"0x100\00pixel\00126\000", !296, !9, !17} ; [ DW_TAG_auto_variable ] [pixel] [line 126]
!300 = !{!"0x100\00c\00127\000", !296, !9, !19}   ; [ DW_TAG_auto_variable ] [c] [line 127]
!301 = !MDLocation(line: 127, column: 13, scope: !296)
!302 = !MDLocation(line: 130, column: 9, scope: !295)
!303 = !MDLocation(line: 132, column: 25, scope: !304)
!304 = !{!"0xb\00131\0011\0024", !1, !305}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!305 = !{!"0xb\00131\0011\0023", !1, !294}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!306 = !MDLocation(line: 132, column: 22, scope: !304)
!307 = !MDLocation(line: 132, column: 32, scope: !304)
!308 = !MDLocation(line: 132, column: 41, scope: !304)
!309 = !MDLocation(line: 132, column: 13, scope: !304)
!310 = !MDLocation(line: 131, column: 11, scope: !304)
!311 = !MDLocation(line: 131, column: 32, scope: !304)
!312 = !MDLocation(line: 131, column: 11, scope: !305)
!313 = !MDLocation(line: 130, column: 9, scope: !294)
!314 = !MDLocation(line: 134, column: 21, scope: !296)
!315 = !MDLocation(line: 134, column: 9, scope: !296)
!316 = !MDLocation(line: 125, column: 7, scope: !290)
!317 = !MDLocation(line: 124, column: 5, scope: !286)
!318 = !MDLocation(line: 136, column: 1, scope: !29)
