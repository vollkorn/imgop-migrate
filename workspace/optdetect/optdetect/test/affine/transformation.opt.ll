; ModuleID = 'transformation.opt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @matrix_multiply(i32 %l, i32 %m, i32 %n, float* nocapture readonly %A, float* nocapture readonly %B, float* nocapture %C) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %l, i64 0, metadata !26, metadata !27), !dbg !28
  tail call void @llvm.dbg.value(metadata i32 %m, i64 0, metadata !29, metadata !27), !dbg !30
  tail call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !31, metadata !27), !dbg !32
  tail call void @llvm.dbg.value(metadata float* %A, i64 0, metadata !33, metadata !27), !dbg !34
  tail call void @llvm.dbg.value(metadata float* %B, i64 0, metadata !35, metadata !27), !dbg !36
  tail call void @llvm.dbg.value(metadata float* %C, i64 0, metadata !37, metadata !27), !dbg !38
  %0 = zext i32 %n to i64
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !39, metadata !27), !dbg !40
  %cmp19 = icmp sgt i32 %l, 0, !dbg !41
  br i1 %cmp19, label %for.cond1.preheader.preheader, label %for.end42, !dbg !44

for.cond1.preheader.preheader:                    ; preds = %entry
  %cmp217 = icmp sgt i32 %n, 0, !dbg !45
  %1 = sext i32 %n to i64
  %2 = shl nsw i64 %1, 2, !dbg !45
  %3 = sext i32 %l to i64
  %4 = add nsw i64 %3, -1, !dbg !45
  br label %for.cond1.preheader, !dbg !45

for.cond1.preheader:                              ; preds = %for.inc6, %for.cond1.preheader.preheader
  %indvars.iv720 = phi i64 [ %indvars.iv.next8, %for.inc6 ], [ 0, %for.cond1.preheader.preheader ]
  br i1 %cmp217, label %for.body3.preheader, label %for.inc6, !dbg !48

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %5 = mul i64 %0, %indvars.iv720, !dbg !48
  %scevgep = getelementptr float* %C, i64 %5
  %scevgep4 = bitcast float* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep4, i8 0, i64 %2, i32 4, i1 false), !dbg !49
  br label %for.inc6

for.cond12.preheader.preheader:                   ; preds = %for.inc6
  %6 = add nsw i64 %1, -1, !dbg !45
  %7 = zext i32 %m to i64
  %cmp169 = icmp sgt i32 %m, 0, !dbg !50
  %8 = sext i32 %m to i64
  %9 = add nsw i64 %8, -1, !dbg !57
  br label %for.cond12.preheader, !dbg !57

for.inc6:                                         ; preds = %for.body3.preheader, %for.cond1.preheader
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv720, 1, !dbg !58
  %exitcond5 = icmp eq i64 %indvars.iv720, %4, !dbg !44
  br i1 %exitcond5, label %for.cond12.preheader.preheader, label %for.cond1.preheader, !dbg !44

for.cond12.preheader:                             ; preds = %for.inc40, %for.cond12.preheader.preheader
  %indvars.iv315 = phi i64 [ %indvars.iv.next4, %for.inc40 ], [ 0, %for.cond12.preheader.preheader ]
  br i1 %cmp217, label %for.cond15.preheader.preheader, label %for.inc40, !dbg !59

for.cond15.preheader.preheader:                   ; preds = %for.cond12.preheader
  %10 = mul nsw i64 %indvars.iv315, %0, !dbg !60
  %11 = mul nsw i64 %indvars.iv315, %7, !dbg !62
  br label %for.cond15.preheader, !dbg !50

for.cond15.preheader:                             ; preds = %for.inc37, %for.cond15.preheader.preheader
  %indvars.iv112 = phi i64 [ %indvars.iv.next2, %for.inc37 ], [ 0, %for.cond15.preheader.preheader ]
  br i1 %cmp169, label %for.body17.preheader, label %for.inc37, !dbg !63

for.body17.preheader:                             ; preds = %for.cond15.preheader
  %arrayidx20.sum = add nuw nsw i64 %indvars.iv112, %10, !dbg !60
  %arrayidx21 = getelementptr inbounds float* %C, i64 %arrayidx20.sum, !dbg !60
  %12 = mul nsw i64 %indvars.iv112, %0, !dbg !64
  %.pre = load float* %arrayidx21, align 4, !dbg !60
  br label %for.body17, !dbg !60

for.body17:                                       ; preds = %for.body17, %for.body17.preheader
  %13 = phi float [ %add, %for.body17 ], [ %.pre, %for.body17.preheader ], !dbg !60
  %indvars.iv10 = phi i64 [ %indvars.iv.next, %for.body17 ], [ 0, %for.body17.preheader ]
  %arrayidx24.sum = add nuw nsw i64 %indvars.iv10, %11, !dbg !62
  %arrayidx25 = getelementptr inbounds float* %A, i64 %arrayidx24.sum, !dbg !62
  %14 = load float* %arrayidx25, align 4, !dbg !62
  %arrayidx28.sum = add nuw nsw i64 %indvars.iv10, %12, !dbg !64
  %arrayidx29 = getelementptr inbounds float* %B, i64 %arrayidx28.sum, !dbg !64
  %15 = load float* %arrayidx29, align 4, !dbg !64
  %mul = fmul float %14, %15, !dbg !62
  %add = fadd float %13, %mul, !dbg !60
  store float %add, float* %arrayidx21, align 4, !dbg !65
  %indvars.iv.next = add nuw nsw i64 %indvars.iv10, 1, !dbg !66
  %exitcond = icmp eq i64 %indvars.iv10, %9, !dbg !63
  br i1 %exitcond, label %for.inc37.loopexit, label %for.body17, !dbg !63

for.inc37.loopexit:                               ; preds = %for.body17
  br label %for.inc37

for.inc37:                                        ; preds = %for.inc37.loopexit, %for.cond15.preheader
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv112, 1, !dbg !67
  %exitcond1 = icmp eq i64 %indvars.iv112, %6, !dbg !59
  br i1 %exitcond1, label %for.inc40.loopexit, label %for.cond15.preheader, !dbg !59

for.inc40.loopexit:                               ; preds = %for.inc37
  br label %for.inc40

for.inc40:                                        ; preds = %for.inc40.loopexit, %for.cond12.preheader
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv315, 1, !dbg !68
  %exitcond2 = icmp eq i64 %indvars.iv315, %4, !dbg !69
  br i1 %exitcond2, label %for.end42.loopexit, label %for.cond12.preheader, !dbg !69

for.end42.loopexit:                               ; preds = %for.inc40
  br label %for.end42

for.end42:                                        ; preds = %for.end42.loopexit, %entry
  ret void, !dbg !70
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @transform(i8** nocapture readonly %data_in, i8** nocapture readonly %data_out, i32 %nx, i32 %ny, i32 %l, i32 %m, float* nocapture readonly %M) #0 {
entry:
  %T = alloca [3 x [1 x float]], align 4
  %0 = bitcast [3 x [1 x float]]* %T to i8*
  %A = alloca [3 x [1 x float]], align 4
  tail call void @llvm.dbg.value(metadata i8** %data_in, i64 0, metadata !71, metadata !27), !dbg !72
  tail call void @llvm.dbg.value(metadata i8** %data_out, i64 0, metadata !73, metadata !27), !dbg !74
  tail call void @llvm.dbg.value(metadata i32 %nx, i64 0, metadata !75, metadata !27), !dbg !76
  tail call void @llvm.dbg.value(metadata i32 %ny, i64 0, metadata !77, metadata !27), !dbg !78
  tail call void @llvm.dbg.value(metadata i32 %l, i64 0, metadata !79, metadata !27), !dbg !80
  tail call void @llvm.dbg.value(metadata i32 %m, i64 0, metadata !81, metadata !27), !dbg !82
  tail call void @llvm.dbg.value(metadata float* %M, i64 0, metadata !83, metadata !27), !dbg !84
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !85, metadata !27), !dbg !86
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !87, metadata !27), !dbg !88
  tail call void @llvm.dbg.declare(metadata [3 x [1 x float]]* %T, metadata !89, metadata !27), !dbg !94
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 12, i32 4, i1 false), !dbg !94
  tail call void @llvm.dbg.declare(metadata [3 x [1 x float]]* %A, metadata !95, metadata !27), !dbg !96
  %1 = bitcast [3 x [1 x float]]* %A to i8*, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 12, i32 4, i1 false), !dbg !96
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !87, metadata !27), !dbg !88
  %2 = sext i32 %l to i64
  %3 = add nsw i64 %2, -1, !dbg !97
  %4 = sext i32 %m to i64
  %5 = add nsw i64 %4, -1, !dbg !97
  %sub = add nsw i32 %ny, -1, !dbg !99
  %6 = sext i32 %sub to i64, !dbg !101
  %cmp7 = icmp sgt i32 %ny, 1, !dbg !101
  br i1 %cmp7, label %for.cond1.preheader.preheader, label %for.end49, !dbg !102

for.cond1.preheader.preheader:                    ; preds = %entry
  %sub2 = add nsw i32 %nx, -1, !dbg !103
  %7 = sext i32 %sub2 to i64, !dbg !106
  %cmp35 = icmp sgt i32 %nx, 1, !dbg !106
  %arrayidx5 = getelementptr inbounds [3 x [1 x float]]* %A, i64 0, i64 0, i64 0, !dbg !107
  %arrayidx8 = getelementptr inbounds [3 x [1 x float]]* %A, i64 0, i64 1, i64 0, !dbg !109
  %arrayidx10 = getelementptr inbounds [3 x [1 x float]]* %A, i64 0, i64 2, i64 0, !dbg !110
  %8 = getelementptr inbounds [3 x [1 x float]]* %T, i64 0, i64 0, i64 0, !dbg !111
  %cmp19.i = icmp sgt i32 %l, 0, !dbg !112
  %arrayidx15 = getelementptr inbounds [3 x [1 x float]]* %T, i64 0, i64 1, i64 0, !dbg !114
  %conv17 = sitofp i32 %sub2 to float, !dbg !115
  %conv27 = sitofp i32 %sub to float, !dbg !117
  %9 = zext i32 %m to i64, !dbg !113
  %cmp169.i = icmp sgt i32 %m, 0, !dbg !119
  %10 = shl nsw i64 %2, 2, !dbg !103
  br label %for.cond1.preheader, !dbg !103

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.inc47
  %indvars.iv38 = phi i64 [ %indvars.iv.next4, %for.inc47 ], [ 0, %for.cond1.preheader.preheader ]
  br i1 %cmp35, label %for.body4.preheader, label %for.inc47, !dbg !120

for.body4.preheader:                              ; preds = %for.cond1.preheader
  %11 = trunc i64 %indvars.iv38 to i32, !dbg !121
  %conv6 = sitofp i32 %11 to float, !dbg !121
  %arrayidx39 = getelementptr inbounds i8** %data_in, i64 %indvars.iv38, !dbg !122
  br label %for.body4, !dbg !123

for.body4:                                        ; preds = %for.body4.preheader, %matrix_multiply.exit
  %indvars.iv6 = phi i64 [ %indvars.iv.next, %matrix_multiply.exit ], [ 0, %for.body4.preheader ]
  %12 = trunc i64 %indvars.iv6 to i32, !dbg !123
  %conv = sitofp i32 %12 to float, !dbg !123
  store float %conv, float* %arrayidx5, align 4, !dbg !107
  store float %conv6, float* %arrayidx8, align 4, !dbg !109
  store float 1.000000e+00, float* %arrayidx10, align 4, !dbg !110
  tail call void @llvm.dbg.value(metadata i32 %l, i64 0, metadata !124, metadata !27), !dbg !125
  tail call void @llvm.dbg.value(metadata i32 %m, i64 0, metadata !126, metadata !27), !dbg !127
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !128, metadata !27), !dbg !129
  tail call void @llvm.dbg.value(metadata float* %M, i64 0, metadata !130, metadata !27), !dbg !131
  tail call void @llvm.dbg.value(metadata float* %arrayidx5, i64 0, metadata !132, metadata !27), !dbg !133
  tail call void @llvm.dbg.value(metadata float* %8, i64 0, metadata !134, metadata !27), !dbg !135
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !136, metadata !27), !dbg !137
  br i1 %cmp19.i, label %for.cond15.preheader.i.preheader, label %matrix_multiply.exit, !dbg !138

for.cond15.preheader.i.preheader:                 ; preds = %for.body4
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 %10, i32 4, i1 false), !dbg !139
  br label %for.cond15.preheader.i, !dbg !119

for.cond15.preheader.i:                           ; preds = %for.cond15.preheader.i.preheader, %for.inc37.i
  %indvars.iv315.i = phi i64 [ %indvars.iv.next4.i, %for.inc37.i ], [ 0, %for.cond15.preheader.i.preheader ], !dbg !113
  br i1 %cmp169.i, label %for.body17.i.preheader, label %for.inc37.i, !dbg !140

for.body17.i.preheader:                           ; preds = %for.cond15.preheader.i
  %arrayidx21.i = getelementptr inbounds [3 x [1 x float]]* %T, i64 0, i64 0, i64 %indvars.iv315.i, !dbg !141
  %13 = mul nsw i64 %indvars.iv315.i, %9, !dbg !142
  %arrayidx21.i.promoted = load float* %arrayidx21.i, align 4, !dbg !141
  br label %for.body17.i, !dbg !141

for.body17.i:                                     ; preds = %for.body17.i.preheader, %for.body17.i
  %14 = phi float [ %add.i, %for.body17.i ], [ %arrayidx21.i.promoted, %for.body17.i.preheader ], !dbg !141
  %indvars.iv10.i = phi i64 [ %indvars.iv.next.i, %for.body17.i ], [ 0, %for.body17.i.preheader ], !dbg !113
  %arrayidx24.sum.i = add nuw nsw i64 %indvars.iv10.i, %13, !dbg !142
  %arrayidx25.i = getelementptr inbounds float* %M, i64 %arrayidx24.sum.i, !dbg !142
  %15 = load float* %arrayidx25.i, align 4, !dbg !142
  %arrayidx29.i = getelementptr inbounds [3 x [1 x float]]* %A, i64 0, i64 0, i64 %indvars.iv10.i, !dbg !143
  %16 = load float* %arrayidx29.i, align 4, !dbg !143
  %mul.i = fmul float %15, %16, !dbg !142
  %add.i = fadd float %14, %mul.i, !dbg !141
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv10.i, 1, !dbg !144
  %exitcond1 = icmp eq i64 %indvars.iv10.i, %5, !dbg !140
  br i1 %exitcond1, label %for.inc37.i.loopexit, label %for.body17.i, !dbg !140

for.inc37.i.loopexit:                             ; preds = %for.body17.i
  %add.i.lcssa = phi float [ %add.i, %for.body17.i ]
  store float %add.i.lcssa, float* %arrayidx21.i, align 4, !dbg !141
  br label %for.inc37.i

for.inc37.i:                                      ; preds = %for.inc37.i.loopexit, %for.cond15.preheader.i
  %indvars.iv.next4.i = add nuw nsw i64 %indvars.iv315.i, 1, !dbg !145
  %exitcond2 = icmp eq i64 %indvars.iv315.i, %3, !dbg !146
  br i1 %exitcond2, label %matrix_multiply.exit.loopexit, label %for.cond15.preheader.i, !dbg !146

matrix_multiply.exit.loopexit:                    ; preds = %for.inc37.i
  br label %matrix_multiply.exit

matrix_multiply.exit:                             ; preds = %matrix_multiply.exit.loopexit, %for.body4
  %17 = load float* %8, align 4, !dbg !147
  tail call void @llvm.dbg.value(metadata float %17, i64 0, metadata !148, metadata !27), !dbg !149
  %18 = load float* %arrayidx15, align 4, !dbg !114
  tail call void @llvm.dbg.value(metadata float %18, i64 0, metadata !150, metadata !27), !dbg !151
  %cmp18 = fcmp ogt float %17, %conv17, !dbg !152
  tail call void @llvm.dbg.value(metadata float %conv17, i64 0, metadata !148, metadata !27), !dbg !149
  %__x.0 = select i1 %cmp18, float %conv17, float %17, !dbg !153
  %cmp22 = fcmp olt float %__x.0, 0.000000e+00, !dbg !154
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !148, metadata !27), !dbg !149
  %cmp28 = fcmp ogt float %18, %conv27, !dbg !156
  tail call void @llvm.dbg.value(metadata float %conv27, i64 0, metadata !150, metadata !27), !dbg !151
  %__y.0 = select i1 %cmp28, float %conv27, float %18, !dbg !157
  %cmp34 = fcmp olt float %__y.0, 0.000000e+00, !dbg !158
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !150, metadata !27), !dbg !151
  %19 = load i8** %arrayidx39, align 8, !dbg !122
  %arrayidx40 = getelementptr inbounds i8* %19, i64 %indvars.iv6, !dbg !122
  %20 = load i8* %arrayidx40, align 1, !dbg !122
  %21 = fptosi float %__x.0 to i32, !dbg !160
  %22 = sext i32 %21 to i64, !dbg !161
  %idxprom42 = select i1 %cmp22, i64 0, i64 %22, !dbg !161
  %23 = fptosi float %__y.0 to i32, !dbg !162
  %24 = sext i32 %23 to i64, !dbg !161
  %idxprom44 = select i1 %cmp34, i64 0, i64 %24, !dbg !161
  %arrayidx45 = getelementptr inbounds i8** %data_out, i64 %idxprom44, !dbg !161
  %25 = load i8** %arrayidx45, align 8, !dbg !161
  %arrayidx46 = getelementptr inbounds i8* %25, i64 %idxprom42, !dbg !161
  store i8 %20, i8* %arrayidx46, align 1, !dbg !161
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1, !dbg !163
  %cmp3 = icmp slt i64 %indvars.iv.next, %7, !dbg !106
  br i1 %cmp3, label %for.body4, label %for.inc47.loopexit, !dbg !120

for.inc47.loopexit:                               ; preds = %matrix_multiply.exit
  br label %for.inc47

for.inc47:                                        ; preds = %for.inc47.loopexit, %for.cond1.preheader
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv38, 1, !dbg !164
  %cmp = icmp slt i64 %indvars.iv.next4, %6, !dbg !101
  br i1 %cmp, label %for.cond1.preheader, label %for.end49.loopexit, !dbg !102

for.end49.loopexit:                               ; preds = %for.inc47
  br label %for.end49

for.end49:                                        ; preds = %for.end49.loopexit, %entry
  ret void, !dbg !165
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!23, !24}
!llvm.ident = !{!25}

!0 = !{!"0x11\0012\00clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)\000\00\000\00\001", !1, !2, !3, !5, !2, !2} ; [ DW_TAG_compile_unit ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c] [DW_LANG_C99]
!1 = !{!"transformation.c", !"/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!5 = !{!6, !15}
!6 = !{!"0x2e\00matrix_multiply\00matrix_multiply\00\0012\000\001\000\000\00256\000\0012", !1, !7, !8, null, void (i32, i32, i32, float*, float*, float*)* @matrix_multiply, null, null, !2} ; [ DW_TAG_subprogram ] [line 12] [def] [matrix_multiply]
!7 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!8 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !9, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = !{null, !4, !4, !4, !10, !10, !10}
!10 = !{!"0xf\00\000\0064\0064\000\000", null, null, !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = !{!"0x1\00\000\000\0032\000\000\000", null, null, !12, !13, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 0, align 32, offset 0] [from float]
!12 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!13 = !{!14}
!14 = !{!"0x21\000\00-1"}                         ; [ DW_TAG_subrange_type ] [unbounded]
!15 = !{!"0x2e\00transform\00transform\00\0027\000\001\000\000\00256\000\0027", !1, !7, !16, null, void (i8**, i8**, i32, i32, i32, i32, float*)* @transform, null, null, !2} ; [ DW_TAG_subprogram ] [line 27] [def] [transform]
!16 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !17, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = !{null, !18, !18, !4, !4, !4, !4, !10}
!18 = !{!"0xf\00\000\0064\0064\000\000", null, null, !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!19 = !{!"0xf\00\000\0064\0064\000\000", null, null, !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from u_int8_t]
!20 = !{!"0x16\00u_int8_t\00200\000\000\000\000", !21, null, !22} ; [ DW_TAG_typedef ] [u_int8_t] [line 200, size 0, align 0, offset 0] [from unsigned char]
!21 = !{!"/usr/include/x86_64-linux-gnu/sys/types.h", !"/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine"}
!22 = !{!"0x24\00unsigned char\000\008\008\000\000\008", null, null} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!23 = !{i32 2, !"Dwarf Version", i32 4}
!24 = !{i32 2, !"Debug Info Version", i32 2}
!25 = !{!"clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)"}
!26 = !{!"0x101\00l\0016777228\000", !6, !7, !4}  ; [ DW_TAG_arg_variable ] [l] [line 12]
!27 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!28 = !MDLocation(line: 12, column: 26, scope: !6)
!29 = !{!"0x101\00m\0033554444\000", !6, !7, !4}  ; [ DW_TAG_arg_variable ] [m] [line 12]
!30 = !MDLocation(line: 12, column: 33, scope: !6)
!31 = !{!"0x101\00n\0050331660\000", !6, !7, !4}  ; [ DW_TAG_arg_variable ] [n] [line 12]
!32 = !MDLocation(line: 12, column: 40, scope: !6)
!33 = !{!"0x101\00A\0067108876\000", !6, !7, !10} ; [ DW_TAG_arg_variable ] [A] [line 12]
!34 = !MDLocation(line: 12, column: 49, scope: !6)
!35 = !{!"0x101\00B\0083886092\000", !6, !7, !10} ; [ DW_TAG_arg_variable ] [B] [line 12]
!36 = !MDLocation(line: 12, column: 64, scope: !6)
!37 = !{!"0x101\00C\00100663308\000", !6, !7, !10} ; [ DW_TAG_arg_variable ] [C] [line 12]
!38 = !MDLocation(line: 12, column: 79, scope: !6)
!39 = !{!"0x100\00i\0014\000", !6, !7, !4}        ; [ DW_TAG_auto_variable ] [i] [line 14]
!40 = !MDLocation(line: 14, column: 7, scope: !6)
!41 = !MDLocation(line: 16, column: 15, scope: !42)
!42 = !{!"0xb\0016\003\001", !1, !43}             ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!43 = !{!"0xb\0016\003\000", !1, !6}              ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!44 = !MDLocation(line: 16, column: 3, scope: !43)
!45 = !MDLocation(line: 17, column: 17, scope: !46)
!46 = !{!"0xb\0017\005\003", !1, !47}             ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!47 = !{!"0xb\0017\005\002", !1, !42}             ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!48 = !MDLocation(line: 17, column: 5, scope: !47)
!49 = !MDLocation(line: 18, column: 6, scope: !46)
!50 = !MDLocation(line: 22, column: 19, scope: !51)
!51 = !{!"0xb\0022\007\009", !1, !52}             ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!52 = !{!"0xb\0022\007\008", !1, !53}             ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!53 = !{!"0xb\0021\005\007", !1, !54}             ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!54 = !{!"0xb\0021\005\006", !1, !55}             ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!55 = !{!"0xb\0020\003\005", !1, !56}             ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!56 = !{!"0xb\0020\003\004", !1, !6}              ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!57 = !MDLocation(line: 21, column: 17, scope: !53)
!58 = !MDLocation(line: 16, column: 3, scope: !42)
!59 = !MDLocation(line: 21, column: 5, scope: !54)
!60 = !MDLocation(line: 23, column: 19, scope: !61)
!61 = !{!"0xb\0022\0030\0010", !1, !51}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!62 = !MDLocation(line: 23, column: 29, scope: !61)
!63 = !MDLocation(line: 22, column: 7, scope: !52)
!64 = !MDLocation(line: 23, column: 39, scope: !61)
!65 = !MDLocation(line: 23, column: 9, scope: !61)
!66 = !MDLocation(line: 22, column: 7, scope: !51)
!67 = !MDLocation(line: 21, column: 5, scope: !53)
!68 = !MDLocation(line: 20, column: 3, scope: !55)
!69 = !MDLocation(line: 20, column: 3, scope: !56)
!70 = !MDLocation(line: 25, column: 1, scope: !6)
!71 = !{!"0x101\00data_in\0016777243\000", !15, !7, !18} ; [ DW_TAG_arg_variable ] [data_in] [line 27]
!72 = !MDLocation(line: 27, column: 27, scope: !15)
!73 = !{!"0x101\00data_out\0033554459\000", !15, !7, !18} ; [ DW_TAG_arg_variable ] [data_out] [line 27]
!74 = !MDLocation(line: 27, column: 47, scope: !15)
!75 = !{!"0x101\00nx\0050331675\000", !15, !7, !4} ; [ DW_TAG_arg_variable ] [nx] [line 27]
!76 = !MDLocation(line: 27, column: 61, scope: !15)
!77 = !{!"0x101\00ny\0067108891\000", !15, !7, !4} ; [ DW_TAG_arg_variable ] [ny] [line 27]
!78 = !MDLocation(line: 27, column: 69, scope: !15)
!79 = !{!"0x101\00l\0083886107\000", !15, !7, !4} ; [ DW_TAG_arg_variable ] [l] [line 27]
!80 = !MDLocation(line: 27, column: 77, scope: !15)
!81 = !{!"0x101\00m\00100663323\000", !15, !7, !4} ; [ DW_TAG_arg_variable ] [m] [line 27]
!82 = !MDLocation(line: 27, column: 84, scope: !15)
!83 = !{!"0x101\00M\00117440539\000", !15, !7, !10} ; [ DW_TAG_arg_variable ] [M] [line 27]
!84 = !MDLocation(line: 27, column: 93, scope: !15)
!85 = !{!"0x100\00i\0029\000", !15, !7, !4}       ; [ DW_TAG_auto_variable ] [i] [line 29]
!86 = !MDLocation(line: 29, column: 7, scope: !15)
!87 = !{!"0x100\00j\0029\000", !15, !7, !4}       ; [ DW_TAG_auto_variable ] [j] [line 29]
!88 = !MDLocation(line: 29, column: 14, scope: !15)
!89 = !{!"0x100\00T\0031\000", !15, !7, !90}      ; [ DW_TAG_auto_variable ] [T] [line 31]
!90 = !{!"0x1\00\000\0096\0032\000\000\000", null, null, !12, !91, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 96, align 32, offset 0] [from float]
!91 = !{!92, !93}
!92 = !{!"0x21\000\003"}                          ; [ DW_TAG_subrange_type ] [0, 2]
!93 = !{!"0x21\000\001"}                          ; [ DW_TAG_subrange_type ] [0, 0]
!94 = !MDLocation(line: 31, column: 9, scope: !15)
!95 = !{!"0x100\00A\0032\000", !15, !7, !90}      ; [ DW_TAG_auto_variable ] [A] [line 32]
!96 = !MDLocation(line: 32, column: 9, scope: !15)
!97 = !MDLocation(line: 33, column: 8, scope: !98)
!98 = !{!"0xb\0033\003\0011", !1, !15}            ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!99 = !MDLocation(line: 33, column: 19, scope: !100)
!100 = !{!"0xb\0033\003\0012", !1, !98}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!101 = !MDLocation(line: 33, column: 15, scope: !100)
!102 = !MDLocation(line: 33, column: 3, scope: !98)
!103 = !MDLocation(line: 34, column: 21, scope: !104)
!104 = !{!"0xb\0034\005\0014", !1, !105}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!105 = !{!"0xb\0034\005\0013", !1, !100}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!106 = !MDLocation(line: 34, column: 17, scope: !104)
!107 = !MDLocation(line: 36, column: 7, scope: !108)
!108 = !{!"0xb\0034\0034\0015", !1, !104}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!109 = !MDLocation(line: 37, column: 7, scope: !108)
!110 = !MDLocation(line: 38, column: 7, scope: !108)
!111 = !MDLocation(line: 40, column: 38, scope: !108)
!112 = !MDLocation(line: 16, column: 15, scope: !42, inlinedAt: !113)
!113 = !MDLocation(line: 40, column: 7, scope: !108)
!114 = !MDLocation(line: 43, column: 19, scope: !108)
!115 = !MDLocation(line: 45, column: 17, scope: !116)
!116 = !{!"0xb\0045\0011\0016", !1, !108}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!117 = !MDLocation(line: 49, column: 17, scope: !118)
!118 = !{!"0xb\0049\0011\0018", !1, !108}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!119 = !MDLocation(line: 22, column: 19, scope: !51, inlinedAt: !113)
!120 = !MDLocation(line: 34, column: 5, scope: !105)
!121 = !MDLocation(line: 37, column: 17, scope: !108)
!122 = !MDLocation(line: 54, column: 38, scope: !108)
!123 = !MDLocation(line: 36, column: 17, scope: !108)
!124 = !{!"0x101\00l\0016777228\000", !6, !7, !4, !113} ; [ DW_TAG_arg_variable ] [l] [line 12]
!125 = !MDLocation(line: 12, column: 26, scope: !6, inlinedAt: !113)
!126 = !{!"0x101\00m\0033554444\000", !6, !7, !4, !113} ; [ DW_TAG_arg_variable ] [m] [line 12]
!127 = !MDLocation(line: 12, column: 33, scope: !6, inlinedAt: !113)
!128 = !{!"0x101\00n\0050331660\000", !6, !7, !4, !113} ; [ DW_TAG_arg_variable ] [n] [line 12]
!129 = !MDLocation(line: 12, column: 40, scope: !6, inlinedAt: !113)
!130 = !{!"0x101\00A\0067108876\000", !6, !7, !10, !113} ; [ DW_TAG_arg_variable ] [A] [line 12]
!131 = !MDLocation(line: 12, column: 49, scope: !6, inlinedAt: !113)
!132 = !{!"0x101\00B\0083886092\000", !6, !7, !10, !113} ; [ DW_TAG_arg_variable ] [B] [line 12]
!133 = !MDLocation(line: 12, column: 64, scope: !6, inlinedAt: !113)
!134 = !{!"0x101\00C\00100663308\000", !6, !7, !10, !113} ; [ DW_TAG_arg_variable ] [C] [line 12]
!135 = !MDLocation(line: 12, column: 79, scope: !6, inlinedAt: !113)
!136 = !{!"0x100\00i\0014\000", !6, !7, !4, !113} ; [ DW_TAG_auto_variable ] [i] [line 14]
!137 = !MDLocation(line: 14, column: 7, scope: !6, inlinedAt: !113)
!138 = !MDLocation(line: 16, column: 3, scope: !43, inlinedAt: !113)
!139 = !MDLocation(line: 18, column: 6, scope: !46, inlinedAt: !113)
!140 = !MDLocation(line: 22, column: 7, scope: !52, inlinedAt: !113)
!141 = !MDLocation(line: 23, column: 19, scope: !61, inlinedAt: !113)
!142 = !MDLocation(line: 23, column: 29, scope: !61, inlinedAt: !113)
!143 = !MDLocation(line: 23, column: 39, scope: !61, inlinedAt: !113)
!144 = !MDLocation(line: 22, column: 7, scope: !51, inlinedAt: !113)
!145 = !MDLocation(line: 20, column: 3, scope: !55, inlinedAt: !113)
!146 = !MDLocation(line: 20, column: 3, scope: !56, inlinedAt: !113)
!147 = !MDLocation(line: 42, column: 19, scope: !108)
!148 = !{!"0x100\00__x\0042\000", !108, !7, !12}  ; [ DW_TAG_auto_variable ] [__x] [line 42]
!149 = !MDLocation(line: 42, column: 13, scope: !108)
!150 = !{!"0x100\00__y\0043\000", !108, !7, !12}  ; [ DW_TAG_auto_variable ] [__y] [line 43]
!151 = !MDLocation(line: 43, column: 13, scope: !108)
!152 = !MDLocation(line: 45, column: 11, scope: !116)
!153 = !MDLocation(line: 45, column: 11, scope: !108)
!154 = !MDLocation(line: 47, column: 11, scope: !155)
!155 = !{!"0xb\0047\0011\0017", !1, !108}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!156 = !MDLocation(line: 49, column: 11, scope: !118)
!157 = !MDLocation(line: 49, column: 11, scope: !108)
!158 = !MDLocation(line: 51, column: 11, scope: !159)
!159 = !{!"0xb\0051\0011\0019", !1, !108}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!160 = !MDLocation(line: 54, column: 26, scope: !108)
!161 = !MDLocation(line: 54, column: 7, scope: !108)
!162 = !MDLocation(line: 54, column: 16, scope: !108)
!163 = !MDLocation(line: 34, column: 5, scope: !104)
!164 = !MDLocation(line: 33, column: 3, scope: !100)
!165 = !MDLocation(line: 56, column: 1, scope: !15)
