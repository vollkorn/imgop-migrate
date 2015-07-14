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
@.str2 = private unnamed_addr constant [6 x i8] c"dummy\00", align 1
@.str3 = private unnamed_addr constant [27 x i8] c"jpeg decompression failed\0A\00", align 1
@.str4 = private unnamed_addr constant [17 x i8] c"_compressed.jpg\00\00", align 1
@main.kernel_3_3 = private unnamed_addr constant [9 x float] [float 0x3FB99999A0000000, float 0x3FB99999A0000000, float 0x3FB99999A0000000, float 0x3FB99999A0000000, float 0x3FB99999A0000000, float 0x3FB99999A0000000, float 0x3FB99999A0000000, float 0x3FB99999A0000000, float 0x3FB99999A0000000], align 16
@main.kernel_5_5 = private unnamed_addr constant [25 x float] [float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00], align 16
@main.kernel_7_7 = private unnamed_addr constant [49 x float] [float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00], align 16
@.str5 = private unnamed_addr constant [22 x i8] c"invalid filter size!\0A\00", align 1
@.str6 = private unnamed_addr constant [4 x i8] c"%d\09\00", align 1
@.str7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@libfilename_3_3 = global i8* getelementptr inbounds ([46 x i8]* @.str15, i32 0, i32 0), align 8
@libfilename_5_5 = global i8* getelementptr inbounds ([46 x i8]* @.str116, i32 0, i32 0), align 8
@libfilename_7_7 = global i8* getelementptr inbounds ([46 x i8]* @.str217, i32 0, i32 0), align 8
@env_allow_hw = global i8* getelementptr inbounds ([17 x i8]* @.str318, i32 0, i32 0), align 8
@.str47 = private unnamed_addr constant [32 x i8] c"Filter size %d, nx: %d, ny: %d\0A\00", align 1
@.str58 = private unnamed_addr constant [20 x i8] c"HW bypass 0 called\0A\00", align 1
@.str69 = private unnamed_addr constant [88 x i8] c"Parameters:\0Asrc: %p\0Adst: %p\0Akernel: %p\0AFilter size: %d\0AData size x: %d\0AData size y: %d\0A\00", align 1
@.str710 = private unnamed_addr constant [20 x i8] c"HW bypass 1 called\0A\00", align 1
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
@.str27 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str128 = private unnamed_addr constant [15 x i8] c"can't open %s\0A\00", align 1
@.str229 = private unnamed_addr constant [47 x i8] c"Only greyscale images supported! Channels: %d\0A\00", align 1
@.str330 = private unnamed_addr constant [13 x i8] c"Image empty\0A\00", align 1
@.str431 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str532 = private unnamed_addr constant [15 x i8] c"can't open: %s\00", align 1
@.str633 = private unnamed_addr constant [40 x i8] c"Cannot handle color space, channels: %d\00", align 1

; Function Attrs: nounwind uwtable
define void @filter_kernel(i8* nocapture readonly %in, i8* nocapture %out, float* nocapture readonly %kernel, i32 %kn, i32 %m, i32 %n, i32 %size_x, i32 %size_y) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i8* %in, i64 0, metadata !69, metadata !70), !dbg !71
  tail call void @llvm.dbg.value(metadata i8* %out, i64 0, metadata !72, metadata !70), !dbg !73
  tail call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !74, metadata !70), !dbg !75
  tail call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !76, metadata !70), !dbg !77
  tail call void @llvm.dbg.value(metadata i32 %m, i64 0, metadata !78, metadata !70), !dbg !79
  tail call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !80, metadata !70), !dbg !81
  tail call void @llvm.dbg.value(metadata i32 %size_x, i64 0, metadata !82, metadata !70), !dbg !83
  tail call void @llvm.dbg.value(metadata i32 %size_y, i64 0, metadata !84, metadata !70), !dbg !85
  %div = sdiv i32 %kn, 2, !dbg !86
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !87, metadata !70), !dbg !88
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !89, metadata !70), !dbg !90
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !91, metadata !70), !dbg !92
  %sub = sub nsw i32 0, %div, !dbg !93
  tail call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !95, metadata !70), !dbg !96
  %0 = sext i32 %sub to i64
  %1 = sext i32 %div to i64, !dbg !97
  %2 = sext i32 %n to i64, !dbg !97
  %3 = sext i32 %size_x to i64, !dbg !97
  %4 = sext i32 %m to i64, !dbg !97
  %5 = sext i32 %kn to i64, !dbg !97
  %cmp14 = icmp slt i32 %div, %sub, !dbg !98
  br i1 %cmp14, label %for.end18, label %for.inc.preheader.preheader, !dbg !100

for.inc.preheader.preheader:                      ; preds = %entry
  br label %for.inc.preheader, !dbg !101

for.inc.preheader:                                ; preds = %for.inc16, %for.inc.preheader.preheader
  %pixel.017 = phi float [ %add15.lcssa, %for.inc16 ], [ 0.000000e+00, %for.inc.preheader.preheader ]
  %indvars.iv315 = phi i64 [ %indvars.iv.next4, %for.inc16 ], [ %0, %for.inc.preheader.preheader ]
  tail call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !103, metadata !70), !dbg !101
  %6 = sub nsw i64 %2, %indvars.iv315, !dbg !104
  %7 = mul nsw i64 %6, %3, !dbg !106
  %8 = add nsw i64 %7, %4, !dbg !106
  %9 = mul nsw i64 %indvars.iv315, %5, !dbg !107
  %10 = sub i64 2, %9, !dbg !108
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader
  %pixel.113 = phi float [ %add15, %for.inc ], [ %pixel.017, %for.inc.preheader ]
  %indvars.iv12 = phi i64 [ %indvars.iv.next, %for.inc ], [ %0, %for.inc.preheader ]
  tail call void @llvm.dbg.value(metadata float %add15, i64 0, metadata !89, metadata !70), !dbg !90
  %11 = sub i64 %8, %indvars.iv12, !dbg !106
  %arrayidx = getelementptr inbounds i8* %in, i64 %11, !dbg !109
  %12 = load i8* %arrayidx, align 1, !dbg !109
  %conv = zext i8 %12 to i32, !dbg !109
  %conv7 = sitofp i32 %conv to float, !dbg !109
  %13 = sub i64 %10, %indvars.iv12, !dbg !108
  %arrayidx13 = getelementptr inbounds float* %kernel, i64 %13, !dbg !110
  %14 = load float* %arrayidx13, align 4, !dbg !110
  %mul14 = fmul float %14, %conv7, !dbg !109
  %add15 = fadd float %pixel.113, %mul14, !dbg !111
  %indvars.iv.next = add nsw i64 %indvars.iv12, 1, !dbg !112
  %cmp3 = icmp slt i64 %indvars.iv12, %1, !dbg !113
  br i1 %cmp3, label %for.inc, label %for.inc16, !dbg !114

for.inc16:                                        ; preds = %for.inc
  %add15.lcssa = phi float [ %add15, %for.inc ]
  %indvars.iv.next4 = add nsw i64 %indvars.iv315, 1, !dbg !115
  %cmp = icmp slt i64 %indvars.iv315, %1, !dbg !98
  br i1 %cmp, label %for.inc.preheader, label %for.end18.loopexit, !dbg !100

for.end18.loopexit:                               ; preds = %for.inc16
  %add15.lcssa.lcssa = phi float [ %add15.lcssa, %for.inc16 ]
  %phitmp = fptoui float %add15.lcssa.lcssa to i8
  br label %for.end18

for.end18:                                        ; preds = %for.end18.loopexit, %entry
  %pixel.0.lcssa = phi i8 [ 0, %entry ], [ %phitmp, %for.end18.loopexit ]
  %mul20 = mul nsw i32 %size_x, %n, !dbg !116
  %add21 = add nsw i32 %mul20, %m, !dbg !116
  %idxprom22 = sext i32 %add21 to i64, !dbg !117
  %arrayidx23 = getelementptr inbounds i8* %out, i64 %idxprom22, !dbg !117
  store i8 %pixel.0.lcssa, i8* %arrayidx23, align 1, !dbg !117
  ret void, !dbg !118
}

; Function Attrs: nounwind uwtable
define void @filter_kernel_2d(i8** nocapture readonly %in, i8** nocapture readonly %out, float* nocapture readonly %kernel, i32 %kn, i32 %x, i32 %y) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i8** %in, i64 0, metadata !119, metadata !70), !dbg !120
  tail call void @llvm.dbg.value(metadata i8** %out, i64 0, metadata !121, metadata !70), !dbg !122
  tail call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !123, metadata !70), !dbg !124
  tail call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !125, metadata !70), !dbg !126
  tail call void @llvm.dbg.value(metadata i32 %x, i64 0, metadata !127, metadata !70), !dbg !128
  tail call void @llvm.dbg.value(metadata i32 %y, i64 0, metadata !129, metadata !70), !dbg !130
  %div = sdiv i32 %kn, 2, !dbg !131
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !132, metadata !70), !dbg !133
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !134, metadata !70), !dbg !135
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !136, metadata !70), !dbg !137
  %sub = sub i32 0, %div, !dbg !138
  tail call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !140, metadata !70), !dbg !141
  %0 = sext i32 %sub to i64
  %1 = sext i32 %div to i64, !dbg !142
  %2 = sext i32 %x to i64, !dbg !142
  %3 = sext i32 %y to i64, !dbg !142
  %cmp12 = icmp slt i32 %div, %sub, !dbg !143
  br i1 %cmp12, label %for.end15, label %for.body.preheader, !dbg !145

for.body.preheader:                               ; preds = %entry
  %4 = add nsw i64 %1, 1, !dbg !135
  %5 = sub nsw i64 %4, %0, !dbg !135
  br label %for.inc.preheader, !dbg !146

for.inc.preheader:                                ; preds = %for.inc13, %for.body.preheader
  %c.016 = phi i64 [ %13, %for.inc13 ], [ 0, %for.body.preheader ]
  %pixel.015 = phi float [ %add11.lcssa, %for.inc13 ], [ 0.000000e+00, %for.body.preheader ]
  %indvars.iv413 = phi i64 [ %indvars.iv.next5, %for.inc13 ], [ %0, %for.body.preheader ]
  tail call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !148, metadata !70), !dbg !146
  %sext = shl i64 %c.016, 32
  %6 = ashr exact i64 %sext, 32
  %7 = add nsw i64 %indvars.iv413, %3, !dbg !149
  %arrayidx = getelementptr inbounds i8** %in, i64 %7, !dbg !151
  %8 = load i8** %arrayidx, align 8, !dbg !151
  %sext1 = shl i64 %c.016, 32
  %9 = ashr exact i64 %sext1, 32
  br label %for.inc, !dbg !135

for.inc:                                          ; preds = %for.inc, %for.inc.preheader
  %pixel.110 = phi float [ %add11, %for.inc ], [ %pixel.015, %for.inc.preheader ]
  %indvars.iv9 = phi i64 [ %indvars.iv.next, %for.inc ], [ %6, %for.inc.preheader ]
  %indvars.iv18 = phi i64 [ %indvars.iv.next2, %for.inc ], [ %0, %for.inc.preheader ]
  tail call void @llvm.dbg.value(metadata float %add11, i64 0, metadata !134, metadata !70), !dbg !135
  %10 = add nsw i64 %indvars.iv18, %2, !dbg !152
  %arrayidx7 = getelementptr inbounds i8* %8, i64 %10, !dbg !151
  %11 = load i8* %arrayidx7, align 1, !dbg !151
  %conv = zext i8 %11 to i32, !dbg !151
  %conv8 = sitofp i32 %conv to float, !dbg !151
  %arrayidx10 = getelementptr inbounds float* %kernel, i64 %indvars.iv9, !dbg !153
  %12 = load float* %arrayidx10, align 4, !dbg !153
  %mul = fmul float %12, %conv8, !dbg !151
  %add11 = fadd float %pixel.110, %mul, !dbg !154
  %indvars.iv.next = add nsw i64 %indvars.iv9, 1, !dbg !155
  %indvars.iv.next2 = add nsw i64 %indvars.iv18, 1, !dbg !155
  %cmp3 = icmp slt i64 %indvars.iv18, %1, !dbg !156
  br i1 %cmp3, label %for.inc, label %for.inc13, !dbg !157

for.inc13:                                        ; preds = %for.inc
  %add11.lcssa = phi float [ %add11, %for.inc ]
  %13 = add nsw i64 %5, %9, !dbg !135
  %indvars.iv.next5 = add nsw i64 %indvars.iv413, 1, !dbg !158
  %cmp = icmp slt i64 %indvars.iv413, %1, !dbg !143
  br i1 %cmp, label %for.inc.preheader, label %for.end15.loopexit, !dbg !145

for.end15.loopexit:                               ; preds = %for.inc13
  %add11.lcssa.lcssa = phi float [ %add11.lcssa, %for.inc13 ]
  %phitmp = fptoui float %add11.lcssa.lcssa to i8
  br label %for.end15

for.end15:                                        ; preds = %for.end15.loopexit, %entry
  %pixel.0.lcssa = phi i8 [ 0, %entry ], [ %phitmp, %for.end15.loopexit ]
  %arrayidx19 = getelementptr inbounds i8** %out, i64 %3, !dbg !159
  %14 = load i8** %arrayidx19, align 8, !dbg !159
  %arrayidx20 = getelementptr inbounds i8* %14, i64 %2, !dbg !159
  store i8 %pixel.0.lcssa, i8* %arrayidx20, align 1, !dbg !159
  ret void, !dbg !160
}

; Function Attrs: nounwind uwtable
define void @convolve_arr_linear(i8* %in, i8* %out, float* %kernel, i32 %kn, i32 %dim_x, i32 %dim_y) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i8* %in, i64 0, metadata !161, metadata !70), !dbg !162
  tail call void @llvm.dbg.value(metadata i8* %out, i64 0, metadata !163, metadata !70), !dbg !164
  tail call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !165, metadata !70), !dbg !166
  tail call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !167, metadata !70), !dbg !168
  tail call void @llvm.dbg.value(metadata i32 %dim_x, i64 0, metadata !169, metadata !70), !dbg !170
  tail call void @llvm.dbg.value(metadata i32 %dim_y, i64 0, metadata !171, metadata !70), !dbg !172
  %div = sdiv i32 %kn, 2, !dbg !173
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !174, metadata !70), !dbg !175
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !176, metadata !70), !dbg !178
  %0 = sext i32 %div to i64
  %1 = sext i32 %dim_x to i64, !dbg !179
  %sub = sub i32 %dim_x, %div, !dbg !180
  %cmp8 = icmp slt i32 %div, %sub, !dbg !182
  br i1 %cmp8, label %bypassdesc, label %for.end7, !dbg !183

bypassdesc:                                       ; preds = %entry
  %bypass = tail call i1 @convolve_hw_use_accelerator(i32 %kn, i32 %dim_y, i32 %dim_x) #6
  br i1 %bypass, label %acc, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %bypassdesc
  %sub2 = sub i32 %dim_y, %div, !dbg !184
  %cmp36 = icmp slt i32 %div, %sub2, !dbg !187
  %sub.i = sub nsw i32 0, %div, !dbg !188
  %2 = sext i32 %sub.i to i64, !dbg !189
  %3 = sext i32 %kn to i64, !dbg !190
  %cmp14.i = icmp slt i32 %div, %sub.i, !dbg !191
  %4 = sext i32 %sub2 to i64
  %5 = add nsw i64 %4, -1, !dbg !184
  %6 = sext i32 %sub to i64
  %7 = add nsw i64 %6, -1, !dbg !184
  br label %for.cond1.preheader, !dbg !184

for.cond1.preheader:                              ; preds = %for.inc5, %for.cond1.preheader.preheader
  %indvars.iv49 = phi i64 [ %indvars.iv.next5, %for.inc5 ], [ %0, %for.cond1.preheader.preheader ]
  br i1 %cmp36, label %for.body4.preheader, label %for.inc5, !dbg !192

for.body4.preheader:                              ; preds = %for.cond1.preheader
  br label %for.body4, !dbg !193

for.body4:                                        ; preds = %filter_kernel.exit, %for.body4.preheader
  %indvars.iv7 = phi i64 [ %indvars.iv.next, %filter_kernel.exit ], [ %0, %for.body4.preheader ]
  tail call void @llvm.dbg.value(metadata i8* %in, i64 0, metadata !194, metadata !70), !dbg !193
  tail call void @llvm.dbg.value(metadata i8* %out, i64 0, metadata !195, metadata !70), !dbg !196
  tail call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !197, metadata !70), !dbg !198
  tail call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !199, metadata !70), !dbg !200
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !201, metadata !70), !dbg !202
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !203, metadata !70), !dbg !204
  tail call void @llvm.dbg.value(metadata i32 %dim_x, i64 0, metadata !205, metadata !70), !dbg !206
  tail call void @llvm.dbg.value(metadata i32 %dim_y, i64 0, metadata !207, metadata !70), !dbg !208
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !209, metadata !70), !dbg !210
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !211, metadata !70), !dbg !212
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !213, metadata !70), !dbg !214
  tail call void @llvm.dbg.value(metadata i32 %sub.i, i64 0, metadata !215, metadata !70), !dbg !216
  br i1 %cmp14.i, label %filter_kernel.exit, label %for.inc.i.preheader.preheader, !dbg !217

for.inc.i.preheader.preheader:                    ; preds = %for.body4
  br label %for.inc.i.preheader, !dbg !218

for.inc.i.preheader:                              ; preds = %for.inc16.i, %for.inc.i.preheader.preheader
  %pixel.017.i = phi float [ %add15.i.lcssa, %for.inc16.i ], [ 0.000000e+00, %for.inc.i.preheader.preheader ], !dbg !189
  %indvars.iv315.i = phi i64 [ %indvars.iv.next4.i, %for.inc16.i ], [ %2, %for.inc.i.preheader.preheader ], !dbg !189
  tail call void @llvm.dbg.value(metadata i32 %sub.i, i64 0, metadata !219, metadata !70), !dbg !218
  %8 = sub nsw i64 %indvars.iv7, %indvars.iv315.i, !dbg !220
  %9 = mul nsw i64 %8, %1, !dbg !221
  %10 = add nsw i64 %9, %indvars.iv49, !dbg !221
  %11 = mul nsw i64 %indvars.iv315.i, %3, !dbg !222
  %12 = sub i64 2, %11, !dbg !223
  br label %for.inc.i

for.inc.i:                                        ; preds = %for.inc.i, %for.inc.i.preheader
  %pixel.113.i = phi float [ %add15.i, %for.inc.i ], [ %pixel.017.i, %for.inc.i.preheader ], !dbg !189
  %indvars.iv12.i = phi i64 [ %indvars.iv.next.i, %for.inc.i ], [ %2, %for.inc.i.preheader ], !dbg !189
  %13 = sub i64 %10, %indvars.iv12.i, !dbg !221
  %arrayidx.i = getelementptr inbounds i8* %in, i64 %13, !dbg !224
  %14 = load i8* %arrayidx.i, align 1, !dbg !224
  %conv.i = zext i8 %14 to i32, !dbg !224
  %conv7.i = sitofp i32 %conv.i to float, !dbg !224
  %15 = sub i64 %12, %indvars.iv12.i, !dbg !223
  %arrayidx13.i = getelementptr inbounds float* %kernel, i64 %15, !dbg !225
  %16 = load float* %arrayidx13.i, align 4, !dbg !225
  %mul14.i = fmul float %16, %conv7.i, !dbg !224
  %add15.i = fadd float %pixel.113.i, %mul14.i, !dbg !226
  %indvars.iv.next.i = add nsw i64 %indvars.iv12.i, 1, !dbg !227
  %exitcond = icmp eq i64 %indvars.iv12.i, %0, !dbg !228
  br i1 %exitcond, label %for.inc16.i, label %for.inc.i, !dbg !228

for.inc16.i:                                      ; preds = %for.inc.i
  %add15.i.lcssa = phi float [ %add15.i, %for.inc.i ]
  %indvars.iv.next4.i = add nsw i64 %indvars.iv315.i, 1, !dbg !229
  %exitcond1 = icmp eq i64 %indvars.iv315.i, %0, !dbg !217
  br i1 %exitcond1, label %filter_kernel.exit.loopexit, label %for.inc.i.preheader, !dbg !217

filter_kernel.exit.loopexit:                      ; preds = %for.inc16.i
  %add15.i.lcssa.lcssa = phi float [ %add15.i.lcssa, %for.inc16.i ]
  br label %filter_kernel.exit

filter_kernel.exit:                               ; preds = %filter_kernel.exit.loopexit, %for.body4
  %pixel.0.lcssa.i = phi float [ 0.000000e+00, %for.body4 ], [ %add15.i.lcssa.lcssa, %filter_kernel.exit.loopexit ], !dbg !189
  %conv19.i = fptoui float %pixel.0.lcssa.i to i8, !dbg !230
  %17 = mul nsw i64 %indvars.iv7, %1, !dbg !231
  %18 = add nsw i64 %17, %indvars.iv49, !dbg !231
  %arrayidx23.i = getelementptr inbounds i8* %out, i64 %18, !dbg !232
  store i8 %conv19.i, i8* %arrayidx23.i, align 1, !dbg !232
  %indvars.iv.next = add nsw i64 %indvars.iv7, 1, !dbg !233
  %exitcond2 = icmp eq i64 %indvars.iv7, %5, !dbg !192
  br i1 %exitcond2, label %for.inc5.loopexit, label %for.body4, !dbg !192

for.inc5.loopexit:                                ; preds = %filter_kernel.exit
  br label %for.inc5

for.inc5:                                         ; preds = %for.inc5.loopexit, %for.cond1.preheader
  %indvars.iv.next5 = add nsw i64 %indvars.iv49, 1, !dbg !234
  %exitcond3 = icmp eq i64 %indvars.iv49, %7, !dbg !183
  br i1 %exitcond3, label %for.end7.loopexit, label %for.cond1.preheader, !dbg !183

for.end7.loopexit:                                ; preds = %for.inc5
  br label %for.end7

for.end7:                                         ; preds = %for.end7.loopexit, %entry
  ret void, !dbg !235

acc:                                              ; preds = %bypassdesc
  tail call void @convolve_bypass_hw_iface0(i8* %in, i8* %out, float* %kernel, i32 %kn, i32 %dim_y, i32 %dim_x) #6
  ret void
}

; Function Attrs: nounwind uwtable
define void @convolve_arr_indirection(i8** %in, i8** %out, float* %kernel, i32 %kn, i32 %dim_x, i32 %dim_y) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i8** %in, i64 0, metadata !236, metadata !70), !dbg !237
  tail call void @llvm.dbg.value(metadata i8** %out, i64 0, metadata !238, metadata !70), !dbg !239
  tail call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !240, metadata !70), !dbg !241
  tail call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !242, metadata !70), !dbg !243
  tail call void @llvm.dbg.value(metadata i32 %dim_x, i64 0, metadata !244, metadata !70), !dbg !245
  tail call void @llvm.dbg.value(metadata i32 %dim_y, i64 0, metadata !246, metadata !70), !dbg !247
  %div = sdiv i32 %kn, 2, !dbg !248
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !249, metadata !70), !dbg !250
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !251, metadata !70), !dbg !253
  %0 = sext i32 %div to i64
  %1 = add nsw i64 %0, 1, !dbg !254
  %2 = sub i32 0, %div, !dbg !259
  %3 = sext i32 %2 to i64
  %4 = sub nsw i64 %1, %3, !dbg !254
  %sub = sub i32 %dim_x, %div, !dbg !260
  %cmp7 = icmp slt i32 %div, %sub, !dbg !261
  br i1 %cmp7, label %bypassdesc, label %for.end7, !dbg !262

bypassdesc:                                       ; preds = %entry
  %bypass = tail call i1 @convolve_hw_use_accelerator(i32 %kn, i32 %dim_y, i32 %dim_x) #6
  br i1 %bypass, label %acc, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %bypassdesc
  %sub2 = sub nsw i32 %dim_y, %div, !dbg !263
  %cmp34 = icmp slt i32 %div, %sub2, !dbg !264
  %cmp12.i = icmp slt i32 %div, %2, !dbg !265
  %5 = sext i32 %sub2 to i64
  %6 = add nsw i64 %5, -1, !dbg !263
  %7 = sext i32 %sub to i64
  %8 = add nsw i64 %7, -1, !dbg !263
  br label %for.cond1.preheader, !dbg !263

for.cond1.preheader:                              ; preds = %for.inc5, %for.cond1.preheader.preheader
  %indvars.iv28 = phi i64 [ %indvars.iv.next3, %for.inc5 ], [ %0, %for.cond1.preheader.preheader ]
  br i1 %cmp34, label %for.body4.preheader, label %for.inc5, !dbg !266

for.body4.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx19.i = getelementptr inbounds i8** %out, i64 %indvars.iv28, !dbg !267
  br label %for.body4, !dbg !268

for.body4:                                        ; preds = %filter_kernel_2d.exit, %for.body4.preheader
  %indvars.iv5 = phi i64 [ %indvars.iv.next, %filter_kernel_2d.exit ], [ %0, %for.body4.preheader ]
  tail call void @llvm.dbg.value(metadata i8** %in, i64 0, metadata !269, metadata !70), !dbg !268
  tail call void @llvm.dbg.value(metadata i8** %out, i64 0, metadata !270, metadata !70), !dbg !271
  tail call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !272, metadata !70), !dbg !273
  tail call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !274, metadata !70), !dbg !275
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !276, metadata !70), !dbg !277
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !278, metadata !70), !dbg !279
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !280, metadata !70), !dbg !281
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !282, metadata !70), !dbg !283
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !284, metadata !70), !dbg !285
  tail call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !286, metadata !70), !dbg !287
  br i1 %cmp12.i, label %filter_kernel_2d.exit, label %for.inc.i.preheader.preheader, !dbg !288

for.inc.i.preheader.preheader:                    ; preds = %for.body4
  br label %for.inc.i.preheader, !dbg !289

for.inc.i.preheader:                              ; preds = %for.inc13.i, %for.inc.i.preheader.preheader
  %c.016.i = phi i64 [ %15, %for.inc13.i ], [ 0, %for.inc.i.preheader.preheader ], !dbg !255
  %pixel.015.i = phi float [ %add11.i.lcssa, %for.inc13.i ], [ 0.000000e+00, %for.inc.i.preheader.preheader ], !dbg !255
  %indvars.iv413.i = phi i64 [ %indvars.iv.next5.i, %for.inc13.i ], [ %3, %for.inc.i.preheader.preheader ], !dbg !255
  tail call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !290, metadata !70), !dbg !289
  %sext = shl i64 %c.016.i, 32, !dbg !255
  %9 = ashr exact i64 %sext, 32, !dbg !255
  %10 = add nsw i64 %indvars.iv413.i, %indvars.iv28, !dbg !291
  %arrayidx.i = getelementptr inbounds i8** %in, i64 %10, !dbg !292
  %11 = load i8** %arrayidx.i, align 8, !dbg !292
  br label %for.inc.i, !dbg !291

for.inc.i:                                        ; preds = %for.inc.i, %for.inc.i.preheader
  %pixel.110.i = phi float [ %add11.i, %for.inc.i ], [ %pixel.015.i, %for.inc.i.preheader ], !dbg !255
  %indvars.iv9.i = phi i64 [ %indvars.iv.next.i, %for.inc.i ], [ %9, %for.inc.i.preheader ], !dbg !255
  %indvars.iv18.i = phi i64 [ %indvars.iv.next2.i, %for.inc.i ], [ %3, %for.inc.i.preheader ], !dbg !255
  %12 = add nsw i64 %indvars.iv18.i, %indvars.iv5, !dbg !293
  %arrayidx7.i = getelementptr inbounds i8* %11, i64 %12, !dbg !292
  %13 = load i8* %arrayidx7.i, align 1, !dbg !292
  %conv.i = zext i8 %13 to i32, !dbg !292
  %conv8.i = sitofp i32 %conv.i to float, !dbg !292
  %arrayidx10.i = getelementptr inbounds float* %kernel, i64 %indvars.iv9.i, !dbg !294
  %14 = load float* %arrayidx10.i, align 4, !dbg !294
  %mul.i = fmul float %14, %conv8.i, !dbg !292
  %add11.i = fadd float %pixel.110.i, %mul.i, !dbg !295
  %indvars.iv.next.i = add nsw i64 %indvars.iv9.i, 1, !dbg !296
  %indvars.iv.next2.i = add nsw i64 %indvars.iv18.i, 1, !dbg !296
  %exitcond = icmp eq i64 %indvars.iv18.i, %0, !dbg !254
  br i1 %exitcond, label %for.inc13.i, label %for.inc.i, !dbg !254

for.inc13.i:                                      ; preds = %for.inc.i
  %add11.i.lcssa = phi float [ %add11.i, %for.inc.i ]
  %15 = add nsw i64 %4, %9, !dbg !254
  %indvars.iv.next5.i = add nsw i64 %indvars.iv413.i, 1, !dbg !297
  %exitcond1 = icmp eq i64 %indvars.iv413.i, %0, !dbg !288
  br i1 %exitcond1, label %filter_kernel_2d.exit.loopexit, label %for.inc.i.preheader, !dbg !288

filter_kernel_2d.exit.loopexit:                   ; preds = %for.inc13.i
  %add11.i.lcssa.lcssa = phi float [ %add11.i.lcssa, %for.inc13.i ]
  br label %filter_kernel_2d.exit

filter_kernel_2d.exit:                            ; preds = %filter_kernel_2d.exit.loopexit, %for.body4
  %pixel.0.lcssa.i = phi float [ 0.000000e+00, %for.body4 ], [ %add11.i.lcssa.lcssa, %filter_kernel_2d.exit.loopexit ], !dbg !255
  %conv16.i = fptoui float %pixel.0.lcssa.i to i8, !dbg !298
  %16 = load i8** %arrayidx19.i, align 8, !dbg !267
  %arrayidx20.i = getelementptr inbounds i8* %16, i64 %indvars.iv5, !dbg !267
  store i8 %conv16.i, i8* %arrayidx20.i, align 1, !dbg !267
  %indvars.iv.next = add nsw i64 %indvars.iv5, 1, !dbg !299
  %exitcond2 = icmp eq i64 %indvars.iv5, %6, !dbg !266
  br i1 %exitcond2, label %for.inc5.loopexit, label %for.body4, !dbg !266

for.inc5.loopexit:                                ; preds = %filter_kernel_2d.exit
  br label %for.inc5

for.inc5:                                         ; preds = %for.inc5.loopexit, %for.cond1.preheader
  %indvars.iv.next3 = add nsw i64 %indvars.iv28, 1, !dbg !300
  %exitcond3 = icmp eq i64 %indvars.iv28, %8, !dbg !262
  br i1 %exitcond3, label %for.end7.loopexit, label %for.cond1.preheader, !dbg !262

for.end7.loopexit:                                ; preds = %for.inc5
  br label %for.end7

for.end7:                                         ; preds = %for.end7.loopexit, %entry
  ret void, !dbg !301

acc:                                              ; preds = %bypassdesc
  tail call void @convolve_bypass_hw_iface1(i8** %in, i8** %out, float* %kernel, i32 %kn, i32 %dim_y, i32 %dim_x) #6
  ret void
}

; Function Attrs: nounwind uwtable
define void @convolve_loop_nest(i8** %in, i8** %out, float* %kernel, i32 %kn, i32 %dim_x, i32 %dim_y) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i8** %in, i64 0, metadata !302, metadata !70), !dbg !303
  tail call void @llvm.dbg.value(metadata i8** %out, i64 0, metadata !304, metadata !70), !dbg !305
  tail call void @llvm.dbg.value(metadata float* %kernel, i64 0, metadata !306, metadata !70), !dbg !307
  tail call void @llvm.dbg.value(metadata i32 %kn, i64 0, metadata !308, metadata !70), !dbg !309
  tail call void @llvm.dbg.value(metadata i32 %dim_x, i64 0, metadata !310, metadata !70), !dbg !311
  tail call void @llvm.dbg.value(metadata i32 %dim_y, i64 0, metadata !312, metadata !70), !dbg !313
  %div = sdiv i32 %kn, 2, !dbg !314
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !315, metadata !70), !dbg !316
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !317, metadata !70), !dbg !319
  %0 = sub i32 0, %div, !dbg !320
  %1 = sext i32 %0 to i64
  %2 = sext i32 %div to i64, !dbg !320
  %sub = sub i32 %dim_x, %div, !dbg !321
  %cmp25 = icmp slt i32 %div, %sub, !dbg !323
  br i1 %cmp25, label %bypassdesc, label %for.end34, !dbg !324

bypassdesc:                                       ; preds = %entry
  %bypass = tail call i1 @convolve_hw_use_accelerator(i32 %kn, i32 %dim_y, i32 %dim_x) #6
  br i1 %bypass, label %acc, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %bypassdesc
  %sub2 = sub i32 %dim_y, %div, !dbg !325
  %cmp322 = icmp slt i32 %div, %sub2, !dbg !328
  %cmp716 = icmp slt i32 %div, %0, !dbg !329
  %3 = add nsw i64 %2, 1, !dbg !333
  %4 = sub nsw i64 %3, %1, !dbg !333
  %5 = sext i32 %sub2 to i64
  %6 = add nsw i64 %5, -1, !dbg !325
  %7 = sext i32 %sub to i64
  %8 = add nsw i64 %7, -1, !dbg !325
  br label %for.cond1.preheader, !dbg !325

for.cond1.preheader:                              ; preds = %for.inc32, %for.cond1.preheader.preheader
  %indvars.iv926 = phi i64 [ %indvars.iv.next10, %for.inc32 ], [ %2, %for.cond1.preheader.preheader ]
  br i1 %cmp322, label %for.body4.preheader, label %for.inc32, !dbg !334

for.body4.preheader:                              ; preds = %for.cond1.preheader
  br label %for.body4, !dbg !333

for.body4:                                        ; preds = %for.end23, %for.body4.preheader
  %indvars.iv723 = phi i64 [ %indvars.iv.next8, %for.end23 ], [ %2, %for.body4.preheader ]
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !335, metadata !70), !dbg !333
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !336, metadata !70), !dbg !337
  br i1 %cmp716, label %for.end23, label %for.inc.preheader.preheader, !dbg !338

for.inc.preheader.preheader:                      ; preds = %for.body4
  br label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc21, %for.inc.preheader.preheader
  %c.020 = phi i64 [ %16, %for.inc21 ], [ 0, %for.inc.preheader.preheader ]
  %pixel.019 = phi float [ %add19.lcssa, %for.inc21 ], [ 0.000000e+00, %for.inc.preheader.preheader ]
  %indvars.iv417 = phi i64 [ %indvars.iv.next5, %for.inc21 ], [ %1, %for.inc.preheader.preheader ]
  %sext = shl i64 %c.020, 32
  %9 = ashr exact i64 %sext, 32
  %10 = add nsw i64 %indvars.iv417, %indvars.iv723, !dbg !339
  %arrayidx = getelementptr inbounds i8** %in, i64 %10, !dbg !342
  %11 = load i8** %arrayidx, align 8, !dbg !342
  %sext2 = shl i64 %c.020, 32
  %12 = ashr exact i64 %sext2, 32
  br label %for.inc, !dbg !333

for.inc:                                          ; preds = %for.inc, %for.inc.preheader
  %pixel.114 = phi float [ %add19, %for.inc ], [ %pixel.019, %for.inc.preheader ]
  %indvars.iv13 = phi i64 [ %indvars.iv.next, %for.inc ], [ %9, %for.inc.preheader ]
  %indvars.iv112 = phi i64 [ %indvars.iv.next2, %for.inc ], [ %1, %for.inc.preheader ]
  tail call void @llvm.dbg.value(metadata float %add19, i64 0, metadata !335, metadata !70), !dbg !333
  %13 = add nsw i64 %indvars.iv112, %indvars.iv926, !dbg !343
  %arrayidx15 = getelementptr inbounds i8* %11, i64 %13, !dbg !342
  %14 = load i8* %arrayidx15, align 1, !dbg !342
  %conv = zext i8 %14 to i32, !dbg !342
  %conv16 = sitofp i32 %conv to float, !dbg !342
  %arrayidx18 = getelementptr inbounds float* %kernel, i64 %indvars.iv13, !dbg !344
  %15 = load float* %arrayidx18, align 4, !dbg !344
  %mul = fmul float %15, %conv16, !dbg !342
  %add19 = fadd float %pixel.114, %mul, !dbg !345
  %indvars.iv.next = add nsw i64 %indvars.iv13, 1, !dbg !346
  %indvars.iv.next2 = add nsw i64 %indvars.iv112, 1, !dbg !346
  %cmp11 = icmp slt i64 %indvars.iv112, %2, !dbg !347
  br i1 %cmp11, label %for.inc, label %for.inc21, !dbg !348

for.inc21:                                        ; preds = %for.inc
  %add19.lcssa = phi float [ %add19, %for.inc ]
  %16 = add nsw i64 %4, %12, !dbg !333
  %indvars.iv.next5 = add nsw i64 %indvars.iv417, 1, !dbg !349
  %cmp7 = icmp slt i64 %indvars.iv417, %2, !dbg !329
  br i1 %cmp7, label %for.inc.preheader, label %for.end23.loopexit, !dbg !338

for.end23.loopexit:                               ; preds = %for.inc21
  %add19.lcssa.lcssa = phi float [ %add19.lcssa, %for.inc21 ]
  br label %for.end23

for.end23:                                        ; preds = %for.end23.loopexit, %for.body4
  %pixel.0.lcssa = phi float [ 0.000000e+00, %for.body4 ], [ %add19.lcssa.lcssa, %for.end23.loopexit ]
  %conv24 = fptoui float %pixel.0.lcssa to i8, !dbg !350
  %arrayidx27 = getelementptr inbounds i8** %out, i64 %indvars.iv723, !dbg !351
  %17 = load i8** %arrayidx27, align 8, !dbg !351
  %arrayidx28 = getelementptr inbounds i8* %17, i64 %indvars.iv926, !dbg !351
  store i8 %conv24, i8* %arrayidx28, align 1, !dbg !351
  %indvars.iv.next8 = add nsw i64 %indvars.iv723, 1, !dbg !352
  %exitcond = icmp eq i64 %indvars.iv723, %6, !dbg !334
  br i1 %exitcond, label %for.inc32.loopexit, label %for.body4, !dbg !334

for.inc32.loopexit:                               ; preds = %for.end23
  br label %for.inc32

for.inc32:                                        ; preds = %for.inc32.loopexit, %for.cond1.preheader
  %indvars.iv.next10 = add nsw i64 %indvars.iv926, 1, !dbg !353
  %exitcond1 = icmp eq i64 %indvars.iv926, %8, !dbg !324
  br i1 %exitcond1, label %for.end34.loopexit, label %for.cond1.preheader, !dbg !324

for.end34.loopexit:                               ; preds = %for.inc32
  br label %for.end34

for.end34:                                        ; preds = %for.end34.loopexit, %entry
  ret void, !dbg !354

acc:                                              ; preds = %bypassdesc
  tail call void @convolve_bypass_hw_iface1(i8** %in, i8** %out, float* %kernel, i32 %kn, i32 %dim_y, i32 %dim_x) #6
  ret void
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %index = alloca i32, align 4
  %verbose_output = alloca i32, align 4
  %arg = alloca i32, align 4
  %_size_arr = alloca i32, align 4
  %_size_filter = alloca i32, align 4
  %data_input = alloca i8**, align 8
  %data_output = alloca i8**, align 8
  %nrows = alloca i32, align 4
  %ncols = alloca i32, align 4
  %nchannels = alloca i32, align 4
  %opt = alloca i32, align 4
  %filename_in = alloca i8*, align 8
  %filename_out = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %kernel_3_3 = alloca [9 x float], align 16
  %kernel_5_5 = alloca [25 x float], align 16
  %kernel_7_7 = alloca [49 x float], align 16
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !355, metadata !70), !dbg !356
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !357, metadata !70), !dbg !358
  store i32 0, i32* @opterr, align 4, !dbg !359
  call void @llvm.dbg.declare(metadata i32* %index, metadata !360, metadata !70), !dbg !361
  store i32 0, i32* %index, align 4, !dbg !361
  call void @llvm.dbg.declare(metadata i32* %verbose_output, metadata !362, metadata !70), !dbg !363
  store i32 0, i32* %verbose_output, align 4, !dbg !363
  call void @llvm.dbg.declare(metadata i32* %arg, metadata !364, metadata !70), !dbg !365
  store i32 0, i32* %arg, align 4, !dbg !365
  call void @llvm.dbg.declare(metadata i32* %_size_arr, metadata !366, metadata !70), !dbg !367
  store i32 0, i32* %_size_arr, align 4, !dbg !367
  call void @llvm.dbg.declare(metadata i32* %_size_filter, metadata !368, metadata !70), !dbg !369
  store i32 0, i32* %_size_filter, align 4, !dbg !369
  call void @llvm.dbg.declare(metadata i8*** %data_input, metadata !370, metadata !70), !dbg !371
  call void @llvm.dbg.declare(metadata i8*** %data_output, metadata !372, metadata !70), !dbg !373
  call void @llvm.dbg.declare(metadata i32* %nrows, metadata !374, metadata !70), !dbg !377
  call void @llvm.dbg.declare(metadata i32* %ncols, metadata !378, metadata !70), !dbg !379
  call void @llvm.dbg.declare(metadata i32* %nchannels, metadata !380, metadata !70), !dbg !381
  call void @llvm.dbg.declare(metadata i32* %opt, metadata !382, metadata !70), !dbg !383
  call void @llvm.dbg.declare(metadata i8** %filename_in, metadata !384, metadata !70), !dbg !385
  store i8* null, i8** %filename_in, align 8, !dbg !385
  call void @llvm.dbg.declare(metadata i8** %filename_out, metadata !386, metadata !70), !dbg !387
  store i8* null, i8** %filename_out, align 8, !dbg !387
  br label %while.cond, !dbg !388

while.cond:                                       ; preds = %sw.epilog, %entry
  %0 = load i32* %argc.addr, align 4, !dbg !389
  %1 = load i8*** %argv.addr, align 8, !dbg !392
  %call = call i32 @getopt(i32 %0, i8** %1, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0)) #6, !dbg !393
  store i32 %call, i32* %opt, align 4, !dbg !394
  %cmp = icmp ne i32 %call, -1, !dbg !395
  br i1 %cmp, label %while.body, label %while.end, !dbg !388

while.body:                                       ; preds = %while.cond
  %2 = load i32* %opt, align 4, !dbg !396
  switch i32 %2, label %sw.default [
    i32 102, label %sw.bb
    i32 118, label %sw.bb1
  ], !dbg !398

sw.bb:                                            ; preds = %while.body
  %3 = load i8** @optarg, align 8, !dbg !399
  store i8* %3, i8** %filename_in, align 8, !dbg !401
  br label %sw.epilog, !dbg !402

sw.bb1:                                           ; preds = %while.body
  store i32 1, i32* %verbose_output, align 4, !dbg !403
  br label %sw.epilog, !dbg !404

sw.default:                                       ; preds = %while.body
  %4 = load %struct._IO_FILE** @stderr, align 8, !dbg !405
  %5 = load i8*** %argv.addr, align 8, !dbg !406
  %arrayidx = getelementptr inbounds i8** %5, i64 0, !dbg !406
  %6 = load i8** %arrayidx, align 8, !dbg !406
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([24 x i8]* @.str1, i32 0, i32 0), i8* %6), !dbg !407
  call void @exit(i32 1) #10, !dbg !408
  unreachable, !dbg !408

sw.epilog:                                        ; preds = %sw.bb1, %sw.bb
  br label %while.cond, !dbg !388

while.end:                                        ; preds = %while.cond
  %7 = load i8** %filename_in, align 8, !dbg !409
  %tobool = icmp ne i8* %7, null, !dbg !411
  br i1 %tobool, label %if.else, label %if.then, !dbg !411

if.then:                                          ; preds = %while.end
  %8 = load i32* @optind, align 4, !dbg !412
  store i32 %8, i32* %index, align 4, !dbg !415
  br label %for.cond, !dbg !415

for.cond:                                         ; preds = %for.inc, %if.then
  %9 = load i32* %index, align 4, !dbg !416
  %10 = load i32* %argc.addr, align 4, !dbg !420
  %cmp3 = icmp slt i32 %9, %10, !dbg !421
  br i1 %cmp3, label %for.body, label %for.end, !dbg !422

for.body:                                         ; preds = %for.cond
  %11 = load i32* %arg, align 4, !dbg !423
  %inc = add nsw i32 %11, 1, !dbg !423
  store i32 %inc, i32* %arg, align 4, !dbg !423
  switch i32 %11, label %sw.epilog11 [
    i32 0, label %sw.bb4
    i32 1, label %sw.bb7
  ], !dbg !425

sw.bb4:                                           ; preds = %for.body
  %12 = load i32* %index, align 4, !dbg !426
  %idxprom = sext i32 %12 to i64, !dbg !428
  %13 = load i8*** %argv.addr, align 8, !dbg !428
  %arrayidx5 = getelementptr inbounds i8** %13, i64 %idxprom, !dbg !428
  %14 = load i8** %arrayidx5, align 8, !dbg !428
  %call6 = call i32 @atoi(i8* %14) #11, !dbg !429
  store i32 %call6, i32* %_size_arr, align 4, !dbg !430
  br label %sw.epilog11, !dbg !431

sw.bb7:                                           ; preds = %for.body
  %15 = load i32* %index, align 4, !dbg !432
  %idxprom8 = sext i32 %15 to i64, !dbg !433
  %16 = load i8*** %argv.addr, align 8, !dbg !433
  %arrayidx9 = getelementptr inbounds i8** %16, i64 %idxprom8, !dbg !433
  %17 = load i8** %arrayidx9, align 8, !dbg !433
  %call10 = call i32 @atoi(i8* %17) #11, !dbg !434
  store i32 %call10, i32* %_size_filter, align 4, !dbg !435
  br label %sw.epilog11, !dbg !436

sw.epilog11:                                      ; preds = %sw.bb7, %sw.bb4, %for.body
  br label %for.inc, !dbg !437

for.inc:                                          ; preds = %sw.epilog11
  %18 = load i32* %index, align 4, !dbg !438
  %inc12 = add nsw i32 %18, 1, !dbg !438
  store i32 %inc12, i32* %index, align 4, !dbg !438
  br label %for.cond, !dbg !439

for.end:                                          ; preds = %for.cond
  %19 = load i32* %_size_arr, align 4, !dbg !440
  store i32 %19, i32* %ncols, align 4, !dbg !441
  store i32 %19, i32* %nrows, align 4, !dbg !442
  store i8* getelementptr inbounds ([6 x i8]* @.str2, i32 0, i32 0), i8** %filename_in, align 8, !dbg !443
  %20 = load i32* %nrows, align 4, !dbg !444
  %conv = zext i32 %20 to i64, !dbg !444
  %21 = load i32* %ncols, align 4, !dbg !445
  %conv13 = zext i32 %21 to i64, !dbg !445
  %call14 = call i8** @create_array_2d(i64 %conv, i64 %conv13, i8 zeroext 1), !dbg !446
  store i8** %call14, i8*** %data_input, align 8, !dbg !447
  %22 = load i32* %nrows, align 4, !dbg !448
  %conv15 = zext i32 %22 to i64, !dbg !448
  %23 = load i32* %ncols, align 4, !dbg !449
  %conv16 = zext i32 %23 to i64, !dbg !449
  %call17 = call i8** @create_array_2d(i64 %conv15, i64 %conv16, i8 zeroext 0), !dbg !450
  store i8** %call17, i8*** %data_output, align 8, !dbg !451
  br label %if.end38, !dbg !452

if.else:                                          ; preds = %while.end
  %24 = load i8** %filename_in, align 8, !dbg !453
  %call18 = call i32 @jpeg_decompress(i8*** %data_input, i32* %ncols, i32* %nrows, i32* %nchannels, i8* %24), !dbg !456
  %tobool19 = icmp ne i32 %call18, 0, !dbg !457
  br i1 %tobool19, label %if.then20, label %if.end, !dbg !457

if.then20:                                        ; preds = %if.else
  %25 = load %struct._IO_FILE** @stderr, align 8, !dbg !458
  %call21 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([27 x i8]* @.str3, i32 0, i32 0)), !dbg !460
  store i32 1, i32* %retval, !dbg !461
  br label %return, !dbg !461

if.end:                                           ; preds = %if.else
  %26 = load i32* @optind, align 4, !dbg !462
  store i32 %26, i32* %index, align 4, !dbg !464
  br label %for.cond22, !dbg !464

for.cond22:                                       ; preds = %for.inc32, %if.end
  %27 = load i32* %index, align 4, !dbg !465
  %28 = load i32* %argc.addr, align 4, !dbg !469
  %cmp23 = icmp slt i32 %27, %28, !dbg !470
  br i1 %cmp23, label %for.body25, label %for.end34, !dbg !471

for.body25:                                       ; preds = %for.cond22
  %29 = load i32* %arg, align 4, !dbg !472
  %inc26 = add nsw i32 %29, 1, !dbg !472
  store i32 %inc26, i32* %arg, align 4, !dbg !472
  switch i32 %29, label %sw.epilog31 [
    i32 0, label %sw.bb27
  ], !dbg !474

sw.bb27:                                          ; preds = %for.body25
  %30 = load i32* %index, align 4, !dbg !475
  %idxprom28 = sext i32 %30 to i64, !dbg !477
  %31 = load i8*** %argv.addr, align 8, !dbg !477
  %arrayidx29 = getelementptr inbounds i8** %31, i64 %idxprom28, !dbg !477
  %32 = load i8** %arrayidx29, align 8, !dbg !477
  %call30 = call i32 @atoi(i8* %32) #11, !dbg !478
  store i32 %call30, i32* %_size_filter, align 4, !dbg !479
  br label %sw.epilog31, !dbg !480

sw.epilog31:                                      ; preds = %sw.bb27, %for.body25
  br label %for.inc32, !dbg !481

for.inc32:                                        ; preds = %sw.epilog31
  %33 = load i32* %index, align 4, !dbg !482
  %inc33 = add nsw i32 %33, 1, !dbg !482
  store i32 %inc33, i32* %index, align 4, !dbg !482
  br label %for.cond22, !dbg !483

for.end34:                                        ; preds = %for.cond22
  %34 = load i32* %nrows, align 4, !dbg !484
  %conv35 = zext i32 %34 to i64, !dbg !484
  %35 = load i32* %ncols, align 4, !dbg !485
  %conv36 = zext i32 %35 to i64, !dbg !485
  %call37 = call i8** @create_array_2d(i64 %conv35, i64 %conv36, i8 zeroext 0), !dbg !486
  store i8** %call37, i8*** %data_output, align 8, !dbg !487
  br label %if.end38

if.end38:                                         ; preds = %for.end34, %for.end
  %36 = load i8** %filename_in, align 8, !dbg !488
  %call39 = call i64 @strlen(i8* %36) #11, !dbg !489
  %add = add i64 %call39, 17, !dbg !489
  %add40 = add i64 %add, 1, !dbg !489
  %call41 = call noalias i8* @calloc(i64 1, i64 %add40) #6, !dbg !490
  store i8* %call41, i8** %filename_out, align 8, !dbg !491
  %37 = load i8** %filename_out, align 8, !dbg !492
  %38 = load i8** %filename_in, align 8, !dbg !493
  %39 = load i8** %filename_in, align 8, !dbg !494
  %call42 = call i64 @strlen(i8* %39) #11, !dbg !495
  %call43 = call i8* @strncpy(i8* %37, i8* %38, i64 %call42) #6, !dbg !496
  %40 = load i8** %filename_out, align 8, !dbg !497
  %call44 = call i8* @strcat(i8* %40, i8* getelementptr inbounds ([17 x i8]* @.str4, i32 0, i32 0)) #6, !dbg !498
  call void @llvm.dbg.declare(metadata i32* %i, metadata !499, metadata !70), !dbg !500
  store i32 0, i32* %i, align 4, !dbg !500
  call void @llvm.dbg.declare(metadata i32* %j, metadata !501, metadata !70), !dbg !502
  store i32 0, i32* %j, align 4, !dbg !502
  call void @llvm.dbg.declare(metadata [9 x float]* %kernel_3_3, metadata !503, metadata !70), !dbg !507
  %41 = bitcast [9 x float]* %kernel_3_3 to i8*, !dbg !507
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %41, i8* bitcast ([9 x float]* @main.kernel_3_3 to i8*), i64 36, i32 16, i1 false), !dbg !507
  call void @llvm.dbg.declare(metadata [25 x float]* %kernel_5_5, metadata !508, metadata !70), !dbg !512
  %42 = bitcast [25 x float]* %kernel_5_5 to i8*, !dbg !512
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %42, i8* bitcast ([25 x float]* @main.kernel_5_5 to i8*), i64 100, i32 16, i1 false), !dbg !512
  call void @llvm.dbg.declare(metadata [49 x float]* %kernel_7_7, metadata !513, metadata !70), !dbg !517
  %43 = bitcast [49 x float]* %kernel_7_7 to i8*, !dbg !517
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %43, i8* bitcast ([49 x float]* @main.kernel_7_7 to i8*), i64 196, i32 16, i1 false), !dbg !517
  %44 = load i32* %_size_filter, align 4, !dbg !518
  %cmp45 = icmp eq i32 %44, 3, !dbg !518
  br i1 %cmp45, label %if.then47, label %if.else49, !dbg !520

if.then47:                                        ; preds = %if.end38
  %45 = load i8*** %data_input, align 8, !dbg !521
  %46 = load i8*** %data_output, align 8, !dbg !522
  %arrayidx48 = getelementptr inbounds [9 x float]* %kernel_3_3, i32 0, i64 0, !dbg !523
  %47 = load i32* %ncols, align 4, !dbg !524
  %48 = load i32* %nrows, align 4, !dbg !525
  call void @convolve_loop_nest(i8** %45, i8** %46, float* %arrayidx48, i32 3, i32 %47, i32 %48), !dbg !526
  br label %if.end65, !dbg !526

if.else49:                                        ; preds = %if.end38
  %49 = load i32* %_size_filter, align 4, !dbg !527
  %cmp50 = icmp eq i32 %49, 5, !dbg !527
  br i1 %cmp50, label %if.then52, label %if.else54, !dbg !529

if.then52:                                        ; preds = %if.else49
  %50 = load i8*** %data_input, align 8, !dbg !530
  %51 = load i8*** %data_output, align 8, !dbg !531
  %arrayidx53 = getelementptr inbounds [25 x float]* %kernel_5_5, i32 0, i64 0, !dbg !532
  %52 = load i32* %ncols, align 4, !dbg !533
  %53 = load i32* %nrows, align 4, !dbg !534
  call void @convolve_loop_nest(i8** %50, i8** %51, float* %arrayidx53, i32 5, i32 %52, i32 %53), !dbg !535
  br label %if.end64, !dbg !535

if.else54:                                        ; preds = %if.else49
  %54 = load i32* %_size_filter, align 4, !dbg !536
  %cmp55 = icmp eq i32 %54, 7, !dbg !536
  br i1 %cmp55, label %if.then57, label %if.else59, !dbg !538

if.then57:                                        ; preds = %if.else54
  %55 = load i8*** %data_input, align 8, !dbg !539
  %56 = load i8*** %data_output, align 8, !dbg !540
  %arrayidx58 = getelementptr inbounds [49 x float]* %kernel_7_7, i32 0, i64 0, !dbg !541
  %57 = load i32* %ncols, align 4, !dbg !542
  %58 = load i32* %nrows, align 4, !dbg !543
  call void @convolve_loop_nest(i8** %55, i8** %56, float* %arrayidx58, i32 7, i32 %57, i32 %58), !dbg !544
  br label %if.end63, !dbg !544

if.else59:                                        ; preds = %if.else54
  %call60 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0)), !dbg !545
  %59 = load i32* %nrows, align 4, !dbg !547
  %conv61 = zext i32 %59 to i64, !dbg !547
  %60 = load i8*** %data_input, align 8, !dbg !548
  call void @free_array_2d(i64 %conv61, i8** %60), !dbg !549
  %61 = load i32* %nrows, align 4, !dbg !550
  %conv62 = zext i32 %61 to i64, !dbg !550
  %62 = load i8*** %data_output, align 8, !dbg !551
  call void @free_array_2d(i64 %conv62, i8** %62), !dbg !552
  store i32 1, i32* %retval, !dbg !553
  br label %return, !dbg !553

if.end63:                                         ; preds = %if.then57
  br label %if.end64

if.end64:                                         ; preds = %if.end63, %if.then52
  br label %if.end65

if.end65:                                         ; preds = %if.end64, %if.then47
  %63 = load i32* %verbose_output, align 4, !dbg !554
  %tobool66 = icmp ne i32 %63, 0, !dbg !556
  br i1 %tobool66, label %if.then67, label %if.end89, !dbg !556

if.then67:                                        ; preds = %if.end65
  store i32 0, i32* %j, align 4, !dbg !557
  br label %for.cond68, !dbg !557

for.cond68:                                       ; preds = %for.inc86, %if.then67
  %64 = load i32* %j, align 4, !dbg !560
  %65 = load i32* %_size_arr, align 4, !dbg !564
  %cmp69 = icmp slt i32 %64, %65, !dbg !565
  br i1 %cmp69, label %for.body71, label %for.end88, !dbg !566

for.body71:                                       ; preds = %for.cond68
  store i32 0, i32* %i, align 4, !dbg !567
  br label %for.cond72, !dbg !567

for.cond72:                                       ; preds = %for.inc82, %for.body71
  %66 = load i32* %i, align 4, !dbg !570
  %67 = load i32* %_size_arr, align 4, !dbg !574
  %cmp73 = icmp slt i32 %66, %67, !dbg !575
  br i1 %cmp73, label %for.body75, label %for.end84, !dbg !576

for.body75:                                       ; preds = %for.cond72
  %68 = load i32* %j, align 4, !dbg !577
  %idxprom76 = sext i32 %68 to i64, !dbg !579
  %69 = load i32* %i, align 4, !dbg !580
  %idxprom77 = sext i32 %69 to i64, !dbg !579
  %70 = load i8*** %data_output, align 8, !dbg !579
  %arrayidx78 = getelementptr inbounds i8** %70, i64 %idxprom77, !dbg !579
  %71 = load i8** %arrayidx78, align 8, !dbg !579
  %arrayidx79 = getelementptr inbounds i8* %71, i64 %idxprom76, !dbg !579
  %72 = load i8* %arrayidx79, align 1, !dbg !579
  %conv80 = zext i8 %72 to i32, !dbg !579
  %call81 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str6, i32 0, i32 0), i32 %conv80), !dbg !581
  br label %for.inc82, !dbg !582

for.inc82:                                        ; preds = %for.body75
  %73 = load i32* %i, align 4, !dbg !583
  %inc83 = add nsw i32 %73, 1, !dbg !583
  store i32 %inc83, i32* %i, align 4, !dbg !583
  br label %for.cond72, !dbg !584

for.end84:                                        ; preds = %for.cond72
  %call85 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str7, i32 0, i32 0)), !dbg !585
  br label %for.inc86, !dbg !586

for.inc86:                                        ; preds = %for.end84
  %74 = load i32* %j, align 4, !dbg !587
  %inc87 = add nsw i32 %74, 1, !dbg !587
  store i32 %inc87, i32* %j, align 4, !dbg !587
  br label %for.cond68, !dbg !588

for.end88:                                        ; preds = %for.cond68
  br label %if.end89, !dbg !589

if.end89:                                         ; preds = %for.end88, %if.end65
  %75 = load i8*** %data_output, align 8, !dbg !590
  %76 = load i32* %ncols, align 4, !dbg !591
  %77 = load i32* %nrows, align 4, !dbg !592
  %78 = load i8** %filename_out, align 8, !dbg !593
  %call90 = call i32 @jpeg_compress(i8** %75, i32 %76, i32 %77, i32 1, i8* %78), !dbg !594
  %79 = load i32* %nrows, align 4, !dbg !595
  %conv91 = zext i32 %79 to i64, !dbg !595
  %80 = load i8*** %data_input, align 8, !dbg !596
  call void @free_array_2d(i64 %conv91, i8** %80), !dbg !597
  %81 = load i32* %nrows, align 4, !dbg !598
  %conv92 = zext i32 %81 to i64, !dbg !598
  %82 = load i8*** %data_output, align 8, !dbg !599
  call void @free_array_2d(i64 %conv92, i8** %82), !dbg !600
  store i32 0, i32* %retval, !dbg !601
  br label %return, !dbg !601

return:                                           ; preds = %if.end89, %if.else59, %if.then20
  %83 = load i32* %retval, !dbg !602
  ret i32 %83, !dbg !602
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32 @getopt(i32, i8**, i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #5

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #5

; Function Attrs: nounwind
declare i8* @strncpy(i8*, i8*, i64) #2

; Function Attrs: nounwind
declare i8* @strcat(i8*, i8*) #2

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #6

declare i32 @printf(i8*, ...) #3

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
  call void @llvm.dbg.declare(metadata i32* %filter_size.addr, metadata !603, metadata !70), !dbg !604
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !605, metadata !70), !dbg !606
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !607, metadata !70), !dbg !608
  call void @llvm.dbg.declare(metadata i8* %allow_hw, metadata !609, metadata !70), !dbg !610
  store i8 0, i8* %allow_hw, align 1, !dbg !610
  call void @llvm.dbg.declare(metadata i8** %pAllowHWAccelerationEnv, metadata !611, metadata !70), !dbg !612
  %0 = load i8** @env_allow_hw, align 8, !dbg !613
  %call = call i8* @getenv(i8* %0) #6, !dbg !614
  store i8* %call, i8** %pAllowHWAccelerationEnv, align 8, !dbg !612
  %1 = load i8** %pAllowHWAccelerationEnv, align 8, !dbg !615
  %tobool = icmp ne i8* %1, null, !dbg !617
  br i1 %tobool, label %if.then, label %if.end, !dbg !617

if.then:                                          ; preds = %entry
  %2 = load i8** %pAllowHWAccelerationEnv, align 8, !dbg !618
  %call1 = call i64 @strtol(i8* %2, i8** null, i32 10) #6, !dbg !620
  %conv = trunc i64 %call1 to i8, !dbg !620
  store i8 %conv, i8* %allow_hw, align 1, !dbg !621
  br label %if.end, !dbg !622

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8* %allow_hw, align 1, !dbg !623
  %tobool2 = icmp ne i8 %3, 0, !dbg !625
  br i1 %tobool2, label %if.then3, label %if.end14, !dbg !625

if.then3:                                         ; preds = %if.end
  %4 = load i32* %filter_size.addr, align 4, !dbg !626
  %5 = load i32* %nx.addr, align 4, !dbg !628
  %6 = load i32* %ny.addr, align 4, !dbg !629
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str47, i32 0, i32 0), i32 %4, i32 %5, i32 %6), !dbg !630
  %7 = load i32* %nx.addr, align 4, !dbg !631
  %cmp = icmp sge i32 %7, 10, !dbg !631
  br i1 %cmp, label %land.lhs.true, label %if.end13, !dbg !633

land.lhs.true:                                    ; preds = %if.then3
  %8 = load i32* %ny.addr, align 4, !dbg !634
  %cmp6 = icmp sge i32 %8, 10, !dbg !634
  br i1 %cmp6, label %if.then8, label %if.end13, !dbg !633

if.then8:                                         ; preds = %land.lhs.true
  %9 = load i32* %filter_size.addr, align 4, !dbg !636
  %cmp9 = icmp sgt i32 %9, 2, !dbg !636
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !638

if.then11:                                        ; preds = %if.then8
  store i1 true, i1* %retval, !dbg !639
  br label %return, !dbg !639

if.end12:                                         ; preds = %if.then8
  br label %if.end13, !dbg !640

if.end13:                                         ; preds = %if.end12, %land.lhs.true, %if.then3
  br label %if.end14, !dbg !642

if.end14:                                         ; preds = %if.end13, %if.end
  store i1 false, i1* %retval, !dbg !643
  br label %return, !dbg !643

return:                                           ; preds = %if.end14, %if.then11
  %10 = load i1* %retval, !dbg !644
  ret i1 %10, !dbg !644
}

; Function Attrs: nounwind
declare i8* @getenv(i8*) #2

; Function Attrs: nounwind
declare i64 @strtol(i8*, i8**, i32) #2

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
  call void @llvm.dbg.declare(metadata i8** %src.addr, metadata !645, metadata !70), !dbg !646
  store i8* %dst, i8** %dst.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dst.addr, metadata !647, metadata !70), !dbg !648
  store float* %kernel, float** %kernel.addr, align 8
  call void @llvm.dbg.declare(metadata float** %kernel.addr, metadata !649, metadata !70), !dbg !650
  store i32 %filter_size, i32* %filter_size.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %filter_size.addr, metadata !651, metadata !70), !dbg !652
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !653, metadata !70), !dbg !654
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !655, metadata !70), !dbg !656
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str58, i32 0, i32 0)), !dbg !657
  %0 = load i8** %src.addr, align 8, !dbg !658
  %1 = load i8** %dst.addr, align 8, !dbg !659
  %2 = load float** %kernel.addr, align 8, !dbg !660
  %3 = load i32* %filter_size.addr, align 4, !dbg !661
  %4 = load i32* %nx.addr, align 4, !dbg !662
  %5 = load i32* %ny.addr, align 4, !dbg !663
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([88 x i8]* @.str69, i32 0, i32 0), i8* %0, i8* %1, float* %2, i32 %3, i32 %4, i32 %5), !dbg !664
  ret void, !dbg !665
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
  call void @llvm.dbg.declare(metadata i8*** %src.addr, metadata !666, metadata !70), !dbg !667
  store i8** %dst, i8*** %dst.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dst.addr, metadata !668, metadata !70), !dbg !669
  store float* %kernel, float** %kernel.addr, align 8
  call void @llvm.dbg.declare(metadata float** %kernel.addr, metadata !670, metadata !70), !dbg !671
  store i32 %filter_size, i32* %filter_size.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %filter_size.addr, metadata !672, metadata !70), !dbg !673
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !674, metadata !70), !dbg !675
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !676, metadata !70), !dbg !677
  call void @llvm.dbg.declare(metadata i8** %error, metadata !678, metadata !70), !dbg !679
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str710, i32 0, i32 0)), !dbg !680
  %0 = load i8*** %src.addr, align 8, !dbg !681
  %1 = load i8*** %dst.addr, align 8, !dbg !682
  %2 = load float** %kernel.addr, align 8, !dbg !683
  %3 = load i32* %filter_size.addr, align 4, !dbg !684
  %4 = load i32* %nx.addr, align 4, !dbg !685
  %5 = load i32* %ny.addr, align 4, !dbg !686
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([88 x i8]* @.str69, i32 0, i32 0), i8** %0, i8** %1, float* %2, i32 %3, i32 %4, i32 %5), !dbg !687
  call void @llvm.dbg.declare(metadata i8** %libfile, metadata !688, metadata !70), !dbg !689
  %6 = load i32* %filter_size.addr, align 4, !dbg !690
  %cmp = icmp eq i32 %6, 3, !dbg !690
  br i1 %cmp, label %if.then, label %if.else, !dbg !692

if.then:                                          ; preds = %entry
  %7 = load i8** @libfilename_3_3, align 8, !dbg !693
  store i8* %7, i8** %libfile, align 8, !dbg !695
  br label %if.end10, !dbg !696

if.else:                                          ; preds = %entry
  %8 = load i32* %filter_size.addr, align 4, !dbg !697
  %cmp2 = icmp eq i32 %8, 5, !dbg !697
  br i1 %cmp2, label %if.then3, label %if.else4, !dbg !699

if.then3:                                         ; preds = %if.else
  %9 = load i8** @libfilename_5_5, align 8, !dbg !700
  store i8* %9, i8** %libfile, align 8, !dbg !702
  br label %if.end9, !dbg !703

if.else4:                                         ; preds = %if.else
  %10 = load i32* %filter_size.addr, align 4, !dbg !704
  %cmp5 = icmp eq i32 %10, 7, !dbg !704
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !706

if.then6:                                         ; preds = %if.else4
  %11 = load i8** @libfilename_7_7, align 8, !dbg !707
  store i8* %11, i8** %libfile, align 8, !dbg !709
  br label %if.end, !dbg !710

if.else7:                                         ; preds = %if.else4
  %12 = load i32* %filter_size.addr, align 4, !dbg !711
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str8, i32 0, i32 0), i32 %12), !dbg !713
  br label %return, !dbg !714

if.end:                                           ; preds = %if.then6
  br label %if.end9

if.end9:                                          ; preds = %if.end, %if.then3
  br label %if.end10

if.end10:                                         ; preds = %if.end9, %if.then
  call void @llvm.dbg.declare(metadata i8** %in, metadata !715, metadata !70), !dbg !716
  %13 = load i32* %nx.addr, align 4, !dbg !717
  %conv = sext i32 %13 to i64, !dbg !717
  %mul = mul i64 1, %conv, !dbg !718
  %14 = load i32* %ny.addr, align 4, !dbg !719
  %conv11 = sext i32 %14 to i64, !dbg !719
  %mul12 = mul i64 %mul, %conv11, !dbg !718
  %call13 = call noalias i8* @malloc(i64 %mul12) #6, !dbg !720
  store i8* %call13, i8** %in, align 8, !dbg !716
  call void @llvm.dbg.declare(metadata i8** %out, metadata !721, metadata !70), !dbg !722
  %15 = load i32* %nx.addr, align 4, !dbg !723
  %conv14 = sext i32 %15 to i64, !dbg !723
  %mul15 = mul i64 1, %conv14, !dbg !724
  %16 = load i32* %ny.addr, align 4, !dbg !725
  %conv16 = sext i32 %16 to i64, !dbg !725
  %mul17 = mul i64 %mul15, %conv16, !dbg !724
  %call18 = call noalias i8* @malloc(i64 %mul17) #6, !dbg !726
  store i8* %call18, i8** %out, align 8, !dbg !722
  call void @llvm.dbg.declare(metadata i32* %i, metadata !727, metadata !70), !dbg !728
  store i32 0, i32* %i, align 4, !dbg !728
  call void @llvm.dbg.declare(metadata i32* %j, metadata !729, metadata !70), !dbg !730
  store i32 0, i32* %j, align 4, !dbg !730
  store i32 0, i32* %i, align 4, !dbg !731
  br label %for.cond, !dbg !731

for.cond:                                         ; preds = %for.inc, %if.end10
  %17 = load i32* %i, align 4, !dbg !733
  %18 = load i32* %ny.addr, align 4, !dbg !737
  %cmp19 = icmp slt i32 %17, %18, !dbg !738
  br i1 %cmp19, label %for.body, label %for.end, !dbg !739

for.body:                                         ; preds = %for.cond
  %19 = load i32* %i, align 4, !dbg !740
  %20 = load i32* %nx.addr, align 4, !dbg !741
  %mul21 = mul nsw i32 %19, %20, !dbg !740
  %idxprom = sext i32 %mul21 to i64, !dbg !742
  %21 = load i8** %in, align 8, !dbg !743
  %arrayidx = getelementptr inbounds i8* %21, i64 %idxprom, !dbg !742
  %22 = load i32* %i, align 4, !dbg !744
  %idxprom22 = sext i32 %22 to i64, !dbg !745
  %23 = load i8*** %src.addr, align 8, !dbg !745
  %arrayidx23 = getelementptr inbounds i8** %23, i64 %idxprom22, !dbg !745
  %24 = load i8** %arrayidx23, align 8, !dbg !745
  %25 = load i32* %nx.addr, align 4, !dbg !746
  %conv24 = sext i32 %25 to i64, !dbg !746
  %mul25 = mul i64 1, %conv24, !dbg !747
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %arrayidx, i8* %24, i64 %mul25, i32 1, i1 false), !dbg !742
  br label %for.inc, !dbg !742

for.inc:                                          ; preds = %for.body
  %26 = load i32* %i, align 4, !dbg !748
  %inc = add nsw i32 %26, 1, !dbg !748
  store i32 %inc, i32* %i, align 4, !dbg !748
  br label %for.cond, !dbg !749

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata void (i64, i32, i32, float*, i8*, i8*)** %ifaceptr, metadata !750, metadata !70), !dbg !756
  call void @llvm.dbg.declare(metadata %struct.max_file* (...)** %max_init, metadata !757, metadata !70), !dbg !774
  call void @llvm.dbg.declare(metadata i8** %dlhandle, metadata !775, metadata !70), !dbg !776
  %27 = load i8** %libfile, align 8, !dbg !777
  %call26 = call i8* @dlopen(i8* %27, i32 257) #6, !dbg !778
  store i8* %call26, i8** %dlhandle, align 8, !dbg !776
  %28 = load i8** %dlhandle, align 8, !dbg !779
  %tobool = icmp ne i8* %28, null, !dbg !781
  br i1 %tobool, label %if.end30, label %if.then27, !dbg !781

if.then27:                                        ; preds = %for.end
  %call28 = call i8* @dlerror() #6, !dbg !782
  store i8* %call28, i8** %error, align 8, !dbg !784
  %29 = load i8** %error, align 8, !dbg !785
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str9, i32 0, i32 0), i8* %29), !dbg !786
  br label %return, !dbg !787

if.end30:                                         ; preds = %for.end
  %30 = load i8** %dlhandle, align 8, !dbg !788
  %call31 = call i8* @dlsym(i8* %30, i8* getelementptr inbounds ([10 x i8]* @.str10, i32 0, i32 0)) #6, !dbg !789
  %31 = bitcast i8* %call31 to void (i64, i32, i32, float*, i8*, i8*)*, !dbg !789
  store void (i64, i32, i32, float*, i8*, i8*)* %31, void (i64, i32, i32, float*, i8*, i8*)** %ifaceptr, align 8, !dbg !790
  %call32 = call i8* @dlerror() #6, !dbg !791
  store i8* %call32, i8** %error, align 8, !dbg !793
  %cmp33 = icmp ne i8* %call32, null, !dbg !794
  br i1 %cmp33, label %if.then35, label %if.end37, !dbg !795

if.then35:                                        ; preds = %if.end30
  %32 = load i8** %error, align 8, !dbg !796
  %call36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i8* %32), !dbg !798
  br label %return, !dbg !799

if.end37:                                         ; preds = %if.end30
  %33 = load i8** %dlhandle, align 8, !dbg !800
  %call38 = call i8* @dlsym(i8* %33, i8* getelementptr inbounds ([15 x i8]* @.str12, i32 0, i32 0)) #6, !dbg !801
  %34 = bitcast i8* %call38 to %struct.max_file* (...)*, !dbg !801
  store %struct.max_file* (...)* %34, %struct.max_file* (...)** %max_init, align 8, !dbg !802
  %call39 = call i8* @dlerror() #6, !dbg !803
  store i8* %call39, i8** %error, align 8, !dbg !805
  %cmp40 = icmp ne i8* %call39, null, !dbg !806
  br i1 %cmp40, label %if.then42, label %if.end44, !dbg !807

if.then42:                                        ; preds = %if.end37
  %35 = load i8** %error, align 8, !dbg !808
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i8* %35), !dbg !810
  br label %return, !dbg !811

if.end44:                                         ; preds = %if.end37
  %call45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str13, i32 0, i32 0)), !dbg !812
  %36 = load void (i64, i32, i32, float*, i8*, i8*)** %ifaceptr, align 8, !dbg !813
  %37 = load i32* %nx.addr, align 4, !dbg !814
  %38 = load i32* %ny.addr, align 4, !dbg !815
  %mul46 = mul nsw i32 %37, %38, !dbg !814
  %conv47 = sext i32 %mul46 to i64, !dbg !814
  %39 = load i32* %nx.addr, align 4, !dbg !816
  %40 = load i32* %ny.addr, align 4, !dbg !817
  %41 = load float** %kernel.addr, align 8, !dbg !818
  %42 = load i8** %in, align 8, !dbg !819
  %43 = load i8** %out, align 8, !dbg !820
  call void %36(i64 %conv47, i32 %39, i32 %40, float* %41, i8* %42, i8* %43), !dbg !813
  %call48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str14, i32 0, i32 0)), !dbg !821
  %44 = load i8** %dlhandle, align 8, !dbg !822
  %call49 = call i32 @dlclose(i8* %44) #6, !dbg !823
  store i32 0, i32* %i, align 4, !dbg !824
  br label %for.cond50, !dbg !824

for.cond50:                                       ; preds = %for.inc61, %if.end44
  %45 = load i32* %i, align 4, !dbg !826
  %46 = load i32* %ny.addr, align 4, !dbg !830
  %cmp51 = icmp slt i32 %45, %46, !dbg !831
  br i1 %cmp51, label %for.body53, label %for.end63, !dbg !832

for.body53:                                       ; preds = %for.cond50
  %47 = load i32* %i, align 4, !dbg !833
  %idxprom54 = sext i32 %47 to i64, !dbg !834
  %48 = load i8*** %dst.addr, align 8, !dbg !834
  %arrayidx55 = getelementptr inbounds i8** %48, i64 %idxprom54, !dbg !834
  %49 = load i8** %arrayidx55, align 8, !dbg !834
  %50 = load i32* %i, align 4, !dbg !835
  %51 = load i32* %nx.addr, align 4, !dbg !836
  %mul56 = mul nsw i32 %50, %51, !dbg !835
  %idxprom57 = sext i32 %mul56 to i64, !dbg !837
  %52 = load i8** %out, align 8, !dbg !838
  %arrayidx58 = getelementptr inbounds i8* %52, i64 %idxprom57, !dbg !837
  %53 = load i32* %nx.addr, align 4, !dbg !839
  %conv59 = sext i32 %53 to i64, !dbg !839
  %mul60 = mul i64 1, %conv59, !dbg !840
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %49, i8* %arrayidx58, i64 %mul60, i32 1, i1 false), !dbg !837
  br label %for.inc61, !dbg !837

for.inc61:                                        ; preds = %for.body53
  %54 = load i32* %i, align 4, !dbg !841
  %inc62 = add nsw i32 %54, 1, !dbg !841
  store i32 %inc62, i32* %i, align 4, !dbg !841
  br label %for.cond50, !dbg !842

for.end63:                                        ; preds = %for.cond50
  %55 = load i8** %in, align 8, !dbg !843
  call void @free(i8* %55) #6, !dbg !844
  %56 = load i8** %out, align 8, !dbg !845
  call void @free(i8* %56) #6, !dbg !846
  br label %return, !dbg !847

return:                                           ; preds = %for.end63, %if.then42, %if.then35, %if.then27, %if.else7
  ret void, !dbg !848
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare i8* @dlopen(i8*, i32) #2

; Function Attrs: nounwind
declare i8* @dlerror() #2

; Function Attrs: nounwind
declare i8* @dlsym(i8*, i8*) #2

; Function Attrs: nounwind
declare i32 @dlclose(i8*) #2

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define void @free_array_2d(i64 %nrows, i8** nocapture %arr) #7 {
entry:
  %cmp5 = icmp eq i64 %nrows, 0
  br i1 %cmp5, label %for.end, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %entry
  %0 = add i64 %nrows, -1
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds i8** %arr, i64 %indvars.iv
  %1 = load i8** %arrayidx, align 8, !tbaa !850
  tail call void @free(i8* %1) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv, %0
  br i1 %exitcond, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %2 = bitcast i8** %arr to i8*
  tail call void @free(i8* %2) #6
  ret void
}

; Function Attrs: nounwind uwtable
define noalias i8** @create_array_2d(i64 %nrows, i64 %ncols, i8 zeroext %init) #7 {
entry:
  %mul = shl i64 %nrows, 3
  %call = tail call noalias i8* @malloc(i64 %mul) #6
  %0 = bitcast i8* %call to i8**
  %cmp28 = icmp eq i64 %nrows, 0
  br i1 %cmp28, label %for.end15, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %entry
  %cmp625 = icmp eq i64 %ncols, 0
  %1 = add i64 %nrows, -1
  br label %for.body

for.body:                                         ; preds = %for.inc13, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.inc13 ]
  %call3 = tail call noalias i8* @malloc(i64 %ncols) #6
  %arrayidx = getelementptr inbounds i8** %0, i64 %indvars.iv
  store i8* %call3, i8** %arrayidx, align 8, !tbaa !850
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
define i32 @jpeg_decompress(i8*** nocapture %data, i32* nocapture %nx, i32* nocapture %ny, i32* nocapture %nc, i8* %filename) #7 {
entry:
  %err = alloca %struct.jpeg_error_mgr, align 8
  %cinfo = alloca %struct.jpeg_decompress_struct, align 8
  %0 = bitcast %struct.jpeg_error_mgr* %err to i8*
  call void @llvm.lifetime.start(i64 168, i8* %0) #6
  %1 = bitcast %struct.jpeg_decompress_struct* %cinfo to i8*
  call void @llvm.lifetime.start(i64 656, i8* %1) #6
  %call = call %struct.jpeg_error_mgr* @jpeg_std_error(%struct.jpeg_error_mgr* %err) #6
  %err1 = getelementptr inbounds %struct.jpeg_decompress_struct* %cinfo, i64 0, i32 0
  store %struct.jpeg_error_mgr* %call, %struct.jpeg_error_mgr** %err1, align 8, !tbaa !854
  call void @jpeg_CreateDecompress(%struct.jpeg_decompress_struct* %cinfo, i32 80, i64 656) #6
  %call2 = call %struct._IO_FILE* @fopen(i8* %filename, i8* getelementptr inbounds ([3 x i8]* @.str27, i64 0, i64 0)) #6
  %cmp = icmp eq %struct._IO_FILE* %call2, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct._IO_FILE** @stderr, align 8, !tbaa !850
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8]* @.str128, i64 0, i64 0), i8* %filename) #12
  br label %cleanup

if.end:                                           ; preds = %entry
  call void @jpeg_stdio_src(%struct.jpeg_decompress_struct* %cinfo, %struct._IO_FILE* %call2) #6
  %call4 = call i32 @jpeg_read_header(%struct.jpeg_decompress_struct* %cinfo, i32 1) #6
  %call5 = call i32 @jpeg_start_decompress(%struct.jpeg_decompress_struct* %cinfo) #6
  %output_width = getelementptr inbounds %struct.jpeg_decompress_struct* %cinfo, i64 0, i32 27
  %3 = bitcast i32* %output_width to i64*
  %4 = load i64* %3, align 8
  %5 = trunc i64 %4 to i32
  store i32 %5, i32* %nx, align 4, !tbaa !859
  %output_height = getelementptr inbounds %struct.jpeg_decompress_struct* %cinfo, i64 0, i32 28
  %6 = lshr i64 %4, 32
  %7 = trunc i64 %6 to i32
  store i32 %7, i32* %ny, align 4, !tbaa !859
  %actual_number_of_colors = getelementptr inbounds %struct.jpeg_decompress_struct* %cinfo, i64 0, i32 32
  %8 = load i32* %actual_number_of_colors, align 4, !tbaa !860
  store i32 %8, i32* %nc, align 4, !tbaa !859
  %cmp6 = icmp ugt i32 %8, 1
  br i1 %cmp6, label %if.then7, label %if.end10

if.then7:                                         ; preds = %if.end
  %9 = load %struct._IO_FILE** @stderr, align 8, !tbaa !850
  %call8 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([47 x i8]* @.str229, i64 0, i64 0), i32 %8) #12
  %call9 = call i32 @jpeg_finish_decompress(%struct.jpeg_decompress_struct* %cinfo) #6
  call void @jpeg_destroy_decompress(%struct.jpeg_decompress_struct* %cinfo) #6
  br label %cleanup

if.end10:                                         ; preds = %if.end
  %10 = load i32* %nx, align 4, !tbaa !859
  %cmp11 = icmp eq i32 %10, 0
  %11 = load i32* %ny, align 4, !tbaa !859
  %12 = or i32 %10, %11
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %if.then13, label %if.end15

if.then13:                                        ; preds = %if.end10
  %14 = load %struct._IO_FILE** @stderr, align 8, !tbaa !850
  %15 = call i64 @fwrite(i8* getelementptr inbounds ([13 x i8]* @.str330, i64 0, i64 0), i64 12, i64 1, %struct._IO_FILE* %14) #13
  br label %cleanup

if.end15:                                         ; preds = %if.end10
  %conv = zext i32 %11 to i64
  %conv16 = zext i32 %10 to i64
  %mul.i = shl nuw nsw i64 %conv, 3
  %call.i = call noalias i8* @malloc(i64 %mul.i) #6
  %16 = bitcast i8* %call.i to i8**
  %cmp28.i = icmp eq i32 %11, 0
  br i1 %cmp28.i, label %while.cond.preheader, label %for.body.lr.ph.i

for.body.lr.ph.i:                                 ; preds = %if.end15
  %17 = add nsw i64 %conv, -1
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc13.i, %for.body.lr.ph.i
  %indvars.iv.i = phi i64 [ 0, %for.body.lr.ph.i ], [ %indvars.iv.next.i, %for.inc13.i ]
  %call3.i = call noalias i8* @malloc(i64 %conv16) #6
  %arrayidx.i = getelementptr inbounds i8** %16, i64 %indvars.iv.i
  store i8* %call3.i, i8** %arrayidx.i, align 8, !tbaa !850
  br i1 %cmp11, label %for.inc13.i, label %for.body8.lr.ph.i

for.body8.lr.ph.i:                                ; preds = %for.body.i
  call void @llvm.memset.p0i8.i64(i8* %call3.i, i8 0, i64 %conv16, i32 1, i1 false) #6
  br label %for.inc13.i

for.inc13.i:                                      ; preds = %for.body8.lr.ph.i, %for.body.i
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.i, %17
  br i1 %exitcond.i, label %while.cond.preheader.loopexit, label %for.body.i

while.cond.preheader.loopexit:                    ; preds = %for.inc13.i
  br label %while.cond.preheader

while.cond.preheader:                             ; preds = %while.cond.preheader.loopexit, %if.end15
  %output_scanline = getelementptr inbounds %struct.jpeg_decompress_struct* %cinfo, i64 0, i32 34
  %18 = load i32* %output_scanline, align 8, !tbaa !861
  %cmp1935 = icmp ult i32 %18, %7
  br i1 %cmp1935, label %while.body.preheader, label %while.end

while.body.preheader:                             ; preds = %while.cond.preheader
  br label %while.body

while.body:                                       ; preds = %while.body, %while.body.preheader
  %19 = phi i32 [ %20, %while.body ], [ %18, %while.body.preheader ]
  %idxprom = zext i32 %19 to i64
  %arrayidx = getelementptr inbounds i8** %16, i64 %idxprom
  %call22 = call i32 @jpeg_read_scanlines(%struct.jpeg_decompress_struct* %cinfo, i8** %arrayidx, i32 1) #6
  %20 = load i32* %output_scanline, align 8, !tbaa !861
  %21 = load i32* %output_height, align 4, !tbaa !862
  %cmp19 = icmp ult i32 %20, %21
  br i1 %cmp19, label %while.body, label %while.end.loopexit

while.end.loopexit:                               ; preds = %while.body
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %while.cond.preheader
  %22 = bitcast i8*** %data to i8**
  store i8* %call.i, i8** %22, align 8, !tbaa !850
  %call23 = call i32 @jpeg_finish_decompress(%struct.jpeg_decompress_struct* %cinfo) #6
  call void @jpeg_destroy_decompress(%struct.jpeg_decompress_struct* %cinfo) #6
  %call24 = call i32 @fclose(%struct._IO_FILE* %call2) #6
  br label %cleanup

cleanup:                                          ; preds = %while.end, %if.then13, %if.then7, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 1, %if.then7 ], [ 1, %if.then13 ], [ 0, %while.end ]
  call void @llvm.lifetime.end(i64 656, i8* %1) #6
  call void @llvm.lifetime.end(i64 168, i8* %0) #6
  ret i32 %retval.0
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #6

declare %struct.jpeg_error_mgr* @jpeg_std_error(%struct.jpeg_error_mgr*) #8

declare void @jpeg_CreateDecompress(%struct.jpeg_decompress_struct*, i32, i64) #8

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) #9

declare void @jpeg_stdio_src(%struct.jpeg_decompress_struct*, %struct._IO_FILE*) #8

declare i32 @jpeg_read_header(%struct.jpeg_decompress_struct*, i32) #8

declare i32 @jpeg_start_decompress(%struct.jpeg_decompress_struct*) #8

declare i32 @jpeg_finish_decompress(%struct.jpeg_decompress_struct*) #8

declare void @jpeg_destroy_decompress(%struct.jpeg_decompress_struct*) #8

declare i32 @jpeg_read_scanlines(%struct.jpeg_decompress_struct*, i8**, i32) #8

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) #9

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #6

; Function Attrs: nounwind uwtable
define i32 @jpeg_compress(i8** nocapture readonly %data, i32 %nx, i32 %ny, i32 %nc, i8* %filename) #7 {
entry:
  %cinfo = alloca %struct.jpeg_compress_struct, align 8
  %jerr = alloca %struct.jpeg_error_mgr, align 8
  %row_pointer = alloca i8*, align 8
  %call = tail call %struct._IO_FILE* @fopen(i8* %filename, i8* getelementptr inbounds ([3 x i8]* @.str431, i64 0, i64 0)) #6
  %tobool = icmp eq %struct._IO_FILE* %call, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE** @stderr, align 8, !tbaa !850
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([15 x i8]* @.str532, i64 0, i64 0), i8* %filename) #12
  br label %return

if.end:                                           ; preds = %entry
  %1 = bitcast %struct.jpeg_compress_struct* %cinfo to i8*
  call void @llvm.lifetime.start(i64 584, i8* %1) #6
  %2 = bitcast %struct.jpeg_error_mgr* %jerr to i8*
  call void @llvm.lifetime.start(i64 168, i8* %2) #6
  %call2 = call %struct.jpeg_error_mgr* @jpeg_std_error(%struct.jpeg_error_mgr* %jerr) #6
  %err = getelementptr inbounds %struct.jpeg_compress_struct* %cinfo, i64 0, i32 0
  store %struct.jpeg_error_mgr* %call2, %struct.jpeg_error_mgr** %err, align 8, !tbaa !863
  call void @jpeg_CreateCompress(%struct.jpeg_compress_struct* %cinfo, i32 80, i64 584) #6
  call void @jpeg_stdio_dest(%struct.jpeg_compress_struct* %cinfo, %struct._IO_FILE* %call) #6
  %image_width = getelementptr inbounds %struct.jpeg_compress_struct* %cinfo, i64 0, i32 7
  store i32 %nx, i32* %image_width, align 8, !tbaa !865
  %image_height = getelementptr inbounds %struct.jpeg_compress_struct* %cinfo, i64 0, i32 8
  store i32 %ny, i32* %image_height, align 4, !tbaa !866
  %input_components = getelementptr inbounds %struct.jpeg_compress_struct* %cinfo, i64 0, i32 9
  store i32 %nc, i32* %input_components, align 8, !tbaa !867
  switch i32 %nc, label %if.else7 [
    i32 1, label %if.then3
    i32 3, label %if.then5
  ]

if.then3:                                         ; preds = %if.end
  %in_color_space = getelementptr inbounds %struct.jpeg_compress_struct* %cinfo, i64 0, i32 10
  store i32 1, i32* %in_color_space, align 4, !tbaa !868
  br label %if.end10

if.then5:                                         ; preds = %if.end
  %in_color_space6 = getelementptr inbounds %struct.jpeg_compress_struct* %cinfo, i64 0, i32 10
  store i32 2, i32* %in_color_space6, align 4, !tbaa !868
  br label %if.end10

if.else7:                                         ; preds = %if.end
  %3 = load %struct._IO_FILE** @stderr, align 8, !tbaa !850
  %call8 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([40 x i8]* @.str633, i64 0, i64 0), i32 %nc) #12
  br label %cleanup

if.end10:                                         ; preds = %if.then5, %if.then3
  call void @jpeg_set_defaults(%struct.jpeg_compress_struct* %cinfo) #6
  call void @jpeg_set_quality(%struct.jpeg_compress_struct* %cinfo, i32 75, i32 1) #6
  call void @jpeg_start_compress(%struct.jpeg_compress_struct* %cinfo, i32 1) #6
  %next_scanline = getelementptr inbounds %struct.jpeg_compress_struct* %cinfo, i64 0, i32 45
  %4 = load i32* %next_scanline, align 4, !tbaa !869
  %5 = load i32* %image_height, align 4, !tbaa !866
  %cmp1223 = icmp ult i32 %4, %5
  br i1 %cmp1223, label %while.body.preheader, label %while.end

while.body.preheader:                             ; preds = %if.end10
  br label %while.body

while.body:                                       ; preds = %while.body, %while.body.preheader
  %6 = phi i32 [ %8, %while.body ], [ %4, %while.body.preheader ]
  %idxprom = zext i32 %6 to i64
  %arrayidx = getelementptr inbounds i8** %data, i64 %idxprom
  %7 = load i8** %arrayidx, align 8, !tbaa !850
  store i8* %7, i8** %row_pointer, align 8, !tbaa !850
  %call14 = call i32 @jpeg_write_scanlines(%struct.jpeg_compress_struct* %cinfo, i8** %row_pointer, i32 1) #6
  %8 = load i32* %next_scanline, align 4, !tbaa !869
  %9 = load i32* %image_height, align 4, !tbaa !866
  %cmp12 = icmp ult i32 %8, %9
  br i1 %cmp12, label %while.body, label %while.end.loopexit

while.end.loopexit:                               ; preds = %while.body
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %if.end10
  call void @jpeg_finish_compress(%struct.jpeg_compress_struct* %cinfo) #6
  %call15 = call i32 @fclose(%struct._IO_FILE* %call) #6
  br label %cleanup

cleanup:                                          ; preds = %while.end, %if.else7
  %retval.0 = phi i32 [ 0, %while.end ], [ 1, %if.else7 ]
  call void @llvm.lifetime.end(i64 168, i8* %2) #6
  call void @llvm.lifetime.end(i64 584, i8* %1) #6
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

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #6

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #6

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { noreturn nounwind }
attributes #11 = { nounwind readonly }
attributes #12 = { cold nounwind }
attributes #13 = { cold }

!llvm.dbg.cu = !{!0, !30, !41}
!llvm.ident = !{!66, !66, !66, !66}
!llvm.module.flags = !{!67, !68}

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
!30 = !{!"0x11\0012\00clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)\000\00\000\00\001", !31, !2, !32, !35, !2, !2} ; [ DW_TAG_compile_unit ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c] [DW_LANG_C99]
!31 = !{!"convolve_driver.c", !"/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve"}
!32 = !{!33, !23}
!33 = !{!"0xf\00\000\0064\0064\000\000", null, null, !34} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!34 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!35 = !{!36}
!36 = !{!"0x2e\00main\00main\00\0025\000\001\000\000\00256\000\0026", !31, !37, !38, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 25] [def] [scope 26] [main]
!37 = !{!"0x29", !31}                             ; [ DW_TAG_file_type ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!38 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !39, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!39 = !{!19, !19, !40}
!40 = !{!"0xf\00\000\0064\0064\000\000", null, null, !33} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!41 = !{!"0x11\0012\00clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)\000\00\000\00\001", !42, !2, !43, !45, !59, !2} ; [ DW_TAG_compile_unit ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c] [DW_LANG_C99]
!42 = !{!"convolve_hw_interface.c", !"/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve"}
!43 = !{!44}
!44 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!45 = !{!46, !52, !56}
!46 = !{!"0x2e\00convolve_hw_use_accelerator\00convolve_hw_use_accelerator\00\0033\000\001\000\000\00256\000\0033", !42, !47, !48, null, i1 (i32, i32, i32)* @convolve_hw_use_accelerator, null, null, !2} ; [ DW_TAG_subprogram ] [line 33] [def] [convolve_hw_use_accelerator]
!47 = !{!"0x29", !42}                             ; [ DW_TAG_file_type ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!48 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !49, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!49 = !{!50, !51, !51, !51}
!50 = !{!"0x24\00_Bool\000\008\008\000\000\002", null, null} ; [ DW_TAG_base_type ] [_Bool] [line 0, size 8, align 8, offset 0, enc DW_ATE_boolean]
!51 = !{!"0x16\00int32_t\00196\000\000\000\000", !5, null, !19} ; [ DW_TAG_typedef ] [int32_t] [line 196, size 0, align 0, offset 0] [from int]
!52 = !{!"0x2e\00convolve_bypass_hw_iface0\00convolve_bypass_hw_iface0\00\0051\000\001\000\000\00256\000\0052", !42, !47, !53, null, void (i8*, i8*, float*, i32, i32, i32)* @convolve_bypass_hw_iface0, null, null, !2} ; [ DW_TAG_subprogram ] [line 51] [def] [scope 52] [convolve_bypass_hw_iface0]
!53 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !54, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!54 = !{null, !14, !14, !55, !51, !51, !51}
!55 = !{!"0xf\00\000\0064\0064\000\000", null, null, !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!56 = !{!"0x2e\00convolve_bypass_hw_iface1\00convolve_bypass_hw_iface1\00\0058\000\001\000\000\00256\000\0059", !42, !47, !57, null, void (i8**, i8**, float*, i32, i32, i32)* @convolve_bypass_hw_iface1, null, null, !2} ; [ DW_TAG_subprogram ] [line 58] [def] [scope 59] [convolve_bypass_hw_iface1]
!57 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !58, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!58 = !{null, !24, !24, !55, !51, !51, !51}
!59 = !{!60, !63, !64, !65}
!60 = !{!"0x34\00libfilename_3_3\00libfilename_3_3\00\0017\000\001", null, !47, !61, i8** @libfilename_3_3, null} ; [ DW_TAG_variable ] [libfilename_3_3] [line 17] [def]
!61 = !{!"0xf\00\000\0064\0064\000\000", null, null, !62} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!62 = !{!"0x26\00\000\000\000\000\000", null, null, !34} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!63 = !{!"0x34\00libfilename_5_5\00libfilename_5_5\00\0019\000\001", null, !47, !61, i8** @libfilename_5_5, null} ; [ DW_TAG_variable ] [libfilename_5_5] [line 19] [def]
!64 = !{!"0x34\00libfilename_7_7\00libfilename_7_7\00\0021\000\001", null, !47, !61, i8** @libfilename_7_7, null} ; [ DW_TAG_variable ] [libfilename_7_7] [line 21] [def]
!65 = !{!"0x34\00env_allow_hw\00env_allow_hw\00\0023\000\001", null, !47, !61, i8** @env_allow_hw, null} ; [ DW_TAG_variable ] [env_allow_hw] [line 23] [def]
!66 = !{!"clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)"}
!67 = !{i32 2, !"Dwarf Version", i32 4}
!68 = !{i32 2, !"Debug Info Version", i32 2}
!69 = !{!"0x101\00in\0016777230\000", !8, !9, !12} ; [ DW_TAG_arg_variable ] [in] [line 14]
!70 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!71 = !MDLocation(line: 14, column: 36, scope: !8)
!72 = !{!"0x101\00out\0033554447\000", !8, !9, !14} ; [ DW_TAG_arg_variable ] [out] [line 15]
!73 = !MDLocation(line: 15, column: 19, scope: !8)
!74 = !{!"0x101\00kernel\0050331664\000", !8, !9, !15} ; [ DW_TAG_arg_variable ] [kernel] [line 16]
!75 = !MDLocation(line: 16, column: 22, scope: !8)
!76 = !{!"0x101\00kn\0067108881\000", !8, !9, !18} ; [ DW_TAG_arg_variable ] [kn] [line 17]
!77 = !MDLocation(line: 17, column: 13, scope: !8)
!78 = !{!"0x101\00m\0083886098\000", !8, !9, !18} ; [ DW_TAG_arg_variable ] [m] [line 18]
!79 = !MDLocation(line: 18, column: 19, scope: !8)
!80 = !{!"0x101\00n\00100663315\000", !8, !9, !18} ; [ DW_TAG_arg_variable ] [n] [line 19]
!81 = !MDLocation(line: 19, column: 19, scope: !8)
!82 = !{!"0x101\00size_x\00117440532\000", !8, !9, !18} ; [ DW_TAG_arg_variable ] [size_x] [line 20]
!83 = !MDLocation(line: 20, column: 19, scope: !8)
!84 = !{!"0x101\00size_y\00134217749\000", !8, !9, !18} ; [ DW_TAG_arg_variable ] [size_y] [line 21]
!85 = !MDLocation(line: 21, column: 19, scope: !8)
!86 = !MDLocation(line: 23, column: 23, scope: !8)
!87 = !{!"0x100\00khalf\0023\000", !8, !9, !18}   ; [ DW_TAG_auto_variable ] [khalf] [line 23]
!88 = !MDLocation(line: 23, column: 15, scope: !8)
!89 = !{!"0x100\00pixel\0025\000", !8, !9, !17}   ; [ DW_TAG_auto_variable ] [pixel] [line 25]
!90 = !MDLocation(line: 25, column: 11, scope: !8)
!91 = !{!"0x100\00c\0026\000", !8, !9, !19}       ; [ DW_TAG_auto_variable ] [c] [line 26]
!92 = !MDLocation(line: 26, column: 9, scope: !8)
!93 = !MDLocation(line: 29, column: 18, scope: !94)
!94 = !{!"0xb\0029\005\000", !1, !8}              ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!95 = !{!"0x100\00j\0029\000", !94, !9, !19}      ; [ DW_TAG_auto_variable ] [j] [line 29]
!96 = !MDLocation(line: 29, column: 14, scope: !94)
!97 = !MDLocation(line: 29, column: 10, scope: !94)
!98 = !MDLocation(line: 29, column: 26, scope: !99)
!99 = !{!"0xb\0029\005\001", !1, !94}             ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!100 = !MDLocation(line: 29, column: 5, scope: !94)
!101 = !MDLocation(line: 30, column: 18, scope: !102)
!102 = !{!"0xb\0030\009\002", !1, !99}            ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!103 = !{!"0x100\00i\0030\000", !102, !9, !19}    ; [ DW_TAG_auto_variable ] [i] [line 30]
!104 = !MDLocation(line: 31, column: 26, scope: !105)
!105 = !{!"0xb\0030\009\003", !1, !102}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!106 = !MDLocation(line: 31, column: 25, scope: !105)
!107 = !MDLocation(line: 31, column: 62, scope: !105)
!108 = !MDLocation(line: 31, column: 60, scope: !105)
!109 = !MDLocation(line: 31, column: 22, scope: !105)
!110 = !MDLocation(line: 31, column: 53, scope: !105)
!111 = !MDLocation(line: 31, column: 13, scope: !105)
!112 = !MDLocation(line: 30, column: 9, scope: !105)
!113 = !MDLocation(line: 30, column: 30, scope: !105)
!114 = !MDLocation(line: 30, column: 9, scope: !102)
!115 = !MDLocation(line: 29, column: 5, scope: !99)
!116 = !MDLocation(line: 33, column: 9, scope: !8)
!117 = !MDLocation(line: 33, column: 5, scope: !8)
!118 = !MDLocation(line: 35, column: 1, scope: !8)
!119 = !{!"0x101\00in\0016777253\000", !20, !9, !23} ; [ DW_TAG_arg_variable ] [in] [line 37]
!120 = !MDLocation(line: 37, column: 40, scope: !20)
!121 = !{!"0x101\00out\0033554470\000", !20, !9, !24} ; [ DW_TAG_arg_variable ] [out] [line 38]
!122 = !MDLocation(line: 38, column: 20, scope: !20)
!123 = !{!"0x101\00kernel\0050331687\000", !20, !9, !15} ; [ DW_TAG_arg_variable ] [kernel] [line 39]
!124 = !MDLocation(line: 39, column: 22, scope: !20)
!125 = !{!"0x101\00kn\0067108904\000", !20, !9, !18} ; [ DW_TAG_arg_variable ] [kn] [line 40]
!126 = !MDLocation(line: 40, column: 13, scope: !20)
!127 = !{!"0x101\00x\0083886121\000", !20, !9, !18} ; [ DW_TAG_arg_variable ] [x] [line 41]
!128 = !MDLocation(line: 41, column: 19, scope: !20)
!129 = !{!"0x101\00y\00100663338\000", !20, !9, !18} ; [ DW_TAG_arg_variable ] [y] [line 42]
!130 = !MDLocation(line: 42, column: 19, scope: !20)
!131 = !MDLocation(line: 44, column: 23, scope: !20)
!132 = !{!"0x100\00khalf\0044\000", !20, !9, !18} ; [ DW_TAG_auto_variable ] [khalf] [line 44]
!133 = !MDLocation(line: 44, column: 15, scope: !20)
!134 = !{!"0x100\00pixel\0046\000", !20, !9, !17} ; [ DW_TAG_auto_variable ] [pixel] [line 46]
!135 = !MDLocation(line: 46, column: 11, scope: !20)
!136 = !{!"0x100\00c\0047\000", !20, !9, !19}     ; [ DW_TAG_auto_variable ] [c] [line 47]
!137 = !MDLocation(line: 47, column: 9, scope: !20)
!138 = !MDLocation(line: 50, column: 18, scope: !139)
!139 = !{!"0xb\0050\005\004", !1, !20}            ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!140 = !{!"0x100\00j\0050\000", !139, !9, !19}    ; [ DW_TAG_auto_variable ] [j] [line 50]
!141 = !MDLocation(line: 50, column: 14, scope: !139)
!142 = !MDLocation(line: 50, column: 10, scope: !139)
!143 = !MDLocation(line: 50, column: 26, scope: !144)
!144 = !{!"0xb\0050\005\005", !1, !139}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!145 = !MDLocation(line: 50, column: 5, scope: !139)
!146 = !MDLocation(line: 51, column: 18, scope: !147)
!147 = !{!"0xb\0051\009\006", !1, !144}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!148 = !{!"0x100\00i\0051\000", !147, !9, !19}    ; [ DW_TAG_auto_variable ] [i] [line 51]
!149 = !MDLocation(line: 52, column: 25, scope: !150)
!150 = !{!"0xb\0051\009\007", !1, !147}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!151 = !MDLocation(line: 52, column: 22, scope: !150)
!152 = !MDLocation(line: 52, column: 30, scope: !150)
!153 = !MDLocation(line: 52, column: 37, scope: !150)
!154 = !MDLocation(line: 52, column: 13, scope: !150)
!155 = !MDLocation(line: 51, column: 9, scope: !150)
!156 = !MDLocation(line: 51, column: 30, scope: !150)
!157 = !MDLocation(line: 51, column: 9, scope: !147)
!158 = !MDLocation(line: 50, column: 5, scope: !144)
!159 = !MDLocation(line: 54, column: 5, scope: !20)
!160 = !MDLocation(line: 56, column: 1, scope: !20)
!161 = !{!"0x101\00in\0016777300\000", !25, !9, !12} ; [ DW_TAG_arg_variable ] [in] [line 84]
!162 = !MDLocation(line: 84, column: 25, scope: !25)
!163 = !{!"0x101\00out\0033554517\000", !25, !9, !14} ; [ DW_TAG_arg_variable ] [out] [line 85]
!164 = !MDLocation(line: 85, column: 19, scope: !25)
!165 = !{!"0x101\00kernel\0050331734\000", !25, !9, !15} ; [ DW_TAG_arg_variable ] [kernel] [line 86]
!166 = !MDLocation(line: 86, column: 22, scope: !25)
!167 = !{!"0x101\00kn\0067108951\000", !25, !9, !18} ; [ DW_TAG_arg_variable ] [kn] [line 87]
!168 = !MDLocation(line: 87, column: 19, scope: !25)
!169 = !{!"0x101\00dim_x\0083886168\000", !25, !9, !18} ; [ DW_TAG_arg_variable ] [dim_x] [line 88]
!170 = !MDLocation(line: 88, column: 19, scope: !25)
!171 = !{!"0x101\00dim_y\00100663385\000", !25, !9, !18} ; [ DW_TAG_arg_variable ] [dim_y] [line 89]
!172 = !MDLocation(line: 89, column: 19, scope: !25)
!173 = !MDLocation(line: 92, column: 23, scope: !25)
!174 = !{!"0x100\00khalf\0092\000", !25, !9, !18} ; [ DW_TAG_auto_variable ] [khalf] [line 92]
!175 = !MDLocation(line: 92, column: 15, scope: !25)
!176 = !{!"0x100\00m\0094\000", !177, !9, !19}    ; [ DW_TAG_auto_variable ] [m] [line 94]
!177 = !{!"0xb\0094\005\008", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!178 = !MDLocation(line: 94, column: 14, scope: !177)
!179 = !MDLocation(line: 94, column: 10, scope: !177)
!180 = !MDLocation(line: 94, column: 29, scope: !181)
!181 = !{!"0xb\0094\005\009", !1, !177}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!182 = !MDLocation(line: 94, column: 25, scope: !181)
!183 = !MDLocation(line: 94, column: 5, scope: !177)
!184 = !MDLocation(line: 95, column: 33, scope: !185)
!185 = !{!"0xb\0095\009\0011", !1, !186}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!186 = !{!"0xb\0095\009\0010", !1, !181}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!187 = !MDLocation(line: 95, column: 29, scope: !185)
!188 = !MDLocation(line: 29, column: 18, scope: !94, inlinedAt: !189)
!189 = !MDLocation(line: 96, column: 13, scope: !185)
!190 = !MDLocation(line: 29, column: 10, scope: !94, inlinedAt: !189)
!191 = !MDLocation(line: 29, column: 26, scope: !99, inlinedAt: !189)
!192 = !MDLocation(line: 95, column: 9, scope: !186)
!193 = !MDLocation(line: 14, column: 36, scope: !8, inlinedAt: !189)
!194 = !{!"0x101\00in\0016777230\000", !8, !9, !12, !189} ; [ DW_TAG_arg_variable ] [in] [line 14]
!195 = !{!"0x101\00out\0033554447\000", !8, !9, !14, !189} ; [ DW_TAG_arg_variable ] [out] [line 15]
!196 = !MDLocation(line: 15, column: 19, scope: !8, inlinedAt: !189)
!197 = !{!"0x101\00kernel\0050331664\000", !8, !9, !15, !189} ; [ DW_TAG_arg_variable ] [kernel] [line 16]
!198 = !MDLocation(line: 16, column: 22, scope: !8, inlinedAt: !189)
!199 = !{!"0x101\00kn\0067108881\000", !8, !9, !18, !189} ; [ DW_TAG_arg_variable ] [kn] [line 17]
!200 = !MDLocation(line: 17, column: 13, scope: !8, inlinedAt: !189)
!201 = !{!"0x101\00m\0083886098\000", !8, !9, !18, !189} ; [ DW_TAG_arg_variable ] [m] [line 18]
!202 = !MDLocation(line: 18, column: 19, scope: !8, inlinedAt: !189)
!203 = !{!"0x101\00n\00100663315\000", !8, !9, !18, !189} ; [ DW_TAG_arg_variable ] [n] [line 19]
!204 = !MDLocation(line: 19, column: 19, scope: !8, inlinedAt: !189)
!205 = !{!"0x101\00size_x\00117440532\000", !8, !9, !18, !189} ; [ DW_TAG_arg_variable ] [size_x] [line 20]
!206 = !MDLocation(line: 20, column: 19, scope: !8, inlinedAt: !189)
!207 = !{!"0x101\00size_y\00134217749\000", !8, !9, !18, !189} ; [ DW_TAG_arg_variable ] [size_y] [line 21]
!208 = !MDLocation(line: 21, column: 19, scope: !8, inlinedAt: !189)
!209 = !{!"0x100\00khalf\0023\000", !8, !9, !18, !189} ; [ DW_TAG_auto_variable ] [khalf] [line 23]
!210 = !MDLocation(line: 23, column: 15, scope: !8, inlinedAt: !189)
!211 = !{!"0x100\00pixel\0025\000", !8, !9, !17, !189} ; [ DW_TAG_auto_variable ] [pixel] [line 25]
!212 = !MDLocation(line: 25, column: 11, scope: !8, inlinedAt: !189)
!213 = !{!"0x100\00c\0026\000", !8, !9, !19, !189} ; [ DW_TAG_auto_variable ] [c] [line 26]
!214 = !MDLocation(line: 26, column: 9, scope: !8, inlinedAt: !189)
!215 = !{!"0x100\00j\0029\000", !94, !9, !19, !189} ; [ DW_TAG_auto_variable ] [j] [line 29]
!216 = !MDLocation(line: 29, column: 14, scope: !94, inlinedAt: !189)
!217 = !MDLocation(line: 29, column: 5, scope: !94, inlinedAt: !189)
!218 = !MDLocation(line: 30, column: 18, scope: !102, inlinedAt: !189)
!219 = !{!"0x100\00i\0030\000", !102, !9, !19, !189} ; [ DW_TAG_auto_variable ] [i] [line 30]
!220 = !MDLocation(line: 31, column: 26, scope: !105, inlinedAt: !189)
!221 = !MDLocation(line: 31, column: 25, scope: !105, inlinedAt: !189)
!222 = !MDLocation(line: 31, column: 62, scope: !105, inlinedAt: !189)
!223 = !MDLocation(line: 31, column: 60, scope: !105, inlinedAt: !189)
!224 = !MDLocation(line: 31, column: 22, scope: !105, inlinedAt: !189)
!225 = !MDLocation(line: 31, column: 53, scope: !105, inlinedAt: !189)
!226 = !MDLocation(line: 31, column: 13, scope: !105, inlinedAt: !189)
!227 = !MDLocation(line: 30, column: 9, scope: !105, inlinedAt: !189)
!228 = !MDLocation(line: 30, column: 9, scope: !102, inlinedAt: !189)
!229 = !MDLocation(line: 29, column: 5, scope: !99, inlinedAt: !189)
!230 = !MDLocation(line: 33, column: 27, scope: !8, inlinedAt: !189)
!231 = !MDLocation(line: 33, column: 9, scope: !8, inlinedAt: !189)
!232 = !MDLocation(line: 33, column: 5, scope: !8, inlinedAt: !189)
!233 = !MDLocation(line: 95, column: 9, scope: !185)
!234 = !MDLocation(line: 94, column: 5, scope: !181)
!235 = !MDLocation(line: 97, column: 1, scope: !25)
!236 = !{!"0x101\00in\0016777316\000", !28, !9, !23} ; [ DW_TAG_arg_variable ] [in] [line 100]
!237 = !MDLocation(line: 100, column: 26, scope: !28)
!238 = !{!"0x101\00out\0033554533\000", !28, !9, !24} ; [ DW_TAG_arg_variable ] [out] [line 101]
!239 = !MDLocation(line: 101, column: 20, scope: !28)
!240 = !{!"0x101\00kernel\0050331750\000", !28, !9, !15} ; [ DW_TAG_arg_variable ] [kernel] [line 102]
!241 = !MDLocation(line: 102, column: 22, scope: !28)
!242 = !{!"0x101\00kn\0067108967\000", !28, !9, !18} ; [ DW_TAG_arg_variable ] [kn] [line 103]
!243 = !MDLocation(line: 103, column: 19, scope: !28)
!244 = !{!"0x101\00dim_x\0083886184\000", !28, !9, !18} ; [ DW_TAG_arg_variable ] [dim_x] [line 104]
!245 = !MDLocation(line: 104, column: 19, scope: !28)
!246 = !{!"0x101\00dim_y\00100663401\000", !28, !9, !18} ; [ DW_TAG_arg_variable ] [dim_y] [line 105]
!247 = !MDLocation(line: 105, column: 19, scope: !28)
!248 = !MDLocation(line: 107, column: 23, scope: !28)
!249 = !{!"0x100\00khalf\00107\000", !28, !9, !18} ; [ DW_TAG_auto_variable ] [khalf] [line 107]
!250 = !MDLocation(line: 107, column: 15, scope: !28)
!251 = !{!"0x100\00m\00109\000", !252, !9, !19}   ; [ DW_TAG_auto_variable ] [m] [line 109]
!252 = !{!"0xb\00109\005\0012", !1, !28}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!253 = !MDLocation(line: 109, column: 14, scope: !252)
!254 = !MDLocation(line: 51, column: 9, scope: !147, inlinedAt: !255)
!255 = !MDLocation(line: 111, column: 10, scope: !256)
!256 = !{!"0xb\00110\009\0015", !1, !257}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!257 = !{!"0xb\00110\009\0014", !1, !258}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!258 = !{!"0xb\00109\005\0013", !1, !252}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!259 = !MDLocation(line: 109, column: 10, scope: !252)
!260 = !MDLocation(line: 109, column: 29, scope: !258)
!261 = !MDLocation(line: 109, column: 25, scope: !258)
!262 = !MDLocation(line: 109, column: 5, scope: !252)
!263 = !MDLocation(line: 110, column: 33, scope: !256)
!264 = !MDLocation(line: 110, column: 29, scope: !256)
!265 = !MDLocation(line: 50, column: 26, scope: !144, inlinedAt: !255)
!266 = !MDLocation(line: 110, column: 9, scope: !257)
!267 = !MDLocation(line: 54, column: 5, scope: !20, inlinedAt: !255)
!268 = !MDLocation(line: 37, column: 40, scope: !20, inlinedAt: !255)
!269 = !{!"0x101\00in\0016777253\000", !20, !9, !23, !255} ; [ DW_TAG_arg_variable ] [in] [line 37]
!270 = !{!"0x101\00out\0033554470\000", !20, !9, !24, !255} ; [ DW_TAG_arg_variable ] [out] [line 38]
!271 = !MDLocation(line: 38, column: 20, scope: !20, inlinedAt: !255)
!272 = !{!"0x101\00kernel\0050331687\000", !20, !9, !15, !255} ; [ DW_TAG_arg_variable ] [kernel] [line 39]
!273 = !MDLocation(line: 39, column: 22, scope: !20, inlinedAt: !255)
!274 = !{!"0x101\00kn\0067108904\000", !20, !9, !18, !255} ; [ DW_TAG_arg_variable ] [kn] [line 40]
!275 = !MDLocation(line: 40, column: 13, scope: !20, inlinedAt: !255)
!276 = !{!"0x101\00x\0083886121\000", !20, !9, !18, !255} ; [ DW_TAG_arg_variable ] [x] [line 41]
!277 = !MDLocation(line: 41, column: 19, scope: !20, inlinedAt: !255)
!278 = !{!"0x101\00y\00100663338\000", !20, !9, !18, !255} ; [ DW_TAG_arg_variable ] [y] [line 42]
!279 = !MDLocation(line: 42, column: 19, scope: !20, inlinedAt: !255)
!280 = !{!"0x100\00khalf\0044\000", !20, !9, !18, !255} ; [ DW_TAG_auto_variable ] [khalf] [line 44]
!281 = !MDLocation(line: 44, column: 15, scope: !20, inlinedAt: !255)
!282 = !{!"0x100\00pixel\0046\000", !20, !9, !17, !255} ; [ DW_TAG_auto_variable ] [pixel] [line 46]
!283 = !MDLocation(line: 46, column: 11, scope: !20, inlinedAt: !255)
!284 = !{!"0x100\00c\0047\000", !20, !9, !19, !255} ; [ DW_TAG_auto_variable ] [c] [line 47]
!285 = !MDLocation(line: 47, column: 9, scope: !20, inlinedAt: !255)
!286 = !{!"0x100\00j\0050\000", !139, !9, !19, !255} ; [ DW_TAG_auto_variable ] [j] [line 50]
!287 = !MDLocation(line: 50, column: 14, scope: !139, inlinedAt: !255)
!288 = !MDLocation(line: 50, column: 5, scope: !139, inlinedAt: !255)
!289 = !MDLocation(line: 51, column: 18, scope: !147, inlinedAt: !255)
!290 = !{!"0x100\00i\0051\000", !147, !9, !19, !255} ; [ DW_TAG_auto_variable ] [i] [line 51]
!291 = !MDLocation(line: 52, column: 25, scope: !150, inlinedAt: !255)
!292 = !MDLocation(line: 52, column: 22, scope: !150, inlinedAt: !255)
!293 = !MDLocation(line: 52, column: 30, scope: !150, inlinedAt: !255)
!294 = !MDLocation(line: 52, column: 37, scope: !150, inlinedAt: !255)
!295 = !MDLocation(line: 52, column: 13, scope: !150, inlinedAt: !255)
!296 = !MDLocation(line: 51, column: 9, scope: !150, inlinedAt: !255)
!297 = !MDLocation(line: 50, column: 5, scope: !144, inlinedAt: !255)
!298 = !MDLocation(line: 54, column: 17, scope: !20, inlinedAt: !255)
!299 = !MDLocation(line: 110, column: 9, scope: !256)
!300 = !MDLocation(line: 109, column: 5, scope: !258)
!301 = !MDLocation(line: 112, column: 1, scope: !28)
!302 = !{!"0x101\00in\0016777331\000", !29, !9, !23} ; [ DW_TAG_arg_variable ] [in] [line 115]
!303 = !MDLocation(line: 115, column: 26, scope: !29)
!304 = !{!"0x101\00out\0033554548\000", !29, !9, !24} ; [ DW_TAG_arg_variable ] [out] [line 116]
!305 = !MDLocation(line: 116, column: 20, scope: !29)
!306 = !{!"0x101\00kernel\0050331765\000", !29, !9, !15} ; [ DW_TAG_arg_variable ] [kernel] [line 117]
!307 = !MDLocation(line: 117, column: 22, scope: !29)
!308 = !{!"0x101\00kn\0067108982\000", !29, !9, !18} ; [ DW_TAG_arg_variable ] [kn] [line 118]
!309 = !MDLocation(line: 118, column: 19, scope: !29)
!310 = !{!"0x101\00dim_x\0083886199\000", !29, !9, !18} ; [ DW_TAG_arg_variable ] [dim_x] [line 119]
!311 = !MDLocation(line: 119, column: 19, scope: !29)
!312 = !{!"0x101\00dim_y\00100663416\000", !29, !9, !18} ; [ DW_TAG_arg_variable ] [dim_y] [line 120]
!313 = !MDLocation(line: 120, column: 19, scope: !29)
!314 = !MDLocation(line: 122, column: 23, scope: !29)
!315 = !{!"0x100\00khalf\00122\000", !29, !9, !18} ; [ DW_TAG_auto_variable ] [khalf] [line 122]
!316 = !MDLocation(line: 122, column: 15, scope: !29)
!317 = !{!"0x100\00y\00124\000", !318, !9, !19}   ; [ DW_TAG_auto_variable ] [y] [line 124]
!318 = !{!"0xb\00124\005\0016", !1, !29}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!319 = !MDLocation(line: 124, column: 14, scope: !318)
!320 = !MDLocation(line: 124, column: 10, scope: !318)
!321 = !MDLocation(line: 124, column: 29, scope: !322)
!322 = !{!"0xb\00124\005\0017", !1, !318}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!323 = !MDLocation(line: 124, column: 25, scope: !322)
!324 = !MDLocation(line: 124, column: 5, scope: !318)
!325 = !MDLocation(line: 125, column: 31, scope: !326)
!326 = !{!"0xb\00125\007\0019", !1, !327}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!327 = !{!"0xb\00125\007\0018", !1, !322}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!328 = !MDLocation(line: 125, column: 27, scope: !326)
!329 = !MDLocation(line: 130, column: 30, scope: !330)
!330 = !{!"0xb\00130\009\0022", !1, !331}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!331 = !{!"0xb\00130\009\0021", !1, !332}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!332 = !{!"0xb\00125\0051\0020", !1, !326}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!333 = !MDLocation(line: 126, column: 15, scope: !332)
!334 = !MDLocation(line: 125, column: 7, scope: !327)
!335 = !{!"0x100\00pixel\00126\000", !332, !9, !17} ; [ DW_TAG_auto_variable ] [pixel] [line 126]
!336 = !{!"0x100\00c\00127\000", !332, !9, !19}   ; [ DW_TAG_auto_variable ] [c] [line 127]
!337 = !MDLocation(line: 127, column: 13, scope: !332)
!338 = !MDLocation(line: 130, column: 9, scope: !331)
!339 = !MDLocation(line: 132, column: 25, scope: !340)
!340 = !{!"0xb\00131\0011\0024", !1, !341}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!341 = !{!"0xb\00131\0011\0023", !1, !330}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c]
!342 = !MDLocation(line: 132, column: 22, scope: !340)
!343 = !MDLocation(line: 132, column: 32, scope: !340)
!344 = !MDLocation(line: 132, column: 41, scope: !340)
!345 = !MDLocation(line: 132, column: 13, scope: !340)
!346 = !MDLocation(line: 131, column: 11, scope: !340)
!347 = !MDLocation(line: 131, column: 32, scope: !340)
!348 = !MDLocation(line: 131, column: 11, scope: !341)
!349 = !MDLocation(line: 130, column: 9, scope: !330)
!350 = !MDLocation(line: 134, column: 21, scope: !332)
!351 = !MDLocation(line: 134, column: 9, scope: !332)
!352 = !MDLocation(line: 125, column: 7, scope: !326)
!353 = !MDLocation(line: 124, column: 5, scope: !322)
!354 = !MDLocation(line: 136, column: 1, scope: !29)
!355 = !{!"0x101\00argc\0016777241\000", !36, !37, !19} ; [ DW_TAG_arg_variable ] [argc] [line 25]
!356 = !MDLocation(line: 25, column: 14, scope: !36)
!357 = !{!"0x101\00argv\0033554457\000", !36, !37, !40} ; [ DW_TAG_arg_variable ] [argv] [line 25]
!358 = !MDLocation(line: 25, column: 26, scope: !36)
!359 = !MDLocation(line: 28, column: 2, scope: !36)
!360 = !{!"0x100\00index\0030\000", !36, !37, !19} ; [ DW_TAG_auto_variable ] [index] [line 30]
!361 = !MDLocation(line: 30, column: 6, scope: !36)
!362 = !{!"0x100\00verbose_output\0030\000", !36, !37, !19} ; [ DW_TAG_auto_variable ] [verbose_output] [line 30]
!363 = !MDLocation(line: 30, column: 17, scope: !36)
!364 = !{!"0x100\00arg\0030\000", !36, !37, !19}  ; [ DW_TAG_auto_variable ] [arg] [line 30]
!365 = !MDLocation(line: 30, column: 37, scope: !36)
!366 = !{!"0x100\00_size_arr\0032\000", !36, !37, !19} ; [ DW_TAG_auto_variable ] [_size_arr] [line 32]
!367 = !MDLocation(line: 32, column: 6, scope: !36)
!368 = !{!"0x100\00_size_filter\0032\000", !36, !37, !19} ; [ DW_TAG_auto_variable ] [_size_filter] [line 32]
!369 = !MDLocation(line: 32, column: 22, scope: !36)
!370 = !{!"0x100\00data_input\0034\000", !36, !37, !24} ; [ DW_TAG_auto_variable ] [data_input] [line 34]
!371 = !MDLocation(line: 34, column: 17, scope: !36)
!372 = !{!"0x100\00data_output\0035\000", !36, !37, !24} ; [ DW_TAG_auto_variable ] [data_output] [line 35]
!373 = !MDLocation(line: 35, column: 17, scope: !36)
!374 = !{!"0x100\00nrows\0037\000", !36, !37, !375} ; [ DW_TAG_auto_variable ] [nrows] [line 37]
!375 = !{!"0x16\00u_int32_t\00202\000\000\000\000", !5, null, !376} ; [ DW_TAG_typedef ] [u_int32_t] [line 202, size 0, align 0, offset 0] [from unsigned int]
!376 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!377 = !MDLocation(line: 37, column: 15, scope: !36)
!378 = !{!"0x100\00ncols\0037\000", !36, !37, !375} ; [ DW_TAG_auto_variable ] [ncols] [line 37]
!379 = !MDLocation(line: 37, column: 22, scope: !36)
!380 = !{!"0x100\00nchannels\0037\000", !36, !37, !375} ; [ DW_TAG_auto_variable ] [nchannels] [line 37]
!381 = !MDLocation(line: 37, column: 29, scope: !36)
!382 = !{!"0x100\00opt\0039\000", !36, !37, !19}  ; [ DW_TAG_auto_variable ] [opt] [line 39]
!383 = !MDLocation(line: 39, column: 9, scope: !36)
!384 = !{!"0x100\00filename_in\0040\000", !36, !37, !33} ; [ DW_TAG_auto_variable ] [filename_in] [line 40]
!385 = !MDLocation(line: 40, column: 11, scope: !36)
!386 = !{!"0x100\00filename_out\0041\000", !36, !37, !33} ; [ DW_TAG_auto_variable ] [filename_out] [line 41]
!387 = !MDLocation(line: 41, column: 11, scope: !36)
!388 = !MDLocation(line: 43, column: 5, scope: !36)
!389 = !MDLocation(line: 43, column: 26, scope: !390)
!390 = !{!"0xb\002", !31, !391}                   ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!391 = !{!"0xb\001", !31, !36}                    ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!392 = !MDLocation(line: 43, column: 32, scope: !36)
!393 = !MDLocation(line: 43, column: 19, scope: !36)
!394 = !MDLocation(line: 43, column: 13, scope: !36)
!395 = !MDLocation(line: 43, column: 12, scope: !36)
!396 = !MDLocation(line: 44, column: 15, scope: !397)
!397 = !{!"0xb\0043\0055\000", !31, !36}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!398 = !MDLocation(line: 44, column: 7, scope: !397)
!399 = !MDLocation(line: 46, column: 22, scope: !400)
!400 = !{!"0xb\0044\0020\001", !31, !397}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!401 = !MDLocation(line: 46, column: 8, scope: !400)
!402 = !MDLocation(line: 47, column: 9, scope: !400)
!403 = !MDLocation(line: 49, column: 8, scope: !400)
!404 = !MDLocation(line: 50, column: 8, scope: !400)
!405 = !MDLocation(line: 52, column: 17, scope: !400)
!406 = !MDLocation(line: 52, column: 53, scope: !400)
!407 = !MDLocation(line: 52, column: 9, scope: !400)
!408 = !MDLocation(line: 53, column: 9, scope: !400)
!409 = !MDLocation(line: 57, column: 10, scope: !410)
!410 = !{!"0xb\0057\009\002", !31, !36}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!411 = !MDLocation(line: 57, column: 9, scope: !36)
!412 = !MDLocation(line: 58, column: 20, scope: !413)
!413 = !{!"0xb\0058\007\004", !31, !414}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!414 = !{!"0xb\0057\0023\003", !31, !410}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!415 = !MDLocation(line: 58, column: 12, scope: !413)
!416 = !MDLocation(line: 58, column: 28, scope: !417)
!417 = !{!"0xb\002", !31, !418}                   ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!418 = !{!"0xb\001", !31, !419}                   ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!419 = !{!"0xb\0058\007\005", !31, !413}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!420 = !MDLocation(line: 58, column: 36, scope: !419)
!421 = !MDLocation(line: 58, column: 28, scope: !419)
!422 = !MDLocation(line: 58, column: 7, scope: !413)
!423 = !MDLocation(line: 60, column: 17, scope: !424)
!424 = !{!"0xb\0058\0051\006", !31, !419}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!425 = !MDLocation(line: 60, column: 9, scope: !424)
!426 = !MDLocation(line: 62, column: 32, scope: !427)
!427 = !{!"0xb\0060\0024\007", !31, !424}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!428 = !MDLocation(line: 62, column: 27, scope: !427)
!429 = !MDLocation(line: 62, column: 22, scope: !427)
!430 = !MDLocation(line: 62, column: 10, scope: !427)
!431 = !MDLocation(line: 63, column: 11, scope: !427)
!432 = !MDLocation(line: 65, column: 36, scope: !427)
!433 = !MDLocation(line: 65, column: 31, scope: !427)
!434 = !MDLocation(line: 65, column: 26, scope: !427)
!435 = !MDLocation(line: 65, column: 11, scope: !427)
!436 = !MDLocation(line: 66, column: 11, scope: !427)
!437 = !MDLocation(line: 68, column: 7, scope: !424)
!438 = !MDLocation(line: 58, column: 42, scope: !419)
!439 = !MDLocation(line: 58, column: 7, scope: !419)
!440 = !MDLocation(line: 70, column: 23, scope: !414)
!441 = !MDLocation(line: 70, column: 15, scope: !414)
!442 = !MDLocation(line: 70, column: 7, scope: !414)
!443 = !MDLocation(line: 72, column: 7, scope: !414)
!444 = !MDLocation(line: 74, column: 37, scope: !414)
!445 = !MDLocation(line: 74, column: 44, scope: !414)
!446 = !MDLocation(line: 74, column: 21, scope: !414)
!447 = !MDLocation(line: 74, column: 7, scope: !414)
!448 = !MDLocation(line: 75, column: 37, scope: !414)
!449 = !MDLocation(line: 75, column: 44, scope: !414)
!450 = !MDLocation(line: 75, column: 21, scope: !414)
!451 = !MDLocation(line: 75, column: 7, scope: !414)
!452 = !MDLocation(line: 77, column: 5, scope: !414)
!453 = !MDLocation(line: 79, column: 66, scope: !454)
!454 = !{!"0xb\0079\009\009", !31, !455}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!455 = !{!"0xb\0077\0010\008", !31, !410}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!456 = !MDLocation(line: 79, column: 9, scope: !454)
!457 = !MDLocation(line: 79, column: 9, scope: !455)
!458 = !MDLocation(line: 80, column: 15, scope: !459)
!459 = !{!"0xb\0079\0079\0010", !31, !454}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!460 = !MDLocation(line: 80, column: 7, scope: !459)
!461 = !MDLocation(line: 81, column: 7, scope: !459)
!462 = !MDLocation(line: 84, column: 22, scope: !463)
!463 = !{!"0xb\0084\009\0011", !31, !455}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!464 = !MDLocation(line: 84, column: 14, scope: !463)
!465 = !MDLocation(line: 84, column: 30, scope: !466)
!466 = !{!"0xb\002", !31, !467}                   ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!467 = !{!"0xb\001", !31, !468}                   ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!468 = !{!"0xb\0084\009\0012", !31, !463}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!469 = !MDLocation(line: 84, column: 38, scope: !468)
!470 = !MDLocation(line: 84, column: 30, scope: !468)
!471 = !MDLocation(line: 84, column: 9, scope: !463)
!472 = !MDLocation(line: 85, column: 19, scope: !473)
!473 = !{!"0xb\0084\0053\0013", !31, !468}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!474 = !MDLocation(line: 85, column: 11, scope: !473)
!475 = !MDLocation(line: 87, column: 38, scope: !476)
!476 = !{!"0xb\0085\0026\0014", !31, !473}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!477 = !MDLocation(line: 87, column: 33, scope: !476)
!478 = !MDLocation(line: 87, column: 28, scope: !476)
!479 = !MDLocation(line: 87, column: 13, scope: !476)
!480 = !MDLocation(line: 88, column: 13, scope: !476)
!481 = !MDLocation(line: 90, column: 9, scope: !473)
!482 = !MDLocation(line: 84, column: 44, scope: !468)
!483 = !MDLocation(line: 84, column: 9, scope: !468)
!484 = !MDLocation(line: 92, column: 36, scope: !455)
!485 = !MDLocation(line: 92, column: 43, scope: !455)
!486 = !MDLocation(line: 92, column: 20, scope: !455)
!487 = !MDLocation(line: 92, column: 6, scope: !455)
!488 = !MDLocation(line: 95, column: 56, scope: !36)
!489 = !MDLocation(line: 95, column: 49, scope: !36)
!490 = !MDLocation(line: 95, column: 28, scope: !36)
!491 = !MDLocation(line: 95, column: 5, scope: !36)
!492 = !MDLocation(line: 96, column: 13, scope: !36)
!493 = !MDLocation(line: 96, column: 27, scope: !36)
!494 = !MDLocation(line: 96, column: 47, scope: !36)
!495 = !MDLocation(line: 96, column: 40, scope: !36)
!496 = !MDLocation(line: 96, column: 5, scope: !36)
!497 = !MDLocation(line: 97, column: 12, scope: !36)
!498 = !MDLocation(line: 97, column: 5, scope: !36)
!499 = !{!"0x100\00i\0099\000", !36, !37, !19}    ; [ DW_TAG_auto_variable ] [i] [line 99]
!500 = !MDLocation(line: 99, column: 9, scope: !36)
!501 = !{!"0x100\00j\0099\000", !36, !37, !19}    ; [ DW_TAG_auto_variable ] [j] [line 99]
!502 = !MDLocation(line: 99, column: 16, scope: !36)
!503 = !{!"0x100\00kernel_3_3\00101\000", !36, !37, !504} ; [ DW_TAG_auto_variable ] [kernel_3_3] [line 101]
!504 = !{!"0x1\00\000\00288\0032\000\000\000", null, null, !17, !505, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 288, align 32, offset 0] [from float]
!505 = !{!506}
!506 = !{!"0x21\000\009"}                         ; [ DW_TAG_subrange_type ] [0, 8]
!507 = !MDLocation(line: 101, column: 11, scope: !36)
!508 = !{!"0x100\00kernel_5_5\00105\000", !36, !37, !509} ; [ DW_TAG_auto_variable ] [kernel_5_5] [line 105]
!509 = !{!"0x1\00\000\00800\0032\000\000\000", null, null, !17, !510, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 800, align 32, offset 0] [from float]
!510 = !{!511}
!511 = !{!"0x21\000\0025"}                        ; [ DW_TAG_subrange_type ] [0, 24]
!512 = !MDLocation(line: 105, column: 11, scope: !36)
!513 = !{!"0x100\00kernel_7_7\00111\000", !36, !37, !514} ; [ DW_TAG_auto_variable ] [kernel_7_7] [line 111]
!514 = !{!"0x1\00\000\001568\0032\000\000\000", null, null, !17, !515, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1568, align 32, offset 0] [from float]
!515 = !{!516}
!516 = !{!"0x21\000\0049"}                        ; [ DW_TAG_subrange_type ] [0, 48]
!517 = !MDLocation(line: 111, column: 11, scope: !36)
!518 = !MDLocation(line: 120, column: 8, scope: !519)
!519 = !{!"0xb\00120\008\0015", !31, !36}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!520 = !MDLocation(line: 120, column: 8, scope: !36)
!521 = !MDLocation(line: 121, column: 43, scope: !519)
!522 = !MDLocation(line: 121, column: 55, scope: !519)
!523 = !MDLocation(line: 121, column: 68, scope: !519)
!524 = !MDLocation(line: 121, column: 87, scope: !519)
!525 = !MDLocation(line: 121, column: 94, scope: !519)
!526 = !MDLocation(line: 121, column: 6, scope: !519)
!527 = !MDLocation(line: 122, column: 13, scope: !528)
!528 = !{!"0xb\00122\0013\0016", !31, !519}       ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!529 = !MDLocation(line: 122, column: 13, scope: !519)
!530 = !MDLocation(line: 123, column: 43, scope: !528)
!531 = !MDLocation(line: 123, column: 55, scope: !528)
!532 = !MDLocation(line: 123, column: 68, scope: !528)
!533 = !MDLocation(line: 123, column: 87, scope: !528)
!534 = !MDLocation(line: 123, column: 94, scope: !528)
!535 = !MDLocation(line: 123, column: 6, scope: !528)
!536 = !MDLocation(line: 124, column: 13, scope: !537)
!537 = !{!"0xb\00124\0013\0017", !31, !528}       ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!538 = !MDLocation(line: 124, column: 13, scope: !528)
!539 = !MDLocation(line: 125, column: 43, scope: !537)
!540 = !MDLocation(line: 125, column: 55, scope: !537)
!541 = !MDLocation(line: 125, column: 68, scope: !537)
!542 = !MDLocation(line: 125, column: 87, scope: !537)
!543 = !MDLocation(line: 125, column: 94, scope: !537)
!544 = !MDLocation(line: 125, column: 6, scope: !537)
!545 = !MDLocation(line: 127, column: 7, scope: !546)
!546 = !{!"0xb\00126\009\0018", !31, !537}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!547 = !MDLocation(line: 128, column: 21, scope: !546)
!548 = !MDLocation(line: 128, column: 28, scope: !546)
!549 = !MDLocation(line: 128, column: 7, scope: !546)
!550 = !MDLocation(line: 129, column: 21, scope: !546)
!551 = !MDLocation(line: 129, column: 28, scope: !546)
!552 = !MDLocation(line: 129, column: 7, scope: !546)
!553 = !MDLocation(line: 130, column: 7, scope: !546)
!554 = !MDLocation(line: 132, column: 9, scope: !555)
!555 = !{!"0xb\00132\009\0019", !31, !36}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!556 = !MDLocation(line: 132, column: 9, scope: !36)
!557 = !MDLocation(line: 133, column: 12, scope: !558)
!558 = !{!"0xb\00133\007\0021", !31, !559}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!559 = !{!"0xb\00132\0025\0020", !31, !555}       ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!560 = !MDLocation(line: 133, column: 19, scope: !561)
!561 = !{!"0xb\002", !31, !562}                   ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!562 = !{!"0xb\001", !31, !563}                   ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!563 = !{!"0xb\00133\007\0022", !31, !558}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!564 = !MDLocation(line: 133, column: 23, scope: !563)
!565 = !MDLocation(line: 133, column: 19, scope: !563)
!566 = !MDLocation(line: 133, column: 7, scope: !558)
!567 = !MDLocation(line: 134, column: 14, scope: !568)
!568 = !{!"0xb\00134\009\0024", !31, !569}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!569 = !{!"0xb\00133\0039\0023", !31, !563}       ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!570 = !MDLocation(line: 134, column: 21, scope: !571)
!571 = !{!"0xb\002", !31, !572}                   ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!572 = !{!"0xb\001", !31, !573}                   ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!573 = !{!"0xb\00134\009\0025", !31, !568}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!574 = !MDLocation(line: 134, column: 25, scope: !573)
!575 = !MDLocation(line: 134, column: 21, scope: !573)
!576 = !MDLocation(line: 134, column: 9, scope: !568)
!577 = !MDLocation(line: 135, column: 41, scope: !578)
!578 = !{!"0xb\00134\0041\0026", !31, !573}       ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!579 = !MDLocation(line: 135, column: 26, scope: !578)
!580 = !MDLocation(line: 135, column: 38, scope: !578)
!581 = !MDLocation(line: 135, column: 11, scope: !578)
!582 = !MDLocation(line: 136, column: 9, scope: !578)
!583 = !MDLocation(line: 134, column: 36, scope: !573)
!584 = !MDLocation(line: 134, column: 9, scope: !573)
!585 = !MDLocation(line: 137, column: 9, scope: !569)
!586 = !MDLocation(line: 138, column: 7, scope: !569)
!587 = !MDLocation(line: 133, column: 34, scope: !563)
!588 = !MDLocation(line: 133, column: 7, scope: !563)
!589 = !MDLocation(line: 139, column: 5, scope: !559)
!590 = !MDLocation(line: 141, column: 19, scope: !36)
!591 = !MDLocation(line: 141, column: 32, scope: !36)
!592 = !MDLocation(line: 141, column: 39, scope: !36)
!593 = !MDLocation(line: 141, column: 49, scope: !36)
!594 = !MDLocation(line: 141, column: 5, scope: !36)
!595 = !MDLocation(line: 143, column: 19, scope: !36)
!596 = !MDLocation(line: 143, column: 26, scope: !36)
!597 = !MDLocation(line: 143, column: 5, scope: !36)
!598 = !MDLocation(line: 144, column: 19, scope: !36)
!599 = !MDLocation(line: 144, column: 26, scope: !36)
!600 = !MDLocation(line: 144, column: 5, scope: !36)
!601 = !MDLocation(line: 146, column: 5, scope: !36)
!602 = !MDLocation(line: 147, column: 1, scope: !36)
!603 = !{!"0x101\00filter_size\0016777249\000", !46, !47, !51} ; [ DW_TAG_arg_variable ] [filter_size] [line 33]
!604 = !MDLocation(line: 33, column: 42, scope: !46)
!605 = !{!"0x101\00nx\0033554465\000", !46, !47, !51} ; [ DW_TAG_arg_variable ] [nx] [line 33]
!606 = !MDLocation(line: 33, column: 63, scope: !46)
!607 = !{!"0x101\00ny\0050331681\000", !46, !47, !51} ; [ DW_TAG_arg_variable ] [ny] [line 33]
!608 = !MDLocation(line: 33, column: 75, scope: !46)
!609 = !{!"0x100\00allow_hw\0034\000", !46, !47, !4} ; [ DW_TAG_auto_variable ] [allow_hw] [line 34]
!610 = !MDLocation(line: 34, column: 12, scope: !46)
!611 = !{!"0x100\00pAllowHWAccelerationEnv\0036\000", !46, !47, !33} ; [ DW_TAG_auto_variable ] [pAllowHWAccelerationEnv] [line 36]
!612 = !MDLocation(line: 36, column: 9, scope: !46)
!613 = !MDLocation(line: 36, column: 42, scope: !46)
!614 = !MDLocation(line: 36, column: 35, scope: !46)
!615 = !MDLocation(line: 37, column: 7, scope: !616)
!616 = !{!"0xb\0037\007\000", !42, !46}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!617 = !MDLocation(line: 37, column: 7, scope: !46)
!618 = !MDLocation(line: 38, column: 23, scope: !619)
!619 = !{!"0xb\0037\0032\001", !42, !616}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!620 = !MDLocation(line: 38, column: 16, scope: !619)
!621 = !MDLocation(line: 38, column: 5, scope: !619)
!622 = !MDLocation(line: 39, column: 3, scope: !619)
!623 = !MDLocation(line: 41, column: 7, scope: !624)
!624 = !{!"0xb\0041\007\002", !42, !46}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!625 = !MDLocation(line: 41, column: 7, scope: !46)
!626 = !MDLocation(line: 42, column: 48, scope: !627)
!627 = !{!"0xb\0041\0017\003", !42, !624}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!628 = !MDLocation(line: 42, column: 61, scope: !627)
!629 = !MDLocation(line: 42, column: 65, scope: !627)
!630 = !MDLocation(line: 42, column: 5, scope: !627)
!631 = !MDLocation(line: 43, column: 9, scope: !632)
!632 = !{!"0xb\0043\009\004", !42, !627}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!633 = !MDLocation(line: 43, column: 9, scope: !627)
!634 = !MDLocation(line: 43, column: 21, scope: !635)
!635 = !{!"0xb\001", !42, !632}                   ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!636 = !MDLocation(line: 44, column: 11, scope: !637)
!637 = !{!"0xb\0044\0011\005", !42, !632}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!638 = !MDLocation(line: 44, column: 11, scope: !632)
!639 = !MDLocation(line: 45, column: 9, scope: !637)
!640 = !MDLocation(line: 44, column: 25, scope: !641)
!641 = !{!"0xb\001", !42, !637}                   ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!642 = !MDLocation(line: 46, column: 3, scope: !627)
!643 = !MDLocation(line: 48, column: 3, scope: !46)
!644 = !MDLocation(line: 49, column: 1, scope: !46)
!645 = !{!"0x101\00src\0016777267\000", !52, !47, !14} ; [ DW_TAG_arg_variable ] [src] [line 51]
!646 = !MDLocation(line: 51, column: 42, scope: !52)
!647 = !{!"0x101\00dst\0033554483\000", !52, !47, !14} ; [ DW_TAG_arg_variable ] [dst] [line 51]
!648 = !MDLocation(line: 51, column: 57, scope: !52)
!649 = !{!"0x101\00kernel\0050331699\000", !52, !47, !55} ; [ DW_TAG_arg_variable ] [kernel] [line 51]
!650 = !MDLocation(line: 51, column: 69, scope: !52)
!651 = !{!"0x101\00filter_size\0067108915\000", !52, !47, !51} ; [ DW_TAG_arg_variable ] [filter_size] [line 51]
!652 = !MDLocation(line: 51, column: 85, scope: !52)
!653 = !{!"0x101\00nx\0083886131\000", !52, !47, !51} ; [ DW_TAG_arg_variable ] [nx] [line 51]
!654 = !MDLocation(line: 51, column: 106, scope: !52)
!655 = !{!"0x101\00ny\00100663348\000", !52, !47, !51} ; [ DW_TAG_arg_variable ] [ny] [line 52]
!656 = !MDLocation(line: 52, column: 40, scope: !52)
!657 = !MDLocation(line: 54, column: 3, scope: !52)
!658 = !MDLocation(line: 55, column: 108, scope: !52)
!659 = !MDLocation(line: 55, column: 113, scope: !52)
!660 = !MDLocation(line: 56, column: 10, scope: !52)
!661 = !MDLocation(line: 56, column: 18, scope: !52)
!662 = !MDLocation(line: 56, column: 31, scope: !52)
!663 = !MDLocation(line: 56, column: 35, scope: !52)
!664 = !MDLocation(line: 55, column: 3, scope: !52)
!665 = !MDLocation(line: 57, column: 1, scope: !52)
!666 = !{!"0x101\00src\0016777274\000", !56, !47, !24} ; [ DW_TAG_arg_variable ] [src] [line 58]
!667 = !MDLocation(line: 58, column: 43, scope: !56)
!668 = !{!"0x101\00dst\0033554490\000", !56, !47, !24} ; [ DW_TAG_arg_variable ] [dst] [line 58]
!669 = !MDLocation(line: 58, column: 59, scope: !56)
!670 = !{!"0x101\00kernel\0050331706\000", !56, !47, !55} ; [ DW_TAG_arg_variable ] [kernel] [line 58]
!671 = !MDLocation(line: 58, column: 71, scope: !56)
!672 = !{!"0x101\00filter_size\0067108922\000", !56, !47, !51} ; [ DW_TAG_arg_variable ] [filter_size] [line 58]
!673 = !MDLocation(line: 58, column: 87, scope: !56)
!674 = !{!"0x101\00nx\0083886138\000", !56, !47, !51} ; [ DW_TAG_arg_variable ] [nx] [line 58]
!675 = !MDLocation(line: 58, column: 108, scope: !56)
!676 = !{!"0x101\00ny\00100663355\000", !56, !47, !51} ; [ DW_TAG_arg_variable ] [ny] [line 59]
!677 = !MDLocation(line: 59, column: 40, scope: !56)
!678 = !{!"0x100\00error\0060\000", !56, !47, !33} ; [ DW_TAG_auto_variable ] [error] [line 60]
!679 = !MDLocation(line: 60, column: 9, scope: !56)
!680 = !MDLocation(line: 62, column: 3, scope: !56)
!681 = !MDLocation(line: 63, column: 108, scope: !56)
!682 = !MDLocation(line: 63, column: 113, scope: !56)
!683 = !MDLocation(line: 64, column: 10, scope: !56)
!684 = !MDLocation(line: 64, column: 18, scope: !56)
!685 = !MDLocation(line: 64, column: 31, scope: !56)
!686 = !MDLocation(line: 64, column: 35, scope: !56)
!687 = !MDLocation(line: 63, column: 3, scope: !56)
!688 = !{!"0x100\00libfile\0066\000", !56, !47, !61} ; [ DW_TAG_auto_variable ] [libfile] [line 66]
!689 = !MDLocation(line: 66, column: 15, scope: !56)
!690 = !MDLocation(line: 67, column: 7, scope: !691)
!691 = !{!"0xb\0067\007\006", !42, !56}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!692 = !MDLocation(line: 67, column: 7, scope: !56)
!693 = !MDLocation(line: 68, column: 14, scope: !694)
!694 = !{!"0xb\0067\0024\007", !42, !691}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!695 = !MDLocation(line: 68, column: 4, scope: !694)
!696 = !MDLocation(line: 69, column: 3, scope: !694)
!697 = !MDLocation(line: 69, column: 14, scope: !698)
!698 = !{!"0xb\0069\0014\008", !42, !691}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!699 = !MDLocation(line: 69, column: 14, scope: !691)
!700 = !MDLocation(line: 70, column: 14, scope: !701)
!701 = !{!"0xb\0069\0031\009", !42, !698}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!702 = !MDLocation(line: 70, column: 4, scope: !701)
!703 = !MDLocation(line: 71, column: 3, scope: !701)
!704 = !MDLocation(line: 71, column: 13, scope: !705)
!705 = !{!"0xb\0071\0013\0010", !42, !698}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!706 = !MDLocation(line: 71, column: 13, scope: !698)
!707 = !MDLocation(line: 72, column: 14, scope: !708)
!708 = !{!"0xb\0071\0030\0011", !42, !705}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!709 = !MDLocation(line: 72, column: 4, scope: !708)
!710 = !MDLocation(line: 73, column: 3, scope: !708)
!711 = !MDLocation(line: 75, column: 47, scope: !712)
!712 = !{!"0xb\0074\007\0012", !42, !705}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!713 = !MDLocation(line: 75, column: 4, scope: !712)
!714 = !MDLocation(line: 76, column: 4, scope: !712)
!715 = !{!"0x100\00in\0079\000", !56, !47, !14}   ; [ DW_TAG_auto_variable ] [in] [line 79]
!716 = !MDLocation(line: 79, column: 13, scope: !56)
!717 = !MDLocation(line: 79, column: 44, scope: !56)
!718 = !MDLocation(line: 79, column: 25, scope: !56)
!719 = !MDLocation(line: 79, column: 49, scope: !56)
!720 = !MDLocation(line: 79, column: 18, scope: !56)
!721 = !{!"0x100\00out\0080\000", !56, !47, !14}  ; [ DW_TAG_auto_variable ] [out] [line 80]
!722 = !MDLocation(line: 80, column: 13, scope: !56)
!723 = !MDLocation(line: 80, column: 45, scope: !56)
!724 = !MDLocation(line: 80, column: 26, scope: !56)
!725 = !MDLocation(line: 80, column: 50, scope: !56)
!726 = !MDLocation(line: 80, column: 19, scope: !56)
!727 = !{!"0x100\00i\0082\000", !56, !47, !19}    ; [ DW_TAG_auto_variable ] [i] [line 82]
!728 = !MDLocation(line: 82, column: 7, scope: !56)
!729 = !{!"0x100\00j\0082\000", !56, !47, !19}    ; [ DW_TAG_auto_variable ] [j] [line 82]
!730 = !MDLocation(line: 82, column: 14, scope: !56)
!731 = !MDLocation(line: 83, column: 8, scope: !732)
!732 = !{!"0xb\0083\003\0013", !42, !56}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!733 = !MDLocation(line: 83, column: 15, scope: !734)
!734 = !{!"0xb\002", !42, !735}                   ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!735 = !{!"0xb\001", !42, !736}                   ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!736 = !{!"0xb\0083\003\0014", !42, !732}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!737 = !MDLocation(line: 83, column: 19, scope: !736)
!738 = !MDLocation(line: 83, column: 15, scope: !736)
!739 = !MDLocation(line: 83, column: 3, scope: !732)
!740 = !MDLocation(line: 84, column: 16, scope: !736)
!741 = !MDLocation(line: 84, column: 20, scope: !736)
!742 = !MDLocation(line: 84, column: 5, scope: !736)
!743 = !MDLocation(line: 84, column: 13, scope: !736)
!744 = !MDLocation(line: 84, column: 29, scope: !736)
!745 = !MDLocation(line: 84, column: 25, scope: !736)
!746 = !MDLocation(line: 84, column: 52, scope: !736)
!747 = !MDLocation(line: 84, column: 33, scope: !736)
!748 = !MDLocation(line: 83, column: 23, scope: !736)
!749 = !MDLocation(line: 83, column: 3, scope: !736)
!750 = !{!"0x100\00ifaceptr\0086\000", !56, !47, !751} ; [ DW_TAG_auto_variable ] [ifaceptr] [line 86]
!751 = !{!"0xf\00\000\0064\0064\000\000", null, null, !752} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!752 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !753, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!753 = !{null, !754, !51, !51, !15, !12, !14}
!754 = !{!"0x16\00int64_t\00197\000\000\000\000", !5, null, !755} ; [ DW_TAG_typedef ] [int64_t] [line 197, size 0, align 0, offset 0] [from long int]
!755 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!756 = !MDLocation(line: 86, column: 10, scope: !56)
!757 = !{!"0x100\00max_init\0089\000", !56, !47, !758} ; [ DW_TAG_auto_variable ] [max_init] [line 89]
!758 = !{!"0xf\00\000\0064\0064\000\000", null, null, !759} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!759 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !760, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!760 = !{!761, null}
!761 = !{!"0xf\00\000\0064\0064\000\000", null, null, !762} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from max_file_t]
!762 = !{!"0x16\00max_file_t\00176\000\000\000\000", !763, null, !764} ; [ DW_TAG_typedef ] [max_file_t] [line 176, size 0, align 0, offset 0] [from max_file]
!763 = !{!"/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/slic/include/slic_typedefs.h", !"/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve"}
!764 = !{!"0x13\00max_file\00173\00128\0064\000\000\000", !763, null, null, !765, null, null, null} ; [ DW_TAG_structure_type ] [max_file] [line 173, size 128, align 64, offset 0] [def] [from ]
!765 = !{!766, !770}
!766 = !{!"0xd\00errors\00174\0064\0064\000\000", !763, !764, !767} ; [ DW_TAG_member ] [errors] [line 174, size 64, align 64, offset 0] [from ]
!767 = !{!"0xf\00\000\0064\0064\000\000", null, null, !768} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from max_errors_t]
!768 = !{!"0x16\00max_errors_t\0094\000\000\000\000", !763, null, !769} ; [ DW_TAG_typedef ] [max_errors_t] [line 94, size 0, align 0, offset 0] [from max_errors]
!769 = !{!"0x13\00max_errors\0093\000\000\000\004\000", !763, null, null, null, null, null, null} ; [ DW_TAG_structure_type ] [max_errors] [line 93, size 0, align 0, offset 0] [decl] [from ]
!770 = !{!"0xd\00maxfile_internal\00175\0064\0064\0064\000", !763, !764, !771} ; [ DW_TAG_member ] [maxfile_internal] [line 175, size 64, align 64, offset 64] [from ]
!771 = !{!"0xf\00\000\0064\0064\000\000", null, null, !772} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from max_file_internal_t]
!772 = !{!"0x16\00max_file_internal_t\0097\000\000\000\000", !763, null, !773} ; [ DW_TAG_typedef ] [max_file_internal_t] [line 97, size 0, align 0, offset 0] [from max_file_internal]
!773 = !{!"0x13\00max_file_internal\0096\000\000\000\004\000", !763, null, null, null, null, null, null} ; [ DW_TAG_structure_type ] [max_file_internal] [line 96, size 0, align 0, offset 0] [decl] [from ]
!774 = !MDLocation(line: 89, column: 17, scope: !56)
!775 = !{!"0x100\00dlhandle\0091\000", !56, !47, !44} ; [ DW_TAG_auto_variable ] [dlhandle] [line 91]
!776 = !MDLocation(line: 91, column: 9, scope: !56)
!777 = !MDLocation(line: 91, column: 27, scope: !56)
!778 = !MDLocation(line: 91, column: 20, scope: !56)
!779 = !MDLocation(line: 93, column: 8, scope: !780)
!780 = !{!"0xb\0093\007\0015", !42, !56}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!781 = !MDLocation(line: 93, column: 7, scope: !56)
!782 = !MDLocation(line: 94, column: 13, scope: !783)
!783 = !{!"0xb\0093\0018\0016", !42, !780}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!784 = !MDLocation(line: 94, column: 5, scope: !783)
!785 = !MDLocation(line: 95, column: 51, scope: !783)
!786 = !MDLocation(line: 95, column: 5, scope: !783)
!787 = !MDLocation(line: 96, column: 5, scope: !783)
!788 = !MDLocation(line: 100, column: 20, scope: !56)
!789 = !MDLocation(line: 100, column: 14, scope: !56)
!790 = !MDLocation(line: 100, column: 3, scope: !56)
!791 = !MDLocation(line: 101, column: 16, scope: !792)
!792 = !{!"0xb\00101\007\0017", !42, !56}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!793 = !MDLocation(line: 101, column: 8, scope: !792)
!794 = !MDLocation(line: 101, column: 7, scope: !792)
!795 = !MDLocation(line: 101, column: 7, scope: !56)
!796 = !MDLocation(line: 102, column: 47, scope: !797)
!797 = !{!"0xb\00101\0036\0018", !42, !792}       ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!798 = !MDLocation(line: 102, column: 5, scope: !797)
!799 = !MDLocation(line: 103, column: 5, scope: !797)
!800 = !MDLocation(line: 106, column: 20, scope: !56)
!801 = !MDLocation(line: 106, column: 14, scope: !56)
!802 = !MDLocation(line: 106, column: 3, scope: !56)
!803 = !MDLocation(line: 107, column: 16, scope: !804)
!804 = !{!"0xb\00107\007\0019", !42, !56}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!805 = !MDLocation(line: 107, column: 8, scope: !804)
!806 = !MDLocation(line: 107, column: 7, scope: !804)
!807 = !MDLocation(line: 107, column: 7, scope: !56)
!808 = !MDLocation(line: 108, column: 47, scope: !809)
!809 = !{!"0xb\00107\0036\0020", !42, !804}       ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!810 = !MDLocation(line: 108, column: 5, scope: !809)
!811 = !MDLocation(line: 109, column: 5, scope: !809)
!812 = !MDLocation(line: 112, column: 3, scope: !56)
!813 = !MDLocation(line: 116, column: 5, scope: !56)
!814 = !MDLocation(line: 116, column: 15, scope: !56)
!815 = !MDLocation(line: 116, column: 20, scope: !56)
!816 = !MDLocation(line: 116, column: 24, scope: !56)
!817 = !MDLocation(line: 116, column: 28, scope: !56)
!818 = !MDLocation(line: 116, column: 32, scope: !56)
!819 = !MDLocation(line: 116, column: 40, scope: !56)
!820 = !MDLocation(line: 116, column: 44, scope: !56)
!821 = !MDLocation(line: 118, column: 3, scope: !56)
!822 = !MDLocation(line: 120, column: 11, scope: !56)
!823 = !MDLocation(line: 120, column: 3, scope: !56)
!824 = !MDLocation(line: 122, column: 8, scope: !825)
!825 = !{!"0xb\00122\003\0021", !42, !56}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!826 = !MDLocation(line: 122, column: 15, scope: !827)
!827 = !{!"0xb\002", !42, !828}                   ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!828 = !{!"0xb\001", !42, !829}                   ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!829 = !{!"0xb\00122\003\0022", !42, !825}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!830 = !MDLocation(line: 122, column: 19, scope: !829)
!831 = !MDLocation(line: 122, column: 15, scope: !829)
!832 = !MDLocation(line: 122, column: 3, scope: !825)
!833 = !MDLocation(line: 123, column: 16, scope: !829)
!834 = !MDLocation(line: 123, column: 12, scope: !829)
!835 = !MDLocation(line: 123, column: 25, scope: !829)
!836 = !MDLocation(line: 123, column: 29, scope: !829)
!837 = !MDLocation(line: 123, column: 5, scope: !829)
!838 = !MDLocation(line: 123, column: 21, scope: !829)
!839 = !MDLocation(line: 123, column: 53, scope: !829)
!840 = !MDLocation(line: 123, column: 34, scope: !829)
!841 = !MDLocation(line: 122, column: 23, scope: !829)
!842 = !MDLocation(line: 122, column: 3, scope: !829)
!843 = !MDLocation(line: 125, column: 8, scope: !56)
!844 = !MDLocation(line: 125, column: 3, scope: !56)
!845 = !MDLocation(line: 126, column: 8, scope: !56)
!846 = !MDLocation(line: 126, column: 3, scope: !56)
!847 = !MDLocation(line: 137, column: 1, scope: !56)
!848 = !MDLocation(line: 137, column: 1, scope: !849)
!849 = !{!"0xb\001", !42, !56}                    ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!850 = !{!851, !851, i64 0}
!851 = !{!"any pointer", !852, i64 0}
!852 = !{!"omnipotent char", !853, i64 0}
!853 = !{!"Simple C/C++ TBAA"}
!854 = !{!855, !851, i64 0}
!855 = !{!"jpeg_decompress_struct", !851, i64 0, !851, i64 8, !851, i64 16, !851, i64 24, !856, i64 32, !856, i64 36, !851, i64 40, !856, i64 48, !856, i64 52, !856, i64 56, !852, i64 60, !852, i64 64, !856, i64 68, !856, i64 72, !857, i64 80, !856, i64 88, !856, i64 92, !852, i64 96, !856, i64 100, !856, i64 104, !856, i64 108, !852, i64 112, !856, i64 116, !856, i64 120, !856, i64 124, !856, i64 128, !856, i64 132, !856, i64 136, !856, i64 140, !856, i64 144, !856, i64 148, !856, i64 152, !856, i64 156, !851, i64 160, !856, i64 168, !856, i64 172, !856, i64 176, !856, i64 180, !856, i64 184, !851, i64 192, !852, i64 200, !852, i64 232, !852, i64 264, !856, i64 296, !851, i64 304, !856, i64 312, !856, i64 316, !856, i64 320, !852, i64 324, !852, i64 340, !852, i64 356, !856, i64 372, !856, i64 376, !852, i64 380, !852, i64 381, !852, i64 382, !858, i64 384, !858, i64 386, !856, i64 388, !852, i64 392, !856, i64 396, !851, i64 400, !856, i64 408, !856, i64 412, !856, i64 416, !856, i64 420, !856, i64 424, !851, i64 432, !856, i64 440, !852, i64 448, !856, i64 480, !856, i64 484, !856, i64 488, !852, i64 492, !856, i64 532, !856, i64 536, !856, i64 540, !856, i64 544, !856, i64 548, !851, i64 552, !856, i64 560, !856, i64 564, !851, i64 568, !851, i64 576, !851, i64 584, !851, i64 592, !851, i64 600, !851, i64 608, !851, i64 616, !851, i64 624, !851, i64 632, !851, i64 640, !851, i64 648}
!856 = !{!"int", !852, i64 0}
!857 = !{!"double", !852, i64 0}
!858 = !{!"short", !852, i64 0}
!859 = !{!856, !856, i64 0}
!860 = !{!855, !856, i64 156}
!861 = !{!855, !856, i64 168}
!862 = !{!855, !856, i64 140}
!863 = !{!864, !851, i64 0}
!864 = !{!"jpeg_compress_struct", !851, i64 0, !851, i64 8, !851, i64 16, !851, i64 24, !856, i64 32, !856, i64 36, !851, i64 40, !856, i64 48, !856, i64 52, !856, i64 56, !852, i64 60, !857, i64 64, !856, i64 72, !856, i64 76, !856, i64 80, !856, i64 84, !856, i64 88, !856, i64 92, !852, i64 96, !851, i64 104, !852, i64 112, !852, i64 144, !852, i64 160, !852, i64 192, !852, i64 224, !852, i64 240, !852, i64 256, !856, i64 272, !851, i64 280, !856, i64 288, !856, i64 292, !856, i64 296, !856, i64 300, !856, i64 304, !856, i64 308, !852, i64 312, !856, i64 316, !856, i64 320, !856, i64 324, !852, i64 328, !852, i64 329, !852, i64 330, !858, i64 332, !858, i64 334, !856, i64 336, !856, i64 340, !856, i64 344, !856, i64 348, !856, i64 352, !856, i64 356, !856, i64 360, !856, i64 364, !856, i64 368, !852, i64 376, !856, i64 408, !856, i64 412, !856, i64 416, !852, i64 420, !856, i64 460, !856, i64 464, !856, i64 468, !856, i64 472, !856, i64 476, !851, i64 480, !856, i64 488, !851, i64 496, !851, i64 504, !851, i64 512, !851, i64 520, !851, i64 528, !851, i64 536, !851, i64 544, !851, i64 552, !851, i64 560, !851, i64 568, !856, i64 576}
!865 = !{!864, !856, i64 48}
!866 = !{!864, !856, i64 52}
!867 = !{!864, !856, i64 56}
!868 = !{!864, !852, i64 60}
!869 = !{!864, !856, i64 340}
