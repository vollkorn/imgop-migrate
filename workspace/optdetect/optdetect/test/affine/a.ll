; ModuleID = 'llvm-link'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.max_file = type { %struct.max_errors*, %struct.max_file_internal* }
%struct.max_errors = type opaque
%struct.max_file_internal = type opaque
%struct.jpeg_error_mgr = type { void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i8*)*, void (%struct.jpeg_common_struct*)*, i32, %union.anon, i32, i64, i8**, i32, i8**, i32, i32 }
%struct.jpeg_common_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i8*, i32, i32 }
%struct.jpeg_memory_mgr = type { i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, {}*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, void (%struct.jpeg_common_struct*, i32)*, {}*, i64, i64 }
%struct.jvirt_sarray_control = type opaque
%struct.jvirt_barray_control = type opaque
%struct.jpeg_progress_mgr = type { {}*, i64, i64, i32, i32 }
%union.anon = type { [8 x i32], [48 x i8] }
%struct.jpeg_decompress_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i8*, i32, i32, %struct.jpeg_source_mgr*, i32, i32, i32, i32, i32, i32, i32, double, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8**, i32, i32, i32, i32, i32, [64 x i32]*, [4 x %struct.JQUANT_TBL*], [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*], i32, %struct.jpeg_component_info*, i32, i32, i32, [16 x i8], [16 x i8], [16 x i8], i32, i32, i8, i8, i8, i16, i16, i32, i8, i32, %struct.jpeg_marker_struct*, i32, i32, i32, i32, i32, i8*, i32, [4 x %struct.jpeg_component_info*], i32, i32, i32, [10 x i32], i32, i32, i32, i32, i32, i32*, i32, i32, %struct.jpeg_decomp_master*, %struct.jpeg_d_main_controller*, %struct.jpeg_d_coef_controller*, %struct.jpeg_d_post_controller*, %struct.jpeg_input_controller*, %struct.jpeg_marker_reader*, %struct.jpeg_entropy_decoder*, %struct.jpeg_inverse_dct*, %struct.jpeg_upsampler*, %struct.jpeg_color_deconverter*, %struct.jpeg_color_quantizer* }
%struct.jpeg_source_mgr = type { i8*, i64, void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i64)*, i32 (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*)* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.jpeg_marker_struct = type { %struct.jpeg_marker_struct*, i8, i32, i32, i8* }
%struct.jpeg_decomp_master = type opaque
%struct.jpeg_d_main_controller = type opaque
%struct.jpeg_d_coef_controller = type opaque
%struct.jpeg_d_post_controller = type opaque
%struct.jpeg_input_controller = type opaque
%struct.jpeg_marker_reader = type opaque
%struct.jpeg_entropy_decoder = type opaque
%struct.jpeg_inverse_dct = type opaque
%struct.jpeg_upsampler = type opaque
%struct.jpeg_color_deconverter = type opaque
%struct.jpeg_color_quantizer = type opaque
%struct.jpeg_compress_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i8*, i32, i32, %struct.jpeg_destination_mgr*, i32, i32, i32, i32, double, i32, i32, i32, i32, i32, i32, i32, %struct.jpeg_component_info*, [4 x %struct.JQUANT_TBL*], [4 x i32], [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*], [16 x i8], [16 x i8], [16 x i8], i32, %struct.jpeg_scan_info*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8, i8, i8, i16, i16, i32, i32, i32, i32, i32, i32, i32, i32, i32, [4 x %struct.jpeg_component_info*], i32, i32, i32, [10 x i32], i32, i32, i32, i32, i32, i32*, i32, %struct.jpeg_comp_master*, %struct.jpeg_c_main_controller*, %struct.jpeg_c_prep_controller*, %struct.jpeg_c_coef_controller*, %struct.jpeg_marker_writer*, %struct.jpeg_color_converter*, %struct.jpeg_downsampler*, %struct.jpeg_forward_dct*, %struct.jpeg_entropy_encoder*, %struct.jpeg_scan_info*, i32 }
%struct.jpeg_destination_mgr = type { i8*, i64, void (%struct.jpeg_compress_struct*)*, i32 (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)* }
%struct.jpeg_comp_master = type opaque
%struct.jpeg_c_main_controller = type opaque
%struct.jpeg_c_prep_controller = type opaque
%struct.jpeg_c_coef_controller = type opaque
%struct.jpeg_marker_writer = type opaque
%struct.jpeg_color_converter = type opaque
%struct.jpeg_downsampler = type opaque
%struct.jpeg_forward_dct = type opaque
%struct.jpeg_entropy_encoder = type opaque
%struct.jpeg_scan_info = type { i32, [4 x i32], i32, i32, i32, i32 }

@opterr = external global i32
@optarg = external global i8*
@stderr = external global %struct._IO_FILE*
@optind = external global i32
@.str = private unnamed_addr constant [6 x i8] c"f:v::\00", align 1
@.str1 = private unnamed_addr constant [24 x i8] c"Usage: %s -f [file...]\0A\00", align 1
@.str3 = private unnamed_addr constant [27 x i8] c"jpeg decompression failed\0A\00", align 1
@.str2 = private unnamed_addr constant [6 x i8] c"dummy\00", align 1
@.str4 = private unnamed_addr constant [18 x i8] c"_transformed.jpg\00\00", align 1
@.str5 = private unnamed_addr constant [4 x i8] c"%d\09\00", align 1
@libfilename_3_3 = global i8* getelementptr inbounds ([46 x i8]* @.str15, i32 0, i32 0), align 8
@libfilename_5_5 = global i8* getelementptr inbounds ([46 x i8]* @.str116, i32 0, i32 0), align 8
@libfilename_7_7 = global i8* getelementptr inbounds ([46 x i8]* @.str217, i32 0, i32 0), align 8
@env_allow_hw = global i8* getelementptr inbounds ([17 x i8]* @.str318, i32 0, i32 0), align 8
@.str41 = private unnamed_addr constant [32 x i8] c"Filter size %d, nx: %d, ny: %d\0A\00", align 1
@.str52 = private unnamed_addr constant [20 x i8] c"HW bypass 0 called\0A\00", align 1
@.str6 = private unnamed_addr constant [88 x i8] c"Parameters:\0Asrc: %p\0Adst: %p\0Akernel: %p\0AFilter size: %d\0AData size x: %d\0AData size y: %d\0A\00", align 1
@.str7 = private unnamed_addr constant [20 x i8] c"HW bypass 1 called\0A\00", align 1
@.str8 = private unnamed_addr constant [32 x i8] c"No maxfile for filter size: %d\0A\00", align 1
@.str9 = private unnamed_addr constant [35 x i8] c"Could not load shared library! %s\0A\00", align 1
@.str10 = private unnamed_addr constant [10 x i8] c"MemStream\00", align 1
@.str11 = private unnamed_addr constant [31 x i8] c"Could not find interface: %s \0A\00", align 1
@.str12 = private unnamed_addr constant [15 x i8] c"MemStream_init\00", align 1
@.str13 = private unnamed_addr constant [18 x i8] c"Initializing DFE\0A\00", align 1
@.str14 = private unnamed_addr constant [14 x i8] c"DFE finished\0A\00", align 1
@.str15 = private unnamed_addr constant [46 x i8] c"/home/lfunke/overlays/slic_convolution_3_3.so\00", align 1
@.str116 = private unnamed_addr constant [46 x i8] c"/home/lfunke/overlays/slic_convolution_5_5.so\00", align 1
@.str217 = private unnamed_addr constant [46 x i8] c"/home/lfunke/overlays/slic_convolution_7_7.so\00", align 1
@.str318 = private unnamed_addr constant [17 x i8] c"ALLOW_OP_MIGRATE\00", align 1
@.str29 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str130 = private unnamed_addr constant [15 x i8] c"can't open %s\0A\00", align 1
@.str231 = private unnamed_addr constant [47 x i8] c"Only greyscale images supported! Channels: %d\0A\00", align 1
@.str332 = private unnamed_addr constant [13 x i8] c"Image empty\0A\00", align 1
@.str433 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str534 = private unnamed_addr constant [15 x i8] c"can't open: %s\00", align 1
@.str635 = private unnamed_addr constant [40 x i8] c"Cannot handle color space, channels: %d\00", align 1

; Function Attrs: nounwind uwtable
define void @matrix_multiply(i32 %l, i32 %m, i32 %n, float* nocapture readonly %A, float* nocapture readonly %B, float* nocapture %C) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %l, i64 0, metadata !108, metadata !109), !dbg !110
  tail call void @llvm.dbg.value(metadata i32 %m, i64 0, metadata !111, metadata !109), !dbg !112
  tail call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !113, metadata !109), !dbg !114
  tail call void @llvm.dbg.value(metadata float* %A, i64 0, metadata !115, metadata !109), !dbg !116
  tail call void @llvm.dbg.value(metadata float* %B, i64 0, metadata !117, metadata !109), !dbg !118
  tail call void @llvm.dbg.value(metadata float* %C, i64 0, metadata !119, metadata !109), !dbg !120
  %0 = zext i32 %n to i64
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !121, metadata !109), !dbg !122
  %cmp19 = icmp sgt i32 %l, 0, !dbg !123
  br i1 %cmp19, label %for.cond1.preheader.preheader, label %for.end42, !dbg !126

for.cond1.preheader.preheader:                    ; preds = %entry
  %cmp217 = icmp sgt i32 %n, 0, !dbg !127
  %1 = sext i32 %n to i64
  %2 = shl nsw i64 %1, 2, !dbg !127
  %3 = sext i32 %l to i64
  %4 = add nsw i64 %3, -1, !dbg !127
  br label %for.cond1.preheader, !dbg !127

for.cond1.preheader:                              ; preds = %for.inc6, %for.cond1.preheader.preheader
  %indvars.iv720 = phi i64 [ %indvars.iv.next8, %for.inc6 ], [ 0, %for.cond1.preheader.preheader ]
  br i1 %cmp217, label %for.body3.preheader, label %for.inc6, !dbg !130

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %5 = mul i64 %0, %indvars.iv720, !dbg !130
  %scevgep = getelementptr float* %C, i64 %5
  %scevgep4 = bitcast float* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep4, i8 0, i64 %2, i32 4, i1 false), !dbg !131
  br label %for.inc6

for.cond12.preheader.preheader:                   ; preds = %for.inc6
  %6 = add nsw i64 %1, -1, !dbg !127
  %7 = zext i32 %m to i64
  %cmp169 = icmp sgt i32 %m, 0, !dbg !132
  %8 = sext i32 %m to i64
  %9 = add nsw i64 %8, -1, !dbg !139
  br label %for.cond12.preheader, !dbg !139

for.inc6:                                         ; preds = %for.body3.preheader, %for.cond1.preheader
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv720, 1, !dbg !140
  %exitcond5 = icmp eq i64 %indvars.iv720, %4, !dbg !126
  br i1 %exitcond5, label %for.cond12.preheader.preheader, label %for.cond1.preheader, !dbg !126

for.cond12.preheader:                             ; preds = %for.inc40, %for.cond12.preheader.preheader
  %indvars.iv315 = phi i64 [ %indvars.iv.next4, %for.inc40 ], [ 0, %for.cond12.preheader.preheader ]
  br i1 %cmp217, label %for.cond15.preheader.preheader, label %for.inc40, !dbg !141

for.cond15.preheader.preheader:                   ; preds = %for.cond12.preheader
  %10 = mul nsw i64 %indvars.iv315, %0, !dbg !142
  %11 = mul nsw i64 %indvars.iv315, %7, !dbg !144
  br label %for.cond15.preheader, !dbg !132

for.cond15.preheader:                             ; preds = %for.inc37, %for.cond15.preheader.preheader
  %indvars.iv112 = phi i64 [ %indvars.iv.next2, %for.inc37 ], [ 0, %for.cond15.preheader.preheader ]
  br i1 %cmp169, label %for.body17.preheader, label %for.inc37, !dbg !145

for.body17.preheader:                             ; preds = %for.cond15.preheader
  %arrayidx20.sum = add nuw nsw i64 %indvars.iv112, %10, !dbg !142
  %arrayidx21 = getelementptr inbounds float* %C, i64 %arrayidx20.sum, !dbg !142
  %12 = mul nsw i64 %indvars.iv112, %0, !dbg !146
  %.pre = load float* %arrayidx21, align 4, !dbg !142
  br label %for.body17, !dbg !142

for.body17:                                       ; preds = %for.body17, %for.body17.preheader
  %13 = phi float [ %add, %for.body17 ], [ %.pre, %for.body17.preheader ], !dbg !142
  %indvars.iv10 = phi i64 [ %indvars.iv.next, %for.body17 ], [ 0, %for.body17.preheader ]
  %arrayidx24.sum = add nuw nsw i64 %indvars.iv10, %11, !dbg !144
  %arrayidx25 = getelementptr inbounds float* %A, i64 %arrayidx24.sum, !dbg !144
  %14 = load float* %arrayidx25, align 4, !dbg !144
  %arrayidx28.sum = add nuw nsw i64 %indvars.iv10, %12, !dbg !146
  %arrayidx29 = getelementptr inbounds float* %B, i64 %arrayidx28.sum, !dbg !146
  %15 = load float* %arrayidx29, align 4, !dbg !146
  %mul = fmul float %14, %15, !dbg !144
  %add = fadd float %13, %mul, !dbg !142
  store float %add, float* %arrayidx21, align 4, !dbg !147
  %indvars.iv.next = add nuw nsw i64 %indvars.iv10, 1, !dbg !148
  %exitcond = icmp eq i64 %indvars.iv10, %9, !dbg !145
  br i1 %exitcond, label %for.inc37.loopexit, label %for.body17, !dbg !145

for.inc37.loopexit:                               ; preds = %for.body17
  br label %for.inc37

for.inc37:                                        ; preds = %for.inc37.loopexit, %for.cond15.preheader
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv112, 1, !dbg !149
  %exitcond1 = icmp eq i64 %indvars.iv112, %6, !dbg !141
  br i1 %exitcond1, label %for.inc40.loopexit, label %for.cond15.preheader, !dbg !141

for.inc40.loopexit:                               ; preds = %for.inc37
  br label %for.inc40

for.inc40:                                        ; preds = %for.inc40.loopexit, %for.cond12.preheader
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv315, 1, !dbg !150
  %exitcond2 = icmp eq i64 %indvars.iv315, %4, !dbg !151
  br i1 %exitcond2, label %for.end42.loopexit, label %for.cond12.preheader, !dbg !151

for.end42.loopexit:                               ; preds = %for.inc40
  br label %for.end42

for.end42:                                        ; preds = %for.end42.loopexit, %entry
  ret void, !dbg !152
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @transform(i8** nocapture readonly %data_in, i8** nocapture readonly %data_out, i32 %nx, i32 %ny, i32 %l, i32 %m, float* nocapture readonly %M) #0 {
entry:
  %T = alloca [3 x [1 x float]], align 4
  %0 = bitcast [3 x [1 x float]]* %T to i8*
  %A = alloca [3 x [1 x float]], align 4
  tail call void @llvm.dbg.value(metadata i8** %data_in, i64 0, metadata !153, metadata !109), !dbg !154
  tail call void @llvm.dbg.value(metadata i8** %data_out, i64 0, metadata !155, metadata !109), !dbg !156
  tail call void @llvm.dbg.value(metadata i32 %nx, i64 0, metadata !157, metadata !109), !dbg !158
  tail call void @llvm.dbg.value(metadata i32 %ny, i64 0, metadata !159, metadata !109), !dbg !160
  tail call void @llvm.dbg.value(metadata i32 %l, i64 0, metadata !161, metadata !109), !dbg !162
  tail call void @llvm.dbg.value(metadata i32 %m, i64 0, metadata !163, metadata !109), !dbg !164
  tail call void @llvm.dbg.value(metadata float* %M, i64 0, metadata !165, metadata !109), !dbg !166
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !167, metadata !109), !dbg !168
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !169, metadata !109), !dbg !170
  tail call void @llvm.dbg.declare(metadata [3 x [1 x float]]* %T, metadata !171, metadata !109), !dbg !175
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 12, i32 4, i1 false), !dbg !175
  tail call void @llvm.dbg.declare(metadata [3 x [1 x float]]* %A, metadata !176, metadata !109), !dbg !177
  %1 = bitcast [3 x [1 x float]]* %A to i8*, !dbg !177
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 12, i32 4, i1 false), !dbg !177
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !169, metadata !109), !dbg !170
  %2 = sext i32 %l to i64
  %3 = add nsw i64 %2, -1, !dbg !178
  %4 = sext i32 %m to i64
  %5 = add nsw i64 %4, -1, !dbg !178
  %sub = add nsw i32 %ny, -1, !dbg !180
  %6 = sext i32 %sub to i64, !dbg !182
  %cmp7 = icmp sgt i32 %ny, 1, !dbg !182
  br i1 %cmp7, label %for.cond1.preheader.preheader, label %for.end49, !dbg !183

for.cond1.preheader.preheader:                    ; preds = %entry
  %sub2 = add nsw i32 %nx, -1, !dbg !184
  %7 = sext i32 %sub2 to i64, !dbg !187
  %cmp35 = icmp sgt i32 %nx, 1, !dbg !187
  %arrayidx5 = getelementptr inbounds [3 x [1 x float]]* %A, i64 0, i64 0, i64 0, !dbg !188
  %arrayidx8 = getelementptr inbounds [3 x [1 x float]]* %A, i64 0, i64 1, i64 0, !dbg !190
  %arrayidx10 = getelementptr inbounds [3 x [1 x float]]* %A, i64 0, i64 2, i64 0, !dbg !191
  %8 = getelementptr inbounds [3 x [1 x float]]* %T, i64 0, i64 0, i64 0, !dbg !192
  %cmp19.i = icmp sgt i32 %l, 0, !dbg !193
  %arrayidx15 = getelementptr inbounds [3 x [1 x float]]* %T, i64 0, i64 1, i64 0, !dbg !195
  %conv17 = sitofp i32 %sub2 to float, !dbg !196
  %conv27 = sitofp i32 %sub to float, !dbg !198
  %9 = zext i32 %m to i64, !dbg !194
  %cmp169.i = icmp sgt i32 %m, 0, !dbg !200
  %10 = shl nsw i64 %2, 2, !dbg !184
  br label %for.cond1.preheader, !dbg !184

for.cond1.preheader:                              ; preds = %for.inc47, %for.cond1.preheader.preheader
  %indvars.iv38 = phi i64 [ %indvars.iv.next4, %for.inc47 ], [ 0, %for.cond1.preheader.preheader ]
  br i1 %cmp35, label %for.body4.preheader, label %for.inc47, !dbg !201

for.body4.preheader:                              ; preds = %for.cond1.preheader
  %11 = trunc i64 %indvars.iv38 to i32, !dbg !202
  %conv6 = sitofp i32 %11 to float, !dbg !202
  %arrayidx39 = getelementptr inbounds i8** %data_in, i64 %indvars.iv38, !dbg !203
  br label %for.body4, !dbg !204

for.body4:                                        ; preds = %matrix_multiply.exit, %for.body4.preheader
  %indvars.iv6 = phi i64 [ %indvars.iv.next, %matrix_multiply.exit ], [ 0, %for.body4.preheader ]
  %12 = trunc i64 %indvars.iv6 to i32, !dbg !204
  %conv = sitofp i32 %12 to float, !dbg !204
  store float %conv, float* %arrayidx5, align 4, !dbg !188
  store float %conv6, float* %arrayidx8, align 4, !dbg !190
  store float 1.000000e+00, float* %arrayidx10, align 4, !dbg !191
  tail call void @llvm.dbg.value(metadata i32 %l, i64 0, metadata !205, metadata !109), !dbg !206
  tail call void @llvm.dbg.value(metadata i32 %m, i64 0, metadata !207, metadata !109), !dbg !208
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !209, metadata !109), !dbg !210
  tail call void @llvm.dbg.value(metadata float* %M, i64 0, metadata !211, metadata !109), !dbg !212
  tail call void @llvm.dbg.value(metadata float* %arrayidx5, i64 0, metadata !213, metadata !109), !dbg !214
  tail call void @llvm.dbg.value(metadata float* %8, i64 0, metadata !215, metadata !109), !dbg !216
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !217, metadata !109), !dbg !218
  br i1 %cmp19.i, label %for.cond15.preheader.i.preheader, label %matrix_multiply.exit, !dbg !219

for.cond15.preheader.i.preheader:                 ; preds = %for.body4
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 %10, i32 4, i1 false), !dbg !220
  br label %for.cond15.preheader.i, !dbg !200

for.cond15.preheader.i:                           ; preds = %for.inc37.i, %for.cond15.preheader.i.preheader
  %indvars.iv315.i = phi i64 [ %indvars.iv.next4.i, %for.inc37.i ], [ 0, %for.cond15.preheader.i.preheader ], !dbg !194
  br i1 %cmp169.i, label %for.body17.i.preheader, label %for.inc37.i, !dbg !221

for.body17.i.preheader:                           ; preds = %for.cond15.preheader.i
  %arrayidx21.i = getelementptr inbounds [3 x [1 x float]]* %T, i64 0, i64 0, i64 %indvars.iv315.i, !dbg !222
  %13 = mul nsw i64 %indvars.iv315.i, %9, !dbg !223
  %arrayidx21.i.promoted = load float* %arrayidx21.i, align 4, !dbg !222
  br label %for.body17.i, !dbg !222

for.body17.i:                                     ; preds = %for.body17.i, %for.body17.i.preheader
  %14 = phi float [ %add.i, %for.body17.i ], [ %arrayidx21.i.promoted, %for.body17.i.preheader ], !dbg !222
  %indvars.iv10.i = phi i64 [ %indvars.iv.next.i, %for.body17.i ], [ 0, %for.body17.i.preheader ], !dbg !194
  %arrayidx24.sum.i = add nuw nsw i64 %indvars.iv10.i, %13, !dbg !223
  %arrayidx25.i = getelementptr inbounds float* %M, i64 %arrayidx24.sum.i, !dbg !223
  %15 = load float* %arrayidx25.i, align 4, !dbg !223
  %arrayidx29.i = getelementptr inbounds [3 x [1 x float]]* %A, i64 0, i64 0, i64 %indvars.iv10.i, !dbg !224
  %16 = load float* %arrayidx29.i, align 4, !dbg !224
  %mul.i = fmul float %15, %16, !dbg !223
  %add.i = fadd float %14, %mul.i, !dbg !222
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv10.i, 1, !dbg !225
  %exitcond1 = icmp eq i64 %indvars.iv10.i, %5, !dbg !221
  br i1 %exitcond1, label %for.inc37.i.loopexit, label %for.body17.i, !dbg !221

for.inc37.i.loopexit:                             ; preds = %for.body17.i
  %add.i.lcssa = phi float [ %add.i, %for.body17.i ]
  store float %add.i.lcssa, float* %arrayidx21.i, align 4, !dbg !222
  br label %for.inc37.i

for.inc37.i:                                      ; preds = %for.inc37.i.loopexit, %for.cond15.preheader.i
  %indvars.iv.next4.i = add nuw nsw i64 %indvars.iv315.i, 1, !dbg !226
  %exitcond2 = icmp eq i64 %indvars.iv315.i, %3, !dbg !227
  br i1 %exitcond2, label %matrix_multiply.exit.loopexit, label %for.cond15.preheader.i, !dbg !227

matrix_multiply.exit.loopexit:                    ; preds = %for.inc37.i
  br label %matrix_multiply.exit

matrix_multiply.exit:                             ; preds = %matrix_multiply.exit.loopexit, %for.body4
  %17 = load float* %8, align 4, !dbg !228
  tail call void @llvm.dbg.value(metadata float %17, i64 0, metadata !229, metadata !109), !dbg !230
  %18 = load float* %arrayidx15, align 4, !dbg !195
  tail call void @llvm.dbg.value(metadata float %18, i64 0, metadata !231, metadata !109), !dbg !232
  %cmp18 = fcmp ogt float %17, %conv17, !dbg !233
  tail call void @llvm.dbg.value(metadata float %conv17, i64 0, metadata !229, metadata !109), !dbg !230
  %__x.0 = select i1 %cmp18, float %conv17, float %17, !dbg !234
  %cmp22 = fcmp olt float %__x.0, 0.000000e+00, !dbg !235
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !229, metadata !109), !dbg !230
  %cmp28 = fcmp ogt float %18, %conv27, !dbg !237
  tail call void @llvm.dbg.value(metadata float %conv27, i64 0, metadata !231, metadata !109), !dbg !232
  %__y.0 = select i1 %cmp28, float %conv27, float %18, !dbg !238
  %cmp34 = fcmp olt float %__y.0, 0.000000e+00, !dbg !239
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !231, metadata !109), !dbg !232
  %19 = load i8** %arrayidx39, align 8, !dbg !203
  %arrayidx40 = getelementptr inbounds i8* %19, i64 %indvars.iv6, !dbg !203
  %20 = load i8* %arrayidx40, align 1, !dbg !203
  %21 = fptosi float %__x.0 to i32, !dbg !241
  %22 = sext i32 %21 to i64, !dbg !242
  %idxprom42 = select i1 %cmp22, i64 0, i64 %22, !dbg !242
  %23 = fptosi float %__y.0 to i32, !dbg !243
  %24 = sext i32 %23 to i64, !dbg !242
  %idxprom44 = select i1 %cmp34, i64 0, i64 %24, !dbg !242
  %arrayidx45 = getelementptr inbounds i8** %data_out, i64 %idxprom44, !dbg !242
  %25 = load i8** %arrayidx45, align 8, !dbg !242
  %arrayidx46 = getelementptr inbounds i8* %25, i64 %idxprom42, !dbg !242
  store i8 %20, i8* %arrayidx46, align 1, !dbg !242
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1, !dbg !244
  %cmp3 = icmp slt i64 %indvars.iv.next, %7, !dbg !187
  br i1 %cmp3, label %for.body4, label %for.inc47.loopexit, !dbg !201

for.inc47.loopexit:                               ; preds = %matrix_multiply.exit
  br label %for.inc47

for.inc47:                                        ; preds = %for.inc47.loopexit, %for.cond1.preheader
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv38, 1, !dbg !245
  %cmp = icmp slt i64 %indvars.iv.next4, %6, !dbg !182
  br i1 %cmp, label %for.cond1.preheader, label %for.end49.loopexit, !dbg !183

for.end49.loopexit:                               ; preds = %for.inc47
  br label %for.end49

for.end49:                                        ; preds = %for.end49.loopexit, %entry
  ret void, !dbg !246
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #3 {
entry:
  %data_input = alloca i8**, align 8
  %nrows = alloca i32, align 4
  %ncols = alloca i32, align 4
  %nchannels = alloca i32, align 4
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !36, metadata !109), !dbg !247
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !37, metadata !109), !dbg !248
  store i32 0, i32* @opterr, align 4, !dbg !249, !tbaa !250
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !38, metadata !109), !dbg !254
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !39, metadata !109), !dbg !255
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !40, metadata !109), !dbg !256
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !41, metadata !109), !dbg !257
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !42, metadata !109), !dbg !258
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !43, metadata !109), !dbg !259
  tail call void @llvm.dbg.value(metadata i8* null, i64 0, metadata !52, metadata !109), !dbg !260
  tail call void @llvm.dbg.value(metadata i8* null, i64 0, metadata !53, metadata !109), !dbg !261
  br label %while.cond.outer, !dbg !262

while.cond.outer.loopexit:                        ; preds = %while.cond
  %filename_in.0.lcssa100 = phi i8* [ %filename_in.0, %while.cond ]
  br label %while.cond.outer

while.cond.outer:                                 ; preds = %while.cond.outer.loopexit, %entry
  %verbose_output.0.ph = phi i32 [ 0, %entry ], [ 1, %while.cond.outer.loopexit ]
  %filename_in.0.ph = phi i8* [ null, %entry ], [ %filename_in.0.lcssa100, %while.cond.outer.loopexit ]
  br label %while.cond

while.cond:                                       ; preds = %sw.bb, %while.cond.outer
  %filename_in.0 = phi i8* [ %0, %sw.bb ], [ %filename_in.0.ph, %while.cond.outer ]
  %call = tail call i32 @getopt(i32 %argc, i8** %argv, i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0)) #2, !dbg !263
  tail call void @llvm.dbg.value(metadata i32 %call, i64 0, metadata !51, metadata !109), !dbg !264
  switch i32 %call, label %sw.default [
    i32 -1, label %while.end
    i32 102, label %sw.bb
    i32 118, label %while.cond.outer.loopexit
  ], !dbg !262

sw.bb:                                            ; preds = %while.cond
  %0 = load i8** @optarg, align 8, !dbg !265, !tbaa !268
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !52, metadata !109), !dbg !260
  br label %while.cond, !dbg !270

sw.default:                                       ; preds = %while.cond
  %1 = load %struct._IO_FILE** @stderr, align 8, !dbg !271, !tbaa !268
  %2 = load i8** %argv, align 8, !dbg !272, !tbaa !268
  %call2 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([24 x i8]* @.str1, i64 0, i64 0), i8* %2) #9, !dbg !273
  tail call void @exit(i32 1) #10, !dbg !274
  unreachable, !dbg !274

while.end:                                        ; preds = %while.cond
  %verbose_output.0.ph.lcssa101 = phi i32 [ %verbose_output.0.ph, %while.cond ]
  %filename_in.0.lcssa99 = phi i8* [ %filename_in.0, %while.cond ]
  %tobool = icmp eq i8* %filename_in.0.lcssa99, null, !dbg !275
  br i1 %tobool, label %if.then, label %if.else, !dbg !275

if.then:                                          ; preds = %while.end
  %3 = load i32* @optind, align 4, !dbg !276, !tbaa !250
  tail call void @llvm.dbg.value(metadata i32 %3, i64 0, metadata !38, metadata !109), !dbg !254
  %cmp382 = icmp slt i32 %3, %argc, !dbg !280
  br i1 %cmp382, label %for.body.lr.ph, label %for.end, !dbg !282

for.body.lr.ph:                                   ; preds = %if.then
  %4 = sext i32 %3 to i64
  %5 = add i32 %argc, -1, !dbg !282
  %6 = sub i32 %5, %3, !dbg !282
  br label %for.body, !dbg !282

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %indvars.iv93 = phi i64 [ %4, %for.body.lr.ph ], [ %indvars.iv.next94, %for.inc ]
  %_size_arr.085 = phi i32 [ 0, %for.body.lr.ph ], [ %_size_arr.1, %for.inc ]
  %arg.084 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.inc ]
  %inc = add nuw nsw i32 %arg.084, 1, !dbg !283
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !40, metadata !109), !dbg !256
  %cond = icmp eq i32 %arg.084, 0, !dbg !285
  br i1 %cond, label %sw.bb4, label %for.inc, !dbg !285

sw.bb4:                                           ; preds = %for.body
  %arrayidx5 = getelementptr inbounds i8** %argv, i64 %indvars.iv93, !dbg !286
  %7 = load i8** %arrayidx5, align 8, !dbg !286, !tbaa !268
  tail call void @llvm.dbg.value(metadata i8* %7, i64 0, metadata !288, metadata !109) #2, !dbg !290
  %call.i = tail call i64 @strtol(i8* nocapture %7, i8** null, i32 10) #2, !dbg !291
  %conv.i = trunc i64 %call.i to i32, !dbg !292
  tail call void @llvm.dbg.value(metadata i32 %conv.i, i64 0, metadata !43, metadata !109), !dbg !259
  br label %for.inc, !dbg !293

for.inc:                                          ; preds = %sw.bb4, %for.body
  %_size_arr.1 = phi i32 [ %conv.i, %sw.bb4 ], [ %_size_arr.085, %for.body ]
  %indvars.iv.next94 = add nsw i64 %indvars.iv93, 1, !dbg !282
  %exitcond95 = icmp eq i32 %arg.084, %6, !dbg !282
  br i1 %exitcond95, label %for.end.loopexit, label %for.body, !dbg !282

for.end.loopexit:                                 ; preds = %for.inc
  %_size_arr.1.lcssa = phi i32 [ %_size_arr.1, %for.inc ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %if.then
  %_size_arr.0.lcssa = phi i32 [ 0, %if.then ], [ %_size_arr.1.lcssa, %for.end.loopexit ]
  tail call void @llvm.dbg.value(metadata i32 %_size_arr.1, i64 0, metadata !49, metadata !109), !dbg !294
  store i32 %_size_arr.0.lcssa, i32* %ncols, align 4, !dbg !295, !tbaa !250
  tail call void @llvm.dbg.value(metadata i32 %_size_arr.1, i64 0, metadata !46, metadata !109), !dbg !296
  store i32 %_size_arr.0.lcssa, i32* %nrows, align 4, !dbg !297, !tbaa !250
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !52, metadata !109), !dbg !260
  %conv = zext i32 %_size_arr.0.lcssa to i64, !dbg !298
  tail call void @llvm.dbg.value(metadata i32* %ncols, i64 0, metadata !49, metadata !109), !dbg !294
  %call10 = tail call i8** @create_array_2d(i64 %conv, i64 %conv, i8 zeroext 1) #2, !dbg !299
  tail call void @llvm.dbg.value(metadata i8** %call10, i64 0, metadata !44, metadata !109), !dbg !300
  store i8** %call10, i8*** %data_input, align 8, !dbg !301, !tbaa !268
  tail call void @llvm.dbg.value(metadata i32* %nrows, i64 0, metadata !46, metadata !109), !dbg !296
  tail call void @llvm.dbg.value(metadata i32* %ncols, i64 0, metadata !49, metadata !109), !dbg !294
  %call13 = tail call i8** @create_array_2d(i64 %conv, i64 %conv, i8 zeroext 0) #2, !dbg !302
  tail call void @llvm.dbg.value(metadata i8** %call13, i64 0, metadata !45, metadata !109), !dbg !303
  br label %if.end21, !dbg !304

if.else:                                          ; preds = %while.end
  tail call void @llvm.dbg.value(metadata i8*** %data_input, i64 0, metadata !44, metadata !109), !dbg !300
  tail call void @llvm.dbg.value(metadata i32* %nrows, i64 0, metadata !46, metadata !109), !dbg !296
  tail call void @llvm.dbg.value(metadata i32* %ncols, i64 0, metadata !49, metadata !109), !dbg !294
  tail call void @llvm.dbg.value(metadata i32* %nchannels, i64 0, metadata !50, metadata !109), !dbg !305
  %call14 = call i32 @jpeg_decompress(i8*** %data_input, i32* %ncols, i32* %nrows, i32* %nchannels, i8* %filename_in.0.lcssa99) #2, !dbg !306
  %tobool15 = icmp eq i32 %call14, 0, !dbg !309
  br i1 %tobool15, label %if.end, label %if.then16, !dbg !309

if.then16:                                        ; preds = %if.else
  %8 = load %struct._IO_FILE** @stderr, align 8, !dbg !310, !tbaa !268
  %9 = call i64 @fwrite(i8* getelementptr inbounds ([27 x i8]* @.str3, i64 0, i64 0), i64 26, i64 1, %struct._IO_FILE* %8) #11, !dbg !312
  br label %return, !dbg !313

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.value(metadata i32* %nrows, i64 0, metadata !46, metadata !109), !dbg !296
  %10 = load i32* %nrows, align 4, !dbg !314, !tbaa !250
  %conv18 = zext i32 %10 to i64, !dbg !314
  call void @llvm.dbg.value(metadata i32* %ncols, i64 0, metadata !49, metadata !109), !dbg !294
  %11 = load i32* %ncols, align 4, !dbg !315, !tbaa !250
  %conv19 = zext i32 %11 to i64, !dbg !315
  %call20 = call i8** @create_array_2d(i64 %conv18, i64 %conv19, i8 zeroext 0) #2, !dbg !316
  call void @llvm.dbg.value(metadata i8** %call20, i64 0, metadata !45, metadata !109), !dbg !303
  br label %if.end21

if.end21:                                         ; preds = %if.end, %for.end
  %_size_arr.2 = phi i32 [ 0, %if.end ], [ %_size_arr.0.lcssa, %for.end ]
  %data_output.0 = phi i8** [ %call20, %if.end ], [ %call13, %for.end ]
  %filename_in.1 = phi i8* [ %filename_in.0.lcssa99, %if.end ], [ getelementptr inbounds ([6 x i8]* @.str2, i64 0, i64 0), %for.end ]
  %call22 = call i64 @strlen(i8* %filename_in.1) #12, !dbg !317
  %add23 = add i64 %call22, 19, !dbg !317
  %call24 = call noalias i8* @calloc(i64 1, i64 %add23) #2, !dbg !318
  call void @llvm.dbg.value(metadata i8* %call24, i64 0, metadata !53, metadata !109), !dbg !261
  %call25 = call i64 @strlen(i8* %filename_in.1) #12, !dbg !319
  %call26 = call i8* @strncpy(i8* %call24, i8* %filename_in.1, i64 %call25) #2, !dbg !319
  %strlen = call i64 @strlen(i8* %call24), !dbg !320
  %endptr = getelementptr i8* %call24, i64 %strlen, !dbg !320
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %endptr, i8* getelementptr inbounds ([18 x i8]* @.str4, i64 0, i64 0), i64 17, i32 1, i1 false), !dbg !320
  call void @llvm.dbg.value(metadata i8*** %data_input, i64 0, metadata !44, metadata !109), !dbg !300
  %12 = load i8*** %data_input, align 8, !dbg !321, !tbaa !268
  call void @llvm.dbg.value(metadata i32* %ncols, i64 0, metadata !49, metadata !109), !dbg !294
  %13 = load i32* %ncols, align 4, !dbg !322, !tbaa !250
  call void @llvm.dbg.value(metadata i32* %nrows, i64 0, metadata !46, metadata !109), !dbg !296
  %14 = load i32* %nrows, align 4, !dbg !323, !tbaa !250
  call void @do_it(i8** %12, i8** %data_output.0, i32 %13, i32 %14), !dbg !324
  %tobool28 = icmp ne i32 %verbose_output.0.ph.lcssa101, 0, !dbg !325
  %cmp3180 = icmp sgt i32 %_size_arr.2, 0, !dbg !326
  %or.cond = and i1 %tobool28, %cmp3180, !dbg !325
  br i1 %or.cond, label %for.cond34.preheader.lr.ph, label %if.end51, !dbg !325

for.cond34.preheader.lr.ph:                       ; preds = %if.end21
  %15 = add i32 %_size_arr.2, -1, !dbg !331
  br label %for.body37.lr.ph, !dbg !331

for.body37.lr.ph:                                 ; preds = %for.end46, %for.cond34.preheader.lr.ph
  %indvars.iv89 = phi i64 [ 0, %for.cond34.preheader.lr.ph ], [ %indvars.iv.next90, %for.end46 ]
  br label %for.body37, !dbg !332

for.body37:                                       ; preds = %for.body37, %for.body37.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body37.lr.ph ], [ %indvars.iv.next, %for.body37 ]
  %arrayidx40 = getelementptr inbounds i8** %data_output.0, i64 %indvars.iv, !dbg !335
  %16 = load i8** %arrayidx40, align 8, !dbg !335, !tbaa !268
  %arrayidx41 = getelementptr inbounds i8* %16, i64 %indvars.iv89, !dbg !335
  %17 = load i8* %arrayidx41, align 1, !dbg !335, !tbaa !338
  %conv42 = zext i8 %17 to i32, !dbg !335
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str5, i64 0, i64 0), i32 %conv42) #2, !dbg !339
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !332
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !332
  %exitcond = icmp eq i32 %lftr.wideiv, %15, !dbg !332
  br i1 %exitcond, label %for.end46, label %for.body37, !dbg !332

for.end46:                                        ; preds = %for.body37
  %putchar = call i32 @putchar(i32 10) #2, !dbg !340
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1, !dbg !331
  %lftr.wideiv91 = trunc i64 %indvars.iv89 to i32, !dbg !331
  %exitcond92 = icmp eq i32 %lftr.wideiv91, %15, !dbg !331
  br i1 %exitcond92, label %if.end51.loopexit, label %for.body37.lr.ph, !dbg !331

if.end51.loopexit:                                ; preds = %for.end46
  br label %if.end51

if.end51:                                         ; preds = %if.end51.loopexit, %if.end21
  call void @llvm.dbg.value(metadata i32* %ncols, i64 0, metadata !49, metadata !109), !dbg !294
  %18 = load i32* %ncols, align 4, !dbg !341, !tbaa !250
  call void @llvm.dbg.value(metadata i32* %nrows, i64 0, metadata !46, metadata !109), !dbg !296
  %19 = load i32* %nrows, align 4, !dbg !342, !tbaa !250
  %call52 = call i32 @jpeg_compress(i8** %data_output.0, i32 %18, i32 %19, i32 1, i8* %call24) #2, !dbg !343
  call void @llvm.dbg.value(metadata i32* %nrows, i64 0, metadata !46, metadata !109), !dbg !296
  %20 = load i32* %nrows, align 4, !dbg !344, !tbaa !250
  %conv53 = zext i32 %20 to i64, !dbg !344
  call void @llvm.dbg.value(metadata i8*** %data_input, i64 0, metadata !44, metadata !109), !dbg !300
  %21 = load i8*** %data_input, align 8, !dbg !345, !tbaa !268
  call void @free_array_2d(i64 %conv53, i8** %21) #2, !dbg !346
  call void @llvm.dbg.value(metadata i32* %nrows, i64 0, metadata !46, metadata !109), !dbg !296
  %22 = load i32* %nrows, align 4, !dbg !347, !tbaa !250
  %conv54 = zext i32 %22 to i64, !dbg !347
  call void @free_array_2d(i64 %conv54, i8** %data_output.0) #2, !dbg !348
  br label %return, !dbg !349

return:                                           ; preds = %if.end51, %if.then16
  %retval.0 = phi i32 [ 1, %if.then16 ], [ 0, %if.end51 ]
  ret i32 %retval.0, !dbg !350
}

; Function Attrs: nounwind
declare i32 @getopt(i32, i8**, i8*) #4

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32) #5

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #4

; Function Attrs: nounwind readonly
declare i64 @strlen(i8* nocapture) #6

; Function Attrs: nounwind
declare i8* @strncpy(i8*, i8* nocapture readonly, i64) #4

; Function Attrs: nounwind uwtable
define void @do_it(i8** %in, i8** %out, i32 %nx, i32 %ny) #3 {
entry:
  %T = alloca [3 x [3 x float]], align 16
  %S = alloca [3 x [3 x float]], align 16
  %SH = alloca [3 x [3 x float]], align 16
  tail call void @llvm.dbg.value(metadata i8** %in, i64 0, metadata !58, metadata !109), !dbg !352
  tail call void @llvm.dbg.value(metadata i8** %out, i64 0, metadata !59, metadata !109), !dbg !353
  tail call void @llvm.dbg.value(metadata i32 %nx, i64 0, metadata !60, metadata !109), !dbg !354
  tail call void @llvm.dbg.value(metadata i32 %ny, i64 0, metadata !61, metadata !109), !dbg !355
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !62, metadata !109), !dbg !356
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !63, metadata !109), !dbg !357
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !64, metadata !109), !dbg !358
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !65, metadata !109), !dbg !359
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !66, metadata !109), !dbg !360
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !67, metadata !109), !dbg !361
  tail call void @llvm.dbg.value(metadata i32 50, i64 0, metadata !63, metadata !109), !dbg !357
  tail call void @llvm.dbg.value(metadata i32 50, i64 0, metadata !62, metadata !109), !dbg !356
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !65, metadata !109), !dbg !359
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !64, metadata !109), !dbg !358
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !66, metadata !109), !dbg !360
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !67, metadata !109), !dbg !361
  %0 = bitcast [3 x [3 x float]]* %T to i8*, !dbg !362
  call void @llvm.lifetime.start(i64 36, i8* %0) #2, !dbg !362
  tail call void @llvm.dbg.declare(metadata [3 x [3 x float]]* %T, metadata !68, metadata !109), !dbg !363
  %arrayinit.begin1 = getelementptr inbounds [3 x [3 x float]]* %T, i64 0, i64 0, i64 0, !dbg !363
  store float 1.000000e+00, float* %arrayinit.begin1, align 16, !dbg !363, !tbaa !364
  %arrayinit.element = getelementptr inbounds [3 x [3 x float]]* %T, i64 0, i64 0, i64 1, !dbg !363
  store float 0.000000e+00, float* %arrayinit.element, align 4, !dbg !363, !tbaa !364
  %arrayinit.element2 = getelementptr inbounds [3 x [3 x float]]* %T, i64 0, i64 0, i64 2, !dbg !363
  store float 5.000000e+01, float* %arrayinit.element2, align 8, !dbg !363, !tbaa !364
  %arrayinit.begin4 = getelementptr inbounds [3 x [3 x float]]* %T, i64 0, i64 1, i64 0, !dbg !363
  store float 0.000000e+00, float* %arrayinit.begin4, align 4, !dbg !363, !tbaa !364
  %arrayinit.element5 = getelementptr inbounds [3 x [3 x float]]* %T, i64 0, i64 1, i64 1, !dbg !363
  store float 1.000000e+00, float* %arrayinit.element5, align 4, !dbg !363, !tbaa !364
  %arrayinit.element6 = getelementptr inbounds [3 x [3 x float]]* %T, i64 0, i64 1, i64 2, !dbg !363
  store float 5.000000e+01, float* %arrayinit.element6, align 4, !dbg !363, !tbaa !364
  %arrayinit.begin9 = getelementptr inbounds [3 x [3 x float]]* %T, i64 0, i64 2, i64 0, !dbg !363
  store float 0.000000e+00, float* %arrayinit.begin9, align 8, !dbg !363, !tbaa !364
  %arrayinit.element10 = getelementptr inbounds [3 x [3 x float]]* %T, i64 0, i64 2, i64 1, !dbg !363
  store float 0.000000e+00, float* %arrayinit.element10, align 4, !dbg !363, !tbaa !364
  %arrayinit.element11 = getelementptr inbounds [3 x [3 x float]]* %T, i64 0, i64 2, i64 2, !dbg !363
  store float 1.000000e+00, float* %arrayinit.element11, align 8, !dbg !363, !tbaa !364
  %1 = bitcast [3 x [3 x float]]* %S to i8*, !dbg !366
  call void @llvm.lifetime.start(i64 36, i8* %1) #2, !dbg !366
  tail call void @llvm.dbg.declare(metadata [3 x [3 x float]]* %S, metadata !72, metadata !109), !dbg !367
  %arrayinit.begin13 = getelementptr inbounds [3 x [3 x float]]* %S, i64 0, i64 0, i64 0, !dbg !367
  store float 5.000000e-01, float* %arrayinit.begin13, align 16, !dbg !367, !tbaa !364
  %arrayinit.element14 = getelementptr inbounds [3 x [3 x float]]* %S, i64 0, i64 0, i64 1, !dbg !367
  store float 0.000000e+00, float* %arrayinit.element14, align 4, !dbg !367, !tbaa !364
  %arrayinit.element15 = getelementptr inbounds [3 x [3 x float]]* %S, i64 0, i64 0, i64 2, !dbg !367
  store float 0.000000e+00, float* %arrayinit.element15, align 8, !dbg !367, !tbaa !364
  %arrayinit.begin17 = getelementptr inbounds [3 x [3 x float]]* %S, i64 0, i64 1, i64 0, !dbg !367
  store float 0.000000e+00, float* %arrayinit.begin17, align 4, !dbg !367, !tbaa !364
  %arrayinit.element18 = getelementptr inbounds [3 x [3 x float]]* %S, i64 0, i64 1, i64 1, !dbg !367
  store float 5.000000e-01, float* %arrayinit.element18, align 4, !dbg !367, !tbaa !364
  %arrayinit.element19 = getelementptr inbounds [3 x [3 x float]]* %S, i64 0, i64 1, i64 2, !dbg !367
  store float 0.000000e+00, float* %arrayinit.element19, align 4, !dbg !367, !tbaa !364
  %arrayinit.begin21 = getelementptr inbounds [3 x [3 x float]]* %S, i64 0, i64 2, i64 0, !dbg !367
  store float 0.000000e+00, float* %arrayinit.begin21, align 8, !dbg !367, !tbaa !364
  %arrayinit.element22 = getelementptr inbounds [3 x [3 x float]]* %S, i64 0, i64 2, i64 1, !dbg !367
  store float 0.000000e+00, float* %arrayinit.element22, align 4, !dbg !367, !tbaa !364
  %arrayinit.element23 = getelementptr inbounds [3 x [3 x float]]* %S, i64 0, i64 2, i64 2, !dbg !367
  store float 1.000000e+00, float* %arrayinit.element23, align 8, !dbg !367, !tbaa !364
  %2 = bitcast [3 x [3 x float]]* %SH to i8*, !dbg !368
  call void @llvm.lifetime.start(i64 36, i8* %2) #2, !dbg !368
  tail call void @llvm.dbg.declare(metadata [3 x [3 x float]]* %SH, metadata !73, metadata !109), !dbg !369
  %arrayinit.begin25 = getelementptr inbounds [3 x [3 x float]]* %SH, i64 0, i64 0, i64 0, !dbg !369
  store float 1.000000e+00, float* %arrayinit.begin25, align 16, !dbg !369, !tbaa !364
  %arrayinit.element26 = getelementptr inbounds [3 x [3 x float]]* %SH, i64 0, i64 0, i64 1, !dbg !369
  store float 5.000000e-01, float* %arrayinit.element26, align 4, !dbg !369, !tbaa !364
  %arrayinit.element27 = getelementptr inbounds [3 x [3 x float]]* %SH, i64 0, i64 0, i64 2, !dbg !369
  store float 0.000000e+00, float* %arrayinit.element27, align 8, !dbg !369, !tbaa !364
  %arrayinit.begin29 = getelementptr inbounds [3 x [3 x float]]* %SH, i64 0, i64 1, i64 0, !dbg !369
  store float 5.000000e-01, float* %arrayinit.begin29, align 4, !dbg !369, !tbaa !364
  %arrayinit.element30 = getelementptr inbounds [3 x [3 x float]]* %SH, i64 0, i64 1, i64 1, !dbg !369
  store float 1.000000e+00, float* %arrayinit.element30, align 4, !dbg !369, !tbaa !364
  %arrayinit.element31 = getelementptr inbounds [3 x [3 x float]]* %SH, i64 0, i64 1, i64 2, !dbg !369
  store float 0.000000e+00, float* %arrayinit.element31, align 4, !dbg !369, !tbaa !364
  %arrayinit.begin33 = getelementptr inbounds [3 x [3 x float]]* %SH, i64 0, i64 2, i64 0, !dbg !369
  store float 0.000000e+00, float* %arrayinit.begin33, align 8, !dbg !369, !tbaa !364
  %arrayinit.element34 = getelementptr inbounds [3 x [3 x float]]* %SH, i64 0, i64 2, i64 1, !dbg !369
  store float 0.000000e+00, float* %arrayinit.element34, align 4, !dbg !369, !tbaa !364
  %arrayinit.element35 = getelementptr inbounds [3 x [3 x float]]* %SH, i64 0, i64 2, i64 2, !dbg !369
  store float 1.000000e+00, float* %arrayinit.element35, align 8, !dbg !369, !tbaa !364
  %conv36 = sext i32 %ny to i64, !dbg !370
  %conv37 = sext i32 %nx to i64, !dbg !371
  tail call void @arr_set_value(i8** %out, i64 %conv36, i64 %conv37, i8 zeroext 0) #2, !dbg !372
  call void @transform(i8** %in, i8** %out, i32 %nx, i32 %ny, i32 3, i32 3, float* %arrayinit.begin1) #2, !dbg !373
  call void @arr_set_value(i8** %in, i64 %conv36, i64 %conv37, i8 zeroext 0) #2, !dbg !374
  call void @transform(i8** %out, i8** %in, i32 %nx, i32 %ny, i32 3, i32 3, float* %arrayinit.begin13) #2, !dbg !375
  call void @arr_set_value(i8** %out, i64 %conv36, i64 %conv37, i8 zeroext 0) #2, !dbg !376
  call void @transform(i8** %in, i8** %out, i32 %nx, i32 %ny, i32 3, i32 3, float* %arrayinit.begin25) #2, !dbg !377
  call void @llvm.lifetime.end(i64 36, i8* %2) #2, !dbg !378
  call void @llvm.lifetime.end(i64 36, i8* %1) #2, !dbg !378
  call void @llvm.lifetime.end(i64 36, i8* %0) #2, !dbg !378
  ret void, !dbg !378
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #4

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #4

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind
declare i32 @putchar(i32) #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #2

; Function Attrs: nounwind uwtable
define zeroext i1 @convolve_hw_use_accelerator(i32 %filter_size, i32 %nx, i32 %ny) #0 {
entry:
  %retval = alloca i1, align 1
  %filter_size.addr = alloca i32, align 4
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %allow_hw = alloca i8, align 1
  %pAllowHWAccelerationEnv = alloca i8*, align 8
  store i32 %filter_size, i32* %filter_size.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %filter_size.addr, metadata !379, metadata !109), !dbg !380
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !381, metadata !109), !dbg !382
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !383, metadata !109), !dbg !384
  call void @llvm.dbg.declare(metadata i8* %allow_hw, metadata !385, metadata !109), !dbg !386
  store i8 0, i8* %allow_hw, align 1, !dbg !386
  call void @llvm.dbg.declare(metadata i8** %pAllowHWAccelerationEnv, metadata !387, metadata !109), !dbg !388
  %0 = load i8** @env_allow_hw, align 8, !dbg !389
  %call = call i8* @getenv(i8* %0) #2, !dbg !390
  store i8* %call, i8** %pAllowHWAccelerationEnv, align 8, !dbg !388
  %1 = load i8** %pAllowHWAccelerationEnv, align 8, !dbg !391
  %tobool = icmp ne i8* %1, null, !dbg !393
  br i1 %tobool, label %if.then, label %if.end, !dbg !393

if.then:                                          ; preds = %entry
  %2 = load i8** %pAllowHWAccelerationEnv, align 8, !dbg !394
  %call1 = call i64 @strtol(i8* %2, i8** null, i32 10) #2, !dbg !396
  %conv = trunc i64 %call1 to i8, !dbg !396
  store i8 %conv, i8* %allow_hw, align 1, !dbg !397
  br label %if.end, !dbg !398

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8* %allow_hw, align 1, !dbg !399
  %tobool2 = icmp ne i8 %3, 0, !dbg !401
  br i1 %tobool2, label %if.then3, label %if.end14, !dbg !401

if.then3:                                         ; preds = %if.end
  %4 = load i32* %filter_size.addr, align 4, !dbg !402
  %5 = load i32* %nx.addr, align 4, !dbg !404
  %6 = load i32* %ny.addr, align 4, !dbg !405
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str41, i32 0, i32 0), i32 %4, i32 %5, i32 %6), !dbg !406
  %7 = load i32* %nx.addr, align 4, !dbg !407
  %cmp = icmp sge i32 %7, 10, !dbg !407
  br i1 %cmp, label %land.lhs.true, label %if.end13, !dbg !409

land.lhs.true:                                    ; preds = %if.then3
  %8 = load i32* %ny.addr, align 4, !dbg !410
  %cmp6 = icmp sge i32 %8, 10, !dbg !410
  br i1 %cmp6, label %if.then8, label %if.end13, !dbg !409

if.then8:                                         ; preds = %land.lhs.true
  %9 = load i32* %filter_size.addr, align 4, !dbg !412
  %cmp9 = icmp sgt i32 %9, 2, !dbg !412
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !414

if.then11:                                        ; preds = %if.then8
  store i1 true, i1* %retval, !dbg !415
  br label %return, !dbg !415

if.end12:                                         ; preds = %if.then8
  br label %if.end13, !dbg !416

if.end13:                                         ; preds = %if.end12, %land.lhs.true, %if.then3
  br label %if.end14, !dbg !418

if.end14:                                         ; preds = %if.end13, %if.end
  store i1 false, i1* %retval, !dbg !419
  br label %return, !dbg !419

return:                                           ; preds = %if.end14, %if.then11
  %10 = load i1* %retval, !dbg !420
  ret i1 %10, !dbg !420
}

; Function Attrs: nounwind
declare i8* @getenv(i8*) #7

; Function Attrs: nounwind uwtable
define void @convolve_bypass_hw_iface0(i8* %src, i8* %dst, float* %kernel, i32 %filter_size, i32 %nx, i32 %ny) #0 {
entry:
  %src.addr = alloca i8*, align 8
  %dst.addr = alloca i8*, align 8
  %kernel.addr = alloca float*, align 8
  %filter_size.addr = alloca i32, align 4
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  store i8* %src, i8** %src.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %src.addr, metadata !421, metadata !109), !dbg !422
  store i8* %dst, i8** %dst.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dst.addr, metadata !423, metadata !109), !dbg !424
  store float* %kernel, float** %kernel.addr, align 8
  call void @llvm.dbg.declare(metadata float** %kernel.addr, metadata !425, metadata !109), !dbg !426
  store i32 %filter_size, i32* %filter_size.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %filter_size.addr, metadata !427, metadata !109), !dbg !428
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !429, metadata !109), !dbg !430
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !431, metadata !109), !dbg !432
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str52, i32 0, i32 0)), !dbg !433
  %0 = load i8** %src.addr, align 8, !dbg !434
  %1 = load i8** %dst.addr, align 8, !dbg !435
  %2 = load float** %kernel.addr, align 8, !dbg !436
  %3 = load i32* %filter_size.addr, align 4, !dbg !437
  %4 = load i32* %nx.addr, align 4, !dbg !438
  %5 = load i32* %ny.addr, align 4, !dbg !439
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([88 x i8]* @.str6, i32 0, i32 0), i8* %0, i8* %1, float* %2, i32 %3, i32 %4, i32 %5), !dbg !440
  ret void, !dbg !441
}

; Function Attrs: nounwind uwtable
define void @convolve_bypass_hw_iface1(i8** %src, i8** %dst, float* %kernel, i32 %filter_size, i32 %nx, i32 %ny) #0 {
entry:
  %src.addr = alloca i8**, align 8
  %dst.addr = alloca i8**, align 8
  %kernel.addr = alloca float*, align 8
  %filter_size.addr = alloca i32, align 4
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %error = alloca i8*, align 8
  %libfile = alloca i8*, align 8
  %in = alloca i8*, align 8
  %out = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %ifaceptr = alloca void (i64, i32, i32, float*, i8*, i8*)*, align 8
  %max_init = alloca %struct.max_file* (...)*, align 8
  %dlhandle = alloca i8*, align 8
  store i8** %src, i8*** %src.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %src.addr, metadata !442, metadata !109), !dbg !443
  store i8** %dst, i8*** %dst.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dst.addr, metadata !444, metadata !109), !dbg !445
  store float* %kernel, float** %kernel.addr, align 8
  call void @llvm.dbg.declare(metadata float** %kernel.addr, metadata !446, metadata !109), !dbg !447
  store i32 %filter_size, i32* %filter_size.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %filter_size.addr, metadata !448, metadata !109), !dbg !449
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !450, metadata !109), !dbg !451
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !452, metadata !109), !dbg !453
  call void @llvm.dbg.declare(metadata i8** %error, metadata !454, metadata !109), !dbg !455
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str7, i32 0, i32 0)), !dbg !456
  %0 = load i8*** %src.addr, align 8, !dbg !457
  %1 = load i8*** %dst.addr, align 8, !dbg !458
  %2 = load float** %kernel.addr, align 8, !dbg !459
  %3 = load i32* %filter_size.addr, align 4, !dbg !460
  %4 = load i32* %nx.addr, align 4, !dbg !461
  %5 = load i32* %ny.addr, align 4, !dbg !462
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([88 x i8]* @.str6, i32 0, i32 0), i8** %0, i8** %1, float* %2, i32 %3, i32 %4, i32 %5), !dbg !463
  call void @llvm.dbg.declare(metadata i8** %libfile, metadata !464, metadata !109), !dbg !465
  %6 = load i32* %filter_size.addr, align 4, !dbg !466
  %cmp = icmp eq i32 %6, 3, !dbg !466
  br i1 %cmp, label %if.then, label %if.else, !dbg !468

if.then:                                          ; preds = %entry
  %7 = load i8** @libfilename_3_3, align 8, !dbg !469
  store i8* %7, i8** %libfile, align 8, !dbg !471
  br label %if.end10, !dbg !472

if.else:                                          ; preds = %entry
  %8 = load i32* %filter_size.addr, align 4, !dbg !473
  %cmp2 = icmp eq i32 %8, 5, !dbg !473
  br i1 %cmp2, label %if.then3, label %if.else4, !dbg !475

if.then3:                                         ; preds = %if.else
  %9 = load i8** @libfilename_5_5, align 8, !dbg !476
  store i8* %9, i8** %libfile, align 8, !dbg !478
  br label %if.end9, !dbg !479

if.else4:                                         ; preds = %if.else
  %10 = load i32* %filter_size.addr, align 4, !dbg !480
  %cmp5 = icmp eq i32 %10, 7, !dbg !480
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !482

if.then6:                                         ; preds = %if.else4
  %11 = load i8** @libfilename_7_7, align 8, !dbg !483
  store i8* %11, i8** %libfile, align 8, !dbg !485
  br label %if.end, !dbg !486

if.else7:                                         ; preds = %if.else4
  %12 = load i32* %filter_size.addr, align 4, !dbg !487
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str8, i32 0, i32 0), i32 %12), !dbg !489
  br label %return, !dbg !490

if.end:                                           ; preds = %if.then6
  br label %if.end9

if.end9:                                          ; preds = %if.end, %if.then3
  br label %if.end10

if.end10:                                         ; preds = %if.end9, %if.then
  call void @llvm.dbg.declare(metadata i8** %in, metadata !491, metadata !109), !dbg !492
  %13 = load i32* %nx.addr, align 4, !dbg !493
  %conv = sext i32 %13 to i64, !dbg !493
  %mul = mul i64 1, %conv, !dbg !494
  %14 = load i32* %ny.addr, align 4, !dbg !495
  %conv11 = sext i32 %14 to i64, !dbg !495
  %mul12 = mul i64 %mul, %conv11, !dbg !494
  %call13 = call noalias i8* @malloc(i64 %mul12) #2, !dbg !496
  store i8* %call13, i8** %in, align 8, !dbg !492
  call void @llvm.dbg.declare(metadata i8** %out, metadata !497, metadata !109), !dbg !498
  %15 = load i32* %nx.addr, align 4, !dbg !499
  %conv14 = sext i32 %15 to i64, !dbg !499
  %mul15 = mul i64 1, %conv14, !dbg !500
  %16 = load i32* %ny.addr, align 4, !dbg !501
  %conv16 = sext i32 %16 to i64, !dbg !501
  %mul17 = mul i64 %mul15, %conv16, !dbg !500
  %call18 = call noalias i8* @malloc(i64 %mul17) #2, !dbg !502
  store i8* %call18, i8** %out, align 8, !dbg !498
  call void @llvm.dbg.declare(metadata i32* %i, metadata !503, metadata !109), !dbg !504
  store i32 0, i32* %i, align 4, !dbg !504
  call void @llvm.dbg.declare(metadata i32* %j, metadata !505, metadata !109), !dbg !506
  store i32 0, i32* %j, align 4, !dbg !506
  store i32 0, i32* %i, align 4, !dbg !507
  br label %for.cond, !dbg !507

for.cond:                                         ; preds = %for.inc, %if.end10
  %17 = load i32* %i, align 4, !dbg !509
  %18 = load i32* %ny.addr, align 4, !dbg !513
  %cmp19 = icmp slt i32 %17, %18, !dbg !514
  br i1 %cmp19, label %for.body, label %for.end, !dbg !515

for.body:                                         ; preds = %for.cond
  %19 = load i32* %i, align 4, !dbg !516
  %20 = load i32* %nx.addr, align 4, !dbg !517
  %mul21 = mul nsw i32 %19, %20, !dbg !516
  %idxprom = sext i32 %mul21 to i64, !dbg !518
  %21 = load i8** %in, align 8, !dbg !519
  %arrayidx = getelementptr inbounds i8* %21, i64 %idxprom, !dbg !518
  %22 = load i32* %i, align 4, !dbg !520
  %idxprom22 = sext i32 %22 to i64, !dbg !521
  %23 = load i8*** %src.addr, align 8, !dbg !521
  %arrayidx23 = getelementptr inbounds i8** %23, i64 %idxprom22, !dbg !521
  %24 = load i8** %arrayidx23, align 8, !dbg !521
  %25 = load i32* %nx.addr, align 4, !dbg !522
  %conv24 = sext i32 %25 to i64, !dbg !522
  %mul25 = mul i64 1, %conv24, !dbg !523
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %arrayidx, i8* %24, i64 %mul25, i32 1, i1 false), !dbg !518
  br label %for.inc, !dbg !518

for.inc:                                          ; preds = %for.body
  %26 = load i32* %i, align 4, !dbg !524
  %inc = add nsw i32 %26, 1, !dbg !524
  store i32 %inc, i32* %i, align 4, !dbg !524
  br label %for.cond, !dbg !525

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata void (i64, i32, i32, float*, i8*, i8*)** %ifaceptr, metadata !526, metadata !109), !dbg !536
  call void @llvm.dbg.declare(metadata %struct.max_file* (...)** %max_init, metadata !537, metadata !109), !dbg !554
  call void @llvm.dbg.declare(metadata i8** %dlhandle, metadata !555, metadata !109), !dbg !556
  %27 = load i8** %libfile, align 8, !dbg !557
  %call26 = call i8* @dlopen(i8* %27, i32 257) #2, !dbg !558
  store i8* %call26, i8** %dlhandle, align 8, !dbg !556
  %28 = load i8** %dlhandle, align 8, !dbg !559
  %tobool = icmp ne i8* %28, null, !dbg !561
  br i1 %tobool, label %if.end30, label %if.then27, !dbg !561

if.then27:                                        ; preds = %for.end
  %call28 = call i8* @dlerror() #2, !dbg !562
  store i8* %call28, i8** %error, align 8, !dbg !564
  %29 = load i8** %error, align 8, !dbg !565
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str9, i32 0, i32 0), i8* %29), !dbg !566
  br label %return, !dbg !567

if.end30:                                         ; preds = %for.end
  %30 = load i8** %dlhandle, align 8, !dbg !568
  %call31 = call i8* @dlsym(i8* %30, i8* getelementptr inbounds ([10 x i8]* @.str10, i32 0, i32 0)) #2, !dbg !569
  %31 = bitcast i8* %call31 to void (i64, i32, i32, float*, i8*, i8*)*, !dbg !569
  store void (i64, i32, i32, float*, i8*, i8*)* %31, void (i64, i32, i32, float*, i8*, i8*)** %ifaceptr, align 8, !dbg !570
  %call32 = call i8* @dlerror() #2, !dbg !571
  store i8* %call32, i8** %error, align 8, !dbg !573
  %cmp33 = icmp ne i8* %call32, null, !dbg !574
  br i1 %cmp33, label %if.then35, label %if.end37, !dbg !575

if.then35:                                        ; preds = %if.end30
  %32 = load i8** %error, align 8, !dbg !576
  %call36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i8* %32), !dbg !578
  br label %return, !dbg !579

if.end37:                                         ; preds = %if.end30
  %33 = load i8** %dlhandle, align 8, !dbg !580
  %call38 = call i8* @dlsym(i8* %33, i8* getelementptr inbounds ([15 x i8]* @.str12, i32 0, i32 0)) #2, !dbg !581
  %34 = bitcast i8* %call38 to %struct.max_file* (...)*, !dbg !581
  store %struct.max_file* (...)* %34, %struct.max_file* (...)** %max_init, align 8, !dbg !582
  %call39 = call i8* @dlerror() #2, !dbg !583
  store i8* %call39, i8** %error, align 8, !dbg !585
  %cmp40 = icmp ne i8* %call39, null, !dbg !586
  br i1 %cmp40, label %if.then42, label %if.end44, !dbg !587

if.then42:                                        ; preds = %if.end37
  %35 = load i8** %error, align 8, !dbg !588
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i8* %35), !dbg !590
  br label %return, !dbg !591

if.end44:                                         ; preds = %if.end37
  %call45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str13, i32 0, i32 0)), !dbg !592
  %36 = load void (i64, i32, i32, float*, i8*, i8*)** %ifaceptr, align 8, !dbg !593
  %37 = load i32* %nx.addr, align 4, !dbg !594
  %38 = load i32* %ny.addr, align 4, !dbg !595
  %mul46 = mul nsw i32 %37, %38, !dbg !594
  %conv47 = sext i32 %mul46 to i64, !dbg !594
  %39 = load i32* %nx.addr, align 4, !dbg !596
  %40 = load i32* %ny.addr, align 4, !dbg !597
  %41 = load float** %kernel.addr, align 8, !dbg !598
  %42 = load i8** %in, align 8, !dbg !599
  %43 = load i8** %out, align 8, !dbg !600
  call void %36(i64 %conv47, i32 %39, i32 %40, float* %41, i8* %42, i8* %43), !dbg !593
  %call48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str14, i32 0, i32 0)), !dbg !601
  %44 = load i8** %dlhandle, align 8, !dbg !602
  %call49 = call i32 @dlclose(i8* %44) #2, !dbg !603
  store i32 0, i32* %i, align 4, !dbg !604
  br label %for.cond50, !dbg !604

for.cond50:                                       ; preds = %for.inc61, %if.end44
  %45 = load i32* %i, align 4, !dbg !606
  %46 = load i32* %ny.addr, align 4, !dbg !610
  %cmp51 = icmp slt i32 %45, %46, !dbg !611
  br i1 %cmp51, label %for.body53, label %for.end63, !dbg !612

for.body53:                                       ; preds = %for.cond50
  %47 = load i32* %i, align 4, !dbg !613
  %idxprom54 = sext i32 %47 to i64, !dbg !614
  %48 = load i8*** %dst.addr, align 8, !dbg !614
  %arrayidx55 = getelementptr inbounds i8** %48, i64 %idxprom54, !dbg !614
  %49 = load i8** %arrayidx55, align 8, !dbg !614
  %50 = load i32* %i, align 4, !dbg !615
  %51 = load i32* %nx.addr, align 4, !dbg !616
  %mul56 = mul nsw i32 %50, %51, !dbg !615
  %idxprom57 = sext i32 %mul56 to i64, !dbg !617
  %52 = load i8** %out, align 8, !dbg !618
  %arrayidx58 = getelementptr inbounds i8* %52, i64 %idxprom57, !dbg !617
  %53 = load i32* %nx.addr, align 4, !dbg !619
  %conv59 = sext i32 %53 to i64, !dbg !619
  %mul60 = mul i64 1, %conv59, !dbg !620
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %49, i8* %arrayidx58, i64 %mul60, i32 1, i1 false), !dbg !617
  br label %for.inc61, !dbg !617

for.inc61:                                        ; preds = %for.body53
  %54 = load i32* %i, align 4, !dbg !621
  %inc62 = add nsw i32 %54, 1, !dbg !621
  store i32 %inc62, i32* %i, align 4, !dbg !621
  br label %for.cond50, !dbg !622

for.end63:                                        ; preds = %for.cond50
  %55 = load i8** %in, align 8, !dbg !623
  call void @free(i8* %55) #2, !dbg !624
  %56 = load i8** %out, align 8, !dbg !625
  call void @free(i8* %56) #2, !dbg !626
  br label %return, !dbg !627

return:                                           ; preds = %for.end63, %if.then42, %if.then35, %if.then27, %if.else7
  ret void, !dbg !628
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #7

; Function Attrs: nounwind
declare i8* @dlopen(i8*, i32) #7

; Function Attrs: nounwind
declare i8* @dlerror() #7

; Function Attrs: nounwind
declare i8* @dlsym(i8*, i8*) #7

; Function Attrs: nounwind
declare i32 @dlclose(i8*) #7

; Function Attrs: nounwind
declare void @free(i8*) #7

; Function Attrs: nounwind uwtable
define void @free_array_2d(i64 %nrows, i8** nocapture %arr) #3 {
entry:
  %cmp5 = icmp eq i64 %nrows, 0
  br i1 %cmp5, label %for.end, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %entry
  %0 = add i64 %nrows, -1
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds i8** %arr, i64 %indvars.iv
  %1 = load i8** %arrayidx, align 8, !tbaa !268
  tail call void @free(i8* %1) #2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv, %0
  br i1 %exitcond, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %2 = bitcast i8** %arr to i8*
  tail call void @free(i8* %2) #2
  ret void
}

; Function Attrs: nounwind uwtable
define noalias i8** @create_array_2d(i64 %nrows, i64 %ncols, i8 zeroext %init) #3 {
entry:
  %mul = shl i64 %nrows, 3
  %call = tail call noalias i8* @malloc(i64 %mul) #2
  %0 = bitcast i8* %call to i8**
  %cmp28 = icmp eq i64 %nrows, 0
  br i1 %cmp28, label %for.end15, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %entry
  %cmp625 = icmp eq i64 %ncols, 0
  %1 = add i64 %nrows, -1
  br label %for.body

for.body:                                         ; preds = %for.inc13, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.inc13 ]
  %call3 = tail call noalias i8* @malloc(i64 %ncols) #2
  %arrayidx = getelementptr inbounds i8** %0, i64 %indvars.iv
  store i8* %call3, i8** %arrayidx, align 8, !tbaa !268
  br i1 %cmp625, label %for.inc13, label %for.body8.lr.ph

for.body8.lr.ph:                                  ; preds = %for.body
  call void @llvm.memset.p0i8.i64(i8* %call3, i8 %init, i64 %ncols, i32 1, i1 false)
  br label %for.inc13

for.inc13:                                        ; preds = %for.body8.lr.ph, %for.body
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv, %1
  br i1 %exitcond, label %for.end15.loopexit, label %for.body

for.end15.loopexit:                               ; preds = %for.inc13
  br label %for.end15

for.end15:                                        ; preds = %for.end15.loopexit, %entry
  ret i8** %0
}

; Function Attrs: nounwind uwtable
define void @arr_set_value(i8** nocapture readonly %arr, i64 %nrows, i64 %ncols, i8 zeroext %val) #3 {
entry:
  %cmp19 = icmp eq i64 %nrows, 0
  br i1 %cmp19, label %for.end11, label %for.cond2.preheader.lr.ph

for.cond2.preheader.lr.ph:                        ; preds = %entry
  %cmp416 = icmp eq i64 %ncols, 0
  %0 = add i64 %ncols, -1
  %1 = add i64 %nrows, -1
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc9, %for.cond2.preheader.lr.ph
  %indvars.iv22 = phi i64 [ 0, %for.cond2.preheader.lr.ph ], [ %indvars.iv.next23, %for.inc9 ]
  br i1 %cmp416, label %for.inc9, label %for.body6.lr.ph

for.body6.lr.ph:                                  ; preds = %for.cond2.preheader
  %arrayidx = getelementptr inbounds i8** %arr, i64 %indvars.iv22
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.body6.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body6.lr.ph ], [ %indvars.iv.next, %for.body6 ]
  %2 = load i8** %arrayidx, align 8, !tbaa !268
  %arrayidx8 = getelementptr inbounds i8* %2, i64 %indvars.iv
  store i8 %val, i8* %arrayidx8, align 1, !tbaa !338
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv, %0
  br i1 %exitcond, label %for.inc9.loopexit, label %for.body6

for.inc9.loopexit:                                ; preds = %for.body6
  br label %for.inc9

for.inc9:                                         ; preds = %for.inc9.loopexit, %for.cond2.preheader
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond24 = icmp eq i64 %indvars.iv22, %1
  br i1 %exitcond24, label %for.end11.loopexit, label %for.cond2.preheader

for.end11.loopexit:                               ; preds = %for.inc9
  br label %for.end11

for.end11:                                        ; preds = %for.end11.loopexit, %entry
  ret void
}

; Function Attrs: nounwind uwtable
define void @arr_copy(i8** nocapture readonly %src, i8** nocapture readonly %dst, i64 %ny, i64 %nx) #3 {
entry:
  %cmp7 = icmp eq i64 %ny, 0
  br i1 %cmp7, label %for.end, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %entry
  %0 = add i64 %ny, -1
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds i8** %dst, i64 %indvars.iv
  %1 = load i8** %arrayidx, align 8, !tbaa !268
  %arrayidx3 = getelementptr inbounds i8** %src, i64 %indvars.iv
  %2 = load i8** %arrayidx3, align 8, !tbaa !268
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %2, i64 %nx, i32 1, i1 false)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv, %0
  br i1 %exitcond, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @jpeg_decompress(i8*** nocapture %data, i32* nocapture %nx, i32* nocapture %ny, i32* nocapture %nc, i8* %filename) #3 {
entry:
  %err = alloca %struct.jpeg_error_mgr, align 8
  %cinfo = alloca %struct.jpeg_decompress_struct, align 8
  %0 = bitcast %struct.jpeg_error_mgr* %err to i8*
  call void @llvm.lifetime.start(i64 168, i8* %0) #2
  %1 = bitcast %struct.jpeg_decompress_struct* %cinfo to i8*
  call void @llvm.lifetime.start(i64 656, i8* %1) #2
  %call = call %struct.jpeg_error_mgr* @jpeg_std_error(%struct.jpeg_error_mgr* %err) #2
  %err1 = getelementptr inbounds %struct.jpeg_decompress_struct* %cinfo, i64 0, i32 0
  store %struct.jpeg_error_mgr* %call, %struct.jpeg_error_mgr** %err1, align 8, !tbaa !630
  call void @jpeg_CreateDecompress(%struct.jpeg_decompress_struct* %cinfo, i32 80, i64 656) #2
  %call2 = call %struct._IO_FILE* @fopen(i8* %filename, i8* getelementptr inbounds ([3 x i8]* @.str29, i64 0, i64 0)) #2
  %cmp = icmp eq %struct._IO_FILE* %call2, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct._IO_FILE** @stderr, align 8, !tbaa !268
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8]* @.str130, i64 0, i64 0), i8* %filename) #9
  br label %cleanup

if.end:                                           ; preds = %entry
  call void @jpeg_stdio_src(%struct.jpeg_decompress_struct* %cinfo, %struct._IO_FILE* %call2) #2
  %call4 = call i32 @jpeg_read_header(%struct.jpeg_decompress_struct* %cinfo, i32 1) #2
  %call5 = call i32 @jpeg_start_decompress(%struct.jpeg_decompress_struct* %cinfo) #2
  %output_width = getelementptr inbounds %struct.jpeg_decompress_struct* %cinfo, i64 0, i32 27
  %3 = bitcast i32* %output_width to i64*
  %4 = load i64* %3, align 8
  %5 = trunc i64 %4 to i32
  store i32 %5, i32* %nx, align 4, !tbaa !250
  %output_height = getelementptr inbounds %struct.jpeg_decompress_struct* %cinfo, i64 0, i32 28
  %6 = lshr i64 %4, 32
  %7 = trunc i64 %6 to i32
  store i32 %7, i32* %ny, align 4, !tbaa !250
  %actual_number_of_colors = getelementptr inbounds %struct.jpeg_decompress_struct* %cinfo, i64 0, i32 32
  %8 = load i32* %actual_number_of_colors, align 4, !tbaa !634
  store i32 %8, i32* %nc, align 4, !tbaa !250
  %cmp6 = icmp ugt i32 %8, 1
  br i1 %cmp6, label %if.then7, label %if.end10

if.then7:                                         ; preds = %if.end
  %9 = load %struct._IO_FILE** @stderr, align 8, !tbaa !268
  %call8 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([47 x i8]* @.str231, i64 0, i64 0), i32 %8) #9
  %call9 = call i32 @jpeg_finish_decompress(%struct.jpeg_decompress_struct* %cinfo) #2
  call void @jpeg_destroy_decompress(%struct.jpeg_decompress_struct* %cinfo) #2
  br label %cleanup

if.end10:                                         ; preds = %if.end
  %10 = load i32* %nx, align 4, !tbaa !250
  %cmp11 = icmp eq i32 %10, 0
  %11 = load i32* %ny, align 4, !tbaa !250
  %12 = or i32 %10, %11
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %if.then13, label %if.end15

if.then13:                                        ; preds = %if.end10
  %14 = load %struct._IO_FILE** @stderr, align 8, !tbaa !268
  %15 = call i64 @fwrite(i8* getelementptr inbounds ([13 x i8]* @.str332, i64 0, i64 0), i64 12, i64 1, %struct._IO_FILE* %14) #11
  br label %cleanup

if.end15:                                         ; preds = %if.end10
  %conv = zext i32 %11 to i64
  %conv16 = zext i32 %10 to i64
  %mul.i = shl nuw nsw i64 %conv, 3
  %call.i = call noalias i8* @malloc(i64 %mul.i) #2
  %16 = bitcast i8* %call.i to i8**
  %cmp28.i = icmp eq i32 %11, 0
  br i1 %cmp28.i, label %while.cond.preheader, label %for.body.lr.ph.i

for.body.lr.ph.i:                                 ; preds = %if.end15
  %17 = add nsw i64 %conv, -1
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc13.i, %for.body.lr.ph.i
  %indvars.iv.i = phi i64 [ 0, %for.body.lr.ph.i ], [ %indvars.iv.next.i, %for.inc13.i ]
  %call3.i = call noalias i8* @malloc(i64 %conv16) #2
  %arrayidx.i = getelementptr inbounds i8** %16, i64 %indvars.iv.i
  store i8* %call3.i, i8** %arrayidx.i, align 8, !tbaa !268
  br i1 %cmp11, label %for.inc13.i, label %for.body8.lr.ph.i

for.body8.lr.ph.i:                                ; preds = %for.body.i
  call void @llvm.memset.p0i8.i64(i8* %call3.i, i8 0, i64 %conv16, i32 1, i1 false) #2
  br label %for.inc13.i

for.inc13.i:                                      ; preds = %for.body8.lr.ph.i, %for.body.i
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.i, %17
  br i1 %exitcond.i, label %while.cond.preheader.loopexit, label %for.body.i

while.cond.preheader.loopexit:                    ; preds = %for.inc13.i
  br label %while.cond.preheader

while.cond.preheader:                             ; preds = %while.cond.preheader.loopexit, %if.end15
  %output_scanline = getelementptr inbounds %struct.jpeg_decompress_struct* %cinfo, i64 0, i32 34
  %18 = load i32* %output_scanline, align 8, !tbaa !635
  %cmp1935 = icmp ult i32 %18, %7
  br i1 %cmp1935, label %while.body.preheader, label %while.end

while.body.preheader:                             ; preds = %while.cond.preheader
  br label %while.body

while.body:                                       ; preds = %while.body, %while.body.preheader
  %19 = phi i32 [ %20, %while.body ], [ %18, %while.body.preheader ]
  %idxprom = zext i32 %19 to i64
  %arrayidx = getelementptr inbounds i8** %16, i64 %idxprom
  %call22 = call i32 @jpeg_read_scanlines(%struct.jpeg_decompress_struct* %cinfo, i8** %arrayidx, i32 1) #2
  %20 = load i32* %output_scanline, align 8, !tbaa !635
  %21 = load i32* %output_height, align 4, !tbaa !636
  %cmp19 = icmp ult i32 %20, %21
  br i1 %cmp19, label %while.body, label %while.end.loopexit

while.end.loopexit:                               ; preds = %while.body
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %while.cond.preheader
  %22 = bitcast i8*** %data to i8**
  store i8* %call.i, i8** %22, align 8, !tbaa !268
  %call23 = call i32 @jpeg_finish_decompress(%struct.jpeg_decompress_struct* %cinfo) #2
  call void @jpeg_destroy_decompress(%struct.jpeg_decompress_struct* %cinfo) #2
  %call24 = call i32 @fclose(%struct._IO_FILE* %call2) #2
  br label %cleanup

cleanup:                                          ; preds = %while.end, %if.then13, %if.then7, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 1, %if.then7 ], [ 1, %if.then13 ], [ 0, %while.end ]
  call void @llvm.lifetime.end(i64 656, i8* %1) #2
  call void @llvm.lifetime.end(i64 168, i8* %0) #2
  ret i32 %retval.0
}

declare %struct.jpeg_error_mgr* @jpeg_std_error(%struct.jpeg_error_mgr*) #8

declare void @jpeg_CreateDecompress(%struct.jpeg_decompress_struct*, i32, i64) #8

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) #4

declare void @jpeg_stdio_src(%struct.jpeg_decompress_struct*, %struct._IO_FILE*) #8

declare i32 @jpeg_read_header(%struct.jpeg_decompress_struct*, i32) #8

declare i32 @jpeg_start_decompress(%struct.jpeg_decompress_struct*) #8

declare i32 @jpeg_finish_decompress(%struct.jpeg_decompress_struct*) #8

declare void @jpeg_destroy_decompress(%struct.jpeg_decompress_struct*) #8

declare i32 @jpeg_read_scanlines(%struct.jpeg_decompress_struct*, i8**, i32) #8

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind uwtable
define i32 @jpeg_compress(i8** nocapture readonly %data, i32 %nx, i32 %ny, i32 %nc, i8* %filename) #3 {
entry:
  %cinfo = alloca %struct.jpeg_compress_struct, align 8
  %jerr = alloca %struct.jpeg_error_mgr, align 8
  %row_pointer = alloca i8*, align 8
  %call = tail call %struct._IO_FILE* @fopen(i8* %filename, i8* getelementptr inbounds ([3 x i8]* @.str433, i64 0, i64 0)) #2
  %tobool = icmp eq %struct._IO_FILE* %call, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE** @stderr, align 8, !tbaa !268
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([15 x i8]* @.str534, i64 0, i64 0), i8* %filename) #9
  br label %return

if.end:                                           ; preds = %entry
  %1 = bitcast %struct.jpeg_compress_struct* %cinfo to i8*
  call void @llvm.lifetime.start(i64 584, i8* %1) #2
  %2 = bitcast %struct.jpeg_error_mgr* %jerr to i8*
  call void @llvm.lifetime.start(i64 168, i8* %2) #2
  %call2 = call %struct.jpeg_error_mgr* @jpeg_std_error(%struct.jpeg_error_mgr* %jerr) #2
  %err = getelementptr inbounds %struct.jpeg_compress_struct* %cinfo, i64 0, i32 0
  store %struct.jpeg_error_mgr* %call2, %struct.jpeg_error_mgr** %err, align 8, !tbaa !637
  call void @jpeg_CreateCompress(%struct.jpeg_compress_struct* %cinfo, i32 80, i64 584) #2
  call void @jpeg_stdio_dest(%struct.jpeg_compress_struct* %cinfo, %struct._IO_FILE* %call) #2
  %image_width = getelementptr inbounds %struct.jpeg_compress_struct* %cinfo, i64 0, i32 7
  store i32 %nx, i32* %image_width, align 8, !tbaa !639
  %image_height = getelementptr inbounds %struct.jpeg_compress_struct* %cinfo, i64 0, i32 8
  store i32 %ny, i32* %image_height, align 4, !tbaa !640
  %input_components = getelementptr inbounds %struct.jpeg_compress_struct* %cinfo, i64 0, i32 9
  store i32 %nc, i32* %input_components, align 8, !tbaa !641
  switch i32 %nc, label %if.else7 [
    i32 1, label %if.then3
    i32 3, label %if.then5
  ]

if.then3:                                         ; preds = %if.end
  %in_color_space = getelementptr inbounds %struct.jpeg_compress_struct* %cinfo, i64 0, i32 10
  store i32 1, i32* %in_color_space, align 4, !tbaa !642
  br label %if.end10

if.then5:                                         ; preds = %if.end
  %in_color_space6 = getelementptr inbounds %struct.jpeg_compress_struct* %cinfo, i64 0, i32 10
  store i32 2, i32* %in_color_space6, align 4, !tbaa !642
  br label %if.end10

if.else7:                                         ; preds = %if.end
  %3 = load %struct._IO_FILE** @stderr, align 8, !tbaa !268
  %call8 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([40 x i8]* @.str635, i64 0, i64 0), i32 %nc) #9
  br label %cleanup

if.end10:                                         ; preds = %if.then5, %if.then3
  call void @jpeg_set_defaults(%struct.jpeg_compress_struct* %cinfo) #2
  call void @jpeg_set_quality(%struct.jpeg_compress_struct* %cinfo, i32 75, i32 1) #2
  call void @jpeg_start_compress(%struct.jpeg_compress_struct* %cinfo, i32 1) #2
  %next_scanline = getelementptr inbounds %struct.jpeg_compress_struct* %cinfo, i64 0, i32 45
  %4 = load i32* %next_scanline, align 4, !tbaa !643
  %5 = load i32* %image_height, align 4, !tbaa !640
  %cmp1223 = icmp ult i32 %4, %5
  br i1 %cmp1223, label %while.body.preheader, label %while.end

while.body.preheader:                             ; preds = %if.end10
  br label %while.body

while.body:                                       ; preds = %while.body, %while.body.preheader
  %6 = phi i32 [ %8, %while.body ], [ %4, %while.body.preheader ]
  %idxprom = zext i32 %6 to i64
  %arrayidx = getelementptr inbounds i8** %data, i64 %idxprom
  %7 = load i8** %arrayidx, align 8, !tbaa !268
  store i8* %7, i8** %row_pointer, align 8, !tbaa !268
  %call14 = call i32 @jpeg_write_scanlines(%struct.jpeg_compress_struct* %cinfo, i8** %row_pointer, i32 1) #2
  %8 = load i32* %next_scanline, align 4, !tbaa !643
  %9 = load i32* %image_height, align 4, !tbaa !640
  %cmp12 = icmp ult i32 %8, %9
  br i1 %cmp12, label %while.body, label %while.end.loopexit

while.end.loopexit:                               ; preds = %while.body
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %if.end10
  call void @jpeg_finish_compress(%struct.jpeg_compress_struct* %cinfo) #2
  %call15 = call i32 @fclose(%struct._IO_FILE* %call) #2
  br label %cleanup

cleanup:                                          ; preds = %while.end, %if.else7
  %retval.0 = phi i32 [ 0, %while.end ], [ 1, %if.else7 ]
  call void @llvm.lifetime.end(i64 168, i8* %2) #2
  call void @llvm.lifetime.end(i64 584, i8* %1) #2
  br label %return

return:                                           ; preds = %cleanup, %if.then
  %retval.1 = phi i32 [ %retval.0, %cleanup ], [ 1, %if.then ]
  ret i32 %retval.1
}

declare void @jpeg_CreateCompress(%struct.jpeg_compress_struct*, i32, i64) #8

declare void @jpeg_stdio_dest(%struct.jpeg_compress_struct*, %struct._IO_FILE*) #8

declare void @jpeg_set_defaults(%struct.jpeg_compress_struct*) #8

declare void @jpeg_set_quality(%struct.jpeg_compress_struct*, i32, i32) #8

declare void @jpeg_start_compress(%struct.jpeg_compress_struct*, i32) #8

declare i32 @jpeg_write_scanlines(%struct.jpeg_compress_struct*, i8**, i32) #8

declare void @jpeg_finish_compress(%struct.jpeg_compress_struct*) #8

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { cold nounwind }
attributes #10 = { noreturn nounwind }
attributes #11 = { cold }
attributes #12 = { nounwind readonly }

!llvm.dbg.cu = !{!0, !23, !83}
!llvm.ident = !{!105, !105, !105, !105}
!llvm.module.flags = !{!106, !107}

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
!23 = !{!"0x11\0012\00clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)\001\00\000\00\001", !24, !2, !25, !30, !2, !2} ; [ DW_TAG_compile_unit ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c] [DW_LANG_C99]
!24 = !{!"transformation_driver.c", !"/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine"}
!25 = !{!26, !4, !28, !29}
!26 = !{!"0xf\00\000\0064\0064\000\000", null, null, !27} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!27 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!28 = !{!"0xf\00\000\0064\0064\000\000", null, null, !26} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!29 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!30 = !{!31, !54, !74}
!31 = !{!"0x2e\00main\00main\00\0022\000\001\000\000\00256\001\0022", !24, !32, !33, null, i32 (i32, i8**)* @main, null, null, !35} ; [ DW_TAG_subprogram ] [line 22] [def] [main]
!32 = !{!"0x29", !24}                             ; [ DW_TAG_file_type ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!33 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !34, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!34 = !{!4, !4, !28}
!35 = !{!36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !49, !50, !51, !52, !53}
!36 = !{!"0x101\00argc\0016777238\000", !31, !32, !4} ; [ DW_TAG_arg_variable ] [argc] [line 22]
!37 = !{!"0x101\00argv\0033554454\000", !31, !32, !28} ; [ DW_TAG_arg_variable ] [argv] [line 22]
!38 = !{!"0x100\00index\0026\000", !31, !32, !4}  ; [ DW_TAG_auto_variable ] [index] [line 26]
!39 = !{!"0x100\00verbose_output\0026\000", !31, !32, !4} ; [ DW_TAG_auto_variable ] [verbose_output] [line 26]
!40 = !{!"0x100\00arg\0026\000", !31, !32, !4}    ; [ DW_TAG_auto_variable ] [arg] [line 26]
!41 = !{!"0x100\00i\0026\000", !31, !32, !4}      ; [ DW_TAG_auto_variable ] [i] [line 26]
!42 = !{!"0x100\00j\0026\000", !31, !32, !4}      ; [ DW_TAG_auto_variable ] [j] [line 26]
!43 = !{!"0x100\00_size_arr\0028\000", !31, !32, !4} ; [ DW_TAG_auto_variable ] [_size_arr] [line 28]
!44 = !{!"0x100\00data_input\0030\000", !31, !32, !18} ; [ DW_TAG_auto_variable ] [data_input] [line 30]
!45 = !{!"0x100\00data_output\0031\000", !31, !32, !18} ; [ DW_TAG_auto_variable ] [data_output] [line 31]
!46 = !{!"0x100\00nrows\0033\000", !31, !32, !47} ; [ DW_TAG_auto_variable ] [nrows] [line 33]
!47 = !{!"0x16\00u_int32_t\00202\000\000\000\000", !21, null, !48} ; [ DW_TAG_typedef ] [u_int32_t] [line 202, size 0, align 0, offset 0] [from unsigned int]
!48 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!49 = !{!"0x100\00ncols\0033\000", !31, !32, !47} ; [ DW_TAG_auto_variable ] [ncols] [line 33]
!50 = !{!"0x100\00nchannels\0033\000", !31, !32, !47} ; [ DW_TAG_auto_variable ] [nchannels] [line 33]
!51 = !{!"0x100\00opt\0035\000", !31, !32, !4}    ; [ DW_TAG_auto_variable ] [opt] [line 35]
!52 = !{!"0x100\00filename_in\0036\000", !31, !32, !26} ; [ DW_TAG_auto_variable ] [filename_in] [line 36]
!53 = !{!"0x100\00filename_out\0037\000", !31, !32, !26} ; [ DW_TAG_auto_variable ] [filename_out] [line 37]
!54 = !{!"0x2e\00do_it\00do_it\00\00106\000\001\000\000\00256\001\00106", !24, !32, !55, null, void (i8**, i8**, i32, i32)* @do_it, null, null, !57} ; [ DW_TAG_subprogram ] [line 106] [def] [do_it]
!55 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !56, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!56 = !{null, !18, !18, !4, !4}
!57 = !{!58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !72, !73}
!58 = !{!"0x101\00in\0016777322\000", !54, !32, !18} ; [ DW_TAG_arg_variable ] [in] [line 106]
!59 = !{!"0x101\00out\0033554538\000", !54, !32, !18} ; [ DW_TAG_arg_variable ] [out] [line 106]
!60 = !{!"0x101\00nx\0050331754\000", !54, !32, !4} ; [ DW_TAG_arg_variable ] [nx] [line 106]
!61 = !{!"0x101\00ny\0067108970\000", !54, !32, !4} ; [ DW_TAG_arg_variable ] [ny] [line 106]
!62 = !{!"0x100\00dx\00108\000", !54, !32, !4}    ; [ DW_TAG_auto_variable ] [dx] [line 108]
!63 = !{!"0x100\00dy\00108\000", !54, !32, !4}    ; [ DW_TAG_auto_variable ] [dy] [line 108]
!64 = !{!"0x100\00sx\00110\000", !54, !32, !12}   ; [ DW_TAG_auto_variable ] [sx] [line 110]
!65 = !{!"0x100\00sy\00110\000", !54, !32, !12}   ; [ DW_TAG_auto_variable ] [sy] [line 110]
!66 = !{!"0x100\00shx\00111\000", !54, !32, !12}  ; [ DW_TAG_auto_variable ] [shx] [line 111]
!67 = !{!"0x100\00shy\00111\000", !54, !32, !12}  ; [ DW_TAG_auto_variable ] [shy] [line 111]
!68 = !{!"0x100\00T\00121\000", !54, !32, !69}    ; [ DW_TAG_auto_variable ] [T] [line 121]
!69 = !{!"0x1\00\000\00288\0032\000\000\000", null, null, !12, !70, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 288, align 32, offset 0] [from float]
!70 = !{!71, !71}
!71 = !{!"0x21\000\003"}                          ; [ DW_TAG_subrange_type ] [0, 2]
!72 = !{!"0x100\00S\00124\000", !54, !32, !69}    ; [ DW_TAG_auto_variable ] [S] [line 124]
!73 = !{!"0x100\00SH\00127\000", !54, !32, !69}   ; [ DW_TAG_auto_variable ] [SH] [line 127]
!74 = !{!"0x2e\00atoi\00atoi\00\00278\000\001\000\000\00256\001\00279", !75, !76, !77, null, null, null, null, !81} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!75 = !{!"/usr/include/stdlib.h", !"/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine"}
!76 = !{!"0x29", !75}                             ; [ DW_TAG_file_type ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine//usr/include/stdlib.h]
!77 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !78, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!78 = !{!4, !79}
!79 = !{!"0xf\00\000\0064\0064\000\000", null, null, !80} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!80 = !{!"0x26\00\000\000\000\000\000", null, null, !27} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!81 = !{!82}
!82 = !{!"0x101\00__nptr\0016777494\000", !74, !76, !79} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!83 = !{!"0x11\0012\00clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)\000\00\000\00\001", !84, !2, !85, !86, !100, !2} ; [ DW_TAG_compile_unit ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c] [DW_LANG_C99]
!84 = !{!"hw_interface.c", !"/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine"}
!85 = !{!29}
!86 = !{!87, !93, !97}
!87 = !{!"0x2e\00convolve_hw_use_accelerator\00convolve_hw_use_accelerator\00\0033\000\001\000\000\00256\000\0033", !84, !88, !89, null, i1 (i32, i32, i32)* @convolve_hw_use_accelerator, null, null, !2} ; [ DW_TAG_subprogram ] [line 33] [def] [convolve_hw_use_accelerator]
!88 = !{!"0x29", !84}                             ; [ DW_TAG_file_type ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!89 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !90, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!90 = !{!91, !92, !92, !92}
!91 = !{!"0x24\00_Bool\000\008\008\000\000\002", null, null} ; [ DW_TAG_base_type ] [_Bool] [line 0, size 8, align 8, offset 0, enc DW_ATE_boolean]
!92 = !{!"0x16\00int32_t\00196\000\000\000\000", !21, null, !4} ; [ DW_TAG_typedef ] [int32_t] [line 196, size 0, align 0, offset 0] [from int]
!93 = !{!"0x2e\00convolve_bypass_hw_iface0\00convolve_bypass_hw_iface0\00\0051\000\001\000\000\00256\000\0052", !84, !88, !94, null, void (i8*, i8*, float*, i32, i32, i32)* @convolve_bypass_hw_iface0, null, null, !2} ; [ DW_TAG_subprogram ] [line 51] [def] [scope 52] [convolve_bypass_hw_iface0]
!94 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !95, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!95 = !{null, !19, !19, !96, !92, !92, !92}
!96 = !{!"0xf\00\000\0064\0064\000\000", null, null, !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!97 = !{!"0x2e\00convolve_bypass_hw_iface1\00convolve_bypass_hw_iface1\00\0058\000\001\000\000\00256\000\0059", !84, !88, !98, null, void (i8**, i8**, float*, i32, i32, i32)* @convolve_bypass_hw_iface1, null, null, !2} ; [ DW_TAG_subprogram ] [line 58] [def] [scope 59] [convolve_bypass_hw_iface1]
!98 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !99, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!99 = !{null, !18, !18, !96, !92, !92, !92}
!100 = !{!101, !102, !103, !104}
!101 = !{!"0x34\00libfilename_3_3\00libfilename_3_3\00\0017\000\001", null, !88, !79, i8** @libfilename_3_3, null} ; [ DW_TAG_variable ] [libfilename_3_3] [line 17] [def]
!102 = !{!"0x34\00libfilename_5_5\00libfilename_5_5\00\0019\000\001", null, !88, !79, i8** @libfilename_5_5, null} ; [ DW_TAG_variable ] [libfilename_5_5] [line 19] [def]
!103 = !{!"0x34\00libfilename_7_7\00libfilename_7_7\00\0021\000\001", null, !88, !79, i8** @libfilename_7_7, null} ; [ DW_TAG_variable ] [libfilename_7_7] [line 21] [def]
!104 = !{!"0x34\00env_allow_hw\00env_allow_hw\00\0023\000\001", null, !88, !79, i8** @env_allow_hw, null} ; [ DW_TAG_variable ] [env_allow_hw] [line 23] [def]
!105 = !{!"clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)"}
!106 = !{i32 2, !"Dwarf Version", i32 4}
!107 = !{i32 2, !"Debug Info Version", i32 2}
!108 = !{!"0x101\00l\0016777228\000", !6, !7, !4} ; [ DW_TAG_arg_variable ] [l] [line 12]
!109 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!110 = !MDLocation(line: 12, column: 26, scope: !6)
!111 = !{!"0x101\00m\0033554444\000", !6, !7, !4} ; [ DW_TAG_arg_variable ] [m] [line 12]
!112 = !MDLocation(line: 12, column: 33, scope: !6)
!113 = !{!"0x101\00n\0050331660\000", !6, !7, !4} ; [ DW_TAG_arg_variable ] [n] [line 12]
!114 = !MDLocation(line: 12, column: 40, scope: !6)
!115 = !{!"0x101\00A\0067108876\000", !6, !7, !10} ; [ DW_TAG_arg_variable ] [A] [line 12]
!116 = !MDLocation(line: 12, column: 49, scope: !6)
!117 = !{!"0x101\00B\0083886092\000", !6, !7, !10} ; [ DW_TAG_arg_variable ] [B] [line 12]
!118 = !MDLocation(line: 12, column: 64, scope: !6)
!119 = !{!"0x101\00C\00100663308\000", !6, !7, !10} ; [ DW_TAG_arg_variable ] [C] [line 12]
!120 = !MDLocation(line: 12, column: 79, scope: !6)
!121 = !{!"0x100\00i\0014\000", !6, !7, !4}       ; [ DW_TAG_auto_variable ] [i] [line 14]
!122 = !MDLocation(line: 14, column: 7, scope: !6)
!123 = !MDLocation(line: 16, column: 15, scope: !124)
!124 = !{!"0xb\0016\003\001", !1, !125}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!125 = !{!"0xb\0016\003\000", !1, !6}             ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!126 = !MDLocation(line: 16, column: 3, scope: !125)
!127 = !MDLocation(line: 17, column: 17, scope: !128)
!128 = !{!"0xb\0017\005\003", !1, !129}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!129 = !{!"0xb\0017\005\002", !1, !124}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!130 = !MDLocation(line: 17, column: 5, scope: !129)
!131 = !MDLocation(line: 18, column: 6, scope: !128)
!132 = !MDLocation(line: 22, column: 19, scope: !133)
!133 = !{!"0xb\0022\007\009", !1, !134}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!134 = !{!"0xb\0022\007\008", !1, !135}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!135 = !{!"0xb\0021\005\007", !1, !136}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!136 = !{!"0xb\0021\005\006", !1, !137}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!137 = !{!"0xb\0020\003\005", !1, !138}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!138 = !{!"0xb\0020\003\004", !1, !6}             ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!139 = !MDLocation(line: 21, column: 17, scope: !135)
!140 = !MDLocation(line: 16, column: 3, scope: !124)
!141 = !MDLocation(line: 21, column: 5, scope: !136)
!142 = !MDLocation(line: 23, column: 19, scope: !143)
!143 = !{!"0xb\0022\0030\0010", !1, !133}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!144 = !MDLocation(line: 23, column: 29, scope: !143)
!145 = !MDLocation(line: 22, column: 7, scope: !134)
!146 = !MDLocation(line: 23, column: 39, scope: !143)
!147 = !MDLocation(line: 23, column: 9, scope: !143)
!148 = !MDLocation(line: 22, column: 7, scope: !133)
!149 = !MDLocation(line: 21, column: 5, scope: !135)
!150 = !MDLocation(line: 20, column: 3, scope: !137)
!151 = !MDLocation(line: 20, column: 3, scope: !138)
!152 = !MDLocation(line: 25, column: 1, scope: !6)
!153 = !{!"0x101\00data_in\0016777243\000", !15, !7, !18} ; [ DW_TAG_arg_variable ] [data_in] [line 27]
!154 = !MDLocation(line: 27, column: 27, scope: !15)
!155 = !{!"0x101\00data_out\0033554459\000", !15, !7, !18} ; [ DW_TAG_arg_variable ] [data_out] [line 27]
!156 = !MDLocation(line: 27, column: 47, scope: !15)
!157 = !{!"0x101\00nx\0050331675\000", !15, !7, !4} ; [ DW_TAG_arg_variable ] [nx] [line 27]
!158 = !MDLocation(line: 27, column: 61, scope: !15)
!159 = !{!"0x101\00ny\0067108891\000", !15, !7, !4} ; [ DW_TAG_arg_variable ] [ny] [line 27]
!160 = !MDLocation(line: 27, column: 69, scope: !15)
!161 = !{!"0x101\00l\0083886107\000", !15, !7, !4} ; [ DW_TAG_arg_variable ] [l] [line 27]
!162 = !MDLocation(line: 27, column: 77, scope: !15)
!163 = !{!"0x101\00m\00100663323\000", !15, !7, !4} ; [ DW_TAG_arg_variable ] [m] [line 27]
!164 = !MDLocation(line: 27, column: 84, scope: !15)
!165 = !{!"0x101\00M\00117440539\000", !15, !7, !10} ; [ DW_TAG_arg_variable ] [M] [line 27]
!166 = !MDLocation(line: 27, column: 93, scope: !15)
!167 = !{!"0x100\00i\0029\000", !15, !7, !4}      ; [ DW_TAG_auto_variable ] [i] [line 29]
!168 = !MDLocation(line: 29, column: 7, scope: !15)
!169 = !{!"0x100\00j\0029\000", !15, !7, !4}      ; [ DW_TAG_auto_variable ] [j] [line 29]
!170 = !MDLocation(line: 29, column: 14, scope: !15)
!171 = !{!"0x100\00T\0031\000", !15, !7, !172}    ; [ DW_TAG_auto_variable ] [T] [line 31]
!172 = !{!"0x1\00\000\0096\0032\000\000\000", null, null, !12, !173, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 96, align 32, offset 0] [from float]
!173 = !{!71, !174}
!174 = !{!"0x21\000\001"}                         ; [ DW_TAG_subrange_type ] [0, 0]
!175 = !MDLocation(line: 31, column: 9, scope: !15)
!176 = !{!"0x100\00A\0032\000", !15, !7, !172}    ; [ DW_TAG_auto_variable ] [A] [line 32]
!177 = !MDLocation(line: 32, column: 9, scope: !15)
!178 = !MDLocation(line: 33, column: 8, scope: !179)
!179 = !{!"0xb\0033\003\0011", !1, !15}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!180 = !MDLocation(line: 33, column: 19, scope: !181)
!181 = !{!"0xb\0033\003\0012", !1, !179}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!182 = !MDLocation(line: 33, column: 15, scope: !181)
!183 = !MDLocation(line: 33, column: 3, scope: !179)
!184 = !MDLocation(line: 34, column: 21, scope: !185)
!185 = !{!"0xb\0034\005\0014", !1, !186}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!186 = !{!"0xb\0034\005\0013", !1, !181}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!187 = !MDLocation(line: 34, column: 17, scope: !185)
!188 = !MDLocation(line: 36, column: 7, scope: !189)
!189 = !{!"0xb\0034\0034\0015", !1, !185}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!190 = !MDLocation(line: 37, column: 7, scope: !189)
!191 = !MDLocation(line: 38, column: 7, scope: !189)
!192 = !MDLocation(line: 40, column: 38, scope: !189)
!193 = !MDLocation(line: 16, column: 15, scope: !124, inlinedAt: !194)
!194 = !MDLocation(line: 40, column: 7, scope: !189)
!195 = !MDLocation(line: 43, column: 19, scope: !189)
!196 = !MDLocation(line: 45, column: 17, scope: !197)
!197 = !{!"0xb\0045\0011\0016", !1, !189}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!198 = !MDLocation(line: 49, column: 17, scope: !199)
!199 = !{!"0xb\0049\0011\0018", !1, !189}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!200 = !MDLocation(line: 22, column: 19, scope: !133, inlinedAt: !194)
!201 = !MDLocation(line: 34, column: 5, scope: !186)
!202 = !MDLocation(line: 37, column: 17, scope: !189)
!203 = !MDLocation(line: 54, column: 38, scope: !189)
!204 = !MDLocation(line: 36, column: 17, scope: !189)
!205 = !{!"0x101\00l\0016777228\000", !6, !7, !4, !194} ; [ DW_TAG_arg_variable ] [l] [line 12]
!206 = !MDLocation(line: 12, column: 26, scope: !6, inlinedAt: !194)
!207 = !{!"0x101\00m\0033554444\000", !6, !7, !4, !194} ; [ DW_TAG_arg_variable ] [m] [line 12]
!208 = !MDLocation(line: 12, column: 33, scope: !6, inlinedAt: !194)
!209 = !{!"0x101\00n\0050331660\000", !6, !7, !4, !194} ; [ DW_TAG_arg_variable ] [n] [line 12]
!210 = !MDLocation(line: 12, column: 40, scope: !6, inlinedAt: !194)
!211 = !{!"0x101\00A\0067108876\000", !6, !7, !10, !194} ; [ DW_TAG_arg_variable ] [A] [line 12]
!212 = !MDLocation(line: 12, column: 49, scope: !6, inlinedAt: !194)
!213 = !{!"0x101\00B\0083886092\000", !6, !7, !10, !194} ; [ DW_TAG_arg_variable ] [B] [line 12]
!214 = !MDLocation(line: 12, column: 64, scope: !6, inlinedAt: !194)
!215 = !{!"0x101\00C\00100663308\000", !6, !7, !10, !194} ; [ DW_TAG_arg_variable ] [C] [line 12]
!216 = !MDLocation(line: 12, column: 79, scope: !6, inlinedAt: !194)
!217 = !{!"0x100\00i\0014\000", !6, !7, !4, !194} ; [ DW_TAG_auto_variable ] [i] [line 14]
!218 = !MDLocation(line: 14, column: 7, scope: !6, inlinedAt: !194)
!219 = !MDLocation(line: 16, column: 3, scope: !125, inlinedAt: !194)
!220 = !MDLocation(line: 18, column: 6, scope: !128, inlinedAt: !194)
!221 = !MDLocation(line: 22, column: 7, scope: !134, inlinedAt: !194)
!222 = !MDLocation(line: 23, column: 19, scope: !143, inlinedAt: !194)
!223 = !MDLocation(line: 23, column: 29, scope: !143, inlinedAt: !194)
!224 = !MDLocation(line: 23, column: 39, scope: !143, inlinedAt: !194)
!225 = !MDLocation(line: 22, column: 7, scope: !133, inlinedAt: !194)
!226 = !MDLocation(line: 20, column: 3, scope: !137, inlinedAt: !194)
!227 = !MDLocation(line: 20, column: 3, scope: !138, inlinedAt: !194)
!228 = !MDLocation(line: 42, column: 19, scope: !189)
!229 = !{!"0x100\00__x\0042\000", !189, !7, !12}  ; [ DW_TAG_auto_variable ] [__x] [line 42]
!230 = !MDLocation(line: 42, column: 13, scope: !189)
!231 = !{!"0x100\00__y\0043\000", !189, !7, !12}  ; [ DW_TAG_auto_variable ] [__y] [line 43]
!232 = !MDLocation(line: 43, column: 13, scope: !189)
!233 = !MDLocation(line: 45, column: 11, scope: !197)
!234 = !MDLocation(line: 45, column: 11, scope: !189)
!235 = !MDLocation(line: 47, column: 11, scope: !236)
!236 = !{!"0xb\0047\0011\0017", !1, !189}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!237 = !MDLocation(line: 49, column: 11, scope: !199)
!238 = !MDLocation(line: 49, column: 11, scope: !189)
!239 = !MDLocation(line: 51, column: 11, scope: !240)
!240 = !{!"0xb\0051\0011\0019", !1, !189}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c]
!241 = !MDLocation(line: 54, column: 26, scope: !189)
!242 = !MDLocation(line: 54, column: 7, scope: !189)
!243 = !MDLocation(line: 54, column: 16, scope: !189)
!244 = !MDLocation(line: 34, column: 5, scope: !185)
!245 = !MDLocation(line: 33, column: 3, scope: !181)
!246 = !MDLocation(line: 56, column: 1, scope: !15)
!247 = !MDLocation(line: 22, column: 14, scope: !31)
!248 = !MDLocation(line: 22, column: 26, scope: !31)
!249 = !MDLocation(line: 24, column: 2, scope: !31)
!250 = !{!251, !251, i64 0}
!251 = !{!"int", !252, i64 0}
!252 = !{!"omnipotent char", !253, i64 0}
!253 = !{!"Simple C/C++ TBAA"}
!254 = !MDLocation(line: 26, column: 6, scope: !31)
!255 = !MDLocation(line: 26, column: 17, scope: !31)
!256 = !MDLocation(line: 26, column: 37, scope: !31)
!257 = !MDLocation(line: 26, column: 46, scope: !31)
!258 = !MDLocation(line: 26, column: 52, scope: !31)
!259 = !MDLocation(line: 28, column: 6, scope: !31)
!260 = !MDLocation(line: 36, column: 11, scope: !31)
!261 = !MDLocation(line: 37, column: 11, scope: !31)
!262 = !MDLocation(line: 39, column: 5, scope: !31)
!263 = !MDLocation(line: 39, column: 19, scope: !31)
!264 = !MDLocation(line: 35, column: 9, scope: !31)
!265 = !MDLocation(line: 42, column: 22, scope: !266)
!266 = !{!"0xb\0040\0020\001", !24, !267}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!267 = !{!"0xb\0039\0055\000", !24, !31}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!268 = !{!269, !269, i64 0}
!269 = !{!"any pointer", !252, i64 0}
!270 = !MDLocation(line: 43, column: 9, scope: !266)
!271 = !MDLocation(line: 48, column: 17, scope: !266)
!272 = !MDLocation(line: 48, column: 53, scope: !266)
!273 = !MDLocation(line: 48, column: 9, scope: !266)
!274 = !MDLocation(line: 49, column: 9, scope: !266)
!275 = !MDLocation(line: 53, column: 9, scope: !31)
!276 = !MDLocation(line: 54, column: 20, scope: !277)
!277 = !{!"0xb\0054\007\004", !24, !278}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!278 = !{!"0xb\0053\0023\003", !24, !279}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!279 = !{!"0xb\0053\009\002", !24, !31}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!280 = !MDLocation(line: 54, column: 28, scope: !281)
!281 = !{!"0xb\0054\007\005", !24, !277}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!282 = !MDLocation(line: 54, column: 7, scope: !277)
!283 = !MDLocation(line: 56, column: 17, scope: !284)
!284 = !{!"0xb\0054\0051\006", !24, !281}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!285 = !MDLocation(line: 56, column: 9, scope: !284)
!286 = !MDLocation(line: 58, column: 27, scope: !287)
!287 = !{!"0xb\0056\0024\007", !24, !284}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!288 = !{!"0x101\00__nptr\0016777494\000", !74, !76, !79, !289} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!289 = !MDLocation(line: 58, column: 22, scope: !287)
!290 = !MDLocation(line: 278, column: 1, scope: !74, inlinedAt: !289)
!291 = !MDLocation(line: 280, column: 16, scope: !74, inlinedAt: !289)
!292 = !MDLocation(line: 280, column: 10, scope: !74, inlinedAt: !289)
!293 = !MDLocation(line: 59, column: 11, scope: !287)
!294 = !MDLocation(line: 33, column: 22, scope: !31)
!295 = !MDLocation(line: 63, column: 15, scope: !278)
!296 = !MDLocation(line: 33, column: 15, scope: !31)
!297 = !MDLocation(line: 63, column: 7, scope: !278)
!298 = !MDLocation(line: 67, column: 37, scope: !278)
!299 = !MDLocation(line: 67, column: 21, scope: !278)
!300 = !MDLocation(line: 30, column: 17, scope: !31)
!301 = !MDLocation(line: 67, column: 7, scope: !278)
!302 = !MDLocation(line: 68, column: 21, scope: !278)
!303 = !MDLocation(line: 31, column: 17, scope: !31)
!304 = !MDLocation(line: 70, column: 5, scope: !278)
!305 = !MDLocation(line: 33, column: 29, scope: !31)
!306 = !MDLocation(line: 72, column: 9, scope: !307)
!307 = !{!"0xb\0072\009\009", !24, !308}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!308 = !{!"0xb\0070\0010\008", !24, !279}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!309 = !MDLocation(line: 72, column: 9, scope: !308)
!310 = !MDLocation(line: 73, column: 15, scope: !311)
!311 = !{!"0xb\0072\0079\0010", !24, !307}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!312 = !MDLocation(line: 73, column: 7, scope: !311)
!313 = !MDLocation(line: 74, column: 7, scope: !311)
!314 = !MDLocation(line: 76, column: 36, scope: !308)
!315 = !MDLocation(line: 76, column: 43, scope: !308)
!316 = !MDLocation(line: 76, column: 20, scope: !308)
!317 = !MDLocation(line: 79, column: 49, scope: !31)
!318 = !MDLocation(line: 79, column: 28, scope: !31)
!319 = !MDLocation(line: 80, column: 5, scope: !31)
!320 = !MDLocation(line: 81, column: 5, scope: !31)
!321 = !MDLocation(line: 85, column: 11, scope: !31)
!322 = !MDLocation(line: 85, column: 36, scope: !31)
!323 = !MDLocation(line: 85, column: 43, scope: !31)
!324 = !MDLocation(line: 85, column: 5, scope: !31)
!325 = !MDLocation(line: 88, column: 9, scope: !31)
!326 = !MDLocation(line: 89, column: 20, scope: !327)
!327 = !{!"0xb\0089\008\0014", !24, !328}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!328 = !{!"0xb\0089\008\0013", !24, !329}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!329 = !{!"0xb\0088\0025\0012", !24, !330}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!330 = !{!"0xb\0088\009\0011", !24, !31}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!331 = !MDLocation(line: 89, column: 8, scope: !328)
!332 = !MDLocation(line: 90, column: 10, scope: !333)
!333 = !{!"0xb\0090\0010\0016", !24, !334}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!334 = !{!"0xb\0089\0040\0015", !24, !327}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!335 = !MDLocation(line: 91, column: 27, scope: !336)
!336 = !{!"0xb\0090\0042\0018", !24, !337}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!337 = !{!"0xb\0090\0010\0017", !24, !333}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!338 = !{!252, !252, i64 0}
!339 = !MDLocation(line: 91, column: 12, scope: !336)
!340 = !MDLocation(line: 93, column: 10, scope: !334)
!341 = !MDLocation(line: 97, column: 33, scope: !31)
!342 = !MDLocation(line: 97, column: 40, scope: !31)
!343 = !MDLocation(line: 97, column: 6, scope: !31)
!344 = !MDLocation(line: 99, column: 20, scope: !31)
!345 = !MDLocation(line: 99, column: 27, scope: !31)
!346 = !MDLocation(line: 99, column: 6, scope: !31)
!347 = !MDLocation(line: 100, column: 20, scope: !31)
!348 = !MDLocation(line: 100, column: 6, scope: !31)
!349 = !MDLocation(line: 102, column: 1, scope: !31)
!350 = !MDLocation(line: 102, column: 1, scope: !351)
!351 = !{!"0xb\001", !24, !31}                    ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!352 = !MDLocation(line: 106, column: 23, scope: !54)
!353 = !MDLocation(line: 106, column: 38, scope: !54)
!354 = !MDLocation(line: 106, column: 47, scope: !54)
!355 = !MDLocation(line: 106, column: 55, scope: !54)
!356 = !MDLocation(line: 108, column: 6, scope: !54)
!357 = !MDLocation(line: 108, column: 14, scope: !54)
!358 = !MDLocation(line: 110, column: 8, scope: !54)
!359 = !MDLocation(line: 110, column: 16, scope: !54)
!360 = !MDLocation(line: 111, column: 8, scope: !54)
!361 = !MDLocation(line: 111, column: 17, scope: !54)
!362 = !MDLocation(line: 121, column: 2, scope: !54)
!363 = !MDLocation(line: 121, column: 8, scope: !54)
!364 = !{!365, !365, i64 0}
!365 = !{!"float", !252, i64 0}
!366 = !MDLocation(line: 124, column: 2, scope: !54)
!367 = !MDLocation(line: 124, column: 8, scope: !54)
!368 = !MDLocation(line: 127, column: 2, scope: !54)
!369 = !MDLocation(line: 127, column: 8, scope: !54)
!370 = !MDLocation(line: 129, column: 21, scope: !54)
!371 = !MDLocation(line: 129, column: 25, scope: !54)
!372 = !MDLocation(line: 129, column: 2, scope: !54)
!373 = !MDLocation(line: 130, column: 2, scope: !54)
!374 = !MDLocation(line: 132, column: 2, scope: !54)
!375 = !MDLocation(line: 133, column: 2, scope: !54)
!376 = !MDLocation(line: 135, column: 2, scope: !54)
!377 = !MDLocation(line: 136, column: 2, scope: !54)
!378 = !MDLocation(line: 139, column: 1, scope: !54)
!379 = !{!"0x101\00filter_size\0016777249\000", !87, !88, !92} ; [ DW_TAG_arg_variable ] [filter_size] [line 33]
!380 = !MDLocation(line: 33, column: 42, scope: !87)
!381 = !{!"0x101\00nx\0033554465\000", !87, !88, !92} ; [ DW_TAG_arg_variable ] [nx] [line 33]
!382 = !MDLocation(line: 33, column: 63, scope: !87)
!383 = !{!"0x101\00ny\0050331681\000", !87, !88, !92} ; [ DW_TAG_arg_variable ] [ny] [line 33]
!384 = !MDLocation(line: 33, column: 75, scope: !87)
!385 = !{!"0x100\00allow_hw\0034\000", !87, !88, !20} ; [ DW_TAG_auto_variable ] [allow_hw] [line 34]
!386 = !MDLocation(line: 34, column: 12, scope: !87)
!387 = !{!"0x100\00pAllowHWAccelerationEnv\0036\000", !87, !88, !26} ; [ DW_TAG_auto_variable ] [pAllowHWAccelerationEnv] [line 36]
!388 = !MDLocation(line: 36, column: 9, scope: !87)
!389 = !MDLocation(line: 36, column: 42, scope: !87)
!390 = !MDLocation(line: 36, column: 35, scope: !87)
!391 = !MDLocation(line: 37, column: 7, scope: !392)
!392 = !{!"0xb\0037\007\000", !84, !87}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!393 = !MDLocation(line: 37, column: 7, scope: !87)
!394 = !MDLocation(line: 38, column: 23, scope: !395)
!395 = !{!"0xb\0037\0032\001", !84, !392}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!396 = !MDLocation(line: 38, column: 16, scope: !395)
!397 = !MDLocation(line: 38, column: 5, scope: !395)
!398 = !MDLocation(line: 39, column: 3, scope: !395)
!399 = !MDLocation(line: 41, column: 7, scope: !400)
!400 = !{!"0xb\0041\007\002", !84, !87}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!401 = !MDLocation(line: 41, column: 7, scope: !87)
!402 = !MDLocation(line: 42, column: 48, scope: !403)
!403 = !{!"0xb\0041\0017\003", !84, !400}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!404 = !MDLocation(line: 42, column: 61, scope: !403)
!405 = !MDLocation(line: 42, column: 65, scope: !403)
!406 = !MDLocation(line: 42, column: 5, scope: !403)
!407 = !MDLocation(line: 43, column: 9, scope: !408)
!408 = !{!"0xb\0043\009\004", !84, !403}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!409 = !MDLocation(line: 43, column: 9, scope: !403)
!410 = !MDLocation(line: 43, column: 21, scope: !411)
!411 = !{!"0xb\001", !84, !408}                   ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!412 = !MDLocation(line: 44, column: 11, scope: !413)
!413 = !{!"0xb\0044\0011\005", !84, !408}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!414 = !MDLocation(line: 44, column: 11, scope: !408)
!415 = !MDLocation(line: 45, column: 9, scope: !413)
!416 = !MDLocation(line: 44, column: 25, scope: !417)
!417 = !{!"0xb\001", !84, !413}                   ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!418 = !MDLocation(line: 46, column: 3, scope: !403)
!419 = !MDLocation(line: 48, column: 3, scope: !87)
!420 = !MDLocation(line: 49, column: 1, scope: !87)
!421 = !{!"0x101\00src\0016777267\000", !93, !88, !19} ; [ DW_TAG_arg_variable ] [src] [line 51]
!422 = !MDLocation(line: 51, column: 42, scope: !93)
!423 = !{!"0x101\00dst\0033554483\000", !93, !88, !19} ; [ DW_TAG_arg_variable ] [dst] [line 51]
!424 = !MDLocation(line: 51, column: 57, scope: !93)
!425 = !{!"0x101\00kernel\0050331699\000", !93, !88, !96} ; [ DW_TAG_arg_variable ] [kernel] [line 51]
!426 = !MDLocation(line: 51, column: 69, scope: !93)
!427 = !{!"0x101\00filter_size\0067108915\000", !93, !88, !92} ; [ DW_TAG_arg_variable ] [filter_size] [line 51]
!428 = !MDLocation(line: 51, column: 85, scope: !93)
!429 = !{!"0x101\00nx\0083886131\000", !93, !88, !92} ; [ DW_TAG_arg_variable ] [nx] [line 51]
!430 = !MDLocation(line: 51, column: 106, scope: !93)
!431 = !{!"0x101\00ny\00100663348\000", !93, !88, !92} ; [ DW_TAG_arg_variable ] [ny] [line 52]
!432 = !MDLocation(line: 52, column: 40, scope: !93)
!433 = !MDLocation(line: 54, column: 3, scope: !93)
!434 = !MDLocation(line: 55, column: 108, scope: !93)
!435 = !MDLocation(line: 55, column: 113, scope: !93)
!436 = !MDLocation(line: 56, column: 10, scope: !93)
!437 = !MDLocation(line: 56, column: 18, scope: !93)
!438 = !MDLocation(line: 56, column: 31, scope: !93)
!439 = !MDLocation(line: 56, column: 35, scope: !93)
!440 = !MDLocation(line: 55, column: 3, scope: !93)
!441 = !MDLocation(line: 57, column: 1, scope: !93)
!442 = !{!"0x101\00src\0016777274\000", !97, !88, !18} ; [ DW_TAG_arg_variable ] [src] [line 58]
!443 = !MDLocation(line: 58, column: 43, scope: !97)
!444 = !{!"0x101\00dst\0033554490\000", !97, !88, !18} ; [ DW_TAG_arg_variable ] [dst] [line 58]
!445 = !MDLocation(line: 58, column: 59, scope: !97)
!446 = !{!"0x101\00kernel\0050331706\000", !97, !88, !96} ; [ DW_TAG_arg_variable ] [kernel] [line 58]
!447 = !MDLocation(line: 58, column: 71, scope: !97)
!448 = !{!"0x101\00filter_size\0067108922\000", !97, !88, !92} ; [ DW_TAG_arg_variable ] [filter_size] [line 58]
!449 = !MDLocation(line: 58, column: 87, scope: !97)
!450 = !{!"0x101\00nx\0083886138\000", !97, !88, !92} ; [ DW_TAG_arg_variable ] [nx] [line 58]
!451 = !MDLocation(line: 58, column: 108, scope: !97)
!452 = !{!"0x101\00ny\00100663355\000", !97, !88, !92} ; [ DW_TAG_arg_variable ] [ny] [line 59]
!453 = !MDLocation(line: 59, column: 40, scope: !97)
!454 = !{!"0x100\00error\0060\000", !97, !88, !26} ; [ DW_TAG_auto_variable ] [error] [line 60]
!455 = !MDLocation(line: 60, column: 9, scope: !97)
!456 = !MDLocation(line: 62, column: 3, scope: !97)
!457 = !MDLocation(line: 63, column: 108, scope: !97)
!458 = !MDLocation(line: 63, column: 113, scope: !97)
!459 = !MDLocation(line: 64, column: 10, scope: !97)
!460 = !MDLocation(line: 64, column: 18, scope: !97)
!461 = !MDLocation(line: 64, column: 31, scope: !97)
!462 = !MDLocation(line: 64, column: 35, scope: !97)
!463 = !MDLocation(line: 63, column: 3, scope: !97)
!464 = !{!"0x100\00libfile\0066\000", !97, !88, !79} ; [ DW_TAG_auto_variable ] [libfile] [line 66]
!465 = !MDLocation(line: 66, column: 15, scope: !97)
!466 = !MDLocation(line: 67, column: 7, scope: !467)
!467 = !{!"0xb\0067\007\006", !84, !97}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!468 = !MDLocation(line: 67, column: 7, scope: !97)
!469 = !MDLocation(line: 68, column: 14, scope: !470)
!470 = !{!"0xb\0067\0024\007", !84, !467}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!471 = !MDLocation(line: 68, column: 4, scope: !470)
!472 = !MDLocation(line: 69, column: 3, scope: !470)
!473 = !MDLocation(line: 69, column: 14, scope: !474)
!474 = !{!"0xb\0069\0014\008", !84, !467}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!475 = !MDLocation(line: 69, column: 14, scope: !467)
!476 = !MDLocation(line: 70, column: 14, scope: !477)
!477 = !{!"0xb\0069\0031\009", !84, !474}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!478 = !MDLocation(line: 70, column: 4, scope: !477)
!479 = !MDLocation(line: 71, column: 3, scope: !477)
!480 = !MDLocation(line: 71, column: 13, scope: !481)
!481 = !{!"0xb\0071\0013\0010", !84, !474}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!482 = !MDLocation(line: 71, column: 13, scope: !474)
!483 = !MDLocation(line: 72, column: 14, scope: !484)
!484 = !{!"0xb\0071\0030\0011", !84, !481}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!485 = !MDLocation(line: 72, column: 4, scope: !484)
!486 = !MDLocation(line: 73, column: 3, scope: !484)
!487 = !MDLocation(line: 75, column: 47, scope: !488)
!488 = !{!"0xb\0074\007\0012", !84, !481}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!489 = !MDLocation(line: 75, column: 4, scope: !488)
!490 = !MDLocation(line: 76, column: 4, scope: !488)
!491 = !{!"0x100\00in\0079\000", !97, !88, !19}   ; [ DW_TAG_auto_variable ] [in] [line 79]
!492 = !MDLocation(line: 79, column: 13, scope: !97)
!493 = !MDLocation(line: 79, column: 44, scope: !97)
!494 = !MDLocation(line: 79, column: 25, scope: !97)
!495 = !MDLocation(line: 79, column: 49, scope: !97)
!496 = !MDLocation(line: 79, column: 18, scope: !97)
!497 = !{!"0x100\00out\0080\000", !97, !88, !19}  ; [ DW_TAG_auto_variable ] [out] [line 80]
!498 = !MDLocation(line: 80, column: 13, scope: !97)
!499 = !MDLocation(line: 80, column: 45, scope: !97)
!500 = !MDLocation(line: 80, column: 26, scope: !97)
!501 = !MDLocation(line: 80, column: 50, scope: !97)
!502 = !MDLocation(line: 80, column: 19, scope: !97)
!503 = !{!"0x100\00i\0082\000", !97, !88, !4}     ; [ DW_TAG_auto_variable ] [i] [line 82]
!504 = !MDLocation(line: 82, column: 7, scope: !97)
!505 = !{!"0x100\00j\0082\000", !97, !88, !4}     ; [ DW_TAG_auto_variable ] [j] [line 82]
!506 = !MDLocation(line: 82, column: 14, scope: !97)
!507 = !MDLocation(line: 83, column: 8, scope: !508)
!508 = !{!"0xb\0083\003\0013", !84, !97}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!509 = !MDLocation(line: 83, column: 15, scope: !510)
!510 = !{!"0xb\002", !84, !511}                   ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!511 = !{!"0xb\001", !84, !512}                   ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!512 = !{!"0xb\0083\003\0014", !84, !508}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!513 = !MDLocation(line: 83, column: 19, scope: !512)
!514 = !MDLocation(line: 83, column: 15, scope: !512)
!515 = !MDLocation(line: 83, column: 3, scope: !508)
!516 = !MDLocation(line: 84, column: 16, scope: !512)
!517 = !MDLocation(line: 84, column: 20, scope: !512)
!518 = !MDLocation(line: 84, column: 5, scope: !512)
!519 = !MDLocation(line: 84, column: 13, scope: !512)
!520 = !MDLocation(line: 84, column: 29, scope: !512)
!521 = !MDLocation(line: 84, column: 25, scope: !512)
!522 = !MDLocation(line: 84, column: 52, scope: !512)
!523 = !MDLocation(line: 84, column: 33, scope: !512)
!524 = !MDLocation(line: 83, column: 23, scope: !512)
!525 = !MDLocation(line: 83, column: 3, scope: !512)
!526 = !{!"0x100\00ifaceptr\0086\000", !97, !88, !527} ; [ DW_TAG_auto_variable ] [ifaceptr] [line 86]
!527 = !{!"0xf\00\000\0064\0064\000\000", null, null, !528} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!528 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !529, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!529 = !{null, !530, !92, !92, !532, !534, !19}
!530 = !{!"0x16\00int64_t\00197\000\000\000\000", !21, null, !531} ; [ DW_TAG_typedef ] [int64_t] [line 197, size 0, align 0, offset 0] [from long int]
!531 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!532 = !{!"0xf\00\000\0064\0064\000\000", null, null, !533} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!533 = !{!"0x26\00\000\000\000\000\000", null, null, !12} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from float]
!534 = !{!"0xf\00\000\0064\0064\000\000", null, null, !535} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!535 = !{!"0x26\00\000\000\000\000\000", null, null, !20} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from u_int8_t]
!536 = !MDLocation(line: 86, column: 10, scope: !97)
!537 = !{!"0x100\00max_init\0089\000", !97, !88, !538} ; [ DW_TAG_auto_variable ] [max_init] [line 89]
!538 = !{!"0xf\00\000\0064\0064\000\000", null, null, !539} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!539 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !540, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!540 = !{!541, null}
!541 = !{!"0xf\00\000\0064\0064\000\000", null, null, !542} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from max_file_t]
!542 = !{!"0x16\00max_file_t\00176\000\000\000\000", !543, null, !544} ; [ DW_TAG_typedef ] [max_file_t] [line 176, size 0, align 0, offset 0] [from max_file]
!543 = !{!"/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/slic/include/slic_typedefs.h", !"/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine"}
!544 = !{!"0x13\00max_file\00173\00128\0064\000\000\000", !543, null, null, !545, null, null, null} ; [ DW_TAG_structure_type ] [max_file] [line 173, size 128, align 64, offset 0] [def] [from ]
!545 = !{!546, !550}
!546 = !{!"0xd\00errors\00174\0064\0064\000\000", !543, !544, !547} ; [ DW_TAG_member ] [errors] [line 174, size 64, align 64, offset 0] [from ]
!547 = !{!"0xf\00\000\0064\0064\000\000", null, null, !548} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from max_errors_t]
!548 = !{!"0x16\00max_errors_t\0094\000\000\000\000", !543, null, !549} ; [ DW_TAG_typedef ] [max_errors_t] [line 94, size 0, align 0, offset 0] [from max_errors]
!549 = !{!"0x13\00max_errors\0093\000\000\000\004\000", !543, null, null, null, null, null, null} ; [ DW_TAG_structure_type ] [max_errors] [line 93, size 0, align 0, offset 0] [decl] [from ]
!550 = !{!"0xd\00maxfile_internal\00175\0064\0064\0064\000", !543, !544, !551} ; [ DW_TAG_member ] [maxfile_internal] [line 175, size 64, align 64, offset 64] [from ]
!551 = !{!"0xf\00\000\0064\0064\000\000", null, null, !552} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from max_file_internal_t]
!552 = !{!"0x16\00max_file_internal_t\0097\000\000\000\000", !543, null, !553} ; [ DW_TAG_typedef ] [max_file_internal_t] [line 97, size 0, align 0, offset 0] [from max_file_internal]
!553 = !{!"0x13\00max_file_internal\0096\000\000\000\004\000", !543, null, null, null, null, null, null} ; [ DW_TAG_structure_type ] [max_file_internal] [line 96, size 0, align 0, offset 0] [decl] [from ]
!554 = !MDLocation(line: 89, column: 17, scope: !97)
!555 = !{!"0x100\00dlhandle\0091\000", !97, !88, !29} ; [ DW_TAG_auto_variable ] [dlhandle] [line 91]
!556 = !MDLocation(line: 91, column: 9, scope: !97)
!557 = !MDLocation(line: 91, column: 27, scope: !97)
!558 = !MDLocation(line: 91, column: 20, scope: !97)
!559 = !MDLocation(line: 93, column: 8, scope: !560)
!560 = !{!"0xb\0093\007\0015", !84, !97}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!561 = !MDLocation(line: 93, column: 7, scope: !97)
!562 = !MDLocation(line: 94, column: 13, scope: !563)
!563 = !{!"0xb\0093\0018\0016", !84, !560}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!564 = !MDLocation(line: 94, column: 5, scope: !563)
!565 = !MDLocation(line: 95, column: 51, scope: !563)
!566 = !MDLocation(line: 95, column: 5, scope: !563)
!567 = !MDLocation(line: 96, column: 5, scope: !563)
!568 = !MDLocation(line: 100, column: 20, scope: !97)
!569 = !MDLocation(line: 100, column: 14, scope: !97)
!570 = !MDLocation(line: 100, column: 3, scope: !97)
!571 = !MDLocation(line: 101, column: 16, scope: !572)
!572 = !{!"0xb\00101\007\0017", !84, !97}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!573 = !MDLocation(line: 101, column: 8, scope: !572)
!574 = !MDLocation(line: 101, column: 7, scope: !572)
!575 = !MDLocation(line: 101, column: 7, scope: !97)
!576 = !MDLocation(line: 102, column: 47, scope: !577)
!577 = !{!"0xb\00101\0036\0018", !84, !572}       ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!578 = !MDLocation(line: 102, column: 5, scope: !577)
!579 = !MDLocation(line: 103, column: 5, scope: !577)
!580 = !MDLocation(line: 106, column: 20, scope: !97)
!581 = !MDLocation(line: 106, column: 14, scope: !97)
!582 = !MDLocation(line: 106, column: 3, scope: !97)
!583 = !MDLocation(line: 107, column: 16, scope: !584)
!584 = !{!"0xb\00107\007\0019", !84, !97}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!585 = !MDLocation(line: 107, column: 8, scope: !584)
!586 = !MDLocation(line: 107, column: 7, scope: !584)
!587 = !MDLocation(line: 107, column: 7, scope: !97)
!588 = !MDLocation(line: 108, column: 47, scope: !589)
!589 = !{!"0xb\00107\0036\0020", !84, !584}       ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!590 = !MDLocation(line: 108, column: 5, scope: !589)
!591 = !MDLocation(line: 109, column: 5, scope: !589)
!592 = !MDLocation(line: 112, column: 3, scope: !97)
!593 = !MDLocation(line: 116, column: 5, scope: !97)
!594 = !MDLocation(line: 116, column: 15, scope: !97)
!595 = !MDLocation(line: 116, column: 20, scope: !97)
!596 = !MDLocation(line: 116, column: 24, scope: !97)
!597 = !MDLocation(line: 116, column: 28, scope: !97)
!598 = !MDLocation(line: 116, column: 32, scope: !97)
!599 = !MDLocation(line: 116, column: 40, scope: !97)
!600 = !MDLocation(line: 116, column: 44, scope: !97)
!601 = !MDLocation(line: 118, column: 3, scope: !97)
!602 = !MDLocation(line: 120, column: 11, scope: !97)
!603 = !MDLocation(line: 120, column: 3, scope: !97)
!604 = !MDLocation(line: 122, column: 8, scope: !605)
!605 = !{!"0xb\00122\003\0021", !84, !97}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!606 = !MDLocation(line: 122, column: 15, scope: !607)
!607 = !{!"0xb\002", !84, !608}                   ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!608 = !{!"0xb\001", !84, !609}                   ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!609 = !{!"0xb\00122\003\0022", !84, !605}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!610 = !MDLocation(line: 122, column: 19, scope: !609)
!611 = !MDLocation(line: 122, column: 15, scope: !609)
!612 = !MDLocation(line: 122, column: 3, scope: !605)
!613 = !MDLocation(line: 123, column: 16, scope: !609)
!614 = !MDLocation(line: 123, column: 12, scope: !609)
!615 = !MDLocation(line: 123, column: 25, scope: !609)
!616 = !MDLocation(line: 123, column: 29, scope: !609)
!617 = !MDLocation(line: 123, column: 5, scope: !609)
!618 = !MDLocation(line: 123, column: 21, scope: !609)
!619 = !MDLocation(line: 123, column: 53, scope: !609)
!620 = !MDLocation(line: 123, column: 34, scope: !609)
!621 = !MDLocation(line: 122, column: 23, scope: !609)
!622 = !MDLocation(line: 122, column: 3, scope: !609)
!623 = !MDLocation(line: 125, column: 8, scope: !97)
!624 = !MDLocation(line: 125, column: 3, scope: !97)
!625 = !MDLocation(line: 126, column: 8, scope: !97)
!626 = !MDLocation(line: 126, column: 3, scope: !97)
!627 = !MDLocation(line: 137, column: 1, scope: !97)
!628 = !MDLocation(line: 137, column: 1, scope: !629)
!629 = !{!"0xb\001", !84, !97}                    ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c]
!630 = !{!631, !269, i64 0}
!631 = !{!"jpeg_decompress_struct", !269, i64 0, !269, i64 8, !269, i64 16, !269, i64 24, !251, i64 32, !251, i64 36, !269, i64 40, !251, i64 48, !251, i64 52, !251, i64 56, !252, i64 60, !252, i64 64, !251, i64 68, !251, i64 72, !632, i64 80, !251, i64 88, !251, i64 92, !252, i64 96, !251, i64 100, !251, i64 104, !251, i64 108, !252, i64 112, !251, i64 116, !251, i64 120, !251, i64 124, !251, i64 128, !251, i64 132, !251, i64 136, !251, i64 140, !251, i64 144, !251, i64 148, !251, i64 152, !251, i64 156, !269, i64 160, !251, i64 168, !251, i64 172, !251, i64 176, !251, i64 180, !251, i64 184, !269, i64 192, !252, i64 200, !252, i64 232, !252, i64 264, !251, i64 296, !269, i64 304, !251, i64 312, !251, i64 316, !251, i64 320, !252, i64 324, !252, i64 340, !252, i64 356, !251, i64 372, !251, i64 376, !252, i64 380, !252, i64 381, !252, i64 382, !633, i64 384, !633, i64 386, !251, i64 388, !252, i64 392, !251, i64 396, !269, i64 400, !251, i64 408, !251, i64 412, !251, i64 416, !251, i64 420, !251, i64 424, !269, i64 432, !251, i64 440, !252, i64 448, !251, i64 480, !251, i64 484, !251, i64 488, !252, i64 492, !251, i64 532, !251, i64 536, !251, i64 540, !251, i64 544, !251, i64 548, !269, i64 552, !251, i64 560, !251, i64 564, !269, i64 568, !269, i64 576, !269, i64 584, !269, i64 592, !269, i64 600, !269, i64 608, !269, i64 616, !269, i64 624, !269, i64 632, !269, i64 640, !269, i64 648}
!632 = !{!"double", !252, i64 0}
!633 = !{!"short", !252, i64 0}
!634 = !{!631, !251, i64 156}
!635 = !{!631, !251, i64 168}
!636 = !{!631, !251, i64 140}
!637 = !{!638, !269, i64 0}
!638 = !{!"jpeg_compress_struct", !269, i64 0, !269, i64 8, !269, i64 16, !269, i64 24, !251, i64 32, !251, i64 36, !269, i64 40, !251, i64 48, !251, i64 52, !251, i64 56, !252, i64 60, !632, i64 64, !251, i64 72, !251, i64 76, !251, i64 80, !251, i64 84, !251, i64 88, !251, i64 92, !252, i64 96, !269, i64 104, !252, i64 112, !252, i64 144, !252, i64 160, !252, i64 192, !252, i64 224, !252, i64 240, !252, i64 256, !251, i64 272, !269, i64 280, !251, i64 288, !251, i64 292, !251, i64 296, !251, i64 300, !251, i64 304, !251, i64 308, !252, i64 312, !251, i64 316, !251, i64 320, !251, i64 324, !252, i64 328, !252, i64 329, !252, i64 330, !633, i64 332, !633, i64 334, !251, i64 336, !251, i64 340, !251, i64 344, !251, i64 348, !251, i64 352, !251, i64 356, !251, i64 360, !251, i64 364, !251, i64 368, !252, i64 376, !251, i64 408, !251, i64 412, !251, i64 416, !252, i64 420, !251, i64 460, !251, i64 464, !251, i64 468, !251, i64 472, !251, i64 476, !269, i64 480, !251, i64 488, !269, i64 496, !269, i64 504, !269, i64 512, !269, i64 520, !269, i64 528, !269, i64 536, !269, i64 544, !269, i64 552, !269, i64 560, !269, i64 568, !251, i64 576}
!639 = !{!638, !251, i64 48}
!640 = !{!638, !251, i64 52}
!641 = !{!638, !251, i64 56}
!642 = !{!638, !252, i64 60}
!643 = !{!638, !251, i64 340}
