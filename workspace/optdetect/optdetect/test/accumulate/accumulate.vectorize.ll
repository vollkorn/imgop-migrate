; ModuleID = 'accumulate.opt.lr.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @accumulate_1d_addr(i32* %in, i32* %out, i32 %y, i32 %x, i32 %rowstride, i32 %s, i32 %w_size) #0 {
entry:
  %div = sdiv i32 %w_size, 2
  %sub = sub nsw i32 0, %div
  %0 = sext i32 %sub to i64
  %1 = sext i32 %div to i64
  %2 = sext i32 %sub to i64
  %3 = sext i32 %div to i64
  %4 = sext i32 %x to i64
  %5 = sext i32 %rowstride to i64
  %6 = sext i32 %y to i64
  %cmp5 = icmp sle i64 %2, %3
  br i1 %cmp5, label %for.body.lr.ph, label %for.end10

for.body.lr.ph:                                   ; preds = %entry
  %7 = sext i32 %div to i64
  %8 = sub i32 0, %div
  %9 = sext i32 %8 to i64
  %10 = sub i64 %7, %9
  %11 = add i64 %7, 1
  %12 = sub i64 %11, %9
  br label %for.body

for.body:                                         ; preds = %for.inc8, %for.body.lr.ph
  %acc.07 = phi i32 [ 0, %for.body.lr.ph ], [ %acc.1.lcssa, %for.inc8 ]
  %indvars.iv26 = phi i64 [ %2, %for.body.lr.ph ], [ %indvars.iv.next3, %for.inc8 ]
  %cmp31 = icmp sle i64 %0, %1
  br i1 %cmp31, label %for.body4.lr.ph, label %for.end

for.body4.lr.ph:                                  ; preds = %for.body
  %backedge.overflow = icmp eq i64 %10, -1
  %overflow.check.anchor = add i64 %0, 0
  br i1 %backedge.overflow, label %scalar.ph, label %overflow.checked

overflow.checked:                                 ; preds = %for.body4.lr.ph
  %end.idx = add i64 %12, %0
  %n.mod.vf = urem i64 %12, 8
  %n.vec = sub i64 %12, %n.mod.vf
  %end.idx.rnd.down = add i64 %n.vec, %0
  %cmp.zero = icmp eq i64 %end.idx.rnd.down, %0
  %13 = insertelement <4 x i32> zeroinitializer, i32 %acc.07, i32 0
  br i1 %cmp.zero, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %overflow.checked
  %broadcast.splatinsert3 = insertelement <4 x i64> undef, i64 %4, i32 0
  %broadcast.splat4 = shufflevector <4 x i64> %broadcast.splatinsert3, <4 x i64> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert5 = insertelement <4 x i64> undef, i64 %indvars.iv26, i32 0
  %broadcast.splat6 = shufflevector <4 x i64> %broadcast.splatinsert5, <4 x i64> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert7 = insertelement <4 x i64> undef, i64 %5, i32 0
  %broadcast.splat8 = shufflevector <4 x i64> %broadcast.splatinsert7, <4 x i64> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert9 = insertelement <4 x i64> undef, i64 %6, i32 0
  %broadcast.splat10 = shufflevector <4 x i64> %broadcast.splatinsert9, <4 x i64> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert13 = insertelement <4 x i64> undef, i64 %1, i32 0
  %broadcast.splat14 = shufflevector <4 x i64> %broadcast.splatinsert13, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ %0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ %13, %vector.ph ], [ %53, %vector.body ]
  %vec.phi1 = phi <4 x i32> [ zeroinitializer, %vector.ph ], [ %54, %vector.body ]
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %index, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  %induction = add <4 x i64> %broadcast.splat, <i64 0, i64 1, i64 2, i64 3>
  %induction2 = add <4 x i64> %broadcast.splat, <i64 4, i64 5, i64 6, i64 7>
  %14 = sub nsw <4 x i64> %broadcast.splat4, %broadcast.splat6
  %15 = sub nsw <4 x i64> %broadcast.splat4, %broadcast.splat6
  %16 = mul nsw <4 x i64> %14, %broadcast.splat8
  %17 = mul nsw <4 x i64> %15, %broadcast.splat8
  %18 = add nsw <4 x i64> %16, %broadcast.splat10
  %19 = add nsw <4 x i64> %17, %broadcast.splat10
  %20 = sub nsw <4 x i64> %18, %induction
  %21 = sub nsw <4 x i64> %19, %induction2
  %22 = extractelement <4 x i64> %20, i32 0
  %23 = getelementptr inbounds i32* %in, i64 %22
  %24 = insertelement <4 x i32*> undef, i32* %23, i32 0
  %25 = extractelement <4 x i64> %20, i32 1
  %26 = getelementptr inbounds i32* %in, i64 %25
  %27 = insertelement <4 x i32*> %24, i32* %26, i32 1
  %28 = extractelement <4 x i64> %20, i32 2
  %29 = getelementptr inbounds i32* %in, i64 %28
  %30 = insertelement <4 x i32*> %27, i32* %29, i32 2
  %31 = extractelement <4 x i64> %20, i32 3
  %32 = getelementptr inbounds i32* %in, i64 %31
  %33 = insertelement <4 x i32*> %30, i32* %32, i32 3
  %34 = extractelement <4 x i64> %21, i32 0
  %35 = getelementptr inbounds i32* %in, i64 %34
  %36 = insertelement <4 x i32*> undef, i32* %35, i32 0
  %37 = extractelement <4 x i64> %21, i32 1
  %38 = getelementptr inbounds i32* %in, i64 %37
  %39 = insertelement <4 x i32*> %36, i32* %38, i32 1
  %40 = extractelement <4 x i64> %21, i32 2
  %41 = getelementptr inbounds i32* %in, i64 %40
  %42 = insertelement <4 x i32*> %39, i32* %41, i32 2
  %43 = extractelement <4 x i64> %21, i32 3
  %44 = getelementptr inbounds i32* %in, i64 %43
  %45 = insertelement <4 x i32*> %42, i32* %44, i32 3
  %46 = getelementptr i32* %23, i32 0
  %47 = getelementptr i32* %46, i32 -3
  %48 = bitcast i32* %47 to <4 x i32>*
  %wide.load = load <4 x i32>* %48, align 4
  %reverse = shufflevector <4 x i32> %wide.load, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %49 = getelementptr i32* %23, i32 4
  %50 = getelementptr i32* %23, i32 -4
  %51 = getelementptr i32* %50, i32 -3
  %52 = bitcast i32* %51 to <4 x i32>*
  %wide.load11 = load <4 x i32>* %52, align 4
  %reverse12 = shufflevector <4 x i32> %wide.load11, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %53 = add nsw <4 x i32> %vec.phi, %reverse
  %54 = add nsw <4 x i32> %vec.phi1, %reverse12
  %55 = add nsw <4 x i64> %induction, <i64 1, i64 1, i64 1, i64 1>
  %56 = add nsw <4 x i64> %induction2, <i64 1, i64 1, i64 1, i64 1>
  %57 = icmp sle <4 x i64> %55, %broadcast.splat14
  %58 = icmp sle <4 x i64> %56, %broadcast.splat14
  %index.next = add i64 %index, 8
  %59 = icmp eq i64 %index.next, %end.idx.rnd.down
  br i1 %59, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body, %overflow.checked
  %resume.val = phi i64 [ %0, %overflow.checked ], [ %end.idx.rnd.down, %vector.body ]
  %trunc.resume.val = phi i64 [ %0, %overflow.checked ], [ %end.idx.rnd.down, %vector.body ]
  %rdx.vec.exit.phi = phi <4 x i32> [ %13, %overflow.checked ], [ %53, %vector.body ]
  %rdx.vec.exit.phi15 = phi <4 x i32> [ zeroinitializer, %overflow.checked ], [ %54, %vector.body ]
  %bin.rdx = add <4 x i32> %rdx.vec.exit.phi15, %rdx.vec.exit.phi
  %rdx.shuf = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx16 = add <4 x i32> %bin.rdx, %rdx.shuf
  %rdx.shuf17 = shufflevector <4 x i32> %bin.rdx16, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx18 = add <4 x i32> %bin.rdx16, %rdx.shuf17
  %60 = extractelement <4 x i32> %bin.rdx18, i32 0
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %for.cond2.for.end_crit_edge, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %for.body4.lr.ph
  %bc.resume.val = phi i64 [ %resume.val, %middle.block ], [ %0, %for.body4.lr.ph ]
  %bc.trunc.resume.val = phi i64 [ %trunc.resume.val, %middle.block ], [ %0, %for.body4.lr.ph ]
  %bc.merge.rdx = phi i32 [ %acc.07, %for.body4.lr.ph ], [ %60, %middle.block ]
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %scalar.ph
  %acc.14 = phi i32 [ %bc.merge.rdx, %scalar.ph ], [ %add7, %for.inc ]
  %indvars.iv3 = phi i64 [ %bc.trunc.resume.val, %scalar.ph ], [ %indvars.iv.next, %for.inc ]
  %61 = sub nsw i64 %4, %indvars.iv26
  %62 = mul nsw i64 %61, %5
  %63 = add nsw i64 %62, %6
  %64 = sub nsw i64 %63, %indvars.iv3
  %arrayidx = getelementptr inbounds i32* %in, i64 %64
  %65 = load i32* %arrayidx, align 4
  %add7 = add nsw i32 %acc.14, %65
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %indvars.iv.next = add nsw i64 %indvars.iv3, 1
  %cmp3 = icmp sle i64 %indvars.iv.next, %1
  br i1 %cmp3, label %for.body4, label %for.cond2.for.end_crit_edge, !llvm.loop !4

for.cond2.for.end_crit_edge:                      ; preds = %middle.block, %for.inc
  %split = phi i32 [ %add7, %for.inc ], [ %60, %middle.block ]
  br label %for.end

for.end:                                          ; preds = %for.cond2.for.end_crit_edge, %for.body
  %acc.1.lcssa = phi i32 [ %split, %for.cond2.for.end_crit_edge ], [ %acc.07, %for.body ]
  br label %for.inc8

for.inc8:                                         ; preds = %for.end
  %indvars.iv.next3 = add nsw i64 %indvars.iv26, 1
  %cmp = icmp sle i64 %indvars.iv.next3, %3
  br i1 %cmp, label %for.body, label %for.cond.for.end10_crit_edge

for.cond.for.end10_crit_edge:                     ; preds = %for.inc8
  %split8 = phi i32 [ %acc.1.lcssa, %for.inc8 ]
  br label %for.end10

for.end10:                                        ; preds = %for.cond.for.end10_crit_edge, %entry
  %acc.0.lcssa = phi i32 [ %split8, %for.cond.for.end10_crit_edge ], [ 0, %entry ]
  %mul11 = mul nsw i32 %x, %rowstride
  %add12 = add nsw i32 %mul11, %y
  %idxprom13 = sext i32 %add12 to i64
  %arrayidx14 = getelementptr inbounds i32* %out, i64 %idxprom13
  store i32 %acc.0.lcssa, i32* %arrayidx14, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @accumulate_2d_addr(i32** %in, i32** %out, i32 %y, i32 %x, i32 %w_size) #0 {
entry:
  %div = sdiv i32 %w_size, 2
  %sub = sub nsw i32 0, %div
  %0 = sext i32 %sub to i64
  %1 = sext i32 %div to i64
  %2 = sext i32 %x to i64
  %3 = sext i32 %sub to i64
  %4 = sext i32 %div to i64
  %5 = sext i32 %y to i64
  %cmp5 = icmp sle i64 %3, %4
  br i1 %cmp5, label %for.body.lr.ph, label %for.end11

for.body.lr.ph:                                   ; preds = %entry
  %6 = sext i32 %div to i64
  %7 = sub i32 0, %div
  %8 = sext i32 %7 to i64
  %9 = sub i64 %6, %8
  %10 = add i64 %6, 1
  %11 = sub i64 %10, %8
  br label %for.body

for.body:                                         ; preds = %for.inc9, %for.body.lr.ph
  %acc.07 = phi i32 [ 0, %for.body.lr.ph ], [ %acc.1.lcssa, %for.inc9 ]
  %indvars.iv26 = phi i64 [ %3, %for.body.lr.ph ], [ %indvars.iv.next3, %for.inc9 ]
  %cmp31 = icmp sle i64 %0, %1
  br i1 %cmp31, label %for.body4.lr.ph, label %for.end

for.body4.lr.ph:                                  ; preds = %for.body
  %backedge.overflow = icmp eq i64 %9, -1
  %overflow.check.anchor = add i64 %0, 0
  br i1 %backedge.overflow, label %scalar.ph, label %overflow.checked

overflow.checked:                                 ; preds = %for.body4.lr.ph
  %end.idx = add i64 %11, %0
  %n.mod.vf = urem i64 %11, 2
  %n.vec = sub i64 %11, %n.mod.vf
  %end.idx.rnd.down = add i64 %n.vec, %0
  %cmp.zero = icmp eq i64 %end.idx.rnd.down, %0
  br i1 %cmp.zero, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %overflow.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ %0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi i32 [ %acc.07, %vector.ph ], [ %24, %vector.body ]
  %vec.phi1 = phi i32 [ 0, %vector.ph ], [ %25, %vector.body ]
  %induction = add i64 %index, 0
  %induction2 = add i64 %index, 1
  %12 = add nsw i64 %2, %induction
  %13 = add nsw i64 %2, %induction2
  %14 = add nsw i64 %5, %indvars.iv26
  %15 = add nsw i64 %5, %indvars.iv26
  %16 = getelementptr inbounds i32** %in, i64 %14
  %17 = getelementptr inbounds i32** %in, i64 %15
  %18 = load i32** %16, align 8
  %19 = load i32** %17, align 8
  %20 = getelementptr inbounds i32* %18, i64 %12
  %21 = getelementptr inbounds i32* %19, i64 %13
  %22 = load i32* %20, align 4
  %23 = load i32* %21, align 4
  %24 = add nsw i32 %vec.phi, %22
  %25 = add nsw i32 %vec.phi1, %23
  %26 = add nsw i64 %induction, 1
  %27 = add nsw i64 %induction2, 1
  %28 = icmp sle i64 %26, %1
  %29 = icmp sle i64 %27, %1
  %index.next = add i64 %index, 2
  %30 = icmp eq i64 %index.next, %end.idx.rnd.down
  br i1 %30, label %middle.block, label %vector.body, !llvm.loop !5

middle.block:                                     ; preds = %vector.body, %overflow.checked
  %resume.val = phi i64 [ %0, %overflow.checked ], [ %end.idx.rnd.down, %vector.body ]
  %trunc.resume.val = phi i64 [ %0, %overflow.checked ], [ %end.idx.rnd.down, %vector.body ]
  %rdx.vec.exit.phi = phi i32 [ %acc.07, %overflow.checked ], [ %24, %vector.body ]
  %rdx.vec.exit.phi3 = phi i32 [ 0, %overflow.checked ], [ %25, %vector.body ]
  %bin.rdx = add i32 %rdx.vec.exit.phi3, %rdx.vec.exit.phi
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %for.cond2.for.end_crit_edge, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %for.body4.lr.ph
  %bc.resume.val = phi i64 [ %resume.val, %middle.block ], [ %0, %for.body4.lr.ph ]
  %bc.trunc.resume.val = phi i64 [ %trunc.resume.val, %middle.block ], [ %0, %for.body4.lr.ph ]
  %bc.merge.rdx = phi i32 [ %acc.07, %for.body4.lr.ph ], [ %bin.rdx, %middle.block ]
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %scalar.ph
  %acc.14 = phi i32 [ %bc.merge.rdx, %scalar.ph ], [ %add8, %for.inc ]
  %indvars.iv3 = phi i64 [ %bc.trunc.resume.val, %scalar.ph ], [ %indvars.iv.next, %for.inc ]
  %31 = add nsw i64 %2, %indvars.iv3
  %32 = add nsw i64 %5, %indvars.iv26
  %arrayidx = getelementptr inbounds i32** %in, i64 %32
  %33 = load i32** %arrayidx, align 8
  %arrayidx7 = getelementptr inbounds i32* %33, i64 %31
  %34 = load i32* %arrayidx7, align 4
  %add8 = add nsw i32 %acc.14, %34
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %indvars.iv.next = add nsw i64 %indvars.iv3, 1
  %cmp3 = icmp sle i64 %indvars.iv.next, %1
  br i1 %cmp3, label %for.body4, label %for.cond2.for.end_crit_edge, !llvm.loop !6

for.cond2.for.end_crit_edge:                      ; preds = %middle.block, %for.inc
  %split = phi i32 [ %add8, %for.inc ], [ %bin.rdx, %middle.block ]
  br label %for.end

for.end:                                          ; preds = %for.cond2.for.end_crit_edge, %for.body
  %acc.1.lcssa = phi i32 [ %split, %for.cond2.for.end_crit_edge ], [ %acc.07, %for.body ]
  br label %for.inc9

for.inc9:                                         ; preds = %for.end
  %indvars.iv.next3 = add nsw i64 %indvars.iv26, 1
  %cmp = icmp sle i64 %indvars.iv.next3, %4
  br i1 %cmp, label %for.body, label %for.cond.for.end11_crit_edge

for.cond.for.end11_crit_edge:                     ; preds = %for.inc9
  %split8 = phi i32 [ %acc.1.lcssa, %for.inc9 ]
  br label %for.end11

for.end11:                                        ; preds = %for.cond.for.end11_crit_edge, %entry
  %acc.0.lcssa = phi i32 [ %split8, %for.cond.for.end11_crit_edge ], [ 0, %entry ]
  %idxprom12 = sext i32 %x to i64
  %idxprom13 = sext i32 %y to i64
  %arrayidx14 = getelementptr inbounds i32** %out, i64 %idxprom13
  %35 = load i32** %arrayidx14, align 8
  %arrayidx15 = getelementptr inbounds i32* %35, i64 %idxprom12
  store i32 %acc.0.lcssa, i32* %arrayidx15, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @accumulate_1d_linear(i32* %in, i32 %n, i32 %m) #0 {
entry:
  %0 = sext i32 %n to i64
  %1 = sext i32 %m to i64
  %cmp1 = icmp sle i64 %0, %1
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %2 = sext i32 %m to i64
  %3 = sext i32 %n to i64
  %4 = sub i64 %2, %3
  %backedge.overflow = icmp eq i64 %4, -1
  %overflow.check.anchor = add i64 %0, 0
  br i1 %backedge.overflow, label %scalar.ph, label %overflow.checked

overflow.checked:                                 ; preds = %for.body.lr.ph
  %5 = add i64 %2, 1
  %6 = sub i64 %5, %3
  %end.idx = add i64 %6, %0
  %n.mod.vf = urem i64 %6, 8
  %n.vec = sub i64 %6, %n.mod.vf
  %end.idx.rnd.down = add i64 %n.vec, %0
  %cmp.zero = icmp eq i64 %end.idx.rnd.down, %0
  br i1 %cmp.zero, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %overflow.checked
  %broadcast.splatinsert4 = insertelement <4 x i64> undef, i64 %1, i32 0
  %broadcast.splat5 = shufflevector <4 x i64> %broadcast.splatinsert4, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ %0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ zeroinitializer, %vector.ph ], [ %35, %vector.body ]
  %vec.phi1 = phi <4 x i32> [ zeroinitializer, %vector.ph ], [ %36, %vector.body ]
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %index, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  %induction = add <4 x i64> %broadcast.splat, <i64 0, i64 1, i64 2, i64 3>
  %induction2 = add <4 x i64> %broadcast.splat, <i64 4, i64 5, i64 6, i64 7>
  %7 = extractelement <4 x i64> %induction, i32 0
  %8 = getelementptr inbounds i32* %in, i64 %7
  %9 = insertelement <4 x i32*> undef, i32* %8, i32 0
  %10 = extractelement <4 x i64> %induction, i32 1
  %11 = getelementptr inbounds i32* %in, i64 %10
  %12 = insertelement <4 x i32*> %9, i32* %11, i32 1
  %13 = extractelement <4 x i64> %induction, i32 2
  %14 = getelementptr inbounds i32* %in, i64 %13
  %15 = insertelement <4 x i32*> %12, i32* %14, i32 2
  %16 = extractelement <4 x i64> %induction, i32 3
  %17 = getelementptr inbounds i32* %in, i64 %16
  %18 = insertelement <4 x i32*> %15, i32* %17, i32 3
  %19 = extractelement <4 x i64> %induction2, i32 0
  %20 = getelementptr inbounds i32* %in, i64 %19
  %21 = insertelement <4 x i32*> undef, i32* %20, i32 0
  %22 = extractelement <4 x i64> %induction2, i32 1
  %23 = getelementptr inbounds i32* %in, i64 %22
  %24 = insertelement <4 x i32*> %21, i32* %23, i32 1
  %25 = extractelement <4 x i64> %induction2, i32 2
  %26 = getelementptr inbounds i32* %in, i64 %25
  %27 = insertelement <4 x i32*> %24, i32* %26, i32 2
  %28 = extractelement <4 x i64> %induction2, i32 3
  %29 = getelementptr inbounds i32* %in, i64 %28
  %30 = insertelement <4 x i32*> %27, i32* %29, i32 3
  %31 = getelementptr i32* %8, i32 0
  %32 = bitcast i32* %31 to <4 x i32>*
  %wide.load = load <4 x i32>* %32, align 4
  %33 = getelementptr i32* %8, i32 4
  %34 = bitcast i32* %33 to <4 x i32>*
  %wide.load3 = load <4 x i32>* %34, align 4
  %35 = add nsw <4 x i32> %vec.phi, %wide.load
  %36 = add nsw <4 x i32> %vec.phi1, %wide.load3
  %37 = add nsw <4 x i64> %induction, <i64 1, i64 1, i64 1, i64 1>
  %38 = add nsw <4 x i64> %induction2, <i64 1, i64 1, i64 1, i64 1>
  %39 = icmp sle <4 x i64> %37, %broadcast.splat5
  %40 = icmp sle <4 x i64> %38, %broadcast.splat5
  %index.next = add i64 %index, 8
  %41 = icmp eq i64 %index.next, %end.idx.rnd.down
  br i1 %41, label %middle.block, label %vector.body, !llvm.loop !7

middle.block:                                     ; preds = %vector.body, %overflow.checked
  %resume.val = phi i64 [ %0, %overflow.checked ], [ %end.idx.rnd.down, %vector.body ]
  %trunc.resume.val = phi i64 [ %0, %overflow.checked ], [ %end.idx.rnd.down, %vector.body ]
  %rdx.vec.exit.phi = phi <4 x i32> [ zeroinitializer, %overflow.checked ], [ %35, %vector.body ]
  %rdx.vec.exit.phi6 = phi <4 x i32> [ zeroinitializer, %overflow.checked ], [ %36, %vector.body ]
  %bin.rdx = add <4 x i32> %rdx.vec.exit.phi6, %rdx.vec.exit.phi
  %rdx.shuf = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx7 = add <4 x i32> %bin.rdx, %rdx.shuf
  %rdx.shuf8 = shufflevector <4 x i32> %bin.rdx7, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx9 = add <4 x i32> %bin.rdx7, %rdx.shuf8
  %42 = extractelement <4 x i32> %bin.rdx9, i32 0
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %for.cond.for.end_crit_edge, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %for.body.lr.ph
  %bc.resume.val = phi i64 [ %resume.val, %middle.block ], [ %0, %for.body.lr.ph ]
  %bc.trunc.resume.val = phi i64 [ %trunc.resume.val, %middle.block ], [ %0, %for.body.lr.ph ]
  %bc.merge.rdx = phi i32 [ 0, %for.body.lr.ph ], [ %42, %middle.block ]
  br label %for.body

for.body:                                         ; preds = %for.inc, %scalar.ph
  %acc.03 = phi i32 [ %bc.merge.rdx, %scalar.ph ], [ %add, %for.inc ]
  %indvars.iv2 = phi i64 [ %bc.trunc.resume.val, %scalar.ph ], [ %indvars.iv.next, %for.inc ]
  %arrayidx = getelementptr inbounds i32* %in, i64 %indvars.iv2
  %43 = load i32* %arrayidx, align 4
  %add = add nsw i32 %acc.03, %43
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %indvars.iv.next = add nsw i64 %indvars.iv2, 1
  %cmp = icmp sle i64 %indvars.iv.next, %1
  br i1 %cmp, label %for.body, label %for.cond.for.end_crit_edge, !llvm.loop !8

for.cond.for.end_crit_edge:                       ; preds = %middle.block, %for.inc
  %split = phi i32 [ %add, %for.inc ], [ %42, %middle.block ]
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry
  %acc.0.lcssa = phi i32 [ %split, %for.cond.for.end_crit_edge ], [ 0, %entry ]
  ret i32 %acc.0.lcssa
}

; Function Attrs: nounwind uwtable
define i32 @foo(i32* %A, i32* %B, i32 %n) #0 {
entry:
  %0 = sext i32 %n to i64
  %cmp1 = icmp slt i64 0, %0
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %sum.03 = phi i32 [ 0, %for.body.lr.ph ], [ %sum.1, %for.inc ]
  %indvars.iv2 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %arrayidx = getelementptr inbounds i32* %A, i64 %indvars.iv2
  %1 = load i32* %arrayidx, align 4
  %arrayidx2 = getelementptr inbounds i32* %B, i64 %indvars.iv2
  %2 = load i32* %arrayidx2, align 4
  %cmp3 = icmp sgt i32 %1, %2
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %arrayidx5 = getelementptr inbounds i32* %A, i64 %indvars.iv2
  %3 = load i32* %arrayidx5, align 4
  %add = add nsw i32 %3, 5
  %add6 = add i32 %sum.03, %add
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %sum.1 = phi i32 [ %add6, %if.then ], [ %sum.03, %for.body ]
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %indvars.iv.next = add nuw nsw i64 %indvars.iv2, 1
  %cmp = icmp slt i64 %indvars.iv.next, %0
  br i1 %cmp, label %for.body, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %for.inc
  %split = phi i32 [ %sum.1, %for.inc ]
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry
  %sum.0.lcssa = phi i32 [ %split, %for.cond.for.end_crit_edge ], [ 0, %entry ]
  ret i32 %sum.0.lcssa
}

; Function Attrs: nounwind uwtable
define i32 @accumulate_2d_addr_fixed(i32** %in, i32 %y, i32 %x) #0 {
entry:
  %0 = sext i32 %x to i64
  %1 = sext i32 %y to i64
  br label %for.body

for.body:                                         ; preds = %for.inc8, %entry
  %acc.04 = phi i32 [ 0, %entry ], [ %acc.1.lcssa, %for.inc8 ]
  %indvars.iv23 = phi i64 [ -8, %entry ], [ %indvars.iv.next3, %for.inc8 ]
  br label %for.body3

for.body3:                                        ; preds = %for.inc, %for.body
  %acc.12 = phi i32 [ %acc.04, %for.body ], [ %add7, %for.inc ]
  %indvars.iv1 = phi i64 [ -8, %for.body ], [ %indvars.iv.next, %for.inc ]
  %2 = add nsw i64 %0, %indvars.iv1
  %3 = add nsw i64 %1, %indvars.iv23
  %arrayidx = getelementptr inbounds i32** %in, i64 %3
  %4 = load i32** %arrayidx, align 8
  %arrayidx6 = getelementptr inbounds i32* %4, i64 %2
  %5 = load i32* %arrayidx6, align 4
  %add7 = add nsw i32 %acc.12, %5
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %indvars.iv.next = add nsw i64 %indvars.iv1, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 9
  br i1 %exitcond, label %for.body3, label %for.end

for.end:                                          ; preds = %for.inc
  %acc.1.lcssa = phi i32 [ %add7, %for.inc ]
  br label %for.inc8

for.inc8:                                         ; preds = %for.end
  %indvars.iv.next3 = add nsw i64 %indvars.iv23, 1
  %exitcond5 = icmp ne i64 %indvars.iv.next3, 9
  br i1 %exitcond5, label %for.body, label %for.end10

for.end10:                                        ; preds = %for.inc8
  %acc.0.lcssa = phi i32 [ %acc.1.lcssa, %for.inc8 ]
  ret i32 %acc.0.lcssa
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !2, !3}
!5 = distinct !{!5, !2, !3}
!6 = distinct !{!6, !2, !3}
!7 = distinct !{!7, !2, !3}
!8 = distinct !{!8, !2, !3}
