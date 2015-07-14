; ModuleID = 'convolve_hw_interface.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.max_file = type { %struct.max_errors*, %struct.max_file_internal* }
%struct.max_errors = type opaque
%struct.max_file_internal = type opaque

@.str = private unnamed_addr constant [46 x i8] c"/home/lfunke/overlays/slic_convolution_3_3.so\00", align 1
@libfilename_3_3 = global i8* getelementptr inbounds ([46 x i8]* @.str, i32 0, i32 0), align 8
@.str1 = private unnamed_addr constant [46 x i8] c"/home/lfunke/overlays/slic_convolution_5_5.so\00", align 1
@libfilename_5_5 = global i8* getelementptr inbounds ([46 x i8]* @.str1, i32 0, i32 0), align 8
@.str2 = private unnamed_addr constant [46 x i8] c"/home/lfunke/overlays/slic_convolution_7_7.so\00", align 1
@libfilename_7_7 = global i8* getelementptr inbounds ([46 x i8]* @.str2, i32 0, i32 0), align 8
@.str3 = private unnamed_addr constant [17 x i8] c"ALLOW_OP_MIGRATE\00", align 1
@env_allow_hw = global i8* getelementptr inbounds ([17 x i8]* @.str3, i32 0, i32 0), align 8
@.str4 = private unnamed_addr constant [32 x i8] c"Filter size %d, nx: %d, ny: %d\0A\00", align 1
@.str5 = private unnamed_addr constant [20 x i8] c"HW bypass 0 called\0A\00", align 1
@.str6 = private unnamed_addr constant [88 x i8] c"Parameters:\0Asrc: %p\0Adst: %p\0Akernel: %p\0AFilter size: %d\0AData size x: %d\0AData size y: %d\0A\00", align 1
@.str7 = private unnamed_addr constant [20 x i8] c"HW bypass 1 called\0A\00", align 1
@.str8 = private unnamed_addr constant [32 x i8] c"No maxfile for filter size: %d\0A\00", align 1
@.str9 = private unnamed_addr constant [35 x i8] c"Could not load shared library! %s\0A\00", align 1
@.str10 = private unnamed_addr constant [10 x i8] c"MemStream\00", align 1
@.str11 = private unnamed_addr constant [31 x i8] c"Could not find interface: %s \0A\00", align 1
@.str12 = private unnamed_addr constant [15 x i8] c"MemStream_init\00", align 1
@.str13 = private unnamed_addr constant [18 x i8] c"Initializing DFE\0A\00", align 1
@.str14 = private unnamed_addr constant [14 x i8] c"DFE finished\0A\00", align 1

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
  call void @llvm.dbg.declare(metadata i32* %filter_size.addr, metadata !37, metadata !38), !dbg !39
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !40, metadata !38), !dbg !41
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !42, metadata !38), !dbg !43
  call void @llvm.dbg.declare(metadata i8* %allow_hw, metadata !44, metadata !38), !dbg !45
  store i8 0, i8* %allow_hw, align 1, !dbg !45
  call void @llvm.dbg.declare(metadata i8** %pAllowHWAccelerationEnv, metadata !46, metadata !38), !dbg !48
  %0 = load i8** @env_allow_hw, align 8, !dbg !49
  %call = call i8* @getenv(i8* %0) #4, !dbg !50
  store i8* %call, i8** %pAllowHWAccelerationEnv, align 8, !dbg !48
  %1 = load i8** %pAllowHWAccelerationEnv, align 8, !dbg !51
  %tobool = icmp ne i8* %1, null, !dbg !53
  br i1 %tobool, label %if.then, label %if.end, !dbg !53

if.then:                                          ; preds = %entry
  %2 = load i8** %pAllowHWAccelerationEnv, align 8, !dbg !54
  %call1 = call i64 @strtol(i8* %2, i8** null, i32 10) #4, !dbg !56
  %conv = trunc i64 %call1 to i8, !dbg !56
  store i8 %conv, i8* %allow_hw, align 1, !dbg !57
  br label %if.end, !dbg !58

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8* %allow_hw, align 1, !dbg !59
  %tobool2 = icmp ne i8 %3, 0, !dbg !61
  br i1 %tobool2, label %if.then3, label %if.end14, !dbg !61

if.then3:                                         ; preds = %if.end
  %4 = load i32* %filter_size.addr, align 4, !dbg !62
  %5 = load i32* %nx.addr, align 4, !dbg !64
  %6 = load i32* %ny.addr, align 4, !dbg !65
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str4, i32 0, i32 0), i32 %4, i32 %5, i32 %6), !dbg !66
  %7 = load i32* %nx.addr, align 4, !dbg !67
  %cmp = icmp sge i32 %7, 10, !dbg !67
  br i1 %cmp, label %land.lhs.true, label %if.end13, !dbg !69

land.lhs.true:                                    ; preds = %if.then3
  %8 = load i32* %ny.addr, align 4, !dbg !70
  %cmp6 = icmp sge i32 %8, 10, !dbg !70
  br i1 %cmp6, label %if.then8, label %if.end13, !dbg !69

if.then8:                                         ; preds = %land.lhs.true
  %9 = load i32* %filter_size.addr, align 4, !dbg !72
  %cmp9 = icmp sgt i32 %9, 2, !dbg !72
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !74

if.then11:                                        ; preds = %if.then8
  store i1 true, i1* %retval, !dbg !75
  br label %return, !dbg !75

if.end12:                                         ; preds = %if.then8
  br label %if.end13, !dbg !76

if.end13:                                         ; preds = %if.end12, %land.lhs.true, %if.then3
  br label %if.end14, !dbg !78

if.end14:                                         ; preds = %if.end13, %if.end
  store i1 false, i1* %retval, !dbg !79
  br label %return, !dbg !79

return:                                           ; preds = %if.end14, %if.then11
  %10 = load i1* %retval, !dbg !80
  ret i1 %10, !dbg !80
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @getenv(i8*) #2

; Function Attrs: nounwind
declare i64 @strtol(i8*, i8**, i32) #2

declare i32 @printf(i8*, ...) #3

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
  call void @llvm.dbg.declare(metadata i8** %src.addr, metadata !81, metadata !38), !dbg !82
  store i8* %dst, i8** %dst.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dst.addr, metadata !83, metadata !38), !dbg !84
  store float* %kernel, float** %kernel.addr, align 8
  call void @llvm.dbg.declare(metadata float** %kernel.addr, metadata !85, metadata !38), !dbg !86
  store i32 %filter_size, i32* %filter_size.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %filter_size.addr, metadata !87, metadata !38), !dbg !88
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !89, metadata !38), !dbg !90
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !91, metadata !38), !dbg !92
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str5, i32 0, i32 0)), !dbg !93
  %0 = load i8** %src.addr, align 8, !dbg !94
  %1 = load i8** %dst.addr, align 8, !dbg !95
  %2 = load float** %kernel.addr, align 8, !dbg !96
  %3 = load i32* %filter_size.addr, align 4, !dbg !97
  %4 = load i32* %nx.addr, align 4, !dbg !98
  %5 = load i32* %ny.addr, align 4, !dbg !99
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([88 x i8]* @.str6, i32 0, i32 0), i8* %0, i8* %1, float* %2, i32 %3, i32 %4, i32 %5), !dbg !100
  ret void, !dbg !101
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
  call void @llvm.dbg.declare(metadata i8*** %src.addr, metadata !102, metadata !38), !dbg !103
  store i8** %dst, i8*** %dst.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dst.addr, metadata !104, metadata !38), !dbg !105
  store float* %kernel, float** %kernel.addr, align 8
  call void @llvm.dbg.declare(metadata float** %kernel.addr, metadata !106, metadata !38), !dbg !107
  store i32 %filter_size, i32* %filter_size.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %filter_size.addr, metadata !108, metadata !38), !dbg !109
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !110, metadata !38), !dbg !111
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !112, metadata !38), !dbg !113
  call void @llvm.dbg.declare(metadata i8** %error, metadata !114, metadata !38), !dbg !115
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str7, i32 0, i32 0)), !dbg !116
  %0 = load i8*** %src.addr, align 8, !dbg !117
  %1 = load i8*** %dst.addr, align 8, !dbg !118
  %2 = load float** %kernel.addr, align 8, !dbg !119
  %3 = load i32* %filter_size.addr, align 4, !dbg !120
  %4 = load i32* %nx.addr, align 4, !dbg !121
  %5 = load i32* %ny.addr, align 4, !dbg !122
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([88 x i8]* @.str6, i32 0, i32 0), i8** %0, i8** %1, float* %2, i32 %3, i32 %4, i32 %5), !dbg !123
  call void @llvm.dbg.declare(metadata i8** %libfile, metadata !124, metadata !38), !dbg !125
  %6 = load i32* %filter_size.addr, align 4, !dbg !126
  %cmp = icmp eq i32 %6, 3, !dbg !126
  br i1 %cmp, label %if.then, label %if.else, !dbg !128

if.then:                                          ; preds = %entry
  %7 = load i8** @libfilename_3_3, align 8, !dbg !129
  store i8* %7, i8** %libfile, align 8, !dbg !131
  br label %if.end10, !dbg !132

if.else:                                          ; preds = %entry
  %8 = load i32* %filter_size.addr, align 4, !dbg !133
  %cmp2 = icmp eq i32 %8, 5, !dbg !133
  br i1 %cmp2, label %if.then3, label %if.else4, !dbg !135

if.then3:                                         ; preds = %if.else
  %9 = load i8** @libfilename_5_5, align 8, !dbg !136
  store i8* %9, i8** %libfile, align 8, !dbg !138
  br label %if.end9, !dbg !139

if.else4:                                         ; preds = %if.else
  %10 = load i32* %filter_size.addr, align 4, !dbg !140
  %cmp5 = icmp eq i32 %10, 7, !dbg !140
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !142

if.then6:                                         ; preds = %if.else4
  %11 = load i8** @libfilename_7_7, align 8, !dbg !143
  store i8* %11, i8** %libfile, align 8, !dbg !145
  br label %if.end, !dbg !146

if.else7:                                         ; preds = %if.else4
  %12 = load i32* %filter_size.addr, align 4, !dbg !147
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str8, i32 0, i32 0), i32 %12), !dbg !149
  br label %return, !dbg !150

if.end:                                           ; preds = %if.then6
  br label %if.end9

if.end9:                                          ; preds = %if.end, %if.then3
  br label %if.end10

if.end10:                                         ; preds = %if.end9, %if.then
  call void @llvm.dbg.declare(metadata i8** %in, metadata !151, metadata !38), !dbg !152
  %13 = load i32* %nx.addr, align 4, !dbg !153
  %conv = sext i32 %13 to i64, !dbg !153
  %mul = mul i64 1, %conv, !dbg !154
  %14 = load i32* %ny.addr, align 4, !dbg !155
  %conv11 = sext i32 %14 to i64, !dbg !155
  %mul12 = mul i64 %mul, %conv11, !dbg !154
  %call13 = call noalias i8* @malloc(i64 %mul12) #4, !dbg !156
  store i8* %call13, i8** %in, align 8, !dbg !152
  call void @llvm.dbg.declare(metadata i8** %out, metadata !157, metadata !38), !dbg !158
  %15 = load i32* %nx.addr, align 4, !dbg !159
  %conv14 = sext i32 %15 to i64, !dbg !159
  %mul15 = mul i64 1, %conv14, !dbg !160
  %16 = load i32* %ny.addr, align 4, !dbg !161
  %conv16 = sext i32 %16 to i64, !dbg !161
  %mul17 = mul i64 %mul15, %conv16, !dbg !160
  %call18 = call noalias i8* @malloc(i64 %mul17) #4, !dbg !162
  store i8* %call18, i8** %out, align 8, !dbg !158
  call void @llvm.dbg.declare(metadata i32* %i, metadata !163, metadata !38), !dbg !164
  store i32 0, i32* %i, align 4, !dbg !164
  call void @llvm.dbg.declare(metadata i32* %j, metadata !165, metadata !38), !dbg !166
  store i32 0, i32* %j, align 4, !dbg !166
  store i32 0, i32* %i, align 4, !dbg !167
  br label %for.cond, !dbg !167

for.cond:                                         ; preds = %for.inc, %if.end10
  %17 = load i32* %i, align 4, !dbg !169
  %18 = load i32* %ny.addr, align 4, !dbg !173
  %cmp19 = icmp slt i32 %17, %18, !dbg !174
  br i1 %cmp19, label %for.body, label %for.end, !dbg !175

for.body:                                         ; preds = %for.cond
  %19 = load i32* %i, align 4, !dbg !176
  %20 = load i32* %nx.addr, align 4, !dbg !177
  %mul21 = mul nsw i32 %19, %20, !dbg !176
  %idxprom = sext i32 %mul21 to i64, !dbg !178
  %21 = load i8** %in, align 8, !dbg !179
  %arrayidx = getelementptr inbounds i8* %21, i64 %idxprom, !dbg !178
  %22 = load i32* %i, align 4, !dbg !180
  %idxprom22 = sext i32 %22 to i64, !dbg !181
  %23 = load i8*** %src.addr, align 8, !dbg !181
  %arrayidx23 = getelementptr inbounds i8** %23, i64 %idxprom22, !dbg !181
  %24 = load i8** %arrayidx23, align 8, !dbg !181
  %25 = load i32* %nx.addr, align 4, !dbg !182
  %conv24 = sext i32 %25 to i64, !dbg !182
  %mul25 = mul i64 1, %conv24, !dbg !183
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %arrayidx, i8* %24, i64 %mul25, i32 1, i1 false), !dbg !178
  br label %for.inc, !dbg !178

for.inc:                                          ; preds = %for.body
  %26 = load i32* %i, align 4, !dbg !184
  %inc = add nsw i32 %26, 1, !dbg !184
  store i32 %inc, i32* %i, align 4, !dbg !184
  br label %for.cond, !dbg !185

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata void (i64, i32, i32, float*, i8*, i8*)** %ifaceptr, metadata !186, metadata !38), !dbg !196
  call void @llvm.dbg.declare(metadata %struct.max_file* (...)** %max_init, metadata !197, metadata !38), !dbg !214
  call void @llvm.dbg.declare(metadata i8** %dlhandle, metadata !215, metadata !38), !dbg !216
  %27 = load i8** %libfile, align 8, !dbg !217
  %call26 = call i8* @dlopen(i8* %27, i32 257) #4, !dbg !218
  store i8* %call26, i8** %dlhandle, align 8, !dbg !216
  %28 = load i8** %dlhandle, align 8, !dbg !219
  %tobool = icmp ne i8* %28, null, !dbg !221
  br i1 %tobool, label %if.end30, label %if.then27, !dbg !221

if.then27:                                        ; preds = %for.end
  %call28 = call i8* @dlerror() #4, !dbg !222
  store i8* %call28, i8** %error, align 8, !dbg !224
  %29 = load i8** %error, align 8, !dbg !225
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str9, i32 0, i32 0), i8* %29), !dbg !226
  br label %return, !dbg !227

if.end30:                                         ; preds = %for.end
  %30 = load i8** %dlhandle, align 8, !dbg !228
  %call31 = call i8* @dlsym(i8* %30, i8* getelementptr inbounds ([10 x i8]* @.str10, i32 0, i32 0)) #4, !dbg !229
  %31 = bitcast i8* %call31 to void (i64, i32, i32, float*, i8*, i8*)*, !dbg !229
  store void (i64, i32, i32, float*, i8*, i8*)* %31, void (i64, i32, i32, float*, i8*, i8*)** %ifaceptr, align 8, !dbg !230
  %call32 = call i8* @dlerror() #4, !dbg !231
  store i8* %call32, i8** %error, align 8, !dbg !233
  %cmp33 = icmp ne i8* %call32, null, !dbg !234
  br i1 %cmp33, label %if.then35, label %if.end37, !dbg !235

if.then35:                                        ; preds = %if.end30
  %32 = load i8** %error, align 8, !dbg !236
  %call36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i8* %32), !dbg !238
  br label %return, !dbg !239

if.end37:                                         ; preds = %if.end30
  %33 = load i8** %dlhandle, align 8, !dbg !240
  %call38 = call i8* @dlsym(i8* %33, i8* getelementptr inbounds ([15 x i8]* @.str12, i32 0, i32 0)) #4, !dbg !241
  %34 = bitcast i8* %call38 to %struct.max_file* (...)*, !dbg !241
  store %struct.max_file* (...)* %34, %struct.max_file* (...)** %max_init, align 8, !dbg !242
  %call39 = call i8* @dlerror() #4, !dbg !243
  store i8* %call39, i8** %error, align 8, !dbg !245
  %cmp40 = icmp ne i8* %call39, null, !dbg !246
  br i1 %cmp40, label %if.then42, label %if.end44, !dbg !247

if.then42:                                        ; preds = %if.end37
  %35 = load i8** %error, align 8, !dbg !248
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i8* %35), !dbg !250
  br label %return, !dbg !251

if.end44:                                         ; preds = %if.end37
  %call45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str13, i32 0, i32 0)), !dbg !252
  %36 = load void (i64, i32, i32, float*, i8*, i8*)** %ifaceptr, align 8, !dbg !253
  %37 = load i32* %nx.addr, align 4, !dbg !254
  %38 = load i32* %ny.addr, align 4, !dbg !255
  %mul46 = mul nsw i32 %37, %38, !dbg !254
  %conv47 = sext i32 %mul46 to i64, !dbg !254
  %39 = load i32* %nx.addr, align 4, !dbg !256
  %40 = load i32* %ny.addr, align 4, !dbg !257
  %41 = load float** %kernel.addr, align 8, !dbg !258
  %42 = load i8** %in, align 8, !dbg !259
  %43 = load i8** %out, align 8, !dbg !260
  call void %36(i64 %conv47, i32 %39, i32 %40, float* %41, i8* %42, i8* %43), !dbg !253
  %call48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str14, i32 0, i32 0)), !dbg !261
  %44 = load i8** %dlhandle, align 8, !dbg !262
  %call49 = call i32 @dlclose(i8* %44) #4, !dbg !263
  store i32 0, i32* %i, align 4, !dbg !264
  br label %for.cond50, !dbg !264

for.cond50:                                       ; preds = %for.inc61, %if.end44
  %45 = load i32* %i, align 4, !dbg !266
  %46 = load i32* %ny.addr, align 4, !dbg !270
  %cmp51 = icmp slt i32 %45, %46, !dbg !271
  br i1 %cmp51, label %for.body53, label %for.end63, !dbg !272

for.body53:                                       ; preds = %for.cond50
  %47 = load i32* %i, align 4, !dbg !273
  %idxprom54 = sext i32 %47 to i64, !dbg !274
  %48 = load i8*** %dst.addr, align 8, !dbg !274
  %arrayidx55 = getelementptr inbounds i8** %48, i64 %idxprom54, !dbg !274
  %49 = load i8** %arrayidx55, align 8, !dbg !274
  %50 = load i32* %i, align 4, !dbg !275
  %51 = load i32* %nx.addr, align 4, !dbg !276
  %mul56 = mul nsw i32 %50, %51, !dbg !275
  %idxprom57 = sext i32 %mul56 to i64, !dbg !277
  %52 = load i8** %out, align 8, !dbg !278
  %arrayidx58 = getelementptr inbounds i8* %52, i64 %idxprom57, !dbg !277
  %53 = load i32* %nx.addr, align 4, !dbg !279
  %conv59 = sext i32 %53 to i64, !dbg !279
  %mul60 = mul i64 1, %conv59, !dbg !280
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %49, i8* %arrayidx58, i64 %mul60, i32 1, i1 false), !dbg !277
  br label %for.inc61, !dbg !277

for.inc61:                                        ; preds = %for.body53
  %54 = load i32* %i, align 4, !dbg !281
  %inc62 = add nsw i32 %54, 1, !dbg !281
  store i32 %inc62, i32* %i, align 4, !dbg !281
  br label %for.cond50, !dbg !282

for.end63:                                        ; preds = %for.cond50
  %55 = load i8** %in, align 8, !dbg !283
  call void @free(i8* %55) #4, !dbg !284
  %56 = load i8** %out, align 8, !dbg !285
  call void @free(i8* %56) #4, !dbg !286
  br label %return, !dbg !287

return:                                           ; preds = %for.end63, %if.then42, %if.then35, %if.then27, %if.else7
  ret void, !dbg !288
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #4

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

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!34, !35}
!llvm.ident = !{!36}

!0 = !{!"0x11\0012\00clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)\000\00\000\00\001", !1, !2, !3, !5, !26, !2} ; [ DW_TAG_compile_unit ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c] [DW_LANG_C99]
!1 = !{!"convolve_hw_interface.c", !"/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!6, !14, !22}
!6 = !{!"0x2e\00convolve_hw_use_accelerator\00convolve_hw_use_accelerator\00\0033\000\001\000\000\00256\000\0033", !1, !7, !8, null, i1 (i32, i32, i32)* @convolve_hw_use_accelerator, null, null, !2} ; [ DW_TAG_subprogram ] [line 33] [def] [convolve_hw_use_accelerator]
!7 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!8 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !9, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = !{!10, !11, !11, !11}
!10 = !{!"0x24\00_Bool\000\008\008\000\000\002", null, null} ; [ DW_TAG_base_type ] [_Bool] [line 0, size 8, align 8, offset 0, enc DW_ATE_boolean]
!11 = !{!"0x16\00int32_t\00196\000\000\000\000", !12, null, !13} ; [ DW_TAG_typedef ] [int32_t] [line 196, size 0, align 0, offset 0] [from int]
!12 = !{!"/usr/include/x86_64-linux-gnu/sys/types.h", !"/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve"}
!13 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!14 = !{!"0x2e\00convolve_bypass_hw_iface0\00convolve_bypass_hw_iface0\00\0051\000\001\000\000\00256\000\0052", !1, !7, !15, null, void (i8*, i8*, float*, i32, i32, i32)* @convolve_bypass_hw_iface0, null, null, !2} ; [ DW_TAG_subprogram ] [line 51] [def] [scope 52] [convolve_bypass_hw_iface0]
!15 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !16, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!16 = !{null, !17, !17, !20, !11, !11, !11}
!17 = !{!"0xf\00\000\0064\0064\000\000", null, null, !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from u_int8_t]
!18 = !{!"0x16\00u_int8_t\00200\000\000\000\000", !12, null, !19} ; [ DW_TAG_typedef ] [u_int8_t] [line 200, size 0, align 0, offset 0] [from unsigned char]
!19 = !{!"0x24\00unsigned char\000\008\008\000\000\008", null, null} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!20 = !{!"0xf\00\000\0064\0064\000\000", null, null, !21} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!21 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!22 = !{!"0x2e\00convolve_bypass_hw_iface1\00convolve_bypass_hw_iface1\00\0058\000\001\000\000\00256\000\0059", !1, !7, !23, null, void (i8**, i8**, float*, i32, i32, i32)* @convolve_bypass_hw_iface1, null, null, !2} ; [ DW_TAG_subprogram ] [line 58] [def] [scope 59] [convolve_bypass_hw_iface1]
!23 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !24, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!24 = !{null, !25, !25, !20, !11, !11, !11}
!25 = !{!"0xf\00\000\0064\0064\000\000", null, null, !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!26 = !{!27, !31, !32, !33}
!27 = !{!"0x34\00libfilename_3_3\00libfilename_3_3\00\0017\000\001", null, !7, !28, i8** @libfilename_3_3, null} ; [ DW_TAG_variable ] [libfilename_3_3] [line 17] [def]
!28 = !{!"0xf\00\000\0064\0064\000\000", null, null, !29} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!29 = !{!"0x26\00\000\000\000\000\000", null, null, !30} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!30 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!31 = !{!"0x34\00libfilename_5_5\00libfilename_5_5\00\0019\000\001", null, !7, !28, i8** @libfilename_5_5, null} ; [ DW_TAG_variable ] [libfilename_5_5] [line 19] [def]
!32 = !{!"0x34\00libfilename_7_7\00libfilename_7_7\00\0021\000\001", null, !7, !28, i8** @libfilename_7_7, null} ; [ DW_TAG_variable ] [libfilename_7_7] [line 21] [def]
!33 = !{!"0x34\00env_allow_hw\00env_allow_hw\00\0023\000\001", null, !7, !28, i8** @env_allow_hw, null} ; [ DW_TAG_variable ] [env_allow_hw] [line 23] [def]
!34 = !{i32 2, !"Dwarf Version", i32 4}
!35 = !{i32 2, !"Debug Info Version", i32 2}
!36 = !{!"clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)"}
!37 = !{!"0x101\00filter_size\0016777249\000", !6, !7, !11} ; [ DW_TAG_arg_variable ] [filter_size] [line 33]
!38 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!39 = !MDLocation(line: 33, column: 42, scope: !6)
!40 = !{!"0x101\00nx\0033554465\000", !6, !7, !11} ; [ DW_TAG_arg_variable ] [nx] [line 33]
!41 = !MDLocation(line: 33, column: 63, scope: !6)
!42 = !{!"0x101\00ny\0050331681\000", !6, !7, !11} ; [ DW_TAG_arg_variable ] [ny] [line 33]
!43 = !MDLocation(line: 33, column: 75, scope: !6)
!44 = !{!"0x100\00allow_hw\0034\000", !6, !7, !18} ; [ DW_TAG_auto_variable ] [allow_hw] [line 34]
!45 = !MDLocation(line: 34, column: 12, scope: !6)
!46 = !{!"0x100\00pAllowHWAccelerationEnv\0036\000", !6, !7, !47} ; [ DW_TAG_auto_variable ] [pAllowHWAccelerationEnv] [line 36]
!47 = !{!"0xf\00\000\0064\0064\000\000", null, null, !30} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!48 = !MDLocation(line: 36, column: 9, scope: !6)
!49 = !MDLocation(line: 36, column: 42, scope: !6)
!50 = !MDLocation(line: 36, column: 35, scope: !6)
!51 = !MDLocation(line: 37, column: 7, scope: !52)
!52 = !{!"0xb\0037\007\000", !1, !6}              ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!53 = !MDLocation(line: 37, column: 7, scope: !6)
!54 = !MDLocation(line: 38, column: 23, scope: !55)
!55 = !{!"0xb\0037\0032\001", !1, !52}            ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!56 = !MDLocation(line: 38, column: 16, scope: !55)
!57 = !MDLocation(line: 38, column: 5, scope: !55)
!58 = !MDLocation(line: 39, column: 3, scope: !55)
!59 = !MDLocation(line: 41, column: 7, scope: !60)
!60 = !{!"0xb\0041\007\002", !1, !6}              ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!61 = !MDLocation(line: 41, column: 7, scope: !6)
!62 = !MDLocation(line: 42, column: 48, scope: !63)
!63 = !{!"0xb\0041\0017\003", !1, !60}            ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!64 = !MDLocation(line: 42, column: 61, scope: !63)
!65 = !MDLocation(line: 42, column: 65, scope: !63)
!66 = !MDLocation(line: 42, column: 5, scope: !63)
!67 = !MDLocation(line: 43, column: 9, scope: !68)
!68 = !{!"0xb\0043\009\004", !1, !63}             ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!69 = !MDLocation(line: 43, column: 9, scope: !63)
!70 = !MDLocation(line: 43, column: 21, scope: !71)
!71 = !{!"0xb\001", !1, !68}                      ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!72 = !MDLocation(line: 44, column: 11, scope: !73)
!73 = !{!"0xb\0044\0011\005", !1, !68}            ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!74 = !MDLocation(line: 44, column: 11, scope: !68)
!75 = !MDLocation(line: 45, column: 9, scope: !73)
!76 = !MDLocation(line: 44, column: 25, scope: !77)
!77 = !{!"0xb\001", !1, !73}                      ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!78 = !MDLocation(line: 46, column: 3, scope: !63)
!79 = !MDLocation(line: 48, column: 3, scope: !6)
!80 = !MDLocation(line: 49, column: 1, scope: !6)
!81 = !{!"0x101\00src\0016777267\000", !14, !7, !17} ; [ DW_TAG_arg_variable ] [src] [line 51]
!82 = !MDLocation(line: 51, column: 42, scope: !14)
!83 = !{!"0x101\00dst\0033554483\000", !14, !7, !17} ; [ DW_TAG_arg_variable ] [dst] [line 51]
!84 = !MDLocation(line: 51, column: 57, scope: !14)
!85 = !{!"0x101\00kernel\0050331699\000", !14, !7, !20} ; [ DW_TAG_arg_variable ] [kernel] [line 51]
!86 = !MDLocation(line: 51, column: 69, scope: !14)
!87 = !{!"0x101\00filter_size\0067108915\000", !14, !7, !11} ; [ DW_TAG_arg_variable ] [filter_size] [line 51]
!88 = !MDLocation(line: 51, column: 85, scope: !14)
!89 = !{!"0x101\00nx\0083886131\000", !14, !7, !11} ; [ DW_TAG_arg_variable ] [nx] [line 51]
!90 = !MDLocation(line: 51, column: 106, scope: !14)
!91 = !{!"0x101\00ny\00100663348\000", !14, !7, !11} ; [ DW_TAG_arg_variable ] [ny] [line 52]
!92 = !MDLocation(line: 52, column: 40, scope: !14)
!93 = !MDLocation(line: 54, column: 3, scope: !14)
!94 = !MDLocation(line: 55, column: 108, scope: !14)
!95 = !MDLocation(line: 55, column: 113, scope: !14)
!96 = !MDLocation(line: 56, column: 10, scope: !14)
!97 = !MDLocation(line: 56, column: 18, scope: !14)
!98 = !MDLocation(line: 56, column: 31, scope: !14)
!99 = !MDLocation(line: 56, column: 35, scope: !14)
!100 = !MDLocation(line: 55, column: 3, scope: !14)
!101 = !MDLocation(line: 57, column: 1, scope: !14)
!102 = !{!"0x101\00src\0016777274\000", !22, !7, !25} ; [ DW_TAG_arg_variable ] [src] [line 58]
!103 = !MDLocation(line: 58, column: 43, scope: !22)
!104 = !{!"0x101\00dst\0033554490\000", !22, !7, !25} ; [ DW_TAG_arg_variable ] [dst] [line 58]
!105 = !MDLocation(line: 58, column: 59, scope: !22)
!106 = !{!"0x101\00kernel\0050331706\000", !22, !7, !20} ; [ DW_TAG_arg_variable ] [kernel] [line 58]
!107 = !MDLocation(line: 58, column: 71, scope: !22)
!108 = !{!"0x101\00filter_size\0067108922\000", !22, !7, !11} ; [ DW_TAG_arg_variable ] [filter_size] [line 58]
!109 = !MDLocation(line: 58, column: 87, scope: !22)
!110 = !{!"0x101\00nx\0083886138\000", !22, !7, !11} ; [ DW_TAG_arg_variable ] [nx] [line 58]
!111 = !MDLocation(line: 58, column: 108, scope: !22)
!112 = !{!"0x101\00ny\00100663355\000", !22, !7, !11} ; [ DW_TAG_arg_variable ] [ny] [line 59]
!113 = !MDLocation(line: 59, column: 40, scope: !22)
!114 = !{!"0x100\00error\0060\000", !22, !7, !47} ; [ DW_TAG_auto_variable ] [error] [line 60]
!115 = !MDLocation(line: 60, column: 9, scope: !22)
!116 = !MDLocation(line: 62, column: 3, scope: !22)
!117 = !MDLocation(line: 63, column: 108, scope: !22)
!118 = !MDLocation(line: 63, column: 113, scope: !22)
!119 = !MDLocation(line: 64, column: 10, scope: !22)
!120 = !MDLocation(line: 64, column: 18, scope: !22)
!121 = !MDLocation(line: 64, column: 31, scope: !22)
!122 = !MDLocation(line: 64, column: 35, scope: !22)
!123 = !MDLocation(line: 63, column: 3, scope: !22)
!124 = !{!"0x100\00libfile\0066\000", !22, !7, !28} ; [ DW_TAG_auto_variable ] [libfile] [line 66]
!125 = !MDLocation(line: 66, column: 15, scope: !22)
!126 = !MDLocation(line: 67, column: 7, scope: !127)
!127 = !{!"0xb\0067\007\006", !1, !22}            ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!128 = !MDLocation(line: 67, column: 7, scope: !22)
!129 = !MDLocation(line: 68, column: 14, scope: !130)
!130 = !{!"0xb\0067\0024\007", !1, !127}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!131 = !MDLocation(line: 68, column: 4, scope: !130)
!132 = !MDLocation(line: 69, column: 3, scope: !130)
!133 = !MDLocation(line: 69, column: 14, scope: !134)
!134 = !{!"0xb\0069\0014\008", !1, !127}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!135 = !MDLocation(line: 69, column: 14, scope: !127)
!136 = !MDLocation(line: 70, column: 14, scope: !137)
!137 = !{!"0xb\0069\0031\009", !1, !134}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!138 = !MDLocation(line: 70, column: 4, scope: !137)
!139 = !MDLocation(line: 71, column: 3, scope: !137)
!140 = !MDLocation(line: 71, column: 13, scope: !141)
!141 = !{!"0xb\0071\0013\0010", !1, !134}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!142 = !MDLocation(line: 71, column: 13, scope: !134)
!143 = !MDLocation(line: 72, column: 14, scope: !144)
!144 = !{!"0xb\0071\0030\0011", !1, !141}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!145 = !MDLocation(line: 72, column: 4, scope: !144)
!146 = !MDLocation(line: 73, column: 3, scope: !144)
!147 = !MDLocation(line: 75, column: 47, scope: !148)
!148 = !{!"0xb\0074\007\0012", !1, !141}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!149 = !MDLocation(line: 75, column: 4, scope: !148)
!150 = !MDLocation(line: 76, column: 4, scope: !148)
!151 = !{!"0x100\00in\0079\000", !22, !7, !17}    ; [ DW_TAG_auto_variable ] [in] [line 79]
!152 = !MDLocation(line: 79, column: 13, scope: !22)
!153 = !MDLocation(line: 79, column: 44, scope: !22)
!154 = !MDLocation(line: 79, column: 25, scope: !22)
!155 = !MDLocation(line: 79, column: 49, scope: !22)
!156 = !MDLocation(line: 79, column: 18, scope: !22)
!157 = !{!"0x100\00out\0080\000", !22, !7, !17}   ; [ DW_TAG_auto_variable ] [out] [line 80]
!158 = !MDLocation(line: 80, column: 13, scope: !22)
!159 = !MDLocation(line: 80, column: 45, scope: !22)
!160 = !MDLocation(line: 80, column: 26, scope: !22)
!161 = !MDLocation(line: 80, column: 50, scope: !22)
!162 = !MDLocation(line: 80, column: 19, scope: !22)
!163 = !{!"0x100\00i\0082\000", !22, !7, !13}     ; [ DW_TAG_auto_variable ] [i] [line 82]
!164 = !MDLocation(line: 82, column: 7, scope: !22)
!165 = !{!"0x100\00j\0082\000", !22, !7, !13}     ; [ DW_TAG_auto_variable ] [j] [line 82]
!166 = !MDLocation(line: 82, column: 14, scope: !22)
!167 = !MDLocation(line: 83, column: 8, scope: !168)
!168 = !{!"0xb\0083\003\0013", !1, !22}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!169 = !MDLocation(line: 83, column: 15, scope: !170)
!170 = !{!"0xb\002", !1, !171}                    ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!171 = !{!"0xb\001", !1, !172}                    ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!172 = !{!"0xb\0083\003\0014", !1, !168}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!173 = !MDLocation(line: 83, column: 19, scope: !172)
!174 = !MDLocation(line: 83, column: 15, scope: !172)
!175 = !MDLocation(line: 83, column: 3, scope: !168)
!176 = !MDLocation(line: 84, column: 16, scope: !172)
!177 = !MDLocation(line: 84, column: 20, scope: !172)
!178 = !MDLocation(line: 84, column: 5, scope: !172)
!179 = !MDLocation(line: 84, column: 13, scope: !172)
!180 = !MDLocation(line: 84, column: 29, scope: !172)
!181 = !MDLocation(line: 84, column: 25, scope: !172)
!182 = !MDLocation(line: 84, column: 52, scope: !172)
!183 = !MDLocation(line: 84, column: 33, scope: !172)
!184 = !MDLocation(line: 83, column: 23, scope: !172)
!185 = !MDLocation(line: 83, column: 3, scope: !172)
!186 = !{!"0x100\00ifaceptr\0086\000", !22, !7, !187} ; [ DW_TAG_auto_variable ] [ifaceptr] [line 86]
!187 = !{!"0xf\00\000\0064\0064\000\000", null, null, !188} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!188 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !189, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!189 = !{null, !190, !11, !11, !192, !194, !17}
!190 = !{!"0x16\00int64_t\00197\000\000\000\000", !12, null, !191} ; [ DW_TAG_typedef ] [int64_t] [line 197, size 0, align 0, offset 0] [from long int]
!191 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!192 = !{!"0xf\00\000\0064\0064\000\000", null, null, !193} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!193 = !{!"0x26\00\000\000\000\000\000", null, null, !21} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from float]
!194 = !{!"0xf\00\000\0064\0064\000\000", null, null, !195} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!195 = !{!"0x26\00\000\000\000\000\000", null, null, !18} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from u_int8_t]
!196 = !MDLocation(line: 86, column: 10, scope: !22)
!197 = !{!"0x100\00max_init\0089\000", !22, !7, !198} ; [ DW_TAG_auto_variable ] [max_init] [line 89]
!198 = !{!"0xf\00\000\0064\0064\000\000", null, null, !199} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!199 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !200, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!200 = !{!201, null}
!201 = !{!"0xf\00\000\0064\0064\000\000", null, null, !202} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from max_file_t]
!202 = !{!"0x16\00max_file_t\00176\000\000\000\000", !203, null, !204} ; [ DW_TAG_typedef ] [max_file_t] [line 176, size 0, align 0, offset 0] [from max_file]
!203 = !{!"/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/slic/include/slic_typedefs.h", !"/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve"}
!204 = !{!"0x13\00max_file\00173\00128\0064\000\000\000", !203, null, null, !205, null, null, null} ; [ DW_TAG_structure_type ] [max_file] [line 173, size 128, align 64, offset 0] [def] [from ]
!205 = !{!206, !210}
!206 = !{!"0xd\00errors\00174\0064\0064\000\000", !203, !204, !207} ; [ DW_TAG_member ] [errors] [line 174, size 64, align 64, offset 0] [from ]
!207 = !{!"0xf\00\000\0064\0064\000\000", null, null, !208} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from max_errors_t]
!208 = !{!"0x16\00max_errors_t\0094\000\000\000\000", !203, null, !209} ; [ DW_TAG_typedef ] [max_errors_t] [line 94, size 0, align 0, offset 0] [from max_errors]
!209 = !{!"0x13\00max_errors\0093\000\000\000\004\000", !203, null, null, null, null, null, null} ; [ DW_TAG_structure_type ] [max_errors] [line 93, size 0, align 0, offset 0] [decl] [from ]
!210 = !{!"0xd\00maxfile_internal\00175\0064\0064\0064\000", !203, !204, !211} ; [ DW_TAG_member ] [maxfile_internal] [line 175, size 64, align 64, offset 64] [from ]
!211 = !{!"0xf\00\000\0064\0064\000\000", null, null, !212} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from max_file_internal_t]
!212 = !{!"0x16\00max_file_internal_t\0097\000\000\000\000", !203, null, !213} ; [ DW_TAG_typedef ] [max_file_internal_t] [line 97, size 0, align 0, offset 0] [from max_file_internal]
!213 = !{!"0x13\00max_file_internal\0096\000\000\000\004\000", !203, null, null, null, null, null, null} ; [ DW_TAG_structure_type ] [max_file_internal] [line 96, size 0, align 0, offset 0] [decl] [from ]
!214 = !MDLocation(line: 89, column: 17, scope: !22)
!215 = !{!"0x100\00dlhandle\0091\000", !22, !7, !4} ; [ DW_TAG_auto_variable ] [dlhandle] [line 91]
!216 = !MDLocation(line: 91, column: 9, scope: !22)
!217 = !MDLocation(line: 91, column: 27, scope: !22)
!218 = !MDLocation(line: 91, column: 20, scope: !22)
!219 = !MDLocation(line: 93, column: 8, scope: !220)
!220 = !{!"0xb\0093\007\0015", !1, !22}           ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!221 = !MDLocation(line: 93, column: 7, scope: !22)
!222 = !MDLocation(line: 94, column: 13, scope: !223)
!223 = !{!"0xb\0093\0018\0016", !1, !220}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!224 = !MDLocation(line: 94, column: 5, scope: !223)
!225 = !MDLocation(line: 95, column: 51, scope: !223)
!226 = !MDLocation(line: 95, column: 5, scope: !223)
!227 = !MDLocation(line: 96, column: 5, scope: !223)
!228 = !MDLocation(line: 100, column: 20, scope: !22)
!229 = !MDLocation(line: 100, column: 14, scope: !22)
!230 = !MDLocation(line: 100, column: 3, scope: !22)
!231 = !MDLocation(line: 101, column: 16, scope: !232)
!232 = !{!"0xb\00101\007\0017", !1, !22}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!233 = !MDLocation(line: 101, column: 8, scope: !232)
!234 = !MDLocation(line: 101, column: 7, scope: !232)
!235 = !MDLocation(line: 101, column: 7, scope: !22)
!236 = !MDLocation(line: 102, column: 47, scope: !237)
!237 = !{!"0xb\00101\0036\0018", !1, !232}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!238 = !MDLocation(line: 102, column: 5, scope: !237)
!239 = !MDLocation(line: 103, column: 5, scope: !237)
!240 = !MDLocation(line: 106, column: 20, scope: !22)
!241 = !MDLocation(line: 106, column: 14, scope: !22)
!242 = !MDLocation(line: 106, column: 3, scope: !22)
!243 = !MDLocation(line: 107, column: 16, scope: !244)
!244 = !{!"0xb\00107\007\0019", !1, !22}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!245 = !MDLocation(line: 107, column: 8, scope: !244)
!246 = !MDLocation(line: 107, column: 7, scope: !244)
!247 = !MDLocation(line: 107, column: 7, scope: !22)
!248 = !MDLocation(line: 108, column: 47, scope: !249)
!249 = !{!"0xb\00107\0036\0020", !1, !244}        ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!250 = !MDLocation(line: 108, column: 5, scope: !249)
!251 = !MDLocation(line: 109, column: 5, scope: !249)
!252 = !MDLocation(line: 112, column: 3, scope: !22)
!253 = !MDLocation(line: 116, column: 5, scope: !22)
!254 = !MDLocation(line: 116, column: 15, scope: !22)
!255 = !MDLocation(line: 116, column: 20, scope: !22)
!256 = !MDLocation(line: 116, column: 24, scope: !22)
!257 = !MDLocation(line: 116, column: 28, scope: !22)
!258 = !MDLocation(line: 116, column: 32, scope: !22)
!259 = !MDLocation(line: 116, column: 40, scope: !22)
!260 = !MDLocation(line: 116, column: 44, scope: !22)
!261 = !MDLocation(line: 118, column: 3, scope: !22)
!262 = !MDLocation(line: 120, column: 11, scope: !22)
!263 = !MDLocation(line: 120, column: 3, scope: !22)
!264 = !MDLocation(line: 122, column: 8, scope: !265)
!265 = !{!"0xb\00122\003\0021", !1, !22}          ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!266 = !MDLocation(line: 122, column: 15, scope: !267)
!267 = !{!"0xb\002", !1, !268}                    ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!268 = !{!"0xb\001", !1, !269}                    ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!269 = !{!"0xb\00122\003\0022", !1, !265}         ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
!270 = !MDLocation(line: 122, column: 19, scope: !269)
!271 = !MDLocation(line: 122, column: 15, scope: !269)
!272 = !MDLocation(line: 122, column: 3, scope: !265)
!273 = !MDLocation(line: 123, column: 16, scope: !269)
!274 = !MDLocation(line: 123, column: 12, scope: !269)
!275 = !MDLocation(line: 123, column: 25, scope: !269)
!276 = !MDLocation(line: 123, column: 29, scope: !269)
!277 = !MDLocation(line: 123, column: 5, scope: !269)
!278 = !MDLocation(line: 123, column: 21, scope: !269)
!279 = !MDLocation(line: 123, column: 53, scope: !269)
!280 = !MDLocation(line: 123, column: 34, scope: !269)
!281 = !MDLocation(line: 122, column: 23, scope: !269)
!282 = !MDLocation(line: 122, column: 3, scope: !269)
!283 = !MDLocation(line: 125, column: 8, scope: !22)
!284 = !MDLocation(line: 125, column: 3, scope: !22)
!285 = !MDLocation(line: 126, column: 8, scope: !22)
!286 = !MDLocation(line: 126, column: 3, scope: !22)
!287 = !MDLocation(line: 137, column: 1, scope: !22)
!288 = !MDLocation(line: 137, column: 1, scope: !289)
!289 = !{!"0xb\001", !1, !22}                     ; [ DW_TAG_lexical_block ] [/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c]
