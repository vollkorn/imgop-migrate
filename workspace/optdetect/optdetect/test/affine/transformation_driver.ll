; ModuleID = 'transformation_driver.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@opterr = external global i32
@.str = private unnamed_addr constant [6 x i8] c"f:v::\00", align 1
@optarg = external global i8*
@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [24 x i8] c"Usage: %s -f [file...]\0A\00", align 1
@optind = external global i32
@.str2 = private unnamed_addr constant [6 x i8] c"dummy\00", align 1
@.str3 = private unnamed_addr constant [27 x i8] c"jpeg decompression failed\0A\00", align 1
@.str4 = private unnamed_addr constant [18 x i8] c"_transformed.jpg\00\00", align 1
@.str5 = private unnamed_addr constant [4 x i8] c"%d\09\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %data_input = alloca i8**, align 8
  %nrows = alloca i32, align 4
  %ncols = alloca i32, align 4
  %nchannels = alloca i32, align 4
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !15, metadata !71), !dbg !72
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !16, metadata !71), !dbg !73
  store i32 0, i32* @opterr, align 4, !dbg !74, !tbaa !75
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !17, metadata !71), !dbg !79
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !18, metadata !71), !dbg !80
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !19, metadata !71), !dbg !81
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !20, metadata !71), !dbg !82
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !21, metadata !71), !dbg !83
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !22, metadata !71), !dbg !84
  tail call void @llvm.dbg.value(metadata i8* null, i64 0, metadata !36, metadata !71), !dbg !85
  tail call void @llvm.dbg.value(metadata i8* null, i64 0, metadata !37, metadata !71), !dbg !86
  br label %while.cond.outer, !dbg !87

while.cond.outer.loopexit:                        ; preds = %while.cond
  %filename_in.0.lcssa100 = phi i8* [ %filename_in.0, %while.cond ]
  br label %while.cond.outer

while.cond.outer:                                 ; preds = %while.cond.outer.loopexit, %entry
  %verbose_output.0.ph = phi i32 [ 0, %entry ], [ 1, %while.cond.outer.loopexit ]
  %filename_in.0.ph = phi i8* [ null, %entry ], [ %filename_in.0.lcssa100, %while.cond.outer.loopexit ]
  br label %while.cond

while.cond:                                       ; preds = %while.cond.outer, %sw.bb
  %filename_in.0 = phi i8* [ %0, %sw.bb ], [ %filename_in.0.ph, %while.cond.outer ]
  %call = tail call i32 @getopt(i32 %argc, i8** %argv, i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0)) #6, !dbg !88
  tail call void @llvm.dbg.value(metadata i32 %call, i64 0, metadata !35, metadata !71), !dbg !89
  switch i32 %call, label %sw.default [
    i32 -1, label %while.end
    i32 102, label %sw.bb
    i32 118, label %while.cond.outer.loopexit
  ], !dbg !87

sw.bb:                                            ; preds = %while.cond
  %0 = load i8** @optarg, align 8, !dbg !90, !tbaa !93
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !36, metadata !71), !dbg !85
  br label %while.cond, !dbg !95

sw.default:                                       ; preds = %while.cond
  %1 = load %struct._IO_FILE** @stderr, align 8, !dbg !96, !tbaa !93
  %2 = load i8** %argv, align 8, !dbg !97, !tbaa !93
  %call2 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([24 x i8]* @.str1, i64 0, i64 0), i8* %2) #7, !dbg !98
  tail call void @exit(i32 1) #8, !dbg !99
  unreachable, !dbg !99

while.end:                                        ; preds = %while.cond
  %verbose_output.0.ph.lcssa101 = phi i32 [ %verbose_output.0.ph, %while.cond ]
  %filename_in.0.lcssa99 = phi i8* [ %filename_in.0, %while.cond ]
  %tobool = icmp eq i8* %filename_in.0.lcssa99, null, !dbg !100
  br i1 %tobool, label %if.then, label %if.else, !dbg !100

if.then:                                          ; preds = %while.end
  %3 = load i32* @optind, align 4, !dbg !101, !tbaa !75
  tail call void @llvm.dbg.value(metadata i32 %3, i64 0, metadata !17, metadata !71), !dbg !79
  %cmp382 = icmp slt i32 %3, %argc, !dbg !105
  br i1 %cmp382, label %for.body.lr.ph, label %for.end, !dbg !107

for.body.lr.ph:                                   ; preds = %if.then
  %4 = sext i32 %3 to i64
  %5 = add i32 %argc, -1, !dbg !107
  %6 = sub i32 %5, %3, !dbg !107
  br label %for.body, !dbg !107

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %indvars.iv93 = phi i64 [ %4, %for.body.lr.ph ], [ %indvars.iv.next94, %for.inc ]
  %_size_arr.085 = phi i32 [ 0, %for.body.lr.ph ], [ %_size_arr.1, %for.inc ]
  %arg.084 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.inc ]
  %inc = add nuw nsw i32 %arg.084, 1, !dbg !108
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !19, metadata !71), !dbg !81
  %cond = icmp eq i32 %arg.084, 0, !dbg !110
  br i1 %cond, label %sw.bb4, label %for.inc, !dbg !110

sw.bb4:                                           ; preds = %for.body
  %arrayidx5 = getelementptr inbounds i8** %argv, i64 %indvars.iv93, !dbg !111
  %7 = load i8** %arrayidx5, align 8, !dbg !111, !tbaa !93
  tail call void @llvm.dbg.value(metadata i8* %7, i64 0, metadata !113, metadata !71) #6, !dbg !115
  %call.i = tail call i64 @strtol(i8* nocapture %7, i8** null, i32 10) #6, !dbg !116
  %conv.i = trunc i64 %call.i to i32, !dbg !117
  tail call void @llvm.dbg.value(metadata i32 %conv.i, i64 0, metadata !22, metadata !71), !dbg !84
  br label %for.inc, !dbg !118

for.inc:                                          ; preds = %sw.bb4, %for.body
  %_size_arr.1 = phi i32 [ %conv.i, %sw.bb4 ], [ %_size_arr.085, %for.body ]
  %indvars.iv.next94 = add nsw i64 %indvars.iv93, 1, !dbg !107
  %exitcond95 = icmp eq i32 %arg.084, %6, !dbg !107
  br i1 %exitcond95, label %for.end.loopexit, label %for.body, !dbg !107

for.end.loopexit:                                 ; preds = %for.inc
  %_size_arr.1.lcssa = phi i32 [ %_size_arr.1, %for.inc ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %if.then
  %_size_arr.0.lcssa = phi i32 [ 0, %if.then ], [ %_size_arr.1.lcssa, %for.end.loopexit ]
  tail call void @llvm.dbg.value(metadata i32 %_size_arr.1, i64 0, metadata !33, metadata !71), !dbg !119
  store i32 %_size_arr.0.lcssa, i32* %ncols, align 4, !dbg !120, !tbaa !75
  tail call void @llvm.dbg.value(metadata i32 %_size_arr.1, i64 0, metadata !30, metadata !71), !dbg !121
  store i32 %_size_arr.0.lcssa, i32* %nrows, align 4, !dbg !122, !tbaa !75
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !36, metadata !71), !dbg !85
  %conv = zext i32 %_size_arr.0.lcssa to i64, !dbg !123
  tail call void @llvm.dbg.value(metadata i32* %ncols, i64 0, metadata !33, metadata !71), !dbg !119
  %call10 = tail call i8** @create_array_2d(i64 %conv, i64 %conv, i8 zeroext 1) #6, !dbg !124
  tail call void @llvm.dbg.value(metadata i8** %call10, i64 0, metadata !23, metadata !71), !dbg !125
  store i8** %call10, i8*** %data_input, align 8, !dbg !126, !tbaa !93
  tail call void @llvm.dbg.value(metadata i32* %nrows, i64 0, metadata !30, metadata !71), !dbg !121
  tail call void @llvm.dbg.value(metadata i32* %ncols, i64 0, metadata !33, metadata !71), !dbg !119
  %call13 = tail call i8** @create_array_2d(i64 %conv, i64 %conv, i8 zeroext 0) #6, !dbg !127
  tail call void @llvm.dbg.value(metadata i8** %call13, i64 0, metadata !29, metadata !71), !dbg !128
  br label %if.end21, !dbg !129

if.else:                                          ; preds = %while.end
  tail call void @llvm.dbg.value(metadata i8*** %data_input, i64 0, metadata !23, metadata !71), !dbg !125
  tail call void @llvm.dbg.value(metadata i32* %nrows, i64 0, metadata !30, metadata !71), !dbg !121
  tail call void @llvm.dbg.value(metadata i32* %ncols, i64 0, metadata !33, metadata !71), !dbg !119
  tail call void @llvm.dbg.value(metadata i32* %nchannels, i64 0, metadata !34, metadata !71), !dbg !130
  %call14 = call i32 @jpeg_decompress(i8*** %data_input, i32* %ncols, i32* %nrows, i32* %nchannels, i8* %filename_in.0.lcssa99) #6, !dbg !131
  %tobool15 = icmp eq i32 %call14, 0, !dbg !134
  br i1 %tobool15, label %if.end, label %if.then16, !dbg !134

if.then16:                                        ; preds = %if.else
  %8 = load %struct._IO_FILE** @stderr, align 8, !dbg !135, !tbaa !93
  %9 = call i64 @fwrite(i8* getelementptr inbounds ([27 x i8]* @.str3, i64 0, i64 0), i64 26, i64 1, %struct._IO_FILE* %8) #9, !dbg !137
  br label %return, !dbg !138

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.value(metadata i32* %nrows, i64 0, metadata !30, metadata !71), !dbg !121
  %10 = load i32* %nrows, align 4, !dbg !139, !tbaa !75
  %conv18 = zext i32 %10 to i64, !dbg !139
  call void @llvm.dbg.value(metadata i32* %ncols, i64 0, metadata !33, metadata !71), !dbg !119
  %11 = load i32* %ncols, align 4, !dbg !140, !tbaa !75
  %conv19 = zext i32 %11 to i64, !dbg !140
  %call20 = call i8** @create_array_2d(i64 %conv18, i64 %conv19, i8 zeroext 0) #6, !dbg !141
  call void @llvm.dbg.value(metadata i8** %call20, i64 0, metadata !29, metadata !71), !dbg !128
  br label %if.end21

if.end21:                                         ; preds = %if.end, %for.end
  %_size_arr.2 = phi i32 [ 0, %if.end ], [ %_size_arr.0.lcssa, %for.end ]
  %data_output.0 = phi i8** [ %call20, %if.end ], [ %call13, %for.end ]
  %filename_in.1 = phi i8* [ %filename_in.0.lcssa99, %if.end ], [ getelementptr inbounds ([6 x i8]* @.str2, i64 0, i64 0), %for.end ]
  %call22 = call i64 @strlen(i8* %filename_in.1) #10, !dbg !142
  %add23 = add i64 %call22, 19, !dbg !142
  %call24 = call noalias i8* @calloc(i64 1, i64 %add23) #6, !dbg !143
  call void @llvm.dbg.value(metadata i8* %call24, i64 0, metadata !37, metadata !71), !dbg !86
  %call25 = call i64 @strlen(i8* %filename_in.1) #10, !dbg !144
  %call26 = call i8* @strncpy(i8* %call24, i8* %filename_in.1, i64 %call25) #6, !dbg !144
  %strlen = call i64 @strlen(i8* %call24), !dbg !145
  %endptr = getelementptr i8* %call24, i64 %strlen, !dbg !145
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %endptr, i8* getelementptr inbounds ([18 x i8]* @.str4, i64 0, i64 0), i64 17, i32 1, i1 false), !dbg !145
  call void @llvm.dbg.value(metadata i8*** %data_input, i64 0, metadata !23, metadata !71), !dbg !125
  %12 = load i8*** %data_input, align 8, !dbg !146, !tbaa !93
  call void @llvm.dbg.value(metadata i32* %ncols, i64 0, metadata !33, metadata !71), !dbg !119
  %13 = load i32* %ncols, align 4, !dbg !147, !tbaa !75
  call void @llvm.dbg.value(metadata i32* %nrows, i64 0, metadata !30, metadata !71), !dbg !121
  %14 = load i32* %nrows, align 4, !dbg !148, !tbaa !75
  call void @do_it(i8** %12, i8** %data_output.0, i32 %13, i32 %14), !dbg !149
  %tobool28 = icmp ne i32 %verbose_output.0.ph.lcssa101, 0, !dbg !150
  %cmp3180 = icmp sgt i32 %_size_arr.2, 0, !dbg !151
  %or.cond = and i1 %tobool28, %cmp3180, !dbg !150
  br i1 %or.cond, label %for.cond34.preheader.lr.ph, label %if.end51, !dbg !150

for.cond34.preheader.lr.ph:                       ; preds = %if.end21
  %15 = add i32 %_size_arr.2, -1, !dbg !156
  br label %for.body37.lr.ph, !dbg !156

for.body37.lr.ph:                                 ; preds = %for.cond34.preheader.lr.ph, %for.end46
  %indvars.iv89 = phi i64 [ 0, %for.cond34.preheader.lr.ph ], [ %indvars.iv.next90, %for.end46 ]
  br label %for.body37, !dbg !157

for.body37:                                       ; preds = %for.body37, %for.body37.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body37.lr.ph ], [ %indvars.iv.next, %for.body37 ]
  %arrayidx40 = getelementptr inbounds i8** %data_output.0, i64 %indvars.iv, !dbg !160
  %16 = load i8** %arrayidx40, align 8, !dbg !160, !tbaa !93
  %arrayidx41 = getelementptr inbounds i8* %16, i64 %indvars.iv89, !dbg !160
  %17 = load i8* %arrayidx41, align 1, !dbg !160, !tbaa !163
  %conv42 = zext i8 %17 to i32, !dbg !160
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str5, i64 0, i64 0), i32 %conv42) #6, !dbg !164
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !157
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !157
  %exitcond = icmp eq i32 %lftr.wideiv, %15, !dbg !157
  br i1 %exitcond, label %for.end46, label %for.body37, !dbg !157

for.end46:                                        ; preds = %for.body37
  %putchar = call i32 @putchar(i32 10) #6, !dbg !165
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1, !dbg !156
  %lftr.wideiv91 = trunc i64 %indvars.iv89 to i32, !dbg !156
  %exitcond92 = icmp eq i32 %lftr.wideiv91, %15, !dbg !156
  br i1 %exitcond92, label %if.end51.loopexit, label %for.body37.lr.ph, !dbg !156

if.end51.loopexit:                                ; preds = %for.end46
  br label %if.end51

if.end51:                                         ; preds = %if.end51.loopexit, %if.end21
  call void @llvm.dbg.value(metadata i32* %ncols, i64 0, metadata !33, metadata !71), !dbg !119
  %18 = load i32* %ncols, align 4, !dbg !166, !tbaa !75
  call void @llvm.dbg.value(metadata i32* %nrows, i64 0, metadata !30, metadata !71), !dbg !121
  %19 = load i32* %nrows, align 4, !dbg !167, !tbaa !75
  %call52 = call i32 @jpeg_compress(i8** %data_output.0, i32 %18, i32 %19, i32 1, i8* %call24) #6, !dbg !168
  call void @llvm.dbg.value(metadata i32* %nrows, i64 0, metadata !30, metadata !71), !dbg !121
  %20 = load i32* %nrows, align 4, !dbg !169, !tbaa !75
  %conv53 = zext i32 %20 to i64, !dbg !169
  call void @llvm.dbg.value(metadata i8*** %data_input, i64 0, metadata !23, metadata !71), !dbg !125
  %21 = load i8*** %data_input, align 8, !dbg !170, !tbaa !93
  call void @free_array_2d(i64 %conv53, i8** %21) #6, !dbg !171
  call void @llvm.dbg.value(metadata i32* %nrows, i64 0, metadata !30, metadata !71), !dbg !121
  %22 = load i32* %nrows, align 4, !dbg !172, !tbaa !75
  %conv54 = zext i32 %22 to i64, !dbg !172
  call void @free_array_2d(i64 %conv54, i8** %data_output.0) #6, !dbg !173
  br label %return, !dbg !174

return:                                           ; preds = %if.end51, %if.then16
  %retval.0 = phi i32 [ 1, %if.then16 ], [ 0, %if.end51 ]
  ret i32 %retval.0, !dbg !175
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32 @getopt(i32, i8**, i8*) #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

declare i8** @create_array_2d(i64, i64, i8 zeroext) #4

declare i32 @jpeg_decompress(i8***, i32*, i32*, i32*, i8*) #4

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: nounwind readonly
declare i64 @strlen(i8* nocapture) #5

; Function Attrs: nounwind
declare i8* @strncpy(i8*, i8* nocapture readonly, i64) #2

; Function Attrs: nounwind uwtable
define void @do_it(i8** %in, i8** %out, i32 %nx, i32 %ny) #0 {
entry:
  %T = alloca [3 x [3 x float]], align 16
  %S = alloca [3 x [3 x float]], align 16
  %SH = alloca [3 x [3 x float]], align 16
  tail call void @llvm.dbg.value(metadata i8** %in, i64 0, metadata !42, metadata !71), !dbg !177
  tail call void @llvm.dbg.value(metadata i8** %out, i64 0, metadata !43, metadata !71), !dbg !178
  tail call void @llvm.dbg.value(metadata i32 %nx, i64 0, metadata !44, metadata !71), !dbg !179
  tail call void @llvm.dbg.value(metadata i32 %ny, i64 0, metadata !45, metadata !71), !dbg !180
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !46, metadata !71), !dbg !181
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !47, metadata !71), !dbg !182
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !48, metadata !71), !dbg !183
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !50, metadata !71), !dbg !184
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !51, metadata !71), !dbg !185
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !52, metadata !71), !dbg !186
  tail call void @llvm.dbg.value(metadata i32 50, i64 0, metadata !47, metadata !71), !dbg !182
  tail call void @llvm.dbg.value(metadata i32 50, i64 0, metadata !46, metadata !71), !dbg !181
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !50, metadata !71), !dbg !184
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !48, metadata !71), !dbg !183
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !51, metadata !71), !dbg !185
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !52, metadata !71), !dbg !186
  %0 = bitcast [3 x [3 x float]]* %T to i8*, !dbg !187
  call void @llvm.lifetime.start(i64 36, i8* %0) #6, !dbg !187
  tail call void @llvm.dbg.declare(metadata [3 x [3 x float]]* %T, metadata !53, metadata !71), !dbg !188
  %arrayinit.begin1 = getelementptr inbounds [3 x [3 x float]]* %T, i64 0, i64 0, i64 0, !dbg !188
  store float 1.000000e+00, float* %arrayinit.begin1, align 16, !dbg !188, !tbaa !189
  %arrayinit.element = getelementptr inbounds [3 x [3 x float]]* %T, i64 0, i64 0, i64 1, !dbg !188
  store float 0.000000e+00, float* %arrayinit.element, align 4, !dbg !188, !tbaa !189
  %arrayinit.element2 = getelementptr inbounds [3 x [3 x float]]* %T, i64 0, i64 0, i64 2, !dbg !188
  store float 5.000000e+01, float* %arrayinit.element2, align 8, !dbg !188, !tbaa !189
  %arrayinit.begin4 = getelementptr inbounds [3 x [3 x float]]* %T, i64 0, i64 1, i64 0, !dbg !188
  store float 0.000000e+00, float* %arrayinit.begin4, align 4, !dbg !188, !tbaa !189
  %arrayinit.element5 = getelementptr inbounds [3 x [3 x float]]* %T, i64 0, i64 1, i64 1, !dbg !188
  store float 1.000000e+00, float* %arrayinit.element5, align 4, !dbg !188, !tbaa !189
  %arrayinit.element6 = getelementptr inbounds [3 x [3 x float]]* %T, i64 0, i64 1, i64 2, !dbg !188
  store float 5.000000e+01, float* %arrayinit.element6, align 4, !dbg !188, !tbaa !189
  %arrayinit.begin9 = getelementptr inbounds [3 x [3 x float]]* %T, i64 0, i64 2, i64 0, !dbg !188
  store float 0.000000e+00, float* %arrayinit.begin9, align 8, !dbg !188, !tbaa !189
  %arrayinit.element10 = getelementptr inbounds [3 x [3 x float]]* %T, i64 0, i64 2, i64 1, !dbg !188
  store float 0.000000e+00, float* %arrayinit.element10, align 4, !dbg !188, !tbaa !189
  %arrayinit.element11 = getelementptr inbounds [3 x [3 x float]]* %T, i64 0, i64 2, i64 2, !dbg !188
  store float 1.000000e+00, float* %arrayinit.element11, align 8, !dbg !188, !tbaa !189
  %1 = bitcast [3 x [3 x float]]* %S to i8*, !dbg !191
  call void @llvm.lifetime.start(i64 36, i8* %1) #6, !dbg !191
  tail call void @llvm.dbg.declare(metadata [3 x [3 x float]]* %S, metadata !57, metadata !71), !dbg !192
  %arrayinit.begin13 = getelementptr inbounds [3 x [3 x float]]* %S, i64 0, i64 0, i64 0, !dbg !192
  store float 5.000000e-01, float* %arrayinit.begin13, align 16, !dbg !192, !tbaa !189
  %arrayinit.element14 = getelementptr inbounds [3 x [3 x float]]* %S, i64 0, i64 0, i64 1, !dbg !192
  store float 0.000000e+00, float* %arrayinit.element14, align 4, !dbg !192, !tbaa !189
  %arrayinit.element15 = getelementptr inbounds [3 x [3 x float]]* %S, i64 0, i64 0, i64 2, !dbg !192
  store float 0.000000e+00, float* %arrayinit.element15, align 8, !dbg !192, !tbaa !189
  %arrayinit.begin17 = getelementptr inbounds [3 x [3 x float]]* %S, i64 0, i64 1, i64 0, !dbg !192
  store float 0.000000e+00, float* %arrayinit.begin17, align 4, !dbg !192, !tbaa !189
  %arrayinit.element18 = getelementptr inbounds [3 x [3 x float]]* %S, i64 0, i64 1, i64 1, !dbg !192
  store float 5.000000e-01, float* %arrayinit.element18, align 4, !dbg !192, !tbaa !189
  %arrayinit.element19 = getelementptr inbounds [3 x [3 x float]]* %S, i64 0, i64 1, i64 2, !dbg !192
  store float 0.000000e+00, float* %arrayinit.element19, align 4, !dbg !192, !tbaa !189
  %arrayinit.begin21 = getelementptr inbounds [3 x [3 x float]]* %S, i64 0, i64 2, i64 0, !dbg !192
  store float 0.000000e+00, float* %arrayinit.begin21, align 8, !dbg !192, !tbaa !189
  %arrayinit.element22 = getelementptr inbounds [3 x [3 x float]]* %S, i64 0, i64 2, i64 1, !dbg !192
  store float 0.000000e+00, float* %arrayinit.element22, align 4, !dbg !192, !tbaa !189
  %arrayinit.element23 = getelementptr inbounds [3 x [3 x float]]* %S, i64 0, i64 2, i64 2, !dbg !192
  store float 1.000000e+00, float* %arrayinit.element23, align 8, !dbg !192, !tbaa !189
  %2 = bitcast [3 x [3 x float]]* %SH to i8*, !dbg !193
  call void @llvm.lifetime.start(i64 36, i8* %2) #6, !dbg !193
  tail call void @llvm.dbg.declare(metadata [3 x [3 x float]]* %SH, metadata !58, metadata !71), !dbg !194
  %arrayinit.begin25 = getelementptr inbounds [3 x [3 x float]]* %SH, i64 0, i64 0, i64 0, !dbg !194
  store float 1.000000e+00, float* %arrayinit.begin25, align 16, !dbg !194, !tbaa !189
  %arrayinit.element26 = getelementptr inbounds [3 x [3 x float]]* %SH, i64 0, i64 0, i64 1, !dbg !194
  store float 5.000000e-01, float* %arrayinit.element26, align 4, !dbg !194, !tbaa !189
  %arrayinit.element27 = getelementptr inbounds [3 x [3 x float]]* %SH, i64 0, i64 0, i64 2, !dbg !194
  store float 0.000000e+00, float* %arrayinit.element27, align 8, !dbg !194, !tbaa !189
  %arrayinit.begin29 = getelementptr inbounds [3 x [3 x float]]* %SH, i64 0, i64 1, i64 0, !dbg !194
  store float 5.000000e-01, float* %arrayinit.begin29, align 4, !dbg !194, !tbaa !189
  %arrayinit.element30 = getelementptr inbounds [3 x [3 x float]]* %SH, i64 0, i64 1, i64 1, !dbg !194
  store float 1.000000e+00, float* %arrayinit.element30, align 4, !dbg !194, !tbaa !189
  %arrayinit.element31 = getelementptr inbounds [3 x [3 x float]]* %SH, i64 0, i64 1, i64 2, !dbg !194
  store float 0.000000e+00, float* %arrayinit.element31, align 4, !dbg !194, !tbaa !189
  %arrayinit.begin33 = getelementptr inbounds [3 x [3 x float]]* %SH, i64 0, i64 2, i64 0, !dbg !194
  store float 0.000000e+00, float* %arrayinit.begin33, align 8, !dbg !194, !tbaa !189
  %arrayinit.element34 = getelementptr inbounds [3 x [3 x float]]* %SH, i64 0, i64 2, i64 1, !dbg !194
  store float 0.000000e+00, float* %arrayinit.element34, align 4, !dbg !194, !tbaa !189
  %arrayinit.element35 = getelementptr inbounds [3 x [3 x float]]* %SH, i64 0, i64 2, i64 2, !dbg !194
  store float 1.000000e+00, float* %arrayinit.element35, align 8, !dbg !194, !tbaa !189
  %conv36 = sext i32 %ny to i64, !dbg !195
  %conv37 = sext i32 %nx to i64, !dbg !196
  tail call void @arr_set_value(i8** %out, i64 %conv36, i64 %conv37, i8 zeroext 0) #6, !dbg !197
  call void @transform(i8** %in, i8** %out, i32 %nx, i32 %ny, i32 3, i32 3, float* %arrayinit.begin1) #6, !dbg !198
  call void @arr_set_value(i8** %in, i64 %conv36, i64 %conv37, i8 zeroext 0) #6, !dbg !199
  call void @transform(i8** %out, i8** %in, i32 %nx, i32 %ny, i32 3, i32 3, float* %arrayinit.begin13) #6, !dbg !200
  call void @arr_set_value(i8** %out, i64 %conv36, i64 %conv37, i8 zeroext 0) #6, !dbg !201
  call void @transform(i8** %in, i8** %out, i32 %nx, i32 %ny, i32 3, i32 3, float* %arrayinit.begin25) #6, !dbg !202
  call void @llvm.lifetime.end(i64 36, i8* %2) #6, !dbg !203
  call void @llvm.lifetime.end(i64 36, i8* %1) #6, !dbg !203
  call void @llvm.lifetime.end(i64 36, i8* %0) #6, !dbg !203
  ret void, !dbg !203
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

declare i32 @jpeg_compress(i8**, i32, i32, i32, i8*) #4

declare void @free_array_2d(i64, i8**) #4

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #6

declare void @arr_set_value(i8**, i64, i64, i8 zeroext) #4

declare void @transform(i8**, i8**, i32, i32, i32, i32, float*) #4

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #6

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #6

; Function Attrs: nounwind
declare i32 @putchar(i32) #6

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #6

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { cold nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { cold }
attributes #10 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!68, !69}
!llvm.ident = !{!70}

!0 = !{!"0x11\0012\00clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)\001\00\000\00\001", !1, !2, !3, !9, !2, !2} ; [ DW_TAG_compile_unit ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c] [DW_LANG_C99]
!1 = !{!"transformation_driver.c", !"/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine"}
!2 = !{}
!3 = !{!4, !6, !7, !8}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!5 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!6 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!7 = !{!"0xf\00\000\0064\0064\000\000", null, null, !4} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!8 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!9 = !{!10, !38, !59}
!10 = !{!"0x2e\00main\00main\00\0022\000\001\000\000\00256\001\0022", !1, !11, !12, null, i32 (i32, i8**)* @main, null, null, !14} ; [ DW_TAG_subprogram ] [line 22] [def] [main]
!11 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!12 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !13, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!13 = !{!6, !6, !7}
!14 = !{!15, !16, !17, !18, !19, !20, !21, !22, !23, !29, !30, !33, !34, !35, !36, !37}
!15 = !{!"0x101\00argc\0016777238\000", !10, !11, !6} ; [ DW_TAG_arg_variable ] [argc] [line 22]
!16 = !{!"0x101\00argv\0033554454\000", !10, !11, !7} ; [ DW_TAG_arg_variable ] [argv] [line 22]
!17 = !{!"0x100\00index\0026\000", !10, !11, !6}  ; [ DW_TAG_auto_variable ] [index] [line 26]
!18 = !{!"0x100\00verbose_output\0026\000", !10, !11, !6} ; [ DW_TAG_auto_variable ] [verbose_output] [line 26]
!19 = !{!"0x100\00arg\0026\000", !10, !11, !6}    ; [ DW_TAG_auto_variable ] [arg] [line 26]
!20 = !{!"0x100\00i\0026\000", !10, !11, !6}      ; [ DW_TAG_auto_variable ] [i] [line 26]
!21 = !{!"0x100\00j\0026\000", !10, !11, !6}      ; [ DW_TAG_auto_variable ] [j] [line 26]
!22 = !{!"0x100\00_size_arr\0028\000", !10, !11, !6} ; [ DW_TAG_auto_variable ] [_size_arr] [line 28]
!23 = !{!"0x100\00data_input\0030\000", !10, !11, !24} ; [ DW_TAG_auto_variable ] [data_input] [line 30]
!24 = !{!"0xf\00\000\0064\0064\000\000", null, null, !25} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!25 = !{!"0xf\00\000\0064\0064\000\000", null, null, !26} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from u_int8_t]
!26 = !{!"0x16\00u_int8_t\00200\000\000\000\000", !27, null, !28} ; [ DW_TAG_typedef ] [u_int8_t] [line 200, size 0, align 0, offset 0] [from unsigned char]
!27 = !{!"/usr/include/x86_64-linux-gnu/sys/types.h", !"/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine"}
!28 = !{!"0x24\00unsigned char\000\008\008\000\000\008", null, null} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!29 = !{!"0x100\00data_output\0031\000", !10, !11, !24} ; [ DW_TAG_auto_variable ] [data_output] [line 31]
!30 = !{!"0x100\00nrows\0033\000", !10, !11, !31} ; [ DW_TAG_auto_variable ] [nrows] [line 33]
!31 = !{!"0x16\00u_int32_t\00202\000\000\000\000", !27, null, !32} ; [ DW_TAG_typedef ] [u_int32_t] [line 202, size 0, align 0, offset 0] [from unsigned int]
!32 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!33 = !{!"0x100\00ncols\0033\000", !10, !11, !31} ; [ DW_TAG_auto_variable ] [ncols] [line 33]
!34 = !{!"0x100\00nchannels\0033\000", !10, !11, !31} ; [ DW_TAG_auto_variable ] [nchannels] [line 33]
!35 = !{!"0x100\00opt\0035\000", !10, !11, !6}    ; [ DW_TAG_auto_variable ] [opt] [line 35]
!36 = !{!"0x100\00filename_in\0036\000", !10, !11, !4} ; [ DW_TAG_auto_variable ] [filename_in] [line 36]
!37 = !{!"0x100\00filename_out\0037\000", !10, !11, !4} ; [ DW_TAG_auto_variable ] [filename_out] [line 37]
!38 = !{!"0x2e\00do_it\00do_it\00\00106\000\001\000\000\00256\001\00106", !1, !11, !39, null, void (i8**, i8**, i32, i32)* @do_it, null, null, !41} ; [ DW_TAG_subprogram ] [line 106] [def] [do_it]
!39 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !40, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!40 = !{null, !24, !24, !6, !6}
!41 = !{!42, !43, !44, !45, !46, !47, !48, !50, !51, !52, !53, !57, !58}
!42 = !{!"0x101\00in\0016777322\000", !38, !11, !24} ; [ DW_TAG_arg_variable ] [in] [line 106]
!43 = !{!"0x101\00out\0033554538\000", !38, !11, !24} ; [ DW_TAG_arg_variable ] [out] [line 106]
!44 = !{!"0x101\00nx\0050331754\000", !38, !11, !6} ; [ DW_TAG_arg_variable ] [nx] [line 106]
!45 = !{!"0x101\00ny\0067108970\000", !38, !11, !6} ; [ DW_TAG_arg_variable ] [ny] [line 106]
!46 = !{!"0x100\00dx\00108\000", !38, !11, !6}    ; [ DW_TAG_auto_variable ] [dx] [line 108]
!47 = !{!"0x100\00dy\00108\000", !38, !11, !6}    ; [ DW_TAG_auto_variable ] [dy] [line 108]
!48 = !{!"0x100\00sx\00110\000", !38, !11, !49}   ; [ DW_TAG_auto_variable ] [sx] [line 110]
!49 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!50 = !{!"0x100\00sy\00110\000", !38, !11, !49}   ; [ DW_TAG_auto_variable ] [sy] [line 110]
!51 = !{!"0x100\00shx\00111\000", !38, !11, !49}  ; [ DW_TAG_auto_variable ] [shx] [line 111]
!52 = !{!"0x100\00shy\00111\000", !38, !11, !49}  ; [ DW_TAG_auto_variable ] [shy] [line 111]
!53 = !{!"0x100\00T\00121\000", !38, !11, !54}    ; [ DW_TAG_auto_variable ] [T] [line 121]
!54 = !{!"0x1\00\000\00288\0032\000\000\000", null, null, !49, !55, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 288, align 32, offset 0] [from float]
!55 = !{!56, !56}
!56 = !{!"0x21\000\003"}                          ; [ DW_TAG_subrange_type ] [0, 2]
!57 = !{!"0x100\00S\00124\000", !38, !11, !54}    ; [ DW_TAG_auto_variable ] [S] [line 124]
!58 = !{!"0x100\00SH\00127\000", !38, !11, !54}   ; [ DW_TAG_auto_variable ] [SH] [line 127]
!59 = !{!"0x2e\00atoi\00atoi\00\00278\000\001\000\000\00256\001\00279", !60, !61, !62, null, null, null, null, !66} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!60 = !{!"/usr/include/stdlib.h", !"/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine"}
!61 = !{!"0x29", !60}                             ; [ DW_TAG_file_type ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine//usr/include/stdlib.h]
!62 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !63, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!63 = !{!6, !64}
!64 = !{!"0xf\00\000\0064\0064\000\000", null, null, !65} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!65 = !{!"0x26\00\000\000\000\000\000", null, null, !5} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!66 = !{!67}
!67 = !{!"0x101\00__nptr\0016777494\000", !59, !61, !64} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!68 = !{i32 2, !"Dwarf Version", i32 4}
!69 = !{i32 2, !"Debug Info Version", i32 2}
!70 = !{!"clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)"}
!71 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!72 = !MDLocation(line: 22, column: 14, scope: !10)
!73 = !MDLocation(line: 22, column: 26, scope: !10)
!74 = !MDLocation(line: 24, column: 2, scope: !10)
!75 = !{!76, !76, i64 0}
!76 = !{!"int", !77, i64 0}
!77 = !{!"omnipotent char", !78, i64 0}
!78 = !{!"Simple C/C++ TBAA"}
!79 = !MDLocation(line: 26, column: 6, scope: !10)
!80 = !MDLocation(line: 26, column: 17, scope: !10)
!81 = !MDLocation(line: 26, column: 37, scope: !10)
!82 = !MDLocation(line: 26, column: 46, scope: !10)
!83 = !MDLocation(line: 26, column: 52, scope: !10)
!84 = !MDLocation(line: 28, column: 6, scope: !10)
!85 = !MDLocation(line: 36, column: 11, scope: !10)
!86 = !MDLocation(line: 37, column: 11, scope: !10)
!87 = !MDLocation(line: 39, column: 5, scope: !10)
!88 = !MDLocation(line: 39, column: 19, scope: !10)
!89 = !MDLocation(line: 35, column: 9, scope: !10)
!90 = !MDLocation(line: 42, column: 22, scope: !91)
!91 = !{!"0xb\0040\0020\001", !1, !92}            ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!92 = !{!"0xb\0039\0055\000", !1, !10}            ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!93 = !{!94, !94, i64 0}
!94 = !{!"any pointer", !77, i64 0}
!95 = !MDLocation(line: 43, column: 9, scope: !91)
!96 = !MDLocation(line: 48, column: 17, scope: !91)
!97 = !MDLocation(line: 48, column: 53, scope: !91)
!98 = !MDLocation(line: 48, column: 9, scope: !91)
!99 = !MDLocation(line: 49, column: 9, scope: !91)
!100 = !MDLocation(line: 53, column: 9, scope: !10)
!101 = !MDLocation(line: 54, column: 20, scope: !102)
!102 = !{!"0xb\0054\007\004", !1, !103}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!103 = !{!"0xb\0053\0023\003", !1, !104}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!104 = !{!"0xb\0053\009\002", !1, !10}            ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!105 = !MDLocation(line: 54, column: 28, scope: !106)
!106 = !{!"0xb\0054\007\005", !1, !102}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!107 = !MDLocation(line: 54, column: 7, scope: !102)
!108 = !MDLocation(line: 56, column: 17, scope: !109)
!109 = !{!"0xb\0054\0051\006", !1, !106}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!110 = !MDLocation(line: 56, column: 9, scope: !109)
!111 = !MDLocation(line: 58, column: 27, scope: !112)
!112 = !{!"0xb\0056\0024\007", !1, !109}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!113 = !{!"0x101\00__nptr\0016777494\000", !59, !61, !64, !114} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!114 = !MDLocation(line: 58, column: 22, scope: !112)
!115 = !MDLocation(line: 278, column: 1, scope: !59, inlinedAt: !114)
!116 = !MDLocation(line: 280, column: 16, scope: !59, inlinedAt: !114)
!117 = !MDLocation(line: 280, column: 10, scope: !59, inlinedAt: !114)
!118 = !MDLocation(line: 59, column: 11, scope: !112)
!119 = !MDLocation(line: 33, column: 22, scope: !10)
!120 = !MDLocation(line: 63, column: 15, scope: !103)
!121 = !MDLocation(line: 33, column: 15, scope: !10)
!122 = !MDLocation(line: 63, column: 7, scope: !103)
!123 = !MDLocation(line: 67, column: 37, scope: !103)
!124 = !MDLocation(line: 67, column: 21, scope: !103)
!125 = !MDLocation(line: 30, column: 17, scope: !10)
!126 = !MDLocation(line: 67, column: 7, scope: !103)
!127 = !MDLocation(line: 68, column: 21, scope: !103)
!128 = !MDLocation(line: 31, column: 17, scope: !10)
!129 = !MDLocation(line: 70, column: 5, scope: !103)
!130 = !MDLocation(line: 33, column: 29, scope: !10)
!131 = !MDLocation(line: 72, column: 9, scope: !132)
!132 = !{!"0xb\0072\009\009", !1, !133}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!133 = !{!"0xb\0070\0010\008", !1, !104}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!134 = !MDLocation(line: 72, column: 9, scope: !133)
!135 = !MDLocation(line: 73, column: 15, scope: !136)
!136 = !{!"0xb\0072\0079\0010", !1, !132}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!137 = !MDLocation(line: 73, column: 7, scope: !136)
!138 = !MDLocation(line: 74, column: 7, scope: !136)
!139 = !MDLocation(line: 76, column: 36, scope: !133)
!140 = !MDLocation(line: 76, column: 43, scope: !133)
!141 = !MDLocation(line: 76, column: 20, scope: !133)
!142 = !MDLocation(line: 79, column: 49, scope: !10)
!143 = !MDLocation(line: 79, column: 28, scope: !10)
!144 = !MDLocation(line: 80, column: 5, scope: !10)
!145 = !MDLocation(line: 81, column: 5, scope: !10)
!146 = !MDLocation(line: 85, column: 11, scope: !10)
!147 = !MDLocation(line: 85, column: 36, scope: !10)
!148 = !MDLocation(line: 85, column: 43, scope: !10)
!149 = !MDLocation(line: 85, column: 5, scope: !10)
!150 = !MDLocation(line: 88, column: 9, scope: !10)
!151 = !MDLocation(line: 89, column: 20, scope: !152)
!152 = !{!"0xb\0089\008\0014", !1, !153}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!153 = !{!"0xb\0089\008\0013", !1, !154}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!154 = !{!"0xb\0088\0025\0012", !1, !155}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!155 = !{!"0xb\0088\009\0011", !1, !10}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!156 = !MDLocation(line: 89, column: 8, scope: !153)
!157 = !MDLocation(line: 90, column: 10, scope: !158)
!158 = !{!"0xb\0090\0010\0016", !1, !159}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!159 = !{!"0xb\0089\0040\0015", !1, !152}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!160 = !MDLocation(line: 91, column: 27, scope: !161)
!161 = !{!"0xb\0090\0042\0018", !1, !162}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!162 = !{!"0xb\0090\0010\0017", !1, !158}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!163 = !{!77, !77, i64 0}
!164 = !MDLocation(line: 91, column: 12, scope: !161)
!165 = !MDLocation(line: 93, column: 10, scope: !159)
!166 = !MDLocation(line: 97, column: 33, scope: !10)
!167 = !MDLocation(line: 97, column: 40, scope: !10)
!168 = !MDLocation(line: 97, column: 6, scope: !10)
!169 = !MDLocation(line: 99, column: 20, scope: !10)
!170 = !MDLocation(line: 99, column: 27, scope: !10)
!171 = !MDLocation(line: 99, column: 6, scope: !10)
!172 = !MDLocation(line: 100, column: 20, scope: !10)
!173 = !MDLocation(line: 100, column: 6, scope: !10)
!174 = !MDLocation(line: 102, column: 1, scope: !10)
!175 = !MDLocation(line: 102, column: 1, scope: !176)
!176 = !{!"0xb\001", !1, !10}                     ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c]
!177 = !MDLocation(line: 106, column: 23, scope: !38)
!178 = !MDLocation(line: 106, column: 38, scope: !38)
!179 = !MDLocation(line: 106, column: 47, scope: !38)
!180 = !MDLocation(line: 106, column: 55, scope: !38)
!181 = !MDLocation(line: 108, column: 6, scope: !38)
!182 = !MDLocation(line: 108, column: 14, scope: !38)
!183 = !MDLocation(line: 110, column: 8, scope: !38)
!184 = !MDLocation(line: 110, column: 16, scope: !38)
!185 = !MDLocation(line: 111, column: 8, scope: !38)
!186 = !MDLocation(line: 111, column: 17, scope: !38)
!187 = !MDLocation(line: 121, column: 2, scope: !38)
!188 = !MDLocation(line: 121, column: 8, scope: !38)
!189 = !{!190, !190, i64 0}
!190 = !{!"float", !77, i64 0}
!191 = !MDLocation(line: 124, column: 2, scope: !38)
!192 = !MDLocation(line: 124, column: 8, scope: !38)
!193 = !MDLocation(line: 127, column: 2, scope: !38)
!194 = !MDLocation(line: 127, column: 8, scope: !38)
!195 = !MDLocation(line: 129, column: 21, scope: !38)
!196 = !MDLocation(line: 129, column: 25, scope: !38)
!197 = !MDLocation(line: 129, column: 2, scope: !38)
!198 = !MDLocation(line: 130, column: 2, scope: !38)
!199 = !MDLocation(line: 132, column: 2, scope: !38)
!200 = !MDLocation(line: 133, column: 2, scope: !38)
!201 = !MDLocation(line: 135, column: 2, scope: !38)
!202 = !MDLocation(line: 136, column: 2, scope: !38)
!203 = !MDLocation(line: 139, column: 1, scope: !38)
