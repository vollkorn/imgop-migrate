; ModuleID = 'convolve.opt.lr.inline.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @filter_kernel(i8* %in, i8* %out, float* %kernel, i32 %kn, i32 %m, i32 %n, i32 %size_x, i32 %size_y) #0 {
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
  %cmp15 = icmp slt i32 %div, %sub, !dbg !62
  br i1 %cmp15, label %for.end18, label %for.body.preheader, !dbg !64

for.body.preheader:                               ; preds = %entry
  br i1 %cmp15, label %for.body.preheader.split.us, label %for.body.preheader.for.body.preheader.split_crit_edge

for.body.preheader.for.body.preheader.split_crit_edge: ; preds = %for.body.preheader
  br label %for.body.preheader.split

for.body.preheader.split.us:                      ; preds = %for.body.preheader
  br label %for.body.us, !dbg !65

for.body.us:                                      ; preds = %for.inc16.us, %for.body.preheader.split.us
  %indvars.iv16.us = phi i64 [ %indvars.iv.next6.us, %for.inc16.us ], [ %0, %for.body.preheader.split.us ]
  br i1 true, label %for.inc16.us, label %for.body4.lr.ph.us, !dbg !65

for.body4.lr.ph.us:                               ; preds = %for.body.us
  br label %for.body4.us, !dbg !65

for.body4.us:                                     ; preds = %for.body4.us, %for.body4.lr.ph.us
  br i1 false, label %for.body4.us, label %for.inc16.loopexit.us, !dbg !65

for.inc16.us:                                     ; preds = %for.inc16.loopexit.us, %for.body.us
  %indvars.iv.next6.us = add nsw i64 %indvars.iv16.us, 1, !dbg !67
  %cmp.us = icmp slt i64 %indvars.iv16.us, %1, !dbg !62
  br i1 %cmp.us, label %for.body.us, label %for.end18.loopexit.us-lcssa.us, !dbg !64

for.inc16.loopexit.us:                            ; preds = %for.body4.us
  br label %for.inc16.us

for.end18.loopexit.us-lcssa.us:                   ; preds = %for.inc16.us
  br label %for.end18.loopexit

for.body.preheader.split:                         ; preds = %for.body.preheader.for.body.preheader.split_crit_edge
  br label %for.body, !dbg !65

for.body:                                         ; preds = %for.body.preheader.split, %for.inc16
  %pixel.018 = phi float [ %pixel.1.lcssa, %for.inc16 ], [ 0.000000e+00, %for.body.preheader.split ]
  %indvars.iv16 = phi i64 [ %indvars.iv.next6, %for.inc16 ], [ %0, %for.body.preheader.split ]
  br i1 false, label %for.inc16, label %for.body4.lr.ph, !dbg !65

for.body4.lr.ph:                                  ; preds = %for.body
  %6 = sub nsw i64 %2, %indvars.iv16, !dbg !68
  %7 = mul nsw i64 %6, %3, !dbg !70
  %8 = add nsw i64 %7, %4, !dbg !70
  %9 = mul nsw i64 %indvars.iv16, %5, !dbg !71
  %10 = sub i64 2, %9, !dbg !72
  br label %for.body4, !dbg !65

for.body4:                                        ; preds = %for.body4, %for.body4.lr.ph
  %pixel.15 = phi float [ %pixel.018, %for.body4.lr.ph ], [ %add15, %for.body4 ]
  %indvars.iv4 = phi i64 [ %0, %for.body4.lr.ph ], [ %indvars.iv.next, %for.body4 ]
  %11 = sub i64 %8, %indvars.iv4, !dbg !70
  %arrayidx = getelementptr inbounds i8* %in, i64 %11, !dbg !73
  %12 = load i8* %arrayidx, align 1, !dbg !73
  %conv = zext i8 %12 to i32, !dbg !73
  %conv7 = sitofp i32 %conv to float, !dbg !73
  %13 = sub i64 %10, %indvars.iv4, !dbg !72
  %arrayidx13 = getelementptr inbounds float* %kernel, i64 %13, !dbg !74
  %14 = load float* %arrayidx13, align 4, !dbg !74
  %mul14 = fmul float %14, %conv7, !dbg !73
  %add15 = fadd float %pixel.15, %mul14, !dbg !75
  tail call void @llvm.dbg.value(metadata float %add15, i64 0, metadata !53, metadata !34), !dbg !54
  %indvars.iv.next = add nsw i64 %indvars.iv4, 1, !dbg !76
  %cmp3 = icmp slt i64 %indvars.iv4, %1, !dbg !77
  br i1 %cmp3, label %for.body4, label %for.inc16.loopexit, !dbg !65

for.inc16.loopexit:                               ; preds = %for.body4
  br label %for.inc16

for.inc16:                                        ; preds = %for.inc16.loopexit, %for.body
  %pixel.1.lcssa = phi float [ %pixel.018, %for.body ], [ %add15, %for.inc16.loopexit ]
  %indvars.iv.next6 = add nsw i64 %indvars.iv16, 1, !dbg !67
  %cmp = icmp slt i64 %indvars.iv16, %1, !dbg !62
  br i1 %cmp, label %for.body, label %for.end18.loopexit.us-lcssa, !dbg !64

for.end18.loopexit.us-lcssa:                      ; preds = %for.inc16
  br label %for.end18.loopexit

for.end18.loopexit:                               ; preds = %for.end18.loopexit.us-lcssa.us, %for.end18.loopexit.us-lcssa
  %pixel.1.lcssa.lcssa = phi float [ %pixel.1.lcssa, %for.end18.loopexit.us-lcssa ], [ 0.000000e+00, %for.end18.loopexit.us-lcssa.us ]
  br label %for.end18

for.end18:                                        ; preds = %for.end18.loopexit, %entry
  %pixel.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %pixel.1.lcssa.lcssa, %for.end18.loopexit ]
  %conv19 = fptoui float %pixel.0.lcssa to i8, !dbg !78
  %mul20 = mul nsw i32 %size_x, %n, !dbg !79
  %add21 = add nsw i32 %mul20, %m, !dbg !79
  %idxprom22 = sext i32 %add21 to i64, !dbg !80
  %arrayidx23 = getelementptr inbounds i8* %out, i64 %idxprom22, !dbg !80
  store i8 %conv19, i8* %arrayidx23, align 1, !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @filter_kernel_2d(i8** %in, i8** %out, float* %kernel, i32 %kn, i32 %x, i32 %y) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i8** %in, i64 0, metadata !82, metadata !34), !dbg !83
  tail call void @llvm.dbg.value(metadata i8** %out, i64 0, metadata !84, metadata !34), !dbg !85
  tail call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !86, metadata !34), !dbg !87
  tail call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !88, metadata !34), !dbg !89
  tail call void @llvm.dbg.value(metadata i32 %x, i64 0, metadata !90, metadata !34), !dbg !91
  tail call void @llvm.dbg.value(metadata i32 %y, i64 0, metadata !92, metadata !34), !dbg !93
  %div = sdiv i32 %kn, 2, !dbg !94
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !95, metadata !34), !dbg !96
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !97, metadata !34), !dbg !98
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !99, metadata !34), !dbg !100
  %sub = sub nsw i32 0, %div, !dbg !101
  tail call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !103, metadata !34), !dbg !104
  %0 = sext i32 %sub to i64
  %1 = sext i32 %div to i64, !dbg !105
  %2 = sext i32 %x to i64, !dbg !105
  %3 = sext i32 %y to i64, !dbg !105
  %cmp11 = icmp slt i32 %div, %sub, !dbg !106
  br i1 %cmp11, label %for.end15, label %for.body.preheader, !dbg !108

for.body.preheader:                               ; preds = %entry
  br i1 %cmp11, label %for.body.preheader.split.us, label %for.body.preheader.for.body.preheader.split_crit_edge

for.body.preheader.for.body.preheader.split_crit_edge: ; preds = %for.body.preheader
  br label %for.body.preheader.split

for.body.preheader.split.us:                      ; preds = %for.body.preheader
  br label %for.body.us

for.body.us:                                      ; preds = %for.inc13.us, %for.body.preheader.split.us
  %indvars.iv12.us = phi i64 [ %indvars.iv.next9.us, %for.inc13.us ], [ %0, %for.body.preheader.split.us ]
  br i1 true, label %for.inc13.us, label %for.body4.lr.ph.us, !dbg !109

for.body4.lr.ph.us:                               ; preds = %for.body.us
  br label %for.body4.us, !dbg !109

for.body4.us:                                     ; preds = %for.body4.us, %for.body4.lr.ph.us
  br i1 false, label %for.body4.us, label %for.inc13.loopexit.us, !dbg !109

for.inc13.us:                                     ; preds = %for.inc13.loopexit.us, %for.body.us
  %indvars.iv.next9.us = add nsw i64 %indvars.iv12.us, 1, !dbg !111
  %cmp.us = icmp slt i64 %indvars.iv12.us, %1, !dbg !106
  br i1 %cmp.us, label %for.body.us, label %for.end15.loopexit.us-lcssa.us, !dbg !108

for.inc13.loopexit.us:                            ; preds = %for.body4.us
  br label %for.inc13.us

for.end15.loopexit.us-lcssa.us:                   ; preds = %for.inc13.us
  br label %for.end15.loopexit

for.body.preheader.split:                         ; preds = %for.body.preheader.for.body.preheader.split_crit_edge
  br label %for.body

for.body:                                         ; preds = %for.body.preheader.split, %for.inc13
  %c.015 = phi i64 [ %c.1.lcssa.wide, %for.inc13 ], [ 0, %for.body.preheader.split ]
  %pixel.014 = phi float [ %pixel.1.lcssa, %for.inc13 ], [ 0.000000e+00, %for.body.preheader.split ]
  %indvars.iv12 = phi i64 [ %indvars.iv.next9, %for.inc13 ], [ %0, %for.body.preheader.split ]
  %sext = shl i64 %c.015, 32
  %4 = ashr exact i64 %sext, 32
  br i1 false, label %for.inc13, label %for.body4.lr.ph, !dbg !109

for.body4.lr.ph:                                  ; preds = %for.body
  %5 = add nsw i64 %indvars.iv12, %3, !dbg !112
  %arrayidx = getelementptr inbounds i8** %in, i64 %5, !dbg !114
  %6 = load i8** %arrayidx, align 8, !dbg !114
  br label %for.body4, !dbg !109

for.body4:                                        ; preds = %for.body4, %for.body4.lr.ph
  %pixel.17 = phi float [ %pixel.014, %for.body4.lr.ph ], [ %add11, %for.body4 ]
  %indvars.iv6 = phi i64 [ %4, %for.body4.lr.ph ], [ %indvars.iv.next, %for.body4 ]
  %indvars.iv15 = phi i64 [ %0, %for.body4.lr.ph ], [ %indvars.iv.next2, %for.body4 ]
  %7 = add nsw i64 %indvars.iv15, %2, !dbg !115
  %arrayidx7 = getelementptr inbounds i8* %6, i64 %7, !dbg !114
  %8 = load i8* %arrayidx7, align 1, !dbg !114
  %conv = zext i8 %8 to i32, !dbg !114
  %conv8 = sitofp i32 %conv to float, !dbg !114
  %indvars.iv.next = add nsw i64 %indvars.iv6, 1, !dbg !116
  %arrayidx10 = getelementptr inbounds float* %kernel, i64 %indvars.iv6, !dbg !117
  %9 = load float* %arrayidx10, align 4, !dbg !117
  %mul = fmul float %9, %conv8, !dbg !114
  %add11 = fadd float %pixel.17, %mul, !dbg !118
  tail call void @llvm.dbg.value(metadata float %add11, i64 0, metadata !97, metadata !34), !dbg !98
  %indvars.iv.next2 = add nsw i64 %indvars.iv15, 1, !dbg !116
  %cmp3 = icmp slt i64 %indvars.iv15, %1, !dbg !119
  br i1 %cmp3, label %for.body4, label %for.inc13.loopexit, !dbg !109

for.inc13.loopexit:                               ; preds = %for.body4
  br label %for.inc13

for.inc13:                                        ; preds = %for.inc13.loopexit, %for.body
  %c.1.lcssa.wide = phi i64 [ %4, %for.body ], [ %indvars.iv.next, %for.inc13.loopexit ]
  %pixel.1.lcssa = phi float [ %pixel.014, %for.body ], [ %add11, %for.inc13.loopexit ]
  %indvars.iv.next9 = add nsw i64 %indvars.iv12, 1, !dbg !111
  %cmp = icmp slt i64 %indvars.iv12, %1, !dbg !106
  br i1 %cmp, label %for.body, label %for.end15.loopexit.us-lcssa, !dbg !108

for.end15.loopexit.us-lcssa:                      ; preds = %for.inc13
  br label %for.end15.loopexit

for.end15.loopexit:                               ; preds = %for.end15.loopexit.us-lcssa.us, %for.end15.loopexit.us-lcssa
  %pixel.1.lcssa.lcssa = phi float [ %pixel.1.lcssa, %for.end15.loopexit.us-lcssa ], [ 0.000000e+00, %for.end15.loopexit.us-lcssa.us ]
  br label %for.end15

for.end15:                                        ; preds = %for.end15.loopexit, %entry
  %pixel.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %pixel.1.lcssa.lcssa, %for.end15.loopexit ]
  %conv16 = fptoui float %pixel.0.lcssa to i8, !dbg !120
  %arrayidx19 = getelementptr inbounds i8** %out, i64 %3, !dbg !121
  %10 = load i8** %arrayidx19, align 8, !dbg !121
  %arrayidx20 = getelementptr inbounds i8* %10, i64 %2, !dbg !121
  store i8 %conv16, i8* %arrayidx20, align 1, !dbg !121
  ret void, !dbg !122
}

; Function Attrs: nounwind uwtable
define void @convolve_arr_linear(i8* %in, i8* %out, float* %kernel, i32 %kn, i32 %dim_x, i32 %dim_y) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i8* %in, i64 0, metadata !123, metadata !34), !dbg !124
  tail call void @llvm.dbg.value(metadata i8* %out, i64 0, metadata !125, metadata !34), !dbg !126
  tail call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !127, metadata !34), !dbg !128
  tail call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !129, metadata !34), !dbg !130
  tail call void @llvm.dbg.value(metadata i32 %dim_x, i64 0, metadata !131, metadata !34), !dbg !132
  tail call void @llvm.dbg.value(metadata i32 %dim_y, i64 0, metadata !133, metadata !34), !dbg !134
  %div = sdiv i32 %kn, 2, !dbg !135
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !136, metadata !34), !dbg !137
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !138, metadata !34), !dbg !140
  %sub = sub nsw i32 %dim_x, %div, !dbg !141
  %cmp4 = icmp slt i32 %div, %sub, !dbg !143
  br i1 %cmp4, label %for.body.lr.ph, label %for.end7, !dbg !144

for.body.lr.ph:                                   ; preds = %entry
  %sub2 = sub nsw i32 %dim_y, %div, !dbg !145
  %cmp31 = icmp slt i32 %div, %sub2, !dbg !148
  %sub.i = sub nsw i32 0, %div, !dbg !149
  %0 = sext i32 %sub.i to i64, !dbg !150
  %1 = sext i32 %div to i64, !dbg !151
  %2 = sext i32 %dim_x to i64, !dbg !151
  %3 = sext i32 %kn to i64, !dbg !151
  %cmp15.i = icmp slt i32 %div, %sub.i, !dbg !152
  br label %for.body, !dbg !144

for.body:                                         ; preds = %for.inc5, %for.body.lr.ph
  %m.05 = phi i32 [ %div, %for.body.lr.ph ], [ %inc6, %for.inc5 ]
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !153, metadata !34), !dbg !154
  br i1 %cmp31, label %for.body4.lr.ph, label %for.inc5, !dbg !155

for.body4.lr.ph:                                  ; preds = %for.body
  %4 = sext i32 %m.05 to i64, !dbg !151
  br label %for.body4, !dbg !155

for.body4:                                        ; preds = %filter_kernel.exit, %for.body4.lr.ph
  %n.02 = phi i32 [ %div, %for.body4.lr.ph ], [ %inc, %filter_kernel.exit ]
  tail call void @llvm.dbg.value(metadata i8* %in, i64 0, metadata !156, metadata !34), !dbg !157
  tail call void @llvm.dbg.value(metadata i8* %out, i64 0, metadata !158, metadata !34), !dbg !159
  tail call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !160, metadata !34), !dbg !161
  tail call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !162, metadata !34), !dbg !163
  tail call void @llvm.dbg.value(metadata i32 %m.05, i64 0, metadata !164, metadata !34), !dbg !165
  tail call void @llvm.dbg.value(metadata i32 %n.02, i64 0, metadata !166, metadata !34), !dbg !167
  tail call void @llvm.dbg.value(metadata i32 %dim_x, i64 0, metadata !168, metadata !34), !dbg !169
  tail call void @llvm.dbg.value(metadata i32 %dim_y, i64 0, metadata !170, metadata !34), !dbg !171
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !172, metadata !34), !dbg !173
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !174, metadata !34), !dbg !175
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !176, metadata !34), !dbg !177
  tail call void @llvm.dbg.value(metadata i32 %sub.i, i64 0, metadata !178, metadata !34), !dbg !179
  %5 = sext i32 %n.02 to i64, !dbg !151
  br i1 %cmp15.i, label %filter_kernel.exit, label %for.body.i.preheader, !dbg !180

for.body.i.preheader:                             ; preds = %for.body4
  br i1 %cmp15.i, label %for.body.i.preheader.split.us, label %for.body.i.preheader.for.body.i.preheader.split_crit_edge

for.body.i.preheader.for.body.i.preheader.split_crit_edge: ; preds = %for.body.i.preheader
  br label %for.body.i.preheader.split

for.body.i.preheader.split.us:                    ; preds = %for.body.i.preheader
  br label %for.body.i.us, !dbg !181

for.body.i.us:                                    ; preds = %for.end.i.us, %for.body.i.preheader.split.us
  %indvars.iv16.i.us = phi i64 [ %indvars.iv.next6.i.us, %for.end.i.us ], [ %0, %for.body.i.preheader.split.us ], !dbg !150
  br i1 true, label %for.end.i.us, label %for.body4.lr.ph.i.us, !dbg !181

for.body4.lr.ph.i.us:                             ; preds = %for.body.i.us
  br label %for.body4.i.us, !dbg !181

for.body4.i.us:                                   ; preds = %for.body4.i.us, %for.body4.lr.ph.i.us
  br i1 false, label %for.body4.i.us, label %for.end.i.loopexit.us, !dbg !181

for.end.i.us:                                     ; preds = %for.end.i.loopexit.us, %for.body.i.us
  %indvars.iv.next6.i.us = add nsw i64 %indvars.iv16.i.us, 1, !dbg !182
  %cmp.i.us = icmp slt i64 %indvars.iv16.i.us, %1, !dbg !152
  br i1 %cmp.i.us, label %for.body.i.us, label %filter_kernel.exit.loopexit.us-lcssa.us, !dbg !180

for.end.i.loopexit.us:                            ; preds = %for.body4.i.us
  br label %for.end.i.us

filter_kernel.exit.loopexit.us-lcssa.us:          ; preds = %for.end.i.us
  br label %filter_kernel.exit.loopexit

for.body.i.preheader.split:                       ; preds = %for.body.i.preheader.for.body.i.preheader.split_crit_edge
  br label %for.body.i, !dbg !181

for.body.i:                                       ; preds = %for.body.i.preheader.split, %for.end.i
  %pixel.018.i = phi float [ %pixel.1.lcssa.i, %for.end.i ], [ 0.000000e+00, %for.body.i.preheader.split ], !dbg !150
  %indvars.iv16.i = phi i64 [ %indvars.iv.next6.i, %for.end.i ], [ %0, %for.body.i.preheader.split ], !dbg !150
  br i1 false, label %for.end.i, label %for.body4.lr.ph.i, !dbg !181

for.body4.lr.ph.i:                                ; preds = %for.body.i
  %6 = sub nsw i64 %5, %indvars.iv16.i, !dbg !183
  %7 = mul nsw i64 %6, %2, !dbg !184
  %8 = add nsw i64 %7, %4, !dbg !184
  %9 = mul nsw i64 %indvars.iv16.i, %3, !dbg !185
  %10 = sub i64 2, %9, !dbg !186
  br label %for.body4.i, !dbg !181

for.body4.i:                                      ; preds = %for.body4.i, %for.body4.lr.ph.i
  %pixel.15.i = phi float [ %pixel.018.i, %for.body4.lr.ph.i ], [ %add15.i, %for.body4.i ], !dbg !150
  %indvars.iv4.i = phi i64 [ %0, %for.body4.lr.ph.i ], [ %indvars.iv.next.i, %for.body4.i ], !dbg !150
  %11 = sub i64 %8, %indvars.iv4.i, !dbg !184
  %arrayidx.i = getelementptr inbounds i8* %in, i64 %11, !dbg !187
  %12 = load i8* %arrayidx.i, align 1, !dbg !187
  %conv.i = zext i8 %12 to i32, !dbg !187
  %conv7.i = sitofp i32 %conv.i to float, !dbg !187
  %13 = sub i64 %10, %indvars.iv4.i, !dbg !186
  %arrayidx13.i = getelementptr inbounds float* %kernel, i64 %13, !dbg !188
  %14 = load float* %arrayidx13.i, align 4, !dbg !188
  %mul14.i = fmul float %14, %conv7.i, !dbg !187
  %add15.i = fadd float %pixel.15.i, %mul14.i, !dbg !189
  tail call void @llvm.dbg.value(metadata float %add15.i, i64 0, metadata !174, metadata !34), !dbg !175
  %indvars.iv.next.i = add nsw i64 %indvars.iv4.i, 1, !dbg !190
  %cmp3.i = icmp slt i64 %indvars.iv4.i, %1, !dbg !191
  br i1 %cmp3.i, label %for.body4.i, label %for.end.i.loopexit, !dbg !181

for.end.i.loopexit:                               ; preds = %for.body4.i
  br label %for.end.i

for.end.i:                                        ; preds = %for.end.i.loopexit, %for.body.i
  %pixel.1.lcssa.i = phi float [ %pixel.018.i, %for.body.i ], [ %add15.i, %for.end.i.loopexit ], !dbg !150
  %indvars.iv.next6.i = add nsw i64 %indvars.iv16.i, 1, !dbg !182
  %cmp.i = icmp slt i64 %indvars.iv16.i, %1, !dbg !152
  br i1 %cmp.i, label %for.body.i, label %filter_kernel.exit.loopexit.us-lcssa, !dbg !180

filter_kernel.exit.loopexit.us-lcssa:             ; preds = %for.end.i
  br label %filter_kernel.exit.loopexit

filter_kernel.exit.loopexit:                      ; preds = %filter_kernel.exit.loopexit.us-lcssa.us, %filter_kernel.exit.loopexit.us-lcssa
  %pixel.1.lcssa.i.lcssa = phi float [ %pixel.1.lcssa.i, %filter_kernel.exit.loopexit.us-lcssa ], [ 0.000000e+00, %filter_kernel.exit.loopexit.us-lcssa.us ]
  br label %filter_kernel.exit

filter_kernel.exit:                               ; preds = %filter_kernel.exit.loopexit, %for.body4
  %pixel.0.lcssa.i = phi float [ 0.000000e+00, %for.body4 ], [ %pixel.1.lcssa.i.lcssa, %filter_kernel.exit.loopexit ], !dbg !150
  %conv19.i = fptoui float %pixel.0.lcssa.i to i8, !dbg !192
  %mul20.i = mul nsw i32 %n.02, %dim_x, !dbg !193
  %add21.i = add nsw i32 %mul20.i, %m.05, !dbg !193
  %idxprom22.i = sext i32 %add21.i to i64, !dbg !194
  %arrayidx23.i = getelementptr inbounds i8* %out, i64 %idxprom22.i, !dbg !194
  store i8 %conv19.i, i8* %arrayidx23.i, align 1, !dbg !194
  %inc = add nsw i32 %n.02, 1, !dbg !195
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !153, metadata !34), !dbg !154
  %cmp3 = icmp slt i32 %inc, %sub2, !dbg !148
  br i1 %cmp3, label %for.body4, label %for.inc5.loopexit, !dbg !155

for.inc5.loopexit:                                ; preds = %filter_kernel.exit
  br label %for.inc5

for.inc5:                                         ; preds = %for.inc5.loopexit, %for.body
  %inc6 = add nsw i32 %m.05, 1, !dbg !196
  tail call void @llvm.dbg.value(metadata i32 %inc6, i64 0, metadata !138, metadata !34), !dbg !140
  %cmp = icmp slt i32 %inc6, %sub, !dbg !143
  br i1 %cmp, label %for.body, label %for.end7.loopexit, !dbg !144

for.end7.loopexit:                                ; preds = %for.inc5
  br label %for.end7

for.end7:                                         ; preds = %for.end7.loopexit, %entry
  ret void, !dbg !197
}

; Function Attrs: nounwind uwtable
define void @convolve_arr_indirection(i8** %in, i8** %out, float* %kernel, i32 %kn, i32 %dim_x, i32 %dim_y) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i8** %in, i64 0, metadata !198, metadata !34), !dbg !199
  tail call void @llvm.dbg.value(metadata i8** %out, i64 0, metadata !200, metadata !34), !dbg !201
  tail call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !202, metadata !34), !dbg !203
  tail call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !204, metadata !34), !dbg !205
  tail call void @llvm.dbg.value(metadata i32 %dim_x, i64 0, metadata !206, metadata !34), !dbg !207
  tail call void @llvm.dbg.value(metadata i32 %dim_y, i64 0, metadata !208, metadata !34), !dbg !209
  %div = sdiv i32 %kn, 2, !dbg !210
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !211, metadata !34), !dbg !212
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !213, metadata !34), !dbg !215
  %sub = sub nsw i32 %dim_x, %div, !dbg !216
  %cmp4 = icmp slt i32 %div, %sub, !dbg !218
  br i1 %cmp4, label %for.body.lr.ph, label %for.end7, !dbg !219

for.body.lr.ph:                                   ; preds = %entry
  %sub2 = sub nsw i32 %dim_y, %div, !dbg !220
  %cmp31 = icmp slt i32 %div, %sub2, !dbg !223
  %sub.i = sub nsw i32 0, %div, !dbg !224
  %0 = sext i32 %sub.i to i64, !dbg !225
  %1 = sext i32 %div to i64, !dbg !226
  %cmp11.i = icmp slt i32 %div, %sub.i, !dbg !227
  br label %for.body, !dbg !219

for.body:                                         ; preds = %for.inc5, %for.body.lr.ph
  %m.05 = phi i32 [ %div, %for.body.lr.ph ], [ %inc6, %for.inc5 ]
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !228, metadata !34), !dbg !229
  br i1 %cmp31, label %for.body4.lr.ph, label %for.inc5, !dbg !230

for.body4.lr.ph:                                  ; preds = %for.body
  %2 = sext i32 %m.05 to i64, !dbg !226
  %arrayidx19.i = getelementptr inbounds i8** %out, i64 %2, !dbg !231
  br label %for.body4, !dbg !230

for.body4:                                        ; preds = %filter_kernel_2d.exit, %for.body4.lr.ph
  %n.02 = phi i32 [ %div, %for.body4.lr.ph ], [ %inc, %filter_kernel_2d.exit ]
  tail call void @llvm.dbg.value(metadata i8** %in, i64 0, metadata !232, metadata !34), !dbg !233
  tail call void @llvm.dbg.value(metadata i8** %out, i64 0, metadata !234, metadata !34), !dbg !235
  tail call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !236, metadata !34), !dbg !237
  tail call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !238, metadata !34), !dbg !239
  tail call void @llvm.dbg.value(metadata i32 %n.02, i64 0, metadata !240, metadata !34), !dbg !241
  tail call void @llvm.dbg.value(metadata i32 %m.05, i64 0, metadata !242, metadata !34), !dbg !243
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !244, metadata !34), !dbg !245
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !246, metadata !34), !dbg !247
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !248, metadata !34), !dbg !249
  tail call void @llvm.dbg.value(metadata i32 %sub.i, i64 0, metadata !250, metadata !34), !dbg !251
  %3 = sext i32 %n.02 to i64, !dbg !226
  br i1 %cmp11.i, label %filter_kernel_2d.exit, label %for.body.i.preheader, !dbg !252

for.body.i.preheader:                             ; preds = %for.body4
  br i1 %cmp11.i, label %for.body.i.preheader.split.us, label %for.body.i.preheader.for.body.i.preheader.split_crit_edge

for.body.i.preheader.for.body.i.preheader.split_crit_edge: ; preds = %for.body.i.preheader
  br label %for.body.i.preheader.split

for.body.i.preheader.split.us:                    ; preds = %for.body.i.preheader
  br label %for.body.i.us, !dbg !225

for.body.i.us:                                    ; preds = %for.end.i.us, %for.body.i.preheader.split.us
  %indvars.iv12.i.us = phi i64 [ %indvars.iv.next9.i.us, %for.end.i.us ], [ %0, %for.body.i.preheader.split.us ], !dbg !225
  br i1 true, label %for.end.i.us, label %for.body4.lr.ph.i.us, !dbg !253

for.body4.lr.ph.i.us:                             ; preds = %for.body.i.us
  br label %for.body4.i.us, !dbg !253

for.body4.i.us:                                   ; preds = %for.body4.i.us, %for.body4.lr.ph.i.us
  br i1 false, label %for.body4.i.us, label %for.end.i.loopexit.us, !dbg !253

for.end.i.us:                                     ; preds = %for.end.i.loopexit.us, %for.body.i.us
  %indvars.iv.next9.i.us = add nsw i64 %indvars.iv12.i.us, 1, !dbg !254
  %cmp.i.us = icmp slt i64 %indvars.iv12.i.us, %1, !dbg !227
  br i1 %cmp.i.us, label %for.body.i.us, label %filter_kernel_2d.exit.loopexit.us-lcssa.us, !dbg !252

for.end.i.loopexit.us:                            ; preds = %for.body4.i.us
  br label %for.end.i.us

filter_kernel_2d.exit.loopexit.us-lcssa.us:       ; preds = %for.end.i.us
  br label %filter_kernel_2d.exit.loopexit

for.body.i.preheader.split:                       ; preds = %for.body.i.preheader.for.body.i.preheader.split_crit_edge
  br label %for.body.i, !dbg !225

for.body.i:                                       ; preds = %for.body.i.preheader.split, %for.end.i
  %c.015.i = phi i64 [ %c.1.lcssa.wide.i, %for.end.i ], [ 0, %for.body.i.preheader.split ], !dbg !225
  %pixel.014.i = phi float [ %pixel.1.lcssa.i, %for.end.i ], [ 0.000000e+00, %for.body.i.preheader.split ], !dbg !225
  %indvars.iv12.i = phi i64 [ %indvars.iv.next9.i, %for.end.i ], [ %0, %for.body.i.preheader.split ], !dbg !225
  %sext = shl i64 %c.015.i, 32, !dbg !225
  %4 = ashr exact i64 %sext, 32, !dbg !225
  br i1 false, label %for.end.i, label %for.body4.lr.ph.i, !dbg !253

for.body4.lr.ph.i:                                ; preds = %for.body.i
  %5 = add nsw i64 %indvars.iv12.i, %2, !dbg !255
  %arrayidx.i = getelementptr inbounds i8** %in, i64 %5, !dbg !256
  %6 = load i8** %arrayidx.i, align 8, !dbg !256
  br label %for.body4.i, !dbg !253

for.body4.i:                                      ; preds = %for.body4.i, %for.body4.lr.ph.i
  %pixel.17.i = phi float [ %pixel.014.i, %for.body4.lr.ph.i ], [ %add11.i, %for.body4.i ], !dbg !225
  %indvars.iv6.i = phi i64 [ %4, %for.body4.lr.ph.i ], [ %indvars.iv.next.i, %for.body4.i ], !dbg !225
  %indvars.iv15.i = phi i64 [ %0, %for.body4.lr.ph.i ], [ %indvars.iv.next2.i, %for.body4.i ], !dbg !225
  %7 = add nsw i64 %indvars.iv15.i, %3, !dbg !257
  %arrayidx7.i = getelementptr inbounds i8* %6, i64 %7, !dbg !256
  %8 = load i8* %arrayidx7.i, align 1, !dbg !256
  %conv.i = zext i8 %8 to i32, !dbg !256
  %conv8.i = sitofp i32 %conv.i to float, !dbg !256
  %indvars.iv.next.i = add nsw i64 %indvars.iv6.i, 1, !dbg !258
  %arrayidx10.i = getelementptr inbounds float* %kernel, i64 %indvars.iv6.i, !dbg !259
  %9 = load float* %arrayidx10.i, align 4, !dbg !259
  %mul.i = fmul float %9, %conv8.i, !dbg !256
  %add11.i = fadd float %pixel.17.i, %mul.i, !dbg !260
  tail call void @llvm.dbg.value(metadata float %add11.i, i64 0, metadata !246, metadata !34), !dbg !247
  %indvars.iv.next2.i = add nsw i64 %indvars.iv15.i, 1, !dbg !258
  %cmp3.i = icmp slt i64 %indvars.iv15.i, %1, !dbg !261
  br i1 %cmp3.i, label %for.body4.i, label %for.end.i.loopexit, !dbg !253

for.end.i.loopexit:                               ; preds = %for.body4.i
  br label %for.end.i

for.end.i:                                        ; preds = %for.end.i.loopexit, %for.body.i
  %c.1.lcssa.wide.i = phi i64 [ %4, %for.body.i ], [ %indvars.iv.next.i, %for.end.i.loopexit ], !dbg !225
  %pixel.1.lcssa.i = phi float [ %pixel.014.i, %for.body.i ], [ %add11.i, %for.end.i.loopexit ], !dbg !225
  %indvars.iv.next9.i = add nsw i64 %indvars.iv12.i, 1, !dbg !254
  %cmp.i = icmp slt i64 %indvars.iv12.i, %1, !dbg !227
  br i1 %cmp.i, label %for.body.i, label %filter_kernel_2d.exit.loopexit.us-lcssa, !dbg !252

filter_kernel_2d.exit.loopexit.us-lcssa:          ; preds = %for.end.i
  br label %filter_kernel_2d.exit.loopexit

filter_kernel_2d.exit.loopexit:                   ; preds = %filter_kernel_2d.exit.loopexit.us-lcssa.us, %filter_kernel_2d.exit.loopexit.us-lcssa
  %pixel.1.lcssa.i.lcssa = phi float [ %pixel.1.lcssa.i, %filter_kernel_2d.exit.loopexit.us-lcssa ], [ 0.000000e+00, %filter_kernel_2d.exit.loopexit.us-lcssa.us ]
  br label %filter_kernel_2d.exit

filter_kernel_2d.exit:                            ; preds = %filter_kernel_2d.exit.loopexit, %for.body4
  %pixel.0.lcssa.i = phi float [ 0.000000e+00, %for.body4 ], [ %pixel.1.lcssa.i.lcssa, %filter_kernel_2d.exit.loopexit ], !dbg !225
  %conv16.i = fptoui float %pixel.0.lcssa.i to i8, !dbg !262
  %10 = load i8** %arrayidx19.i, align 8, !dbg !231
  %arrayidx20.i = getelementptr inbounds i8* %10, i64 %3, !dbg !231
  store i8 %conv16.i, i8* %arrayidx20.i, align 1, !dbg !231
  %inc = add nsw i32 %n.02, 1, !dbg !263
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !228, metadata !34), !dbg !229
  %cmp3 = icmp slt i32 %inc, %sub2, !dbg !223
  br i1 %cmp3, label %for.body4, label %for.inc5.loopexit, !dbg !230

for.inc5.loopexit:                                ; preds = %filter_kernel_2d.exit
  br label %for.inc5

for.inc5:                                         ; preds = %for.inc5.loopexit, %for.body
  %inc6 = add nsw i32 %m.05, 1, !dbg !264
  tail call void @llvm.dbg.value(metadata i32 %inc6, i64 0, metadata !213, metadata !34), !dbg !215
  %cmp = icmp slt i32 %inc6, %sub, !dbg !218
  br i1 %cmp, label %for.body, label %for.end7.loopexit, !dbg !219

for.end7.loopexit:                                ; preds = %for.inc5
  br label %for.end7

for.end7:                                         ; preds = %for.end7.loopexit, %entry
  ret void, !dbg !265
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
  %sub = sub nsw i32 %dim_x, %div, !dbg !285
  %3 = sext i32 %sub to i64, !dbg !287
  %cmp22 = icmp slt i32 %div, %sub, !dbg !287
  br i1 %cmp22, label %for.body.lr.ph, label %for.end34, !dbg !288

for.body.lr.ph:                                   ; preds = %entry
  %sub2 = sub nsw i32 %dim_y, %div, !dbg !289
  %4 = sext i32 %sub2 to i64, !dbg !292
  %cmp318 = icmp slt i32 %div, %sub2, !dbg !292
  %cmp711 = icmp slt i32 %div, %0, !dbg !293
  br label %for.body, !dbg !288

for.body:                                         ; preds = %for.inc32, %for.body.lr.ph
  %indvars.iv23 = phi i64 [ %2, %for.body.lr.ph ], [ %indvars.iv.next21, %for.inc32 ]
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !297, metadata !34), !dbg !298
  br i1 %cmp318, label %for.body4.preheader, label %for.inc32, !dbg !299

for.body4.preheader:                              ; preds = %for.body
  br label %for.body4, !dbg !300

for.body4:                                        ; preds = %for.body4.preheader, %for.end23
  %indvars.iv19 = phi i64 [ %indvars.iv.next17, %for.end23 ], [ %2, %for.body4.preheader ]
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !301, metadata !34), !dbg !300
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !302, metadata !34), !dbg !303
  br i1 %cmp711, label %for.end23, label %for.body8.preheader, !dbg !304

for.body8.preheader:                              ; preds = %for.body4
  br label %for.body8

for.body8:                                        ; preds = %for.body8.preheader, %for.inc21
  %c.015 = phi i64 [ %c.1.lcssa.wide, %for.inc21 ], [ 0, %for.body8.preheader ]
  %pixel.014 = phi float [ %pixel.1.lcssa, %for.inc21 ], [ 0.000000e+00, %for.body8.preheader ]
  %indvars.iv12 = phi i64 [ %indvars.iv.next9, %for.inc21 ], [ %1, %for.body8.preheader ]
  %sext = shl i64 %c.015, 32
  %5 = ashr exact i64 %sext, 32
  br i1 %cmp711, label %for.inc21, label %for.body12.lr.ph, !dbg !305

for.body12.lr.ph:                                 ; preds = %for.body8
  %6 = add nsw i64 %indvars.iv12, %indvars.iv19, !dbg !307
  %arrayidx = getelementptr inbounds i8** %in, i64 %6, !dbg !309
  %7 = load i8** %arrayidx, align 8, !dbg !309
  br label %for.body12, !dbg !305

for.body12:                                       ; preds = %for.body12, %for.body12.lr.ph
  %pixel.17 = phi float [ %pixel.014, %for.body12.lr.ph ], [ %add19, %for.body12 ]
  %indvars.iv6 = phi i64 [ %5, %for.body12.lr.ph ], [ %indvars.iv.next, %for.body12 ]
  %indvars.iv15 = phi i64 [ %1, %for.body12.lr.ph ], [ %indvars.iv.next2, %for.body12 ]
  %8 = add nsw i64 %indvars.iv15, %indvars.iv23, !dbg !310
  %arrayidx15 = getelementptr inbounds i8* %7, i64 %8, !dbg !309
  %9 = load i8* %arrayidx15, align 1, !dbg !309
  %conv = zext i8 %9 to i32, !dbg !309
  %conv16 = sitofp i32 %conv to float, !dbg !309
  %indvars.iv.next = add nsw i64 %indvars.iv6, 1, !dbg !311
  %arrayidx18 = getelementptr inbounds float* %kernel, i64 %indvars.iv6, !dbg !312
  %10 = load float* %arrayidx18, align 4, !dbg !312
  %mul = fmul float %10, %conv16, !dbg !309
  %add19 = fadd float %pixel.17, %mul, !dbg !313
  tail call void @llvm.dbg.value(metadata float %add19, i64 0, metadata !301, metadata !34), !dbg !300
  %indvars.iv.next2 = add nsw i64 %indvars.iv15, 1, !dbg !311
  %cmp11 = icmp slt i64 %indvars.iv15, %2, !dbg !314
  br i1 %cmp11, label %for.body12, label %for.inc21.loopexit, !dbg !305

for.inc21.loopexit:                               ; preds = %for.body12
  br label %for.inc21

for.inc21:                                        ; preds = %for.inc21.loopexit, %for.body8
  %c.1.lcssa.wide = phi i64 [ %5, %for.body8 ], [ %indvars.iv.next, %for.inc21.loopexit ]
  %pixel.1.lcssa = phi float [ %pixel.014, %for.body8 ], [ %add19, %for.inc21.loopexit ]
  %indvars.iv.next9 = add nsw i64 %indvars.iv12, 1, !dbg !315
  %cmp7 = icmp slt i64 %indvars.iv12, %2, !dbg !293
  br i1 %cmp7, label %for.body8, label %for.end23.loopexit, !dbg !304

for.end23.loopexit:                               ; preds = %for.inc21
  br label %for.end23

for.end23:                                        ; preds = %for.end23.loopexit, %for.body4
  %pixel.0.lcssa = phi float [ 0.000000e+00, %for.body4 ], [ %pixel.1.lcssa, %for.end23.loopexit ]
  %conv24 = fptoui float %pixel.0.lcssa to i8, !dbg !316
  %arrayidx27 = getelementptr inbounds i8** %out, i64 %indvars.iv19, !dbg !317
  %11 = load i8** %arrayidx27, align 8, !dbg !317
  %arrayidx28 = getelementptr inbounds i8* %11, i64 %indvars.iv23, !dbg !317
  store i8 %conv24, i8* %arrayidx28, align 1, !dbg !317
  %indvars.iv.next17 = add nsw i64 %indvars.iv19, 1, !dbg !318
  %cmp3 = icmp slt i64 %indvars.iv.next17, %4, !dbg !292
  br i1 %cmp3, label %for.body4, label %for.inc32.loopexit, !dbg !299

for.inc32.loopexit:                               ; preds = %for.end23
  br label %for.inc32

for.inc32:                                        ; preds = %for.inc32.loopexit, %for.body
  %indvars.iv.next21 = add nsw i64 %indvars.iv23, 1, !dbg !319
  %cmp = icmp slt i64 %indvars.iv.next21, %3, !dbg !287
  br i1 %cmp, label %for.body, label %for.end34.loopexit, !dbg !288

for.end34.loopexit:                               ; preds = %for.inc32
  br label %for.end34

for.end34:                                        ; preds = %for.end34.loopexit, %entry
  ret void, !dbg !320
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
!65 = !MDLocation(line: 30, column: 9, scope: !66)
!66 = !{!"0xb\0030\009\002", !1, !63}             ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!67 = !MDLocation(line: 29, column: 5, scope: !63)
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
!78 = !MDLocation(line: 33, column: 27, scope: !8)
!79 = !MDLocation(line: 33, column: 9, scope: !8)
!80 = !MDLocation(line: 33, column: 5, scope: !8)
!81 = !MDLocation(line: 35, column: 1, scope: !8)
!82 = !{!"0x101\00in\0016777253\000", !20, !9, !23} ; [ DW_TAG_arg_variable ] [in] [line 37]
!83 = !MDLocation(line: 37, column: 40, scope: !20)
!84 = !{!"0x101\00out\0033554470\000", !20, !9, !24} ; [ DW_TAG_arg_variable ] [out] [line 38]
!85 = !MDLocation(line: 38, column: 20, scope: !20)
!86 = !{!"0x101\00kernel\0050331687\000", !20, !9, !15} ; [ DW_TAG_arg_variable ] [kernel] [line 39]
!87 = !MDLocation(line: 39, column: 22, scope: !20)
!88 = !{!"0x101\00kn\0067108904\000", !20, !9, !18} ; [ DW_TAG_arg_variable ] [kn] [line 40]
!89 = !MDLocation(line: 40, column: 13, scope: !20)
!90 = !{!"0x101\00x\0083886121\000", !20, !9, !18} ; [ DW_TAG_arg_variable ] [x] [line 41]
!91 = !MDLocation(line: 41, column: 19, scope: !20)
!92 = !{!"0x101\00y\00100663338\000", !20, !9, !18} ; [ DW_TAG_arg_variable ] [y] [line 42]
!93 = !MDLocation(line: 42, column: 19, scope: !20)
!94 = !MDLocation(line: 44, column: 23, scope: !20)
!95 = !{!"0x100\00khalf\0044\000", !20, !9, !18}  ; [ DW_TAG_auto_variable ] [khalf] [line 44]
!96 = !MDLocation(line: 44, column: 15, scope: !20)
!97 = !{!"0x100\00pixel\0046\000", !20, !9, !17}  ; [ DW_TAG_auto_variable ] [pixel] [line 46]
!98 = !MDLocation(line: 46, column: 11, scope: !20)
!99 = !{!"0x100\00c\0047\000", !20, !9, !19}      ; [ DW_TAG_auto_variable ] [c] [line 47]
!100 = !MDLocation(line: 47, column: 9, scope: !20)
!101 = !MDLocation(line: 50, column: 18, scope: !102)
!102 = !{!"0xb\0050\005\004", !1, !20}            ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!103 = !{!"0x100\00j\0050\000", !102, !9, !19}    ; [ DW_TAG_auto_variable ] [j] [line 50]
!104 = !MDLocation(line: 50, column: 14, scope: !102)
!105 = !MDLocation(line: 50, column: 10, scope: !102)
!106 = !MDLocation(line: 50, column: 26, scope: !107)
!107 = !{!"0xb\0050\005\005", !1, !102}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!108 = !MDLocation(line: 50, column: 5, scope: !102)
!109 = !MDLocation(line: 51, column: 9, scope: !110)
!110 = !{!"0xb\0051\009\006", !1, !107}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!111 = !MDLocation(line: 50, column: 5, scope: !107)
!112 = !MDLocation(line: 52, column: 25, scope: !113)
!113 = !{!"0xb\0051\009\007", !1, !110}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!114 = !MDLocation(line: 52, column: 22, scope: !113)
!115 = !MDLocation(line: 52, column: 30, scope: !113)
!116 = !MDLocation(line: 51, column: 9, scope: !113)
!117 = !MDLocation(line: 52, column: 37, scope: !113)
!118 = !MDLocation(line: 52, column: 13, scope: !113)
!119 = !MDLocation(line: 51, column: 30, scope: !113)
!120 = !MDLocation(line: 54, column: 17, scope: !20)
!121 = !MDLocation(line: 54, column: 5, scope: !20)
!122 = !MDLocation(line: 56, column: 1, scope: !20)
!123 = !{!"0x101\00in\0016777300\000", !25, !9, !12} ; [ DW_TAG_arg_variable ] [in] [line 84]
!124 = !MDLocation(line: 84, column: 25, scope: !25)
!125 = !{!"0x101\00out\0033554517\000", !25, !9, !14} ; [ DW_TAG_arg_variable ] [out] [line 85]
!126 = !MDLocation(line: 85, column: 19, scope: !25)
!127 = !{!"0x101\00kernel\0050331734\000", !25, !9, !15} ; [ DW_TAG_arg_variable ] [kernel] [line 86]
!128 = !MDLocation(line: 86, column: 22, scope: !25)
!129 = !{!"0x101\00kn\0067108951\000", !25, !9, !18} ; [ DW_TAG_arg_variable ] [kn] [line 87]
!130 = !MDLocation(line: 87, column: 19, scope: !25)
!131 = !{!"0x101\00dim_x\0083886168\000", !25, !9, !18} ; [ DW_TAG_arg_variable ] [dim_x] [line 88]
!132 = !MDLocation(line: 88, column: 19, scope: !25)
!133 = !{!"0x101\00dim_y\00100663385\000", !25, !9, !18} ; [ DW_TAG_arg_variable ] [dim_y] [line 89]
!134 = !MDLocation(line: 89, column: 19, scope: !25)
!135 = !MDLocation(line: 92, column: 23, scope: !25)
!136 = !{!"0x100\00khalf\0092\000", !25, !9, !18} ; [ DW_TAG_auto_variable ] [khalf] [line 92]
!137 = !MDLocation(line: 92, column: 15, scope: !25)
!138 = !{!"0x100\00m\0094\000", !139, !9, !19}    ; [ DW_TAG_auto_variable ] [m] [line 94]
!139 = !{!"0xb\0094\005\008", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!140 = !MDLocation(line: 94, column: 14, scope: !139)
!141 = !MDLocation(line: 94, column: 29, scope: !142)
!142 = !{!"0xb\0094\005\009", !1, !139}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!143 = !MDLocation(line: 94, column: 25, scope: !142)
!144 = !MDLocation(line: 94, column: 5, scope: !139)
!145 = !MDLocation(line: 95, column: 33, scope: !146)
!146 = !{!"0xb\0095\009\0011", !1, !147}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!147 = !{!"0xb\0095\009\0010", !1, !142}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!148 = !MDLocation(line: 95, column: 29, scope: !146)
!149 = !MDLocation(line: 29, column: 18, scope: !58, inlinedAt: !150)
!150 = !MDLocation(line: 96, column: 13, scope: !146)
!151 = !MDLocation(line: 29, column: 10, scope: !58, inlinedAt: !150)
!152 = !MDLocation(line: 29, column: 26, scope: !63, inlinedAt: !150)
!153 = !{!"0x100\00n\0095\000", !147, !9, !19}    ; [ DW_TAG_auto_variable ] [n] [line 95]
!154 = !MDLocation(line: 95, column: 18, scope: !147)
!155 = !MDLocation(line: 95, column: 9, scope: !147)
!156 = !{!"0x101\00in\0016777230\000", !8, !9, !12, !150} ; [ DW_TAG_arg_variable ] [in] [line 14]
!157 = !MDLocation(line: 14, column: 36, scope: !8, inlinedAt: !150)
!158 = !{!"0x101\00out\0033554447\000", !8, !9, !14, !150} ; [ DW_TAG_arg_variable ] [out] [line 15]
!159 = !MDLocation(line: 15, column: 19, scope: !8, inlinedAt: !150)
!160 = !{!"0x101\00kernel\0050331664\000", !8, !9, !15, !150} ; [ DW_TAG_arg_variable ] [kernel] [line 16]
!161 = !MDLocation(line: 16, column: 22, scope: !8, inlinedAt: !150)
!162 = !{!"0x101\00kn\0067108881\000", !8, !9, !18, !150} ; [ DW_TAG_arg_variable ] [kn] [line 17]
!163 = !MDLocation(line: 17, column: 13, scope: !8, inlinedAt: !150)
!164 = !{!"0x101\00m\0083886098\000", !8, !9, !18, !150} ; [ DW_TAG_arg_variable ] [m] [line 18]
!165 = !MDLocation(line: 18, column: 19, scope: !8, inlinedAt: !150)
!166 = !{!"0x101\00n\00100663315\000", !8, !9, !18, !150} ; [ DW_TAG_arg_variable ] [n] [line 19]
!167 = !MDLocation(line: 19, column: 19, scope: !8, inlinedAt: !150)
!168 = !{!"0x101\00size_x\00117440532\000", !8, !9, !18, !150} ; [ DW_TAG_arg_variable ] [size_x] [line 20]
!169 = !MDLocation(line: 20, column: 19, scope: !8, inlinedAt: !150)
!170 = !{!"0x101\00size_y\00134217749\000", !8, !9, !18, !150} ; [ DW_TAG_arg_variable ] [size_y] [line 21]
!171 = !MDLocation(line: 21, column: 19, scope: !8, inlinedAt: !150)
!172 = !{!"0x100\00khalf\0023\000", !8, !9, !18, !150} ; [ DW_TAG_auto_variable ] [khalf] [line 23]
!173 = !MDLocation(line: 23, column: 15, scope: !8, inlinedAt: !150)
!174 = !{!"0x100\00pixel\0025\000", !8, !9, !17, !150} ; [ DW_TAG_auto_variable ] [pixel] [line 25]
!175 = !MDLocation(line: 25, column: 11, scope: !8, inlinedAt: !150)
!176 = !{!"0x100\00c\0026\000", !8, !9, !19, !150} ; [ DW_TAG_auto_variable ] [c] [line 26]
!177 = !MDLocation(line: 26, column: 9, scope: !8, inlinedAt: !150)
!178 = !{!"0x100\00j\0029\000", !58, !9, !19, !150} ; [ DW_TAG_auto_variable ] [j] [line 29]
!179 = !MDLocation(line: 29, column: 14, scope: !58, inlinedAt: !150)
!180 = !MDLocation(line: 29, column: 5, scope: !58, inlinedAt: !150)
!181 = !MDLocation(line: 30, column: 9, scope: !66, inlinedAt: !150)
!182 = !MDLocation(line: 29, column: 5, scope: !63, inlinedAt: !150)
!183 = !MDLocation(line: 31, column: 26, scope: !69, inlinedAt: !150)
!184 = !MDLocation(line: 31, column: 25, scope: !69, inlinedAt: !150)
!185 = !MDLocation(line: 31, column: 62, scope: !69, inlinedAt: !150)
!186 = !MDLocation(line: 31, column: 60, scope: !69, inlinedAt: !150)
!187 = !MDLocation(line: 31, column: 22, scope: !69, inlinedAt: !150)
!188 = !MDLocation(line: 31, column: 53, scope: !69, inlinedAt: !150)
!189 = !MDLocation(line: 31, column: 13, scope: !69, inlinedAt: !150)
!190 = !MDLocation(line: 30, column: 9, scope: !69, inlinedAt: !150)
!191 = !MDLocation(line: 30, column: 30, scope: !69, inlinedAt: !150)
!192 = !MDLocation(line: 33, column: 27, scope: !8, inlinedAt: !150)
!193 = !MDLocation(line: 33, column: 9, scope: !8, inlinedAt: !150)
!194 = !MDLocation(line: 33, column: 5, scope: !8, inlinedAt: !150)
!195 = !MDLocation(line: 95, column: 48, scope: !146)
!196 = !MDLocation(line: 94, column: 44, scope: !142)
!197 = !MDLocation(line: 97, column: 1, scope: !25)
!198 = !{!"0x101\00in\0016777316\000", !28, !9, !23} ; [ DW_TAG_arg_variable ] [in] [line 100]
!199 = !MDLocation(line: 100, column: 26, scope: !28)
!200 = !{!"0x101\00out\0033554533\000", !28, !9, !24} ; [ DW_TAG_arg_variable ] [out] [line 101]
!201 = !MDLocation(line: 101, column: 20, scope: !28)
!202 = !{!"0x101\00kernel\0050331750\000", !28, !9, !15} ; [ DW_TAG_arg_variable ] [kernel] [line 102]
!203 = !MDLocation(line: 102, column: 22, scope: !28)
!204 = !{!"0x101\00kn\0067108967\000", !28, !9, !18} ; [ DW_TAG_arg_variable ] [kn] [line 103]
!205 = !MDLocation(line: 103, column: 19, scope: !28)
!206 = !{!"0x101\00dim_x\0083886184\000", !28, !9, !18} ; [ DW_TAG_arg_variable ] [dim_x] [line 104]
!207 = !MDLocation(line: 104, column: 19, scope: !28)
!208 = !{!"0x101\00dim_y\00100663401\000", !28, !9, !18} ; [ DW_TAG_arg_variable ] [dim_y] [line 105]
!209 = !MDLocation(line: 105, column: 19, scope: !28)
!210 = !MDLocation(line: 107, column: 23, scope: !28)
!211 = !{!"0x100\00khalf\00107\000", !28, !9, !18} ; [ DW_TAG_auto_variable ] [khalf] [line 107]
!212 = !MDLocation(line: 107, column: 15, scope: !28)
!213 = !{!"0x100\00m\00109\000", !214, !9, !19}   ; [ DW_TAG_auto_variable ] [m] [line 109]
!214 = !{!"0xb\00109\005\0012", !1, !28}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!215 = !MDLocation(line: 109, column: 14, scope: !214)
!216 = !MDLocation(line: 109, column: 29, scope: !217)
!217 = !{!"0xb\00109\005\0013", !1, !214}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!218 = !MDLocation(line: 109, column: 25, scope: !217)
!219 = !MDLocation(line: 109, column: 5, scope: !214)
!220 = !MDLocation(line: 110, column: 33, scope: !221)
!221 = !{!"0xb\00110\009\0015", !1, !222}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!222 = !{!"0xb\00110\009\0014", !1, !217}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!223 = !MDLocation(line: 110, column: 29, scope: !221)
!224 = !MDLocation(line: 50, column: 18, scope: !102, inlinedAt: !225)
!225 = !MDLocation(line: 111, column: 10, scope: !221)
!226 = !MDLocation(line: 50, column: 10, scope: !102, inlinedAt: !225)
!227 = !MDLocation(line: 50, column: 26, scope: !107, inlinedAt: !225)
!228 = !{!"0x100\00n\00110\000", !222, !9, !19}   ; [ DW_TAG_auto_variable ] [n] [line 110]
!229 = !MDLocation(line: 110, column: 18, scope: !222)
!230 = !MDLocation(line: 110, column: 9, scope: !222)
!231 = !MDLocation(line: 54, column: 5, scope: !20, inlinedAt: !225)
!232 = !{!"0x101\00in\0016777253\000", !20, !9, !23, !225} ; [ DW_TAG_arg_variable ] [in] [line 37]
!233 = !MDLocation(line: 37, column: 40, scope: !20, inlinedAt: !225)
!234 = !{!"0x101\00out\0033554470\000", !20, !9, !24, !225} ; [ DW_TAG_arg_variable ] [out] [line 38]
!235 = !MDLocation(line: 38, column: 20, scope: !20, inlinedAt: !225)
!236 = !{!"0x101\00kernel\0050331687\000", !20, !9, !15, !225} ; [ DW_TAG_arg_variable ] [kernel] [line 39]
!237 = !MDLocation(line: 39, column: 22, scope: !20, inlinedAt: !225)
!238 = !{!"0x101\00kn\0067108904\000", !20, !9, !18, !225} ; [ DW_TAG_arg_variable ] [kn] [line 40]
!239 = !MDLocation(line: 40, column: 13, scope: !20, inlinedAt: !225)
!240 = !{!"0x101\00x\0083886121\000", !20, !9, !18, !225} ; [ DW_TAG_arg_variable ] [x] [line 41]
!241 = !MDLocation(line: 41, column: 19, scope: !20, inlinedAt: !225)
!242 = !{!"0x101\00y\00100663338\000", !20, !9, !18, !225} ; [ DW_TAG_arg_variable ] [y] [line 42]
!243 = !MDLocation(line: 42, column: 19, scope: !20, inlinedAt: !225)
!244 = !{!"0x100\00khalf\0044\000", !20, !9, !18, !225} ; [ DW_TAG_auto_variable ] [khalf] [line 44]
!245 = !MDLocation(line: 44, column: 15, scope: !20, inlinedAt: !225)
!246 = !{!"0x100\00pixel\0046\000", !20, !9, !17, !225} ; [ DW_TAG_auto_variable ] [pixel] [line 46]
!247 = !MDLocation(line: 46, column: 11, scope: !20, inlinedAt: !225)
!248 = !{!"0x100\00c\0047\000", !20, !9, !19, !225} ; [ DW_TAG_auto_variable ] [c] [line 47]
!249 = !MDLocation(line: 47, column: 9, scope: !20, inlinedAt: !225)
!250 = !{!"0x100\00j\0050\000", !102, !9, !19, !225} ; [ DW_TAG_auto_variable ] [j] [line 50]
!251 = !MDLocation(line: 50, column: 14, scope: !102, inlinedAt: !225)
!252 = !MDLocation(line: 50, column: 5, scope: !102, inlinedAt: !225)
!253 = !MDLocation(line: 51, column: 9, scope: !110, inlinedAt: !225)
!254 = !MDLocation(line: 50, column: 5, scope: !107, inlinedAt: !225)
!255 = !MDLocation(line: 52, column: 25, scope: !113, inlinedAt: !225)
!256 = !MDLocation(line: 52, column: 22, scope: !113, inlinedAt: !225)
!257 = !MDLocation(line: 52, column: 30, scope: !113, inlinedAt: !225)
!258 = !MDLocation(line: 51, column: 9, scope: !113, inlinedAt: !225)
!259 = !MDLocation(line: 52, column: 37, scope: !113, inlinedAt: !225)
!260 = !MDLocation(line: 52, column: 13, scope: !113, inlinedAt: !225)
!261 = !MDLocation(line: 51, column: 30, scope: !113, inlinedAt: !225)
!262 = !MDLocation(line: 54, column: 17, scope: !20, inlinedAt: !225)
!263 = !MDLocation(line: 110, column: 48, scope: !221)
!264 = !MDLocation(line: 109, column: 44, scope: !217)
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
!297 = !{!"0x100\00x\00125\000", !291, !9, !19}   ; [ DW_TAG_auto_variable ] [x] [line 125]
!298 = !MDLocation(line: 125, column: 16, scope: !291)
!299 = !MDLocation(line: 125, column: 7, scope: !291)
!300 = !MDLocation(line: 126, column: 15, scope: !296)
!301 = !{!"0x100\00pixel\00126\000", !296, !9, !17} ; [ DW_TAG_auto_variable ] [pixel] [line 126]
!302 = !{!"0x100\00c\00127\000", !296, !9, !19}   ; [ DW_TAG_auto_variable ] [c] [line 127]
!303 = !MDLocation(line: 127, column: 13, scope: !296)
!304 = !MDLocation(line: 130, column: 9, scope: !295)
!305 = !MDLocation(line: 131, column: 11, scope: !306)
!306 = !{!"0xb\00131\0011\0023", !1, !294}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!307 = !MDLocation(line: 132, column: 25, scope: !308)
!308 = !{!"0xb\00131\0011\0024", !1, !306}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!309 = !MDLocation(line: 132, column: 22, scope: !308)
!310 = !MDLocation(line: 132, column: 32, scope: !308)
!311 = !MDLocation(line: 131, column: 11, scope: !308)
!312 = !MDLocation(line: 132, column: 41, scope: !308)
!313 = !MDLocation(line: 132, column: 13, scope: !308)
!314 = !MDLocation(line: 131, column: 32, scope: !308)
!315 = !MDLocation(line: 130, column: 9, scope: !294)
!316 = !MDLocation(line: 134, column: 21, scope: !296)
!317 = !MDLocation(line: 134, column: 9, scope: !296)
!318 = !MDLocation(line: 125, column: 7, scope: !290)
!319 = !MDLocation(line: 124, column: 5, scope: !286)
!320 = !MDLocation(line: 136, column: 1, scope: !29)
