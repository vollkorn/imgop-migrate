; ModuleID = 'convolve_driver.c'
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
@.str4 = private unnamed_addr constant [17 x i8] c"_compressed.jpg\00\00", align 1
@main.kernel_3_3 = private unnamed_addr constant [9 x float] [float 0x3FB99999A0000000, float 0x3FB99999A0000000, float 0x3FB99999A0000000, float 0x3FB99999A0000000, float 0x3FB99999A0000000, float 0x3FB99999A0000000, float 0x3FB99999A0000000, float 0x3FB99999A0000000, float 0x3FB99999A0000000], align 16
@main.kernel_5_5 = private unnamed_addr constant [25 x float] [float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00], align 16
@main.kernel_7_7 = private unnamed_addr constant [49 x float] [float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00], align 16
@.str5 = private unnamed_addr constant [22 x i8] c"invalid filter size!\0A\00", align 1
@.str6 = private unnamed_addr constant [4 x i8] c"%d\09\00", align 1
@.str7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !22, metadata !23), !dbg !24
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !25, metadata !23), !dbg !26
  store i32 0, i32* @opterr, align 4, !dbg !27
  call void @llvm.dbg.declare(metadata i32* %index, metadata !28, metadata !23), !dbg !29
  store i32 0, i32* %index, align 4, !dbg !29
  call void @llvm.dbg.declare(metadata i32* %verbose_output, metadata !30, metadata !23), !dbg !31
  store i32 0, i32* %verbose_output, align 4, !dbg !31
  call void @llvm.dbg.declare(metadata i32* %arg, metadata !32, metadata !23), !dbg !33
  store i32 0, i32* %arg, align 4, !dbg !33
  call void @llvm.dbg.declare(metadata i32* %_size_arr, metadata !34, metadata !23), !dbg !35
  store i32 0, i32* %_size_arr, align 4, !dbg !35
  call void @llvm.dbg.declare(metadata i32* %_size_filter, metadata !36, metadata !23), !dbg !37
  store i32 0, i32* %_size_filter, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata i8*** %data_input, metadata !38, metadata !23), !dbg !41
  call void @llvm.dbg.declare(metadata i8*** %data_output, metadata !42, metadata !23), !dbg !43
  call void @llvm.dbg.declare(metadata i32* %nrows, metadata !44, metadata !23), !dbg !47
  call void @llvm.dbg.declare(metadata i32* %ncols, metadata !48, metadata !23), !dbg !49
  call void @llvm.dbg.declare(metadata i32* %nchannels, metadata !50, metadata !23), !dbg !51
  call void @llvm.dbg.declare(metadata i32* %opt, metadata !52, metadata !23), !dbg !53
  call void @llvm.dbg.declare(metadata i8** %filename_in, metadata !54, metadata !23), !dbg !55
  store i8* null, i8** %filename_in, align 8, !dbg !55
  call void @llvm.dbg.declare(metadata i8** %filename_out, metadata !56, metadata !23), !dbg !57
  store i8* null, i8** %filename_out, align 8, !dbg !57
  br label %while.cond, !dbg !58

while.cond:                                       ; preds = %sw.epilog, %entry
  %0 = load i32* %argc.addr, align 4, !dbg !59
  %1 = load i8*** %argv.addr, align 8, !dbg !62
  %call = call i32 @getopt(i32 %0, i8** %1, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0)) #6, !dbg !63
  store i32 %call, i32* %opt, align 4, !dbg !64
  %cmp = icmp ne i32 %call, -1, !dbg !65
  br i1 %cmp, label %while.body, label %while.end, !dbg !58

while.body:                                       ; preds = %while.cond
  %2 = load i32* %opt, align 4, !dbg !66
  switch i32 %2, label %sw.default [
    i32 102, label %sw.bb
    i32 118, label %sw.bb1
  ], !dbg !68

sw.bb:                                            ; preds = %while.body
  %3 = load i8** @optarg, align 8, !dbg !69
  store i8* %3, i8** %filename_in, align 8, !dbg !71
  br label %sw.epilog, !dbg !72

sw.bb1:                                           ; preds = %while.body
  store i32 1, i32* %verbose_output, align 4, !dbg !73
  br label %sw.epilog, !dbg !74

sw.default:                                       ; preds = %while.body
  %4 = load %struct._IO_FILE** @stderr, align 8, !dbg !75
  %5 = load i8*** %argv.addr, align 8, !dbg !76
  %arrayidx = getelementptr inbounds i8** %5, i64 0, !dbg !76
  %6 = load i8** %arrayidx, align 8, !dbg !76
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([24 x i8]* @.str1, i32 0, i32 0), i8* %6), !dbg !77
  call void @exit(i32 1) #7, !dbg !78
  unreachable, !dbg !78

sw.epilog:                                        ; preds = %sw.bb1, %sw.bb
  br label %while.cond, !dbg !58

while.end:                                        ; preds = %while.cond
  %7 = load i8** %filename_in, align 8, !dbg !79
  %tobool = icmp ne i8* %7, null, !dbg !81
  br i1 %tobool, label %if.else, label %if.then, !dbg !81

if.then:                                          ; preds = %while.end
  %8 = load i32* @optind, align 4, !dbg !82
  store i32 %8, i32* %index, align 4, !dbg !85
  br label %for.cond, !dbg !85

for.cond:                                         ; preds = %for.inc, %if.then
  %9 = load i32* %index, align 4, !dbg !86
  %10 = load i32* %argc.addr, align 4, !dbg !90
  %cmp3 = icmp slt i32 %9, %10, !dbg !91
  br i1 %cmp3, label %for.body, label %for.end, !dbg !92

for.body:                                         ; preds = %for.cond
  %11 = load i32* %arg, align 4, !dbg !93
  %inc = add nsw i32 %11, 1, !dbg !93
  store i32 %inc, i32* %arg, align 4, !dbg !93
  switch i32 %11, label %sw.epilog11 [
    i32 0, label %sw.bb4
    i32 1, label %sw.bb7
  ], !dbg !95

sw.bb4:                                           ; preds = %for.body
  %12 = load i32* %index, align 4, !dbg !96
  %idxprom = sext i32 %12 to i64, !dbg !98
  %13 = load i8*** %argv.addr, align 8, !dbg !98
  %arrayidx5 = getelementptr inbounds i8** %13, i64 %idxprom, !dbg !98
  %14 = load i8** %arrayidx5, align 8, !dbg !98
  %call6 = call i32 @atoi(i8* %14) #8, !dbg !99
  store i32 %call6, i32* %_size_arr, align 4, !dbg !100
  br label %sw.epilog11, !dbg !101

sw.bb7:                                           ; preds = %for.body
  %15 = load i32* %index, align 4, !dbg !102
  %idxprom8 = sext i32 %15 to i64, !dbg !103
  %16 = load i8*** %argv.addr, align 8, !dbg !103
  %arrayidx9 = getelementptr inbounds i8** %16, i64 %idxprom8, !dbg !103
  %17 = load i8** %arrayidx9, align 8, !dbg !103
  %call10 = call i32 @atoi(i8* %17) #8, !dbg !104
  store i32 %call10, i32* %_size_filter, align 4, !dbg !105
  br label %sw.epilog11, !dbg !106

sw.epilog11:                                      ; preds = %for.body, %sw.bb7, %sw.bb4
  br label %for.inc, !dbg !107

for.inc:                                          ; preds = %sw.epilog11
  %18 = load i32* %index, align 4, !dbg !108
  %inc12 = add nsw i32 %18, 1, !dbg !108
  store i32 %inc12, i32* %index, align 4, !dbg !108
  br label %for.cond, !dbg !109

for.end:                                          ; preds = %for.cond
  %19 = load i32* %_size_arr, align 4, !dbg !110
  store i32 %19, i32* %ncols, align 4, !dbg !111
  store i32 %19, i32* %nrows, align 4, !dbg !112
  store i8* getelementptr inbounds ([6 x i8]* @.str2, i32 0, i32 0), i8** %filename_in, align 8, !dbg !113
  %20 = load i32* %nrows, align 4, !dbg !114
  %conv = zext i32 %20 to i64, !dbg !114
  %21 = load i32* %ncols, align 4, !dbg !115
  %conv13 = zext i32 %21 to i64, !dbg !115
  %call14 = call i8** @create_array_2d(i64 %conv, i64 %conv13, i8 zeroext 1), !dbg !116
  store i8** %call14, i8*** %data_input, align 8, !dbg !117
  %22 = load i32* %nrows, align 4, !dbg !118
  %conv15 = zext i32 %22 to i64, !dbg !118
  %23 = load i32* %ncols, align 4, !dbg !119
  %conv16 = zext i32 %23 to i64, !dbg !119
  %call17 = call i8** @create_array_2d(i64 %conv15, i64 %conv16, i8 zeroext 0), !dbg !120
  store i8** %call17, i8*** %data_output, align 8, !dbg !121
  br label %if.end38, !dbg !122

if.else:                                          ; preds = %while.end
  %24 = load i8** %filename_in, align 8, !dbg !123
  %call18 = call i32 @jpeg_decompress(i8*** %data_input, i32* %ncols, i32* %nrows, i32* %nchannels, i8* %24), !dbg !126
  %tobool19 = icmp ne i32 %call18, 0, !dbg !127
  br i1 %tobool19, label %if.then20, label %if.end, !dbg !127

if.then20:                                        ; preds = %if.else
  %25 = load %struct._IO_FILE** @stderr, align 8, !dbg !128
  %call21 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([27 x i8]* @.str3, i32 0, i32 0)), !dbg !130
  store i32 1, i32* %retval, !dbg !131
  br label %return, !dbg !131

if.end:                                           ; preds = %if.else
  %26 = load i32* @optind, align 4, !dbg !132
  store i32 %26, i32* %index, align 4, !dbg !134
  br label %for.cond22, !dbg !134

for.cond22:                                       ; preds = %for.inc32, %if.end
  %27 = load i32* %index, align 4, !dbg !135
  %28 = load i32* %argc.addr, align 4, !dbg !139
  %cmp23 = icmp slt i32 %27, %28, !dbg !140
  br i1 %cmp23, label %for.body25, label %for.end34, !dbg !141

for.body25:                                       ; preds = %for.cond22
  %29 = load i32* %arg, align 4, !dbg !142
  %inc26 = add nsw i32 %29, 1, !dbg !142
  store i32 %inc26, i32* %arg, align 4, !dbg !142
  switch i32 %29, label %sw.epilog31 [
    i32 0, label %sw.bb27
  ], !dbg !144

sw.bb27:                                          ; preds = %for.body25
  %30 = load i32* %index, align 4, !dbg !145
  %idxprom28 = sext i32 %30 to i64, !dbg !147
  %31 = load i8*** %argv.addr, align 8, !dbg !147
  %arrayidx29 = getelementptr inbounds i8** %31, i64 %idxprom28, !dbg !147
  %32 = load i8** %arrayidx29, align 8, !dbg !147
  %call30 = call i32 @atoi(i8* %32) #8, !dbg !148
  store i32 %call30, i32* %_size_filter, align 4, !dbg !149
  br label %sw.epilog31, !dbg !150

sw.epilog31:                                      ; preds = %for.body25, %sw.bb27
  br label %for.inc32, !dbg !151

for.inc32:                                        ; preds = %sw.epilog31
  %33 = load i32* %index, align 4, !dbg !152
  %inc33 = add nsw i32 %33, 1, !dbg !152
  store i32 %inc33, i32* %index, align 4, !dbg !152
  br label %for.cond22, !dbg !153

for.end34:                                        ; preds = %for.cond22
  %34 = load i32* %nrows, align 4, !dbg !154
  %conv35 = zext i32 %34 to i64, !dbg !154
  %35 = load i32* %ncols, align 4, !dbg !155
  %conv36 = zext i32 %35 to i64, !dbg !155
  %call37 = call i8** @create_array_2d(i64 %conv35, i64 %conv36, i8 zeroext 0), !dbg !156
  store i8** %call37, i8*** %data_output, align 8, !dbg !157
  br label %if.end38

if.end38:                                         ; preds = %for.end34, %for.end
  %36 = load i8** %filename_in, align 8, !dbg !158
  %call39 = call i64 @strlen(i8* %36) #8, !dbg !159
  %add = add i64 %call39, 17, !dbg !159
  %add40 = add i64 %add, 1, !dbg !159
  %call41 = call noalias i8* @calloc(i64 1, i64 %add40) #6, !dbg !160
  store i8* %call41, i8** %filename_out, align 8, !dbg !161
  %37 = load i8** %filename_out, align 8, !dbg !162
  %38 = load i8** %filename_in, align 8, !dbg !163
  %39 = load i8** %filename_in, align 8, !dbg !164
  %call42 = call i64 @strlen(i8* %39) #8, !dbg !165
  %call43 = call i8* @strncpy(i8* %37, i8* %38, i64 %call42) #6, !dbg !166
  %40 = load i8** %filename_out, align 8, !dbg !167
  %call44 = call i8* @strcat(i8* %40, i8* getelementptr inbounds ([17 x i8]* @.str4, i32 0, i32 0)) #6, !dbg !168
  call void @llvm.dbg.declare(metadata i32* %i, metadata !169, metadata !23), !dbg !170
  store i32 0, i32* %i, align 4, !dbg !170
  call void @llvm.dbg.declare(metadata i32* %j, metadata !171, metadata !23), !dbg !172
  store i32 0, i32* %j, align 4, !dbg !172
  call void @llvm.dbg.declare(metadata [9 x float]* %kernel_3_3, metadata !173, metadata !23), !dbg !178
  %41 = bitcast [9 x float]* %kernel_3_3 to i8*, !dbg !178
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %41, i8* bitcast ([9 x float]* @main.kernel_3_3 to i8*), i64 36, i32 16, i1 false), !dbg !178
  call void @llvm.dbg.declare(metadata [25 x float]* %kernel_5_5, metadata !179, metadata !23), !dbg !183
  %42 = bitcast [25 x float]* %kernel_5_5 to i8*, !dbg !183
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %42, i8* bitcast ([25 x float]* @main.kernel_5_5 to i8*), i64 100, i32 16, i1 false), !dbg !183
  call void @llvm.dbg.declare(metadata [49 x float]* %kernel_7_7, metadata !184, metadata !23), !dbg !188
  %43 = bitcast [49 x float]* %kernel_7_7 to i8*, !dbg !188
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %43, i8* bitcast ([49 x float]* @main.kernel_7_7 to i8*), i64 196, i32 16, i1 false), !dbg !188
  %44 = load i32* %_size_filter, align 4, !dbg !189
  %cmp45 = icmp eq i32 %44, 3, !dbg !189
  br i1 %cmp45, label %if.then47, label %if.else49, !dbg !191

if.then47:                                        ; preds = %if.end38
  %45 = load i8*** %data_input, align 8, !dbg !192
  %46 = load i8*** %data_output, align 8, !dbg !193
  %arrayidx48 = getelementptr inbounds [9 x float]* %kernel_3_3, i32 0, i64 0, !dbg !194
  %47 = load i32* %ncols, align 4, !dbg !195
  %48 = load i32* %nrows, align 4, !dbg !196
  call void @convolve_loop_nest(i8** %45, i8** %46, float* %arrayidx48, i32 3, i32 %47, i32 %48), !dbg !197
  br label %if.end65, !dbg !197

if.else49:                                        ; preds = %if.end38
  %49 = load i32* %_size_filter, align 4, !dbg !198
  %cmp50 = icmp eq i32 %49, 5, !dbg !198
  br i1 %cmp50, label %if.then52, label %if.else54, !dbg !200

if.then52:                                        ; preds = %if.else49
  %50 = load i8*** %data_input, align 8, !dbg !201
  %51 = load i8*** %data_output, align 8, !dbg !202
  %arrayidx53 = getelementptr inbounds [25 x float]* %kernel_5_5, i32 0, i64 0, !dbg !203
  %52 = load i32* %ncols, align 4, !dbg !204
  %53 = load i32* %nrows, align 4, !dbg !205
  call void @convolve_loop_nest(i8** %50, i8** %51, float* %arrayidx53, i32 5, i32 %52, i32 %53), !dbg !206
  br label %if.end64, !dbg !206

if.else54:                                        ; preds = %if.else49
  %54 = load i32* %_size_filter, align 4, !dbg !207
  %cmp55 = icmp eq i32 %54, 7, !dbg !207
  br i1 %cmp55, label %if.then57, label %if.else59, !dbg !209

if.then57:                                        ; preds = %if.else54
  %55 = load i8*** %data_input, align 8, !dbg !210
  %56 = load i8*** %data_output, align 8, !dbg !211
  %arrayidx58 = getelementptr inbounds [49 x float]* %kernel_7_7, i32 0, i64 0, !dbg !212
  %57 = load i32* %ncols, align 4, !dbg !213
  %58 = load i32* %nrows, align 4, !dbg !214
  call void @convolve_loop_nest(i8** %55, i8** %56, float* %arrayidx58, i32 7, i32 %57, i32 %58), !dbg !215
  br label %if.end63, !dbg !215

if.else59:                                        ; preds = %if.else54
  %call60 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0)), !dbg !216
  %59 = load i32* %nrows, align 4, !dbg !218
  %conv61 = zext i32 %59 to i64, !dbg !218
  %60 = load i8*** %data_input, align 8, !dbg !219
  call void @free_array_2d(i64 %conv61, i8** %60), !dbg !220
  %61 = load i32* %nrows, align 4, !dbg !221
  %conv62 = zext i32 %61 to i64, !dbg !221
  %62 = load i8*** %data_output, align 8, !dbg !222
  call void @free_array_2d(i64 %conv62, i8** %62), !dbg !223
  store i32 1, i32* %retval, !dbg !224
  br label %return, !dbg !224

if.end63:                                         ; preds = %if.then57
  br label %if.end64

if.end64:                                         ; preds = %if.end63, %if.then52
  br label %if.end65

if.end65:                                         ; preds = %if.end64, %if.then47
  %63 = load i32* %verbose_output, align 4, !dbg !225
  %tobool66 = icmp ne i32 %63, 0, !dbg !227
  br i1 %tobool66, label %if.then67, label %if.end89, !dbg !227

if.then67:                                        ; preds = %if.end65
  store i32 0, i32* %j, align 4, !dbg !228
  br label %for.cond68, !dbg !228

for.cond68:                                       ; preds = %for.inc86, %if.then67
  %64 = load i32* %j, align 4, !dbg !231
  %65 = load i32* %_size_arr, align 4, !dbg !235
  %cmp69 = icmp slt i32 %64, %65, !dbg !236
  br i1 %cmp69, label %for.body71, label %for.end88, !dbg !237

for.body71:                                       ; preds = %for.cond68
  store i32 0, i32* %i, align 4, !dbg !238
  br label %for.cond72, !dbg !238

for.cond72:                                       ; preds = %for.inc82, %for.body71
  %66 = load i32* %i, align 4, !dbg !241
  %67 = load i32* %_size_arr, align 4, !dbg !245
  %cmp73 = icmp slt i32 %66, %67, !dbg !246
  br i1 %cmp73, label %for.body75, label %for.end84, !dbg !247

for.body75:                                       ; preds = %for.cond72
  %68 = load i32* %j, align 4, !dbg !248
  %idxprom76 = sext i32 %68 to i64, !dbg !250
  %69 = load i32* %i, align 4, !dbg !251
  %idxprom77 = sext i32 %69 to i64, !dbg !250
  %70 = load i8*** %data_output, align 8, !dbg !250
  %arrayidx78 = getelementptr inbounds i8** %70, i64 %idxprom77, !dbg !250
  %71 = load i8** %arrayidx78, align 8, !dbg !250
  %arrayidx79 = getelementptr inbounds i8* %71, i64 %idxprom76, !dbg !250
  %72 = load i8* %arrayidx79, align 1, !dbg !250
  %conv80 = zext i8 %72 to i32, !dbg !250
  %call81 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str6, i32 0, i32 0), i32 %conv80), !dbg !252
  br label %for.inc82, !dbg !253

for.inc82:                                        ; preds = %for.body75
  %73 = load i32* %i, align 4, !dbg !254
  %inc83 = add nsw i32 %73, 1, !dbg !254
  store i32 %inc83, i32* %i, align 4, !dbg !254
  br label %for.cond72, !dbg !255

for.end84:                                        ; preds = %for.cond72
  %call85 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str7, i32 0, i32 0)), !dbg !256
  br label %for.inc86, !dbg !257

for.inc86:                                        ; preds = %for.end84
  %74 = load i32* %j, align 4, !dbg !258
  %inc87 = add nsw i32 %74, 1, !dbg !258
  store i32 %inc87, i32* %j, align 4, !dbg !258
  br label %for.cond68, !dbg !259

for.end88:                                        ; preds = %for.cond68
  br label %if.end89, !dbg !260

if.end89:                                         ; preds = %for.end88, %if.end65
  %75 = load i8*** %data_output, align 8, !dbg !261
  %76 = load i32* %ncols, align 4, !dbg !262
  %77 = load i32* %nrows, align 4, !dbg !263
  %78 = load i8** %filename_out, align 8, !dbg !264
  %call90 = call i32 @jpeg_compress(i8** %75, i32 %76, i32 %77, i32 1, i8* %78), !dbg !265
  %79 = load i32* %nrows, align 4, !dbg !266
  %conv91 = zext i32 %79 to i64, !dbg !266
  %80 = load i8*** %data_input, align 8, !dbg !267
  call void @free_array_2d(i64 %conv91, i8** %80), !dbg !268
  %81 = load i32* %nrows, align 4, !dbg !269
  %conv92 = zext i32 %81 to i64, !dbg !269
  %82 = load i8*** %data_output, align 8, !dbg !270
  call void @free_array_2d(i64 %conv92, i8** %82), !dbg !271
  store i32 0, i32* %retval, !dbg !272
  br label %return, !dbg !272

return:                                           ; preds = %if.end89, %if.else59, %if.then20
  %83 = load i32* %retval, !dbg !273
  ret i32 %83, !dbg !273
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

declare i8** @create_array_2d(i64, i64, i8 zeroext) #3

declare i32 @jpeg_decompress(i8***, i32*, i32*, i32*, i8*) #3

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

declare void @convolve_loop_nest(i8**, i8**, float*, i32, i32, i32) #3

declare i32 @printf(i8*, ...) #3

declare void @free_array_2d(i64, i8**) #3

declare i32 @jpeg_compress(i8**, i32, i32, i32, i8*) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!19, !20}
!llvm.ident = !{!21}

!0 = !{!"0x11\0012\00clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)\000\00\000\00\001", !1, !2, !3, !12, !2, !2} ; [ DW_TAG_compile_unit ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c] [DW_LANG_C99]
!1 = !{!"convolve_driver.c", !"/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve"}
!2 = !{}
!3 = !{!4, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!5 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!6 = !{!"0xf\00\000\0064\0064\000\000", null, null, !7} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!7 = !{!"0xf\00\000\0064\0064\000\000", null, null, !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!8 = !{!"0x26\00\000\000\000\000\000", null, null, !9} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from u_int8_t]
!9 = !{!"0x16\00u_int8_t\00200\000\000\000\000", !10, null, !11} ; [ DW_TAG_typedef ] [u_int8_t] [line 200, size 0, align 0, offset 0] [from unsigned char]
!10 = !{!"/usr/include/x86_64-linux-gnu/sys/types.h", !"/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve"}
!11 = !{!"0x24\00unsigned char\000\008\008\000\000\008", null, null} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!12 = !{!13}
!13 = !{!"0x2e\00main\00main\00\0025\000\001\000\000\00256\000\0026", !1, !14, !15, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 25] [def] [scope 26] [main]
!14 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!15 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !16, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!16 = !{!17, !17, !18}
!17 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!18 = !{!"0xf\00\000\0064\0064\000\000", null, null, !4} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!19 = !{i32 2, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 2}
!21 = !{!"clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)"}
!22 = !{!"0x101\00argc\0016777241\000", !13, !14, !17} ; [ DW_TAG_arg_variable ] [argc] [line 25]
!23 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!24 = !MDLocation(line: 25, column: 14, scope: !13)
!25 = !{!"0x101\00argv\0033554457\000", !13, !14, !18} ; [ DW_TAG_arg_variable ] [argv] [line 25]
!26 = !MDLocation(line: 25, column: 26, scope: !13)
!27 = !MDLocation(line: 28, column: 2, scope: !13)
!28 = !{!"0x100\00index\0030\000", !13, !14, !17} ; [ DW_TAG_auto_variable ] [index] [line 30]
!29 = !MDLocation(line: 30, column: 6, scope: !13)
!30 = !{!"0x100\00verbose_output\0030\000", !13, !14, !17} ; [ DW_TAG_auto_variable ] [verbose_output] [line 30]
!31 = !MDLocation(line: 30, column: 17, scope: !13)
!32 = !{!"0x100\00arg\0030\000", !13, !14, !17}   ; [ DW_TAG_auto_variable ] [arg] [line 30]
!33 = !MDLocation(line: 30, column: 37, scope: !13)
!34 = !{!"0x100\00_size_arr\0032\000", !13, !14, !17} ; [ DW_TAG_auto_variable ] [_size_arr] [line 32]
!35 = !MDLocation(line: 32, column: 6, scope: !13)
!36 = !{!"0x100\00_size_filter\0032\000", !13, !14, !17} ; [ DW_TAG_auto_variable ] [_size_filter] [line 32]
!37 = !MDLocation(line: 32, column: 22, scope: !13)
!38 = !{!"0x100\00data_input\0034\000", !13, !14, !39} ; [ DW_TAG_auto_variable ] [data_input] [line 34]
!39 = !{!"0xf\00\000\0064\0064\000\000", null, null, !40} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!40 = !{!"0xf\00\000\0064\0064\000\000", null, null, !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from u_int8_t]
!41 = !MDLocation(line: 34, column: 17, scope: !13)
!42 = !{!"0x100\00data_output\0035\000", !13, !14, !39} ; [ DW_TAG_auto_variable ] [data_output] [line 35]
!43 = !MDLocation(line: 35, column: 17, scope: !13)
!44 = !{!"0x100\00nrows\0037\000", !13, !14, !45} ; [ DW_TAG_auto_variable ] [nrows] [line 37]
!45 = !{!"0x16\00u_int32_t\00202\000\000\000\000", !10, null, !46} ; [ DW_TAG_typedef ] [u_int32_t] [line 202, size 0, align 0, offset 0] [from unsigned int]
!46 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!47 = !MDLocation(line: 37, column: 15, scope: !13)
!48 = !{!"0x100\00ncols\0037\000", !13, !14, !45} ; [ DW_TAG_auto_variable ] [ncols] [line 37]
!49 = !MDLocation(line: 37, column: 22, scope: !13)
!50 = !{!"0x100\00nchannels\0037\000", !13, !14, !45} ; [ DW_TAG_auto_variable ] [nchannels] [line 37]
!51 = !MDLocation(line: 37, column: 29, scope: !13)
!52 = !{!"0x100\00opt\0039\000", !13, !14, !17}   ; [ DW_TAG_auto_variable ] [opt] [line 39]
!53 = !MDLocation(line: 39, column: 9, scope: !13)
!54 = !{!"0x100\00filename_in\0040\000", !13, !14, !4} ; [ DW_TAG_auto_variable ] [filename_in] [line 40]
!55 = !MDLocation(line: 40, column: 11, scope: !13)
!56 = !{!"0x100\00filename_out\0041\000", !13, !14, !4} ; [ DW_TAG_auto_variable ] [filename_out] [line 41]
!57 = !MDLocation(line: 41, column: 11, scope: !13)
!58 = !MDLocation(line: 43, column: 5, scope: !13)
!59 = !MDLocation(line: 43, column: 26, scope: !60)
!60 = !{!"0xb\002", !1, !61}                      ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!61 = !{!"0xb\001", !1, !13}                      ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!62 = !MDLocation(line: 43, column: 32, scope: !13)
!63 = !MDLocation(line: 43, column: 19, scope: !13)
!64 = !MDLocation(line: 43, column: 13, scope: !13)
!65 = !MDLocation(line: 43, column: 12, scope: !13)
!66 = !MDLocation(line: 44, column: 15, scope: !67)
!67 = !{!"0xb\0043\0055\000", !1, !13}            ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!68 = !MDLocation(line: 44, column: 7, scope: !67)
!69 = !MDLocation(line: 46, column: 22, scope: !70)
!70 = !{!"0xb\0044\0020\001", !1, !67}            ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!71 = !MDLocation(line: 46, column: 8, scope: !70)
!72 = !MDLocation(line: 47, column: 9, scope: !70)
!73 = !MDLocation(line: 49, column: 8, scope: !70)
!74 = !MDLocation(line: 50, column: 8, scope: !70)
!75 = !MDLocation(line: 52, column: 17, scope: !70)
!76 = !MDLocation(line: 52, column: 53, scope: !70)
!77 = !MDLocation(line: 52, column: 9, scope: !70)
!78 = !MDLocation(line: 53, column: 9, scope: !70)
!79 = !MDLocation(line: 57, column: 10, scope: !80)
!80 = !{!"0xb\0057\009\002", !1, !13}             ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!81 = !MDLocation(line: 57, column: 9, scope: !13)
!82 = !MDLocation(line: 58, column: 20, scope: !83)
!83 = !{!"0xb\0058\007\004", !1, !84}             ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!84 = !{!"0xb\0057\0023\003", !1, !80}            ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!85 = !MDLocation(line: 58, column: 12, scope: !83)
!86 = !MDLocation(line: 58, column: 28, scope: !87)
!87 = !{!"0xb\002", !1, !88}                      ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!88 = !{!"0xb\001", !1, !89}                      ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!89 = !{!"0xb\0058\007\005", !1, !83}             ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!90 = !MDLocation(line: 58, column: 36, scope: !89)
!91 = !MDLocation(line: 58, column: 28, scope: !89)
!92 = !MDLocation(line: 58, column: 7, scope: !83)
!93 = !MDLocation(line: 60, column: 17, scope: !94)
!94 = !{!"0xb\0058\0051\006", !1, !89}            ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!95 = !MDLocation(line: 60, column: 9, scope: !94)
!96 = !MDLocation(line: 62, column: 32, scope: !97)
!97 = !{!"0xb\0060\0024\007", !1, !94}            ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!98 = !MDLocation(line: 62, column: 27, scope: !97)
!99 = !MDLocation(line: 62, column: 22, scope: !97)
!100 = !MDLocation(line: 62, column: 10, scope: !97)
!101 = !MDLocation(line: 63, column: 11, scope: !97)
!102 = !MDLocation(line: 65, column: 36, scope: !97)
!103 = !MDLocation(line: 65, column: 31, scope: !97)
!104 = !MDLocation(line: 65, column: 26, scope: !97)
!105 = !MDLocation(line: 65, column: 11, scope: !97)
!106 = !MDLocation(line: 66, column: 11, scope: !97)
!107 = !MDLocation(line: 68, column: 7, scope: !94)
!108 = !MDLocation(line: 58, column: 42, scope: !89)
!109 = !MDLocation(line: 58, column: 7, scope: !89)
!110 = !MDLocation(line: 70, column: 23, scope: !84)
!111 = !MDLocation(line: 70, column: 15, scope: !84)
!112 = !MDLocation(line: 70, column: 7, scope: !84)
!113 = !MDLocation(line: 72, column: 7, scope: !84)
!114 = !MDLocation(line: 74, column: 37, scope: !84)
!115 = !MDLocation(line: 74, column: 44, scope: !84)
!116 = !MDLocation(line: 74, column: 21, scope: !84)
!117 = !MDLocation(line: 74, column: 7, scope: !84)
!118 = !MDLocation(line: 75, column: 37, scope: !84)
!119 = !MDLocation(line: 75, column: 44, scope: !84)
!120 = !MDLocation(line: 75, column: 21, scope: !84)
!121 = !MDLocation(line: 75, column: 7, scope: !84)
!122 = !MDLocation(line: 77, column: 5, scope: !84)
!123 = !MDLocation(line: 79, column: 66, scope: !124)
!124 = !{!"0xb\0079\009\009", !1, !125}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!125 = !{!"0xb\0077\0010\008", !1, !80}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!126 = !MDLocation(line: 79, column: 9, scope: !124)
!127 = !MDLocation(line: 79, column: 9, scope: !125)
!128 = !MDLocation(line: 80, column: 15, scope: !129)
!129 = !{!"0xb\0079\0079\0010", !1, !124}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!130 = !MDLocation(line: 80, column: 7, scope: !129)
!131 = !MDLocation(line: 81, column: 7, scope: !129)
!132 = !MDLocation(line: 84, column: 22, scope: !133)
!133 = !{!"0xb\0084\009\0011", !1, !125}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!134 = !MDLocation(line: 84, column: 14, scope: !133)
!135 = !MDLocation(line: 84, column: 30, scope: !136)
!136 = !{!"0xb\002", !1, !137}                    ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!137 = !{!"0xb\001", !1, !138}                    ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!138 = !{!"0xb\0084\009\0012", !1, !133}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!139 = !MDLocation(line: 84, column: 38, scope: !138)
!140 = !MDLocation(line: 84, column: 30, scope: !138)
!141 = !MDLocation(line: 84, column: 9, scope: !133)
!142 = !MDLocation(line: 85, column: 19, scope: !143)
!143 = !{!"0xb\0084\0053\0013", !1, !138}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!144 = !MDLocation(line: 85, column: 11, scope: !143)
!145 = !MDLocation(line: 87, column: 38, scope: !146)
!146 = !{!"0xb\0085\0026\0014", !1, !143}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!147 = !MDLocation(line: 87, column: 33, scope: !146)
!148 = !MDLocation(line: 87, column: 28, scope: !146)
!149 = !MDLocation(line: 87, column: 13, scope: !146)
!150 = !MDLocation(line: 88, column: 13, scope: !146)
!151 = !MDLocation(line: 90, column: 9, scope: !143)
!152 = !MDLocation(line: 84, column: 44, scope: !138)
!153 = !MDLocation(line: 84, column: 9, scope: !138)
!154 = !MDLocation(line: 92, column: 36, scope: !125)
!155 = !MDLocation(line: 92, column: 43, scope: !125)
!156 = !MDLocation(line: 92, column: 20, scope: !125)
!157 = !MDLocation(line: 92, column: 6, scope: !125)
!158 = !MDLocation(line: 95, column: 56, scope: !13)
!159 = !MDLocation(line: 95, column: 49, scope: !13)
!160 = !MDLocation(line: 95, column: 28, scope: !13)
!161 = !MDLocation(line: 95, column: 5, scope: !13)
!162 = !MDLocation(line: 96, column: 13, scope: !13)
!163 = !MDLocation(line: 96, column: 27, scope: !13)
!164 = !MDLocation(line: 96, column: 47, scope: !13)
!165 = !MDLocation(line: 96, column: 40, scope: !13)
!166 = !MDLocation(line: 96, column: 5, scope: !13)
!167 = !MDLocation(line: 97, column: 12, scope: !13)
!168 = !MDLocation(line: 97, column: 5, scope: !13)
!169 = !{!"0x100\00i\0099\000", !13, !14, !17}    ; [ DW_TAG_auto_variable ] [i] [line 99]
!170 = !MDLocation(line: 99, column: 9, scope: !13)
!171 = !{!"0x100\00j\0099\000", !13, !14, !17}    ; [ DW_TAG_auto_variable ] [j] [line 99]
!172 = !MDLocation(line: 99, column: 16, scope: !13)
!173 = !{!"0x100\00kernel_3_3\00101\000", !13, !14, !174} ; [ DW_TAG_auto_variable ] [kernel_3_3] [line 101]
!174 = !{!"0x1\00\000\00288\0032\000\000\000", null, null, !175, !176, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 288, align 32, offset 0] [from float]
!175 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!176 = !{!177}
!177 = !{!"0x21\000\009"}                         ; [ DW_TAG_subrange_type ] [0, 8]
!178 = !MDLocation(line: 101, column: 11, scope: !13)
!179 = !{!"0x100\00kernel_5_5\00105\000", !13, !14, !180} ; [ DW_TAG_auto_variable ] [kernel_5_5] [line 105]
!180 = !{!"0x1\00\000\00800\0032\000\000\000", null, null, !175, !181, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 800, align 32, offset 0] [from float]
!181 = !{!182}
!182 = !{!"0x21\000\0025"}                        ; [ DW_TAG_subrange_type ] [0, 24]
!183 = !MDLocation(line: 105, column: 11, scope: !13)
!184 = !{!"0x100\00kernel_7_7\00111\000", !13, !14, !185} ; [ DW_TAG_auto_variable ] [kernel_7_7] [line 111]
!185 = !{!"0x1\00\000\001568\0032\000\000\000", null, null, !175, !186, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1568, align 32, offset 0] [from float]
!186 = !{!187}
!187 = !{!"0x21\000\0049"}                        ; [ DW_TAG_subrange_type ] [0, 48]
!188 = !MDLocation(line: 111, column: 11, scope: !13)
!189 = !MDLocation(line: 120, column: 8, scope: !190)
!190 = !{!"0xb\00120\008\0015", !1, !13}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!191 = !MDLocation(line: 120, column: 8, scope: !13)
!192 = !MDLocation(line: 121, column: 43, scope: !190)
!193 = !MDLocation(line: 121, column: 55, scope: !190)
!194 = !MDLocation(line: 121, column: 68, scope: !190)
!195 = !MDLocation(line: 121, column: 87, scope: !190)
!196 = !MDLocation(line: 121, column: 94, scope: !190)
!197 = !MDLocation(line: 121, column: 6, scope: !190)
!198 = !MDLocation(line: 122, column: 13, scope: !199)
!199 = !{!"0xb\00122\0013\0016", !1, !190}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!200 = !MDLocation(line: 122, column: 13, scope: !190)
!201 = !MDLocation(line: 123, column: 43, scope: !199)
!202 = !MDLocation(line: 123, column: 55, scope: !199)
!203 = !MDLocation(line: 123, column: 68, scope: !199)
!204 = !MDLocation(line: 123, column: 87, scope: !199)
!205 = !MDLocation(line: 123, column: 94, scope: !199)
!206 = !MDLocation(line: 123, column: 6, scope: !199)
!207 = !MDLocation(line: 124, column: 13, scope: !208)
!208 = !{!"0xb\00124\0013\0017", !1, !199}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!209 = !MDLocation(line: 124, column: 13, scope: !199)
!210 = !MDLocation(line: 125, column: 43, scope: !208)
!211 = !MDLocation(line: 125, column: 55, scope: !208)
!212 = !MDLocation(line: 125, column: 68, scope: !208)
!213 = !MDLocation(line: 125, column: 87, scope: !208)
!214 = !MDLocation(line: 125, column: 94, scope: !208)
!215 = !MDLocation(line: 125, column: 6, scope: !208)
!216 = !MDLocation(line: 127, column: 7, scope: !217)
!217 = !{!"0xb\00126\009\0018", !1, !208}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!218 = !MDLocation(line: 128, column: 21, scope: !217)
!219 = !MDLocation(line: 128, column: 28, scope: !217)
!220 = !MDLocation(line: 128, column: 7, scope: !217)
!221 = !MDLocation(line: 129, column: 21, scope: !217)
!222 = !MDLocation(line: 129, column: 28, scope: !217)
!223 = !MDLocation(line: 129, column: 7, scope: !217)
!224 = !MDLocation(line: 130, column: 7, scope: !217)
!225 = !MDLocation(line: 132, column: 9, scope: !226)
!226 = !{!"0xb\00132\009\0019", !1, !13}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!227 = !MDLocation(line: 132, column: 9, scope: !13)
!228 = !MDLocation(line: 133, column: 12, scope: !229)
!229 = !{!"0xb\00133\007\0021", !1, !230}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!230 = !{!"0xb\00132\0025\0020", !1, !226}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!231 = !MDLocation(line: 133, column: 19, scope: !232)
!232 = !{!"0xb\002", !1, !233}                    ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!233 = !{!"0xb\001", !1, !234}                    ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!234 = !{!"0xb\00133\007\0022", !1, !229}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!235 = !MDLocation(line: 133, column: 23, scope: !234)
!236 = !MDLocation(line: 133, column: 19, scope: !234)
!237 = !MDLocation(line: 133, column: 7, scope: !229)
!238 = !MDLocation(line: 134, column: 14, scope: !239)
!239 = !{!"0xb\00134\009\0024", !1, !240}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!240 = !{!"0xb\00133\0039\0023", !1, !234}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!241 = !MDLocation(line: 134, column: 21, scope: !242)
!242 = !{!"0xb\002", !1, !243}                    ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!243 = !{!"0xb\001", !1, !244}                    ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!244 = !{!"0xb\00134\009\0025", !1, !239}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!245 = !MDLocation(line: 134, column: 25, scope: !244)
!246 = !MDLocation(line: 134, column: 21, scope: !244)
!247 = !MDLocation(line: 134, column: 9, scope: !239)
!248 = !MDLocation(line: 135, column: 41, scope: !249)
!249 = !{!"0xb\00134\0041\0026", !1, !244}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c]
!250 = !MDLocation(line: 135, column: 26, scope: !249)
!251 = !MDLocation(line: 135, column: 38, scope: !249)
!252 = !MDLocation(line: 135, column: 11, scope: !249)
!253 = !MDLocation(line: 136, column: 9, scope: !249)
!254 = !MDLocation(line: 134, column: 36, scope: !244)
!255 = !MDLocation(line: 134, column: 9, scope: !244)
!256 = !MDLocation(line: 137, column: 9, scope: !240)
!257 = !MDLocation(line: 138, column: 7, scope: !240)
!258 = !MDLocation(line: 133, column: 34, scope: !234)
!259 = !MDLocation(line: 133, column: 7, scope: !234)
!260 = !MDLocation(line: 139, column: 5, scope: !230)
!261 = !MDLocation(line: 141, column: 19, scope: !13)
!262 = !MDLocation(line: 141, column: 32, scope: !13)
!263 = !MDLocation(line: 141, column: 39, scope: !13)
!264 = !MDLocation(line: 141, column: 49, scope: !13)
!265 = !MDLocation(line: 141, column: 5, scope: !13)
!266 = !MDLocation(line: 143, column: 19, scope: !13)
!267 = !MDLocation(line: 143, column: 26, scope: !13)
!268 = !MDLocation(line: 143, column: 5, scope: !13)
!269 = !MDLocation(line: 144, column: 19, scope: !13)
!270 = !MDLocation(line: 144, column: 26, scope: !13)
!271 = !MDLocation(line: 144, column: 5, scope: !13)
!272 = !MDLocation(line: 146, column: 5, scope: !13)
!273 = !MDLocation(line: 147, column: 1, scope: !13)
