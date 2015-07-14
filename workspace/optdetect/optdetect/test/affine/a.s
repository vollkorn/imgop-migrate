	.text
	.file	"a.ll"
	.section	.debug_info,"",@progbits
.Lsection_info:
	.section	.debug_abbrev,"",@progbits
.Lsection_abbrev:
	.section	.debug_line,"",@progbits
.Lsection_line:
	.section	.debug_pubnames,"",@progbits
	.section	.debug_pubtypes,"",@progbits
	.section	.debug_str,"MS",@progbits,1
.Linfo_string:
	.section	.debug_loc,"",@progbits
.Lsection_debug_loc:
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
	.file	1 "/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/hw_interface.c"
	.text
	.globl	matrix_multiply
	.align	16, 0x90
	.type	matrix_multiply,@function
matrix_multiply:                        # @matrix_multiply
.Lfunc_begin0:
	.file	2 "/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation.c"
	.loc	2 12 0                  # transformation.c:12:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp0:
	.cfi_def_cfa_offset 16
.Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp2:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
.Ltmp3:
	.cfi_offset %rbx, -56
.Ltmp4:
	.cfi_offset %r12, -48
.Ltmp5:
	.cfi_offset %r13, -40
.Ltmp6:
	.cfi_offset %r14, -32
.Ltmp7:
	.cfi_offset %r15, -24
	#DEBUG_VALUE: matrix_multiply:l <- EDI
	#DEBUG_VALUE: matrix_multiply:m <- ESI
	#DEBUG_VALUE: matrix_multiply:n <- EDX
	#DEBUG_VALUE: matrix_multiply:A <- RCX
	#DEBUG_VALUE: matrix_multiply:B <- R8
	#DEBUG_VALUE: matrix_multiply:C <- R9
	movq	%r9, %rbx
.Ltmp8:
	#DEBUG_VALUE: matrix_multiply:C <- RBX
	movq	%r8, -88(%rbp)          # 8-byte Spill
.Ltmp9:
	#DEBUG_VALUE: matrix_multiply:B <- [RBP+-88]
	movq	%rcx, %r15
.Ltmp10:
	#DEBUG_VALUE: matrix_multiply:A <- R15
	movl	%edx, -44(%rbp)         # 4-byte Spill
	movl	%esi, %r13d
.Ltmp11:
	#DEBUG_VALUE: matrix_multiply:m <- R13D
	movl	%edx, %eax
.Ltmp12:
	#DEBUG_VALUE: matrix_multiply:i <- 0
	.loc	2 16 3 prologue_end     # transformation.c:16:3
	movq	%rax, -80(%rbp)         # 8-byte Spill
.Ltmp13:
	#DEBUG_VALUE: matrix_multiply:n <- [RBP+-44]
	testl	%edi, %edi
	jle	.LBB0_13
.Ltmp14:
# BB#1:                                 # %for.cond1.preheader.preheader
	#DEBUG_VALUE: matrix_multiply:l <- EDI
	#DEBUG_VALUE: matrix_multiply:m <- R13D
	#DEBUG_VALUE: matrix_multiply:n <- [RBP+-44]
	#DEBUG_VALUE: matrix_multiply:A <- R15
	#DEBUG_VALUE: matrix_multiply:B <- [RBP+-88]
	#DEBUG_VALUE: matrix_multiply:C <- RBX
	#DEBUG_VALUE: matrix_multiply:i <- 0
	movslq	-44(%rbp), %r12         # 4-byte Folded Reload
	.loc	2 17 17                 # transformation.c:17:17
.Ltmp15:
	leaq	(,%r12,4), %rax
	movq	%rax, -96(%rbp)         # 8-byte Spill
	movslq	%edi, %rcx
	movq	-80(%rbp), %rax         # 8-byte Reload
	leaq	(,%rax,4), %rax
	movq	%rax, -72(%rbp)         # 8-byte Spill
	movq	%rbx, %r14
	leaq	-1(%rcx), %rax
	movq	%rax, -64(%rbp)         # 8-byte Spill
.Ltmp16:
	.align	16, 0x90
.LBB0_2:                                # %for.cond1.preheader
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: matrix_multiply:m <- R13D
	#DEBUG_VALUE: matrix_multiply:n <- [RBP+-44]
	#DEBUG_VALUE: matrix_multiply:A <- R15
	#DEBUG_VALUE: matrix_multiply:B <- [RBP+-88]
	#DEBUG_VALUE: matrix_multiply:C <- RBX
	#DEBUG_VALUE: matrix_multiply:i <- 0
	.loc	2 17 5 is_stmt 0        # transformation.c:17:5
	cmpl	$0, -44(%rbp)           # 4-byte Folded Reload
	jle	.LBB0_4
.Ltmp17:
# BB#3:                                 # %for.body3.preheader
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: matrix_multiply:m <- R13D
	#DEBUG_VALUE: matrix_multiply:n <- [RBP+-44]
	#DEBUG_VALUE: matrix_multiply:A <- R15
	#DEBUG_VALUE: matrix_multiply:B <- [RBP+-88]
	#DEBUG_VALUE: matrix_multiply:C <- RBX
	#DEBUG_VALUE: matrix_multiply:i <- 0
	xorl	%esi, %esi
	.loc	2 18 6 is_stmt 1        # transformation.c:18:6
.Ltmp18:
	movq	%r14, %rdi
	movq	-96(%rbp), %rdx         # 8-byte Reload
	movq	%rcx, -56(%rbp)         # 8-byte Spill
	callq	memset
	movq	-56(%rbp), %rcx         # 8-byte Reload
.Ltmp19:
.LBB0_4:                                # %for.inc6
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: matrix_multiply:m <- R13D
	#DEBUG_VALUE: matrix_multiply:n <- [RBP+-44]
	#DEBUG_VALUE: matrix_multiply:A <- R15
	#DEBUG_VALUE: matrix_multiply:B <- [RBP+-88]
	#DEBUG_VALUE: matrix_multiply:C <- RBX
	#DEBUG_VALUE: matrix_multiply:i <- 0
	.loc	2 16 3                  # transformation.c:16:3
	addq	-72(%rbp), %r14         # 8-byte Folded Reload
	decq	%rcx
	jne	.LBB0_2
.Ltmp20:
# BB#5:                                 # %for.cond12.preheader.preheader
	#DEBUG_VALUE: matrix_multiply:m <- R13D
	#DEBUG_VALUE: matrix_multiply:n <- [RBP+-44]
	#DEBUG_VALUE: matrix_multiply:A <- R15
	#DEBUG_VALUE: matrix_multiply:B <- [RBP+-88]
	#DEBUG_VALUE: matrix_multiply:C <- RBX
	#DEBUG_VALUE: matrix_multiply:i <- 0
	.loc	2 17 17                 # transformation.c:17:17
	decq	%r12
	movslq	%r13d, %r8
.Ltmp21:
	.loc	2 21 17                 # transformation.c:21:17
	movq	-80(%rbp), %r14         # 8-byte Reload
	shlq	$2, %r14
	movl	%r8d, %eax
	shlq	$2, %rax
	movq	%rax, -56(%rbp)         # 8-byte Spill
	xorl	%r9d, %r9d
.Ltmp22:
	.align	16, 0x90
.LBB0_6:                                # %for.cond12.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_8 Depth 2
                                        #       Child Loop BB0_10 Depth 3
	#DEBUG_VALUE: matrix_multiply:m <- R13D
	#DEBUG_VALUE: matrix_multiply:n <- [RBP+-44]
	#DEBUG_VALUE: matrix_multiply:B <- [RBP+-88]
	#DEBUG_VALUE: matrix_multiply:C <- RBX
	#DEBUG_VALUE: matrix_multiply:i <- 0
	.loc	2 21 5 is_stmt 0        # transformation.c:21:5
	cmpl	$0, -44(%rbp)           # 4-byte Folded Reload
	jle	.LBB0_12
.Ltmp23:
# BB#7:                                 # %for.cond15.preheader.preheader
                                        #   in Loop: Header=BB0_6 Depth=1
	#DEBUG_VALUE: matrix_multiply:m <- R13D
	#DEBUG_VALUE: matrix_multiply:n <- [RBP+-44]
	#DEBUG_VALUE: matrix_multiply:B <- [RBP+-88]
	#DEBUG_VALUE: matrix_multiply:C <- RBX
	#DEBUG_VALUE: matrix_multiply:i <- 0
	.loc	2 23 19 is_stmt 1       # transformation.c:23:19
	movq	%r9, %r11
	imulq	-80(%rbp), %r11         # 8-byte Folded Reload
	movq	-88(%rbp), %rcx         # 8-byte Reload
	xorl	%esi, %esi
.Ltmp24:
	.align	16, 0x90
.LBB0_8:                                # %for.cond15.preheader
                                        #   Parent Loop BB0_6 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_10 Depth 3
	#DEBUG_VALUE: matrix_multiply:m <- R13D
	#DEBUG_VALUE: matrix_multiply:n <- [RBP+-44]
	#DEBUG_VALUE: matrix_multiply:B <- [RBP+-88]
	#DEBUG_VALUE: matrix_multiply:C <- RBX
	#DEBUG_VALUE: matrix_multiply:i <- 0
	.loc	2 22 7                  # transformation.c:22:7
	testl	%r13d, %r13d
	jle	.LBB0_11
.Ltmp25:
# BB#9:                                 # %for.body17.preheader
                                        #   in Loop: Header=BB0_8 Depth=2
	#DEBUG_VALUE: matrix_multiply:m <- R13D
	#DEBUG_VALUE: matrix_multiply:n <- [RBP+-44]
	#DEBUG_VALUE: matrix_multiply:B <- [RBP+-88]
	#DEBUG_VALUE: matrix_multiply:C <- RBX
	#DEBUG_VALUE: matrix_multiply:i <- 0
	.loc	2 23 19                 # transformation.c:23:19
	leaq	(%rsi,%r11), %rax
	movss	(%rbx,%rax,4), %xmm0
	movq	%r15, %rdi
	movq	%rcx, %rdx
	movq	%r8, %r10
.Ltmp26:
	.align	16, 0x90
.LBB0_10:                               # %for.body17
                                        #   Parent Loop BB0_6 Depth=1
                                        #     Parent Loop BB0_8 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	#DEBUG_VALUE: matrix_multiply:m <- R13D
	#DEBUG_VALUE: matrix_multiply:n <- [RBP+-44]
	#DEBUG_VALUE: matrix_multiply:B <- [RBP+-88]
	#DEBUG_VALUE: matrix_multiply:C <- RBX
	#DEBUG_VALUE: matrix_multiply:i <- 0
	.loc	2 23 29 is_stmt 0       # transformation.c:23:29
	movss	(%rdi), %xmm1
	mulss	(%rdx), %xmm1
	.loc	2 23 19                 # transformation.c:23:19
	addss	%xmm1, %xmm0
	.loc	2 23 9                  # transformation.c:23:9
	movss	%xmm0, (%rbx,%rax,4)
.Ltmp27:
	.loc	2 22 7 is_stmt 1        # transformation.c:22:7
	addq	$4, %rdx
	addq	$4, %rdi
	decq	%r10
	jne	.LBB0_10
.Ltmp28:
.LBB0_11:                               # %for.inc37
                                        #   in Loop: Header=BB0_8 Depth=2
	#DEBUG_VALUE: matrix_multiply:m <- R13D
	#DEBUG_VALUE: matrix_multiply:n <- [RBP+-44]
	#DEBUG_VALUE: matrix_multiply:B <- [RBP+-88]
	#DEBUG_VALUE: matrix_multiply:C <- RBX
	#DEBUG_VALUE: matrix_multiply:i <- 0
	.loc	2 21 5                  # transformation.c:21:5
	addq	%r14, %rcx
	cmpq	%r12, %rsi
	.loc	2 21 5 is_stmt 0        # transformation.c:21:5
.Ltmp29:
	leaq	1(%rsi), %rsi
	jne	.LBB0_8
.Ltmp30:
.LBB0_12:                               # %for.inc40
                                        #   in Loop: Header=BB0_6 Depth=1
	#DEBUG_VALUE: matrix_multiply:m <- R13D
	#DEBUG_VALUE: matrix_multiply:n <- [RBP+-44]
	#DEBUG_VALUE: matrix_multiply:B <- [RBP+-88]
	#DEBUG_VALUE: matrix_multiply:C <- RBX
	#DEBUG_VALUE: matrix_multiply:i <- 0
	.loc	2 20 3 is_stmt 1        # transformation.c:20:3
	addq	-56(%rbp), %r15         # 8-byte Folded Reload
	cmpq	-64(%rbp), %r9          # 8-byte Folded Reload
	.loc	2 20 3 is_stmt 0        # transformation.c:20:3
.Ltmp31:
	leaq	1(%r9), %r9
	jne	.LBB0_6
.Ltmp32:
.LBB0_13:                               # %for.end42
	.loc	2 25 1 is_stmt 1        # transformation.c:25:1
	addq	$56, %rsp
	#DEBUG_VALUE: matrix_multiply:i <- 0
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp33:
.Ltmp34:
	.size	matrix_multiply, .Ltmp34-matrix_multiply
.Lfunc_end0:
	.cfi_endproc

	.globl	transform
	.align	16, 0x90
	.type	transform,@function
transform:                              # @transform
.Lfunc_begin1:
	.loc	2 27 0                  # transformation.c:27:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp35:
	.cfi_def_cfa_offset 16
.Ltmp36:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp37:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$104, %rsp
.Ltmp38:
	.cfi_offset %rbx, -56
.Ltmp39:
	.cfi_offset %r12, -48
.Ltmp40:
	.cfi_offset %r13, -40
.Ltmp41:
	.cfi_offset %r14, -32
.Ltmp42:
	.cfi_offset %r15, -24
	#DEBUG_VALUE: transform:data_in <- RDI
	#DEBUG_VALUE: transform:data_out <- RSI
	#DEBUG_VALUE: transform:nx <- EDX
	#DEBUG_VALUE: transform:ny <- ECX
	#DEBUG_VALUE: transform:l <- R8D
	#DEBUG_VALUE: transform:m <- R9D
	movl	%r9d, %r15d
.Ltmp43:
	#DEBUG_VALUE: transform:m <- R15D
	movl	%r8d, -88(%rbp)         # 4-byte Spill
.Ltmp44:
	#DEBUG_VALUE: transform:l <- [RBP+-88]
                                        # kill: EDX<def> EDX<kill> RDX<def>
.Ltmp45:
	#DEBUG_VALUE: transform:nx <- [RBP+-136]
	movq	%rdx, -136(%rbp)        # 8-byte Spill
	movq	%rsi, -96(%rbp)         # 8-byte Spill
.Ltmp46:
	#DEBUG_VALUE: transform:data_out <- [RBP+-96]
	movq	%rdi, -104(%rbp)        # 8-byte Spill
.Ltmp47:
	#DEBUG_VALUE: transform:j <- 0
	#DEBUG_VALUE: transform:i <- 0
	#DEBUG_VALUE: transform:data_in <- [RBP+-104]
	.loc	2 31 9 prologue_end     # transformation.c:31:9
	movl	$0, -48(%rbp)
	movq	$0, -56(%rbp)
	.loc	2 32 9                  # transformation.c:32:9
	movl	$0, -64(%rbp)
	movq	$0, -72(%rbp)
	.loc	2 33 3                  # transformation.c:33:3
.Ltmp48:
	cmpl	$2, %ecx
	jl	.LBB1_13
.Ltmp49:
# BB#1:                                 # %for.cond1.preheader.preheader
	#DEBUG_VALUE: transform:data_in <- [RBP+-104]
	#DEBUG_VALUE: transform:data_out <- [RBP+-96]
	#DEBUG_VALUE: transform:nx <- [RBP+-136]
	#DEBUG_VALUE: transform:ny <- ECX
	#DEBUG_VALUE: transform:l <- [RBP+-88]
	#DEBUG_VALUE: transform:m <- R15D
	#DEBUG_VALUE: transform:i <- 0
	#DEBUG_VALUE: transform:j <- 0
	#DEBUG_VALUE: transform:M <- undef
	movslq	-88(%rbp), %rdx         # 4-byte Folded Reload
	.loc	2 33 19 is_stmt 0       # transformation.c:33:19
.Ltmp50:
	decl	%ecx
.Ltmp51:
	.loc	2 33 15                 # transformation.c:33:15
	movslq	%ecx, %rcx
	.loc	2 34 21 is_stmt 1       # transformation.c:34:21
.Ltmp52:
	movq	%rcx, -144(%rbp)        # 8-byte Spill
	movq	-136(%rbp), %rax        # 8-byte Reload
	leal	-1(%rax), %eax
	.loc	2 34 17 is_stmt 0       # transformation.c:34:17
	cltq
	.loc	2 45 17 is_stmt 1       # transformation.c:45:17
.Ltmp53:
	movq	%rax, -112(%rbp)        # 8-byte Spill
	cvtsi2ssl	%eax, %xmm0
.Ltmp54:
	#DEBUG_VALUE: __x <- [RBP+-116]
	.loc	2 49 17                 # transformation.c:49:17
	movss	%xmm0, -116(%rbp)       # 4-byte Spill
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%ecx, %xmm0
.Ltmp55:
	.loc	2 33 8                  # transformation.c:33:8
	movss	%xmm0, -120(%rbp)       # 4-byte Spill
	leaq	-1(%rdx), %r14
.Ltmp56:
	#DEBUG_VALUE: __y <- [RBP+-120]
	.loc	2 34 21                 # transformation.c:34:21
	shlq	$2, %rdx
	movq	%rdx, -128(%rbp)        # 8-byte Spill
	movslq	%r15d, %r12
	movl	%r12d, %r13d
	shlq	$2, %r13
	xorl	%eax, %eax
	movq	%rax, -80(%rbp)         # 8-byte Spill
.Ltmp57:
	.align	16, 0x90
.LBB1_2:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_4 Depth 2
                                        #       Child Loop BB1_6 Depth 3
                                        #         Child Loop BB1_8 Depth 4
	#DEBUG_VALUE: transform:data_in <- [RBP+-104]
	#DEBUG_VALUE: transform:data_out <- [RBP+-96]
	#DEBUG_VALUE: transform:nx <- [RBP+-136]
	#DEBUG_VALUE: transform:l <- [RBP+-88]
	#DEBUG_VALUE: transform:m <- R15D
	#DEBUG_VALUE: transform:i <- 0
	#DEBUG_VALUE: transform:j <- 0
	#DEBUG_VALUE: transform:M <- undef
	.loc	2 34 5 is_stmt 0        # transformation.c:34:5
	movq	-136(%rbp), %rax        # 8-byte Reload
	cmpl	$2, %eax
	jl	.LBB1_12
.Ltmp58:
# BB#3:                                 # %for.body4.preheader
                                        #   in Loop: Header=BB1_2 Depth=1
	#DEBUG_VALUE: transform:data_in <- [RBP+-104]
	#DEBUG_VALUE: transform:data_out <- [RBP+-96]
	#DEBUG_VALUE: transform:nx <- [RBP+-136]
	#DEBUG_VALUE: transform:l <- [RBP+-88]
	#DEBUG_VALUE: transform:m <- R15D
	#DEBUG_VALUE: transform:i <- 0
	#DEBUG_VALUE: transform:j <- 0
	#DEBUG_VALUE: transform:M <- undef
	.loc	2 37 17 is_stmt 1       # transformation.c:37:17
	movq	-80(%rbp), %rax         # 8-byte Reload
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	movss	%xmm0, -84(%rbp)        # 4-byte Spill
	xorl	%r8d, %r8d
.Ltmp59:
	.align	16, 0x90
.LBB1_4:                                # %for.body4
                                        #   Parent Loop BB1_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_6 Depth 3
                                        #         Child Loop BB1_8 Depth 4
	#DEBUG_VALUE: transform:data_in <- [RBP+-104]
	#DEBUG_VALUE: transform:data_out <- [RBP+-96]
	#DEBUG_VALUE: transform:nx <- [RBP+-136]
	#DEBUG_VALUE: transform:l <- [RBP+-88]
	#DEBUG_VALUE: transform:m <- R15D
	#DEBUG_VALUE: transform:i <- 0
	#DEBUG_VALUE: transform:j <- 0
	#DEBUG_VALUE: transform:M <- undef
	.loc	2 36 17                 # transformation.c:36:17
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%r8d, %xmm0
	.loc	2 36 7 is_stmt 0        # transformation.c:36:7
	movss	%xmm0, -72(%rbp)
	.loc	2 37 7 is_stmt 1        # transformation.c:37:7
	movss	-84(%rbp), %xmm0        # 4-byte Reload
	movss	%xmm0, -68(%rbp)
	.loc	2 38 7                  # transformation.c:38:7
	movl	$1065353216, -64(%rbp)  # imm = 0x3F800000
.Ltmp60:
	#DEBUG_VALUE: matrix_multiply:i <- 0
	#DEBUG_VALUE: matrix_multiply:n <- 1
	#DEBUG_VALUE: matrix_multiply:l <- [RBP+-88]
	.loc	2 16 3                  # transformation.c:16:3
	cmpl	$0, -88(%rbp)           # 4-byte Folded Reload
	jle	.LBB1_11
.Ltmp61:
# BB#5:                                 # %for.cond15.preheader.i.preheader
                                        #   in Loop: Header=BB1_4 Depth=2
	#DEBUG_VALUE: transform:data_in <- [RBP+-104]
	#DEBUG_VALUE: transform:data_out <- [RBP+-96]
	#DEBUG_VALUE: transform:nx <- [RBP+-136]
	#DEBUG_VALUE: transform:l <- [RBP+-88]
	#DEBUG_VALUE: transform:m <- R15D
	#DEBUG_VALUE: transform:i <- 0
	#DEBUG_VALUE: transform:j <- 0
	#DEBUG_VALUE: transform:M <- undef
	#DEBUG_VALUE: matrix_multiply:l <- [RBP+-88]
	#DEBUG_VALUE: matrix_multiply:n <- 1
	#DEBUG_VALUE: matrix_multiply:i <- 0
	xorl	%esi, %esi
	leaq	-56(%rbp), %rdi
	.loc	2 18 6                  # transformation.c:18:6
.Ltmp62:
	movq	-128(%rbp), %rdx        # 8-byte Reload
	movq	%r8, %rbx
	callq	memset
	movq	%rbx, %r8
	leaq	-72(%rbp), %rbx
	movq	16(%rbp), %rax
	xorl	%ecx, %ecx
.Ltmp63:
	.align	16, 0x90
.LBB1_6:                                # %for.cond15.preheader.i
                                        #   Parent Loop BB1_2 Depth=1
                                        #     Parent Loop BB1_4 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_8 Depth 4
	#DEBUG_VALUE: transform:data_in <- [RBP+-104]
	#DEBUG_VALUE: transform:data_out <- [RBP+-96]
	#DEBUG_VALUE: transform:nx <- [RBP+-136]
	#DEBUG_VALUE: transform:l <- [RBP+-88]
	#DEBUG_VALUE: transform:m <- R15D
	#DEBUG_VALUE: transform:i <- 0
	#DEBUG_VALUE: transform:j <- 0
	#DEBUG_VALUE: transform:M <- undef
	#DEBUG_VALUE: matrix_multiply:l <- [RBP+-88]
	#DEBUG_VALUE: matrix_multiply:n <- 1
	#DEBUG_VALUE: matrix_multiply:i <- 0
	.loc	2 22 7                  # transformation.c:22:7
	testl	%r15d, %r15d
.Ltmp64:
	#DEBUG_VALUE: matrix_multiply:m <- R15D
	jle	.LBB1_10
.Ltmp65:
# BB#7:                                 # %for.body17.i.preheader
                                        #   in Loop: Header=BB1_6 Depth=3
	#DEBUG_VALUE: transform:data_in <- [RBP+-104]
	#DEBUG_VALUE: transform:data_out <- [RBP+-96]
	#DEBUG_VALUE: transform:nx <- [RBP+-136]
	#DEBUG_VALUE: transform:l <- [RBP+-88]
	#DEBUG_VALUE: transform:m <- R15D
	#DEBUG_VALUE: transform:i <- 0
	#DEBUG_VALUE: transform:j <- 0
	#DEBUG_VALUE: transform:M <- undef
	#DEBUG_VALUE: matrix_multiply:l <- [RBP+-88]
	#DEBUG_VALUE: matrix_multiply:n <- 1
	#DEBUG_VALUE: matrix_multiply:i <- 0
	#DEBUG_VALUE: matrix_multiply:m <- R15D
	.loc	2 23 19                 # transformation.c:23:19
	movss	-56(%rbp,%rcx,4), %xmm0
	movq	%rax, %rdx
	movq	%rbx, %rsi
	movq	%r12, %rdi
.Ltmp66:
	.align	16, 0x90
.LBB1_8:                                # %for.body17.i
                                        #   Parent Loop BB1_2 Depth=1
                                        #     Parent Loop BB1_4 Depth=2
                                        #       Parent Loop BB1_6 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	#DEBUG_VALUE: transform:data_in <- [RBP+-104]
	#DEBUG_VALUE: transform:data_out <- [RBP+-96]
	#DEBUG_VALUE: transform:nx <- [RBP+-136]
	#DEBUG_VALUE: transform:l <- [RBP+-88]
	#DEBUG_VALUE: transform:m <- R15D
	#DEBUG_VALUE: transform:i <- 0
	#DEBUG_VALUE: transform:j <- 0
	#DEBUG_VALUE: transform:M <- undef
	#DEBUG_VALUE: matrix_multiply:l <- [RBP+-88]
	#DEBUG_VALUE: matrix_multiply:n <- 1
	#DEBUG_VALUE: matrix_multiply:i <- 0
	#DEBUG_VALUE: matrix_multiply:m <- R15D
	movaps	%xmm0, %xmm1
	.loc	2 23 29 is_stmt 0       # transformation.c:23:29
	movss	(%rdx), %xmm0
	mulss	(%rsi), %xmm0
	.loc	2 23 19                 # transformation.c:23:19
	addss	%xmm1, %xmm0
.Ltmp67:
	.loc	2 22 7 is_stmt 1        # transformation.c:22:7
	addq	$4, %rsi
	addq	$4, %rdx
	decq	%rdi
	jne	.LBB1_8
.Ltmp68:
# BB#9:                                 # %for.inc37.i.loopexit
                                        #   in Loop: Header=BB1_6 Depth=3
	#DEBUG_VALUE: transform:data_in <- [RBP+-104]
	#DEBUG_VALUE: transform:data_out <- [RBP+-96]
	#DEBUG_VALUE: transform:nx <- [RBP+-136]
	#DEBUG_VALUE: transform:l <- [RBP+-88]
	#DEBUG_VALUE: transform:m <- R15D
	#DEBUG_VALUE: transform:i <- 0
	#DEBUG_VALUE: transform:j <- 0
	#DEBUG_VALUE: transform:M <- undef
	#DEBUG_VALUE: matrix_multiply:l <- [RBP+-88]
	#DEBUG_VALUE: matrix_multiply:n <- 1
	#DEBUG_VALUE: matrix_multiply:i <- 0
	#DEBUG_VALUE: matrix_multiply:m <- R15D
	.loc	2 23 19                 # transformation.c:23:19
	movss	%xmm0, -56(%rbp,%rcx,4)
.Ltmp69:
.LBB1_10:                               # %for.inc37.i
                                        #   in Loop: Header=BB1_6 Depth=3
	#DEBUG_VALUE: transform:data_in <- [RBP+-104]
	#DEBUG_VALUE: transform:data_out <- [RBP+-96]
	#DEBUG_VALUE: transform:nx <- [RBP+-136]
	#DEBUG_VALUE: transform:l <- [RBP+-88]
	#DEBUG_VALUE: transform:m <- R15D
	#DEBUG_VALUE: transform:i <- 0
	#DEBUG_VALUE: transform:j <- 0
	#DEBUG_VALUE: transform:M <- undef
	#DEBUG_VALUE: matrix_multiply:l <- [RBP+-88]
	#DEBUG_VALUE: matrix_multiply:n <- 1
	#DEBUG_VALUE: matrix_multiply:i <- 0
	#DEBUG_VALUE: matrix_multiply:m <- R15D
	.loc	2 20 3                  # transformation.c:20:3
	addq	%r13, %rax
	cmpq	%r14, %rcx
	.loc	2 20 3 is_stmt 0        # transformation.c:20:3
.Ltmp70:
	leaq	1(%rcx), %rcx
	jne	.LBB1_6
.Ltmp71:
.LBB1_11:                               # %matrix_multiply.exit
                                        #   in Loop: Header=BB1_4 Depth=2
	#DEBUG_VALUE: transform:data_in <- [RBP+-104]
	#DEBUG_VALUE: transform:data_out <- [RBP+-96]
	#DEBUG_VALUE: transform:nx <- [RBP+-136]
	#DEBUG_VALUE: transform:l <- [RBP+-88]
	#DEBUG_VALUE: transform:m <- R15D
	#DEBUG_VALUE: transform:i <- 0
	#DEBUG_VALUE: transform:j <- 0
	#DEBUG_VALUE: transform:M <- undef
	.loc	2 45 11 is_stmt 1       # transformation.c:45:11
	movss	-116(%rbp), %xmm0       # 4-byte Reload
	minss	-56(%rbp), %xmm0
.Ltmp72:
	#DEBUG_VALUE: __x <- 0.000000e+00
	xorps	%xmm2, %xmm2
	.loc	2 47 11                 # transformation.c:47:11
.Ltmp73:
	ucomiss	%xmm0, %xmm2
.Ltmp74:
	.loc	2 49 11                 # transformation.c:49:11
	movss	-120(%rbp), %xmm1       # 4-byte Reload
	minss	-52(%rbp), %xmm1
	.loc	2 54 26                 # transformation.c:54:26
	cvttss2si	%xmm0, %eax
	.loc	2 54 7 is_stmt 0        # transformation.c:54:7
	cltq
	movl	$0, %esi
	cmovaq	%rsi, %rax
.Ltmp75:
	#DEBUG_VALUE: __y <- 0.000000e+00
	.loc	2 51 11 is_stmt 1       # transformation.c:51:11
	ucomiss	%xmm1, %xmm2
.Ltmp76:
	.loc	2 54 38                 # transformation.c:54:38
	movq	-104(%rbp), %rcx        # 8-byte Reload
	movq	-80(%rbp), %rdx         # 8-byte Reload
	movq	(%rcx,%rdx,8), %rcx
	movb	(%rcx,%r8), %cl
	.loc	2 54 16 is_stmt 0       # transformation.c:54:16
	cvttss2si	%xmm1, %edx
	.loc	2 54 7                  # transformation.c:54:7
	movslq	%edx, %rdx
	cmovaq	%rsi, %rdx
	movq	-96(%rbp), %rsi         # 8-byte Reload
	movq	(%rsi,%rdx,8), %rdx
	movb	%cl, (%rdx,%rax)
.Ltmp77:
	.loc	2 34 5 is_stmt 1        # transformation.c:34:5
	incq	%r8
	.loc	2 34 17 is_stmt 0       # transformation.c:34:17
	cmpq	-112(%rbp), %r8         # 8-byte Folded Reload
	jl	.LBB1_4
.Ltmp78:
.LBB1_12:                               # %for.inc47
                                        #   in Loop: Header=BB1_2 Depth=1
	#DEBUG_VALUE: transform:data_in <- [RBP+-104]
	#DEBUG_VALUE: transform:data_out <- [RBP+-96]
	#DEBUG_VALUE: transform:nx <- [RBP+-136]
	#DEBUG_VALUE: transform:l <- [RBP+-88]
	#DEBUG_VALUE: transform:m <- R15D
	#DEBUG_VALUE: transform:i <- 0
	#DEBUG_VALUE: transform:j <- 0
	#DEBUG_VALUE: transform:M <- undef
	movq	-80(%rbp), %rax         # 8-byte Reload
	.loc	2 33 3 is_stmt 1        # transformation.c:33:3
	incq	%rax
	.loc	2 33 15 is_stmt 0       # transformation.c:33:15
	movq	%rax, -80(%rbp)         # 8-byte Spill
	cmpq	-144(%rbp), %rax        # 8-byte Folded Reload
	jl	.LBB1_2
.Ltmp79:
.LBB1_13:                               # %for.end49
	.loc	2 56 1 is_stmt 1        # transformation.c:56:1
	addq	$104, %rsp
	#DEBUG_VALUE: transform:i <- 0
	#DEBUG_VALUE: transform:j <- 0
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp80:
.Ltmp81:
	.size	transform, .Ltmp81-transform
.Lfunc_end1:
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin2:
	.file	3 "/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine/transformation_driver.c"
	.loc	3 22 0                  # transformation_driver.c:22:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp82:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp83:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp84:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp85:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp86:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp87:
	.cfi_def_cfa_offset 56
	subq	$40, %rsp
.Ltmp88:
	.cfi_def_cfa_offset 96
.Ltmp89:
	.cfi_offset %rbx, -56
.Ltmp90:
	.cfi_offset %r12, -48
.Ltmp91:
	.cfi_offset %r13, -40
.Ltmp92:
	.cfi_offset %r14, -32
.Ltmp93:
	.cfi_offset %r15, -24
.Ltmp94:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: main:argc <- EDI
	#DEBUG_VALUE: main:argv <- RSI
	movq	%rsi, %r12
.Ltmp95:
	#DEBUG_VALUE: main:argv <- R12
	movl	%edi, %ebx
.Ltmp96:
	#DEBUG_VALUE: main:argc <- EBX
	.loc	3 24 2 prologue_end     # transformation_driver.c:24:2
	movl	$0, opterr(%rip)
.Ltmp97:
	#DEBUG_VALUE: main:_size_arr <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:arg <- 0
	#DEBUG_VALUE: main:verbose_output <- 0
	#DEBUG_VALUE: main:index <- 0
	xorl	%ecx, %ecx
.Ltmp98:
	#DEBUG_VALUE: main:filename_out <- RCX
	xorl	%r15d, %r15d
.Ltmp99:
.LBB2_1:                                # %while.cond.outer
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_2 Depth 2
	#DEBUG_VALUE: main:argc <- EBX
	#DEBUG_VALUE: main:argv <- R12
	#DEBUG_VALUE: main:index <- 0
	#DEBUG_VALUE: main:verbose_output <- 0
	#DEBUG_VALUE: main:arg <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_size_arr <- 0
	movl	%ecx, %ebp
	jmp	.LBB2_2
.Ltmp100:
	.align	16, 0x90
.LBB2_5:                                # %sw.bb
                                        #   in Loop: Header=BB2_2 Depth=2
	#DEBUG_VALUE: main:argc <- EBX
	#DEBUG_VALUE: main:argv <- R12
	#DEBUG_VALUE: main:index <- 0
	#DEBUG_VALUE: main:verbose_output <- 0
	#DEBUG_VALUE: main:arg <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_size_arr <- 0
	.loc	3 42 22                 # transformation_driver.c:42:22
	movq	optarg(%rip), %r15
.Ltmp101:
	#DEBUG_VALUE: main:filename_in <- R15
.LBB2_2:                                # %while.cond
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: main:argc <- EBX
	#DEBUG_VALUE: main:argv <- R12
	#DEBUG_VALUE: main:index <- 0
	#DEBUG_VALUE: main:verbose_output <- 0
	#DEBUG_VALUE: main:arg <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_size_arr <- 0
	.loc	3 39 19                 # transformation_driver.c:39:19
	movl	$.L.str, %edx
	movl	%ebx, %edi
	movq	%r12, %rsi
	callq	getopt
.Ltmp102:
	#DEBUG_VALUE: main:opt <- EAX
	.loc	3 39 5 is_stmt 0        # transformation_driver.c:39:5
	cmpl	$-1, %eax
	je	.LBB2_7
.Ltmp103:
# BB#3:                                 # %while.cond
                                        #   in Loop: Header=BB2_2 Depth=2
	#DEBUG_VALUE: main:argc <- EBX
	#DEBUG_VALUE: main:argv <- R12
	#DEBUG_VALUE: main:index <- 0
	#DEBUG_VALUE: main:verbose_output <- 0
	#DEBUG_VALUE: main:arg <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_size_arr <- 0
	#DEBUG_VALUE: main:opt <- EAX
	movl	$1, %ecx
	cmpl	$118, %eax
	je	.LBB2_1
.Ltmp104:
# BB#4:                                 # %while.cond
                                        #   in Loop: Header=BB2_2 Depth=2
	#DEBUG_VALUE: main:argc <- EBX
	#DEBUG_VALUE: main:argv <- R12
	#DEBUG_VALUE: main:index <- 0
	#DEBUG_VALUE: main:verbose_output <- 0
	#DEBUG_VALUE: main:arg <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_size_arr <- 0
	#DEBUG_VALUE: main:opt <- EAX
	cmpl	$102, %eax
	je	.LBB2_5
.Ltmp105:
# BB#6:                                 # %sw.default
	#DEBUG_VALUE: main:argv <- R12
	#DEBUG_VALUE: main:index <- 0
	#DEBUG_VALUE: main:verbose_output <- 0
	#DEBUG_VALUE: main:arg <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_size_arr <- 0
	.loc	3 48 17 is_stmt 1       # transformation_driver.c:48:17
	movq	stderr(%rip), %rdi
	.loc	3 48 53 is_stmt 0       # transformation_driver.c:48:53
	movq	(%r12), %rdx
	.loc	3 48 9                  # transformation_driver.c:48:9
	movl	$.L.str1, %esi
	xorl	%eax, %eax
	callq	fprintf
	movl	$1, %edi
	.loc	3 49 9 is_stmt 1        # transformation_driver.c:49:9
	callq	exit
.Ltmp106:
.LBB2_7:                                # %while.end
	#DEBUG_VALUE: main:argc <- EBX
	#DEBUG_VALUE: main:argv <- R12
	#DEBUG_VALUE: main:index <- 0
	#DEBUG_VALUE: main:verbose_output <- 0
	#DEBUG_VALUE: main:arg <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_size_arr <- 0
	.loc	3 53 9                  # transformation_driver.c:53:9
	testq	%r15, %r15
	je	.LBB2_8
.Ltmp107:
# BB#14:                                # %if.else
	#DEBUG_VALUE: main:index <- 0
	#DEBUG_VALUE: main:verbose_output <- 0
	#DEBUG_VALUE: main:arg <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_size_arr <- 0
	leaq	32(%rsp), %rdi
.Ltmp108:
	#DEBUG_VALUE: main:data_input <- [RDI+0]
	leaq	24(%rsp), %rsi
.Ltmp109:
	#DEBUG_VALUE: main:ncols <- [RSI+0]
	leaq	28(%rsp), %rdx
.Ltmp110:
	#DEBUG_VALUE: main:nrows <- [RDX+0]
	leaq	20(%rsp), %rcx
.Ltmp111:
	#DEBUG_VALUE: main:nchannels <- [RCX+0]
	.loc	3 72 9                  # transformation_driver.c:72:9
	movq	%r15, %r8
	callq	jpeg_decompress
.Ltmp112:
	.loc	3 72 9 is_stmt 0        # transformation_driver.c:72:9
	testl	%eax, %eax
	jne	.LBB2_15
.Ltmp113:
# BB#16:                                # %if.end
	#DEBUG_VALUE: main:index <- 0
	#DEBUG_VALUE: main:verbose_output <- 0
	#DEBUG_VALUE: main:arg <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_size_arr <- 0
	.loc	3 76 36 is_stmt 1       # transformation_driver.c:76:36
	movl	28(%rsp), %edi
	.loc	3 76 43 is_stmt 0       # transformation_driver.c:76:43
	movl	24(%rsp), %esi
	xorl	%r14d, %r14d
	xorl	%edx, %edx
	.loc	3 76 20                 # transformation_driver.c:76:20
	callq	create_array_2d
	movq	%rax, %r13
.Ltmp114:
	#DEBUG_VALUE: main:data_output <- R13
	jmp	.LBB2_17
.Ltmp115:
.LBB2_8:                                # %if.then
	#DEBUG_VALUE: main:argc <- EBX
	#DEBUG_VALUE: main:argv <- R12
	#DEBUG_VALUE: main:index <- 0
	#DEBUG_VALUE: main:verbose_output <- 0
	#DEBUG_VALUE: main:arg <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_size_arr <- 0
	movl	%ebp, 8(%rsp)           # 4-byte Spill
	movslq	optind(%rip), %rax
	xorl	%r14d, %r14d
	.loc	3 54 7 is_stmt 1        # transformation_driver.c:54:7
.Ltmp116:
	cmpl	%ebx, %eax
	jge	.LBB2_13
.Ltmp117:
# BB#9:                                 # %for.body.lr.ph
	#DEBUG_VALUE: main:argc <- EBX
	#DEBUG_VALUE: main:argv <- R12
	#DEBUG_VALUE: main:index <- 0
	#DEBUG_VALUE: main:verbose_output <- 0
	#DEBUG_VALUE: main:arg <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_size_arr <- 0
	leaq	(%r12,%rax,8), %r15
	subl	%eax, %ebx
.Ltmp118:
	xorl	%ebp, %ebp
	xorl	%r14d, %r14d
.Ltmp119:
	.align	16, 0x90
.LBB2_10:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: main:index <- 0
	#DEBUG_VALUE: main:verbose_output <- 0
	#DEBUG_VALUE: main:arg <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_size_arr <- 0
	.loc	3 56 9                  # transformation_driver.c:56:9
	testl	%ebp, %ebp
	jne	.LBB2_12
# BB#11:                                # %sw.bb4
                                        #   in Loop: Header=BB2_10 Depth=1
	#DEBUG_VALUE: main:index <- 0
	#DEBUG_VALUE: main:verbose_output <- 0
	#DEBUG_VALUE: main:arg <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_size_arr <- 0
	.loc	3 58 27                 # transformation_driver.c:58:27
.Ltmp120:
	movq	(%r15,%rbp,8), %rdi
.Ltmp121:
	#DEBUG_VALUE: atoi:__nptr <- RDI
	xorl	%esi, %esi
	movl	$10, %edx
	.file	4 "/usr/include/stdlib.h"
	.loc	4 280 16                # /usr/include/stdlib.h:280:16
.Ltmp122:
	callq	strtol
	movq	%rax, %r14
.Ltmp123:
	#DEBUG_VALUE: main:_size_arr <- R14D
.LBB2_12:                               # %for.inc
                                        #   in Loop: Header=BB2_10 Depth=1
	#DEBUG_VALUE: main:index <- 0
	#DEBUG_VALUE: main:verbose_output <- 0
	#DEBUG_VALUE: main:arg <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_size_arr <- 0
	.loc	3 54 7                  # transformation_driver.c:54:7
	incq	%rbp
	cmpl	%ebp, %ebx
	jne	.LBB2_10
.Ltmp124:
.LBB2_13:                               # %for.end
	#DEBUG_VALUE: main:index <- 0
	#DEBUG_VALUE: main:verbose_output <- 0
	#DEBUG_VALUE: main:arg <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_size_arr <- 0
	.loc	3 63 15                 # transformation_driver.c:63:15
	movl	%r14d, 24(%rsp)
	.loc	3 63 7 is_stmt 0        # transformation_driver.c:63:7
	movl	%r14d, 28(%rsp)
	.loc	3 67 37 is_stmt 1       # transformation_driver.c:67:37
	movl	%r14d, %ebx
	movl	$1, %edx
	.loc	3 67 21 is_stmt 0       # transformation_driver.c:67:21
	movq	%rbx, %rdi
	movq	%rbx, %rsi
	callq	create_array_2d
.Ltmp125:
	#DEBUG_VALUE: main:data_input <- RAX
	.loc	3 67 7                  # transformation_driver.c:67:7
	movq	%rax, 32(%rsp)
	xorl	%edx, %edx
	.loc	3 68 21 is_stmt 1       # transformation_driver.c:68:21
	movq	%rbx, %rdi
	movq	%rbx, %rsi
	callq	create_array_2d
.Ltmp126:
	movq	%rax, %r13
.Ltmp127:
	#DEBUG_VALUE: main:data_output <- R13
	movl	$.L.str2, %r15d
	movl	8(%rsp), %ebp           # 4-byte Reload
.Ltmp128:
.LBB2_17:                               # %if.end21
	#DEBUG_VALUE: main:index <- 0
	#DEBUG_VALUE: main:verbose_output <- 0
	#DEBUG_VALUE: main:arg <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_size_arr <- 0
	.loc	3 79 49                 # transformation_driver.c:79:49
	movq	%r15, %rdi
	callq	strlen
	leaq	19(%rax), %rsi
	movl	$1, %edi
	.loc	3 79 28 is_stmt 0       # transformation_driver.c:79:28
	callq	calloc
	movq	%rax, %rbx
.Ltmp129:
	#DEBUG_VALUE: main:filename_out <- RBX
	.loc	3 80 5 is_stmt 1        # transformation_driver.c:80:5
	movq	%rbx, 8(%rsp)           # 8-byte Spill
	movq	%r15, %rdi
	callq	strlen
	movq	%rbx, %rdi
	movq	%r15, %rsi
	movq	%rax, %rdx
	callq	strncpy
	.loc	3 81 5                  # transformation_driver.c:81:5
	movq	%rbx, %rdi
	callq	strlen
	movabsq	$7453574130783579506, %rcx # imm = 0x67706A2E64656D72
	movq	%rcx, 8(%rbx,%rax)
	movabsq	$8027230303752975455, %rcx # imm = 0x6F66736E6172745F
	movq	%rcx, (%rbx,%rax)
	movb	$0, 16(%rbx,%rax)
.Ltmp130:
	#DEBUG_VALUE: main:filename_out <- [RSP+8]
	.loc	3 85 11                 # transformation_driver.c:85:11
	movq	32(%rsp), %rdi
	.loc	3 85 36 is_stmt 0       # transformation_driver.c:85:36
	movl	24(%rsp), %edx
	.loc	3 85 43                 # transformation_driver.c:85:43
	movl	28(%rsp), %ecx
	.loc	3 85 5                  # transformation_driver.c:85:5
	movq	%r13, %rsi
	callq	do_it
.Ltmp131:
	.loc	3 88 9 is_stmt 1        # transformation_driver.c:88:9
	testl	%ebp, %ebp
	je	.LBB2_23
# BB#18:                                # %if.end21
	#DEBUG_VALUE: main:index <- 0
	#DEBUG_VALUE: main:verbose_output <- 0
	#DEBUG_VALUE: main:arg <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_size_arr <- 0
.Ltmp132:
	#DEBUG_VALUE: main:filename_out <- [RSP+8]
	testl	%r14d, %r14d
	jle	.LBB2_23
.Ltmp133:
# BB#19:                                # %for.cond34.preheader.lr.ph
	#DEBUG_VALUE: main:index <- 0
	#DEBUG_VALUE: main:verbose_output <- 0
	#DEBUG_VALUE: main:arg <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_size_arr <- 0
	#DEBUG_VALUE: main:filename_out <- [RSP+8]
	.loc	3 89 8                  # transformation_driver.c:89:8
	leal	-1(%r14), %r15d
	xorl	%ebx, %ebx
.Ltmp134:
	.align	16, 0x90
.LBB2_20:                               # %for.body37.lr.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_21 Depth 2
	#DEBUG_VALUE: main:index <- 0
	#DEBUG_VALUE: main:verbose_output <- 0
	#DEBUG_VALUE: main:arg <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_size_arr <- 0
	#DEBUG_VALUE: main:filename_out <- [RSP+8]
	movq	%r13, %rbp
	movl	%r14d, %r12d
.Ltmp135:
	.align	16, 0x90
.LBB2_21:                               # %for.body37
                                        #   Parent Loop BB2_20 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: main:index <- 0
	#DEBUG_VALUE: main:verbose_output <- 0
	#DEBUG_VALUE: main:arg <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_size_arr <- 0
	#DEBUG_VALUE: main:filename_out <- [RSP+8]
	.loc	3 91 27                 # transformation_driver.c:91:27
	movq	(%rbp), %rax
	movzbl	(%rax,%rbx), %esi
	.loc	3 91 12 is_stmt 0       # transformation_driver.c:91:12
	movl	$.L.str5, %edi
	xorl	%eax, %eax
	callq	printf
.Ltmp136:
	.loc	3 90 10 is_stmt 1       # transformation_driver.c:90:10
	addq	$8, %rbp
	decl	%r12d
	jne	.LBB2_21
.Ltmp137:
# BB#22:                                # %for.end46
                                        #   in Loop: Header=BB2_20 Depth=1
	#DEBUG_VALUE: main:index <- 0
	#DEBUG_VALUE: main:verbose_output <- 0
	#DEBUG_VALUE: main:arg <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_size_arr <- 0
	#DEBUG_VALUE: main:filename_out <- [RSP+8]
	movl	$10, %edi
	.loc	3 93 10                 # transformation_driver.c:93:10
	callq	putchar
.Ltmp138:
	.loc	3 89 8                  # transformation_driver.c:89:8
	cmpl	%r15d, %ebx
	leaq	1(%rbx), %rbx
	jne	.LBB2_20
.Ltmp139:
.LBB2_23:                               # %if.end51
	#DEBUG_VALUE: main:index <- 0
	#DEBUG_VALUE: main:verbose_output <- 0
	#DEBUG_VALUE: main:arg <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_size_arr <- 0
	#DEBUG_VALUE: main:filename_out <- [RSP+8]
	.loc	3 97 33                 # transformation_driver.c:97:33
	movl	24(%rsp), %esi
	.loc	3 97 40 is_stmt 0       # transformation_driver.c:97:40
	movl	28(%rsp), %edx
	movl	$1, %ecx
	.loc	3 97 6                  # transformation_driver.c:97:6
	movq	%r13, %rdi
	movq	8(%rsp), %r8            # 8-byte Reload
	callq	jpeg_compress
.Ltmp140:
	.loc	3 99 20 is_stmt 1       # transformation_driver.c:99:20
	movl	28(%rsp), %edi
	.loc	3 99 27 is_stmt 0       # transformation_driver.c:99:27
	movq	32(%rsp), %rsi
	.loc	3 99 6                  # transformation_driver.c:99:6
	callq	free_array_2d
	.loc	3 100 20 is_stmt 1      # transformation_driver.c:100:20
	movl	28(%rsp), %edi
	.loc	3 100 6 is_stmt 0       # transformation_driver.c:100:6
	movq	%r13, %rsi
	callq	free_array_2d
	xorl	%eax, %eax
.LBB2_24:                               # %return
	.loc	3 102 1 is_stmt 1 discriminator 1 # transformation_driver.c:102:1
	addq	$40, %rsp
	#DEBUG_VALUE: main:index <- 0
	#DEBUG_VALUE: main:verbose_output <- 0
	#DEBUG_VALUE: main:arg <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_size_arr <- 0
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB2_15:                               # %if.then16
	#DEBUG_VALUE: main:index <- 0
	#DEBUG_VALUE: main:verbose_output <- 0
	#DEBUG_VALUE: main:arg <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_size_arr <- 0
	.loc	3 73 15                 # transformation_driver.c:73:15
.Ltmp141:
	movq	stderr(%rip), %rcx
	.loc	3 73 7 is_stmt 0        # transformation_driver.c:73:7
	movl	$.L.str3, %edi
	movl	$26, %esi
	movl	$1, %edx
	callq	fwrite
	movl	$1, %eax
	jmp	.LBB2_24
.Ltmp142:
.Ltmp143:
	.size	main, .Ltmp143-main
.Lfunc_end2:
	.cfi_endproc

	.globl	do_it
	.align	16, 0x90
	.type	do_it,@function
do_it:                                  # @do_it
.Lfunc_begin3:
	.loc	3 106 0 is_stmt 1       # transformation_driver.c:106:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp144:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp145:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp146:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp147:
	.cfi_def_cfa_offset 40
	subq	$152, %rsp
.Ltmp148:
	.cfi_def_cfa_offset 192
.Ltmp149:
	.cfi_offset %rbx, -40
.Ltmp150:
	.cfi_offset %r12, -32
.Ltmp151:
	.cfi_offset %r14, -24
.Ltmp152:
	.cfi_offset %r15, -16
	#DEBUG_VALUE: do_it:in <- RDI
	#DEBUG_VALUE: do_it:out <- RSI
	#DEBUG_VALUE: do_it:nx <- EDX
	#DEBUG_VALUE: do_it:ny <- ECX
	movq	%rsi, %r15
.Ltmp153:
	#DEBUG_VALUE: do_it:out <- R15
	movq	%rdi, %r14
.Ltmp154:
	#DEBUG_VALUE: do_it:shy <- 5.000000e-01
	#DEBUG_VALUE: do_it:shx <- 5.000000e-01
	#DEBUG_VALUE: do_it:sy <- 5.000000e-01
	#DEBUG_VALUE: do_it:sx <- 5.000000e-01
	#DEBUG_VALUE: do_it:dy <- 50
	#DEBUG_VALUE: do_it:dx <- 50
	#DEBUG_VALUE: do_it:in <- R14
	.loc	3 121 8 prologue_end    # transformation_driver.c:121:8
	movl	$1065353216, 112(%rsp)  # imm = 0x3F800000
	movl	$0, 116(%rsp)
	movl	$1112014848, 120(%rsp)  # imm = 0x42480000
	movl	$0, 124(%rsp)
	movl	$1065353216, 128(%rsp)  # imm = 0x3F800000
	movl	$1112014848, 132(%rsp)  # imm = 0x42480000
	movl	$0, 136(%rsp)
	movl	$0, 140(%rsp)
	movl	$1065353216, 144(%rsp)  # imm = 0x3F800000
	.loc	3 124 8                 # transformation_driver.c:124:8
	movl	$1056964608, 64(%rsp)   # imm = 0x3F000000
	movl	$0, 68(%rsp)
	movl	$0, 72(%rsp)
	movl	$0, 76(%rsp)
	movl	$1056964608, 80(%rsp)   # imm = 0x3F000000
	movl	$0, 84(%rsp)
	movl	$0, 88(%rsp)
	movl	$0, 92(%rsp)
	movl	$1065353216, 96(%rsp)   # imm = 0x3F800000
	.loc	3 127 8                 # transformation_driver.c:127:8
	movl	$1065353216, 16(%rsp)   # imm = 0x3F800000
	movl	$1056964608, 20(%rsp)   # imm = 0x3F000000
	movl	$0, 24(%rsp)
	movl	$1056964608, 28(%rsp)   # imm = 0x3F000000
	movl	$1065353216, 32(%rsp)   # imm = 0x3F800000
	movl	$0, 36(%rsp)
	movl	$0, 40(%rsp)
	movl	$0, 44(%rsp)
	movl	$1065353216, 48(%rsp)   # imm = 0x3F800000
	.loc	3 129 21                # transformation_driver.c:129:21
	movslq	%ecx, %r12
	.loc	3 129 25 is_stmt 0      # transformation_driver.c:129:25
	movslq	%edx, %rbx
	xorl	%ecx, %ecx
.Ltmp155:
	.loc	3 129 2                 # transformation_driver.c:129:2
	movq	%r15, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
.Ltmp156:
	callq	arr_set_value
	leaq	112(%rsp), %rax
.Ltmp157:
	#DEBUG_VALUE: do_it:T <- [RAX+0]
	.loc	3 130 2 is_stmt 1       # transformation_driver.c:130:2
	movq	%rax, (%rsp)
	movl	$3, %r8d
	movl	$3, %r9d
	movq	%r14, %rdi
	movq	%r15, %rsi
	movl	%ebx, %edx
	movl	%r12d, %ecx
	callq	transform
	xorl	%ecx, %ecx
	.loc	3 132 2                 # transformation_driver.c:132:2
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	arr_set_value
	leaq	64(%rsp), %rax
.Ltmp158:
	#DEBUG_VALUE: do_it:S <- [RAX+0]
	.loc	3 133 2                 # transformation_driver.c:133:2
	movq	%rax, (%rsp)
	movl	$3, %r8d
	movl	$3, %r9d
	movq	%r15, %rdi
	movq	%r14, %rsi
	movl	%ebx, %edx
	movl	%r12d, %ecx
	callq	transform
	xorl	%ecx, %ecx
	.loc	3 135 2                 # transformation_driver.c:135:2
	movq	%r15, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	arr_set_value
	leaq	16(%rsp), %rax
.Ltmp159:
	#DEBUG_VALUE: do_it:SH <- [RAX+0]
	.loc	3 136 2                 # transformation_driver.c:136:2
	movq	%rax, (%rsp)
	movl	$3, %r8d
	movl	$3, %r9d
	movq	%r14, %rdi
	movq	%r15, %rsi
	movl	%ebx, %edx
	movl	%r12d, %ecx
	callq	transform
	.loc	3 139 1                 # transformation_driver.c:139:1
	addq	$152, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
.Ltmp160:
	popq	%r15
.Ltmp161:
	retq
.Ltmp162:
.Ltmp163:
	.size	do_it, .Ltmp163-do_it
.Lfunc_end3:
	.cfi_endproc

	.globl	convolve_hw_use_accelerator
	.align	16, 0x90
	.type	convolve_hw_use_accelerator,@function
convolve_hw_use_accelerator:            # @convolve_hw_use_accelerator
.Lfunc_begin4:
	.loc	1 33 0                  # hw_interface.c:33:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp164:
	.cfi_def_cfa_offset 16
.Ltmp165:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp166:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	%edi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	.loc	1 34 12 prologue_end    # hw_interface.c:34:12
.Ltmp167:
	movb	$0, -17(%rbp)
	.loc	1 36 42                 # hw_interface.c:36:42
	movq	env_allow_hw(%rip), %rdi
	.loc	1 36 35 is_stmt 0       # hw_interface.c:36:35
	callq	getenv
	.loc	1 36 9                  # hw_interface.c:36:9
	movq	%rax, -32(%rbp)
	.loc	1 37 7 is_stmt 1        # hw_interface.c:37:7
	testq	%rax, %rax
	je	.LBB4_2
# BB#1:                                 # %if.then
	.loc	1 38 23                 # hw_interface.c:38:23
.Ltmp168:
	movq	-32(%rbp), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	.loc	1 38 16 is_stmt 0       # hw_interface.c:38:16
	callq	strtol
	.loc	1 38 5                  # hw_interface.c:38:5
	movb	%al, -17(%rbp)
.Ltmp169:
.LBB4_2:                                # %if.end
	.loc	1 41 7 is_stmt 1        # hw_interface.c:41:7
	cmpb	$0, -17(%rbp)
	je	.LBB4_7
# BB#3:                                 # %if.then3
	.loc	1 42 48                 # hw_interface.c:42:48
.Ltmp170:
	movl	-8(%rbp), %esi
	.loc	1 42 61 is_stmt 0       # hw_interface.c:42:61
	movl	-12(%rbp), %edx
	.loc	1 42 65                 # hw_interface.c:42:65
	movl	-16(%rbp), %ecx
	.loc	1 42 5                  # hw_interface.c:42:5
	movl	$.L.str41, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 43 9 is_stmt 1        # hw_interface.c:43:9
	cmpl	$10, -12(%rbp)
	jl	.LBB4_7
# BB#4:                                 # %land.lhs.true
	cmpl	$10, -16(%rbp)
	jl	.LBB4_7
# BB#5:                                 # %if.then8
	.loc	1 44 11                 # hw_interface.c:44:11
.Ltmp171:
	cmpl	$3, -8(%rbp)
	jl	.LBB4_7
# BB#6:                                 # %if.then11
	.loc	1 45 9                  # hw_interface.c:45:9
.Ltmp172:
	movb	$1, -1(%rbp)
	jmp	.LBB4_8
.Ltmp173:
.LBB4_7:                                # %if.end14
	.loc	1 48 3                  # hw_interface.c:48:3
	movb	$0, -1(%rbp)
.LBB4_8:                                # %return
	.loc	1 49 1                  # hw_interface.c:49:1
	movb	-1(%rbp), %al
	addq	$32, %rsp
	popq	%rbp
	retq
.Ltmp174:
.Ltmp175:
	.size	convolve_hw_use_accelerator, .Ltmp175-convolve_hw_use_accelerator
.Lfunc_end4:
	.cfi_endproc

	.globl	convolve_bypass_hw_iface0
	.align	16, 0x90
	.type	convolve_bypass_hw_iface0,@function
convolve_bypass_hw_iface0:              # @convolve_bypass_hw_iface0
.Lfunc_begin5:
	.loc	1 52 0                  # hw_interface.c:52:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp176:
	.cfi_def_cfa_offset 16
.Ltmp177:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp178:
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	%ecx, -28(%rbp)
	movl	%r8d, -32(%rbp)
	movl	%r9d, -36(%rbp)
	.loc	1 54 3 prologue_end     # hw_interface.c:54:3
.Ltmp179:
	movl	$.L.str52, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 55 108                # hw_interface.c:55:108
	movq	-8(%rbp), %rsi
	.loc	1 55 113 is_stmt 0      # hw_interface.c:55:113
	movq	-16(%rbp), %rdx
	.loc	1 56 10 is_stmt 1       # hw_interface.c:56:10
	movq	-24(%rbp), %rcx
	.loc	1 56 18 is_stmt 0       # hw_interface.c:56:18
	movl	-28(%rbp), %r8d
	.loc	1 56 31                 # hw_interface.c:56:31
	movl	-32(%rbp), %r9d
	.loc	1 56 35                 # hw_interface.c:56:35
	movl	-36(%rbp), %eax
	.loc	1 55 3 is_stmt 1        # hw_interface.c:55:3
	movl	%eax, (%rsp)
	movl	$.L.str6, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 57 1                  # hw_interface.c:57:1
	addq	$48, %rsp
	popq	%rbp
	retq
.Ltmp180:
.Ltmp181:
	.size	convolve_bypass_hw_iface0, .Ltmp181-convolve_bypass_hw_iface0
.Lfunc_end5:
	.cfi_endproc

	.globl	convolve_bypass_hw_iface1
	.align	16, 0x90
	.type	convolve_bypass_hw_iface1,@function
convolve_bypass_hw_iface1:              # @convolve_bypass_hw_iface1
.Lfunc_begin6:
	.loc	1 59 0                  # hw_interface.c:59:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp182:
	.cfi_def_cfa_offset 16
.Ltmp183:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp184:
	.cfi_def_cfa_register %rbp
	subq	$112, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	%ecx, -28(%rbp)
	movl	%r8d, -32(%rbp)
	movl	%r9d, -36(%rbp)
	.loc	1 62 3 prologue_end     # hw_interface.c:62:3
.Ltmp185:
	movl	$.L.str7, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 63 108                # hw_interface.c:63:108
	movq	-8(%rbp), %rsi
	.loc	1 63 113 is_stmt 0      # hw_interface.c:63:113
	movq	-16(%rbp), %rdx
	.loc	1 64 10 is_stmt 1       # hw_interface.c:64:10
	movq	-24(%rbp), %rcx
	.loc	1 64 18 is_stmt 0       # hw_interface.c:64:18
	movl	-28(%rbp), %r8d
	.loc	1 64 31                 # hw_interface.c:64:31
	movl	-32(%rbp), %r9d
	.loc	1 64 35                 # hw_interface.c:64:35
	movl	-36(%rbp), %eax
	.loc	1 63 3 is_stmt 1        # hw_interface.c:63:3
	movl	%eax, (%rsp)
	movl	$.L.str6, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 67 7                  # hw_interface.c:67:7
	cmpl	$3, -28(%rbp)
	jne	.LBB6_2
# BB#1:                                 # %if.then
	.loc	1 68 14                 # hw_interface.c:68:14
.Ltmp186:
	movq	libfilename_3_3(%rip), %rax
	jmp	.LBB6_6
.Ltmp187:
.LBB6_2:                                # %if.else
	.loc	1 69 14                 # hw_interface.c:69:14
	cmpl	$5, -28(%rbp)
	jne	.LBB6_4
# BB#3:                                 # %if.then3
	.loc	1 70 14                 # hw_interface.c:70:14
.Ltmp188:
	movq	libfilename_5_5(%rip), %rax
	jmp	.LBB6_6
.Ltmp189:
.LBB6_4:                                # %if.else4
	.loc	1 71 13                 # hw_interface.c:71:13
	cmpl	$7, -28(%rbp)
	jne	.LBB6_19
# BB#5:                                 # %if.then6
	.loc	1 72 14                 # hw_interface.c:72:14
.Ltmp190:
	movq	libfilename_7_7(%rip), %rax
.LBB6_6:                                # %if.end10
	.loc	1 72 4 is_stmt 0        # hw_interface.c:72:4
	movq	%rax, -56(%rbp)
.Ltmp191:
	#DEBUG_VALUE: convolve_bypass_hw_iface1:in <- [RBP+-64]
	.loc	1 79 44 is_stmt 1       # hw_interface.c:79:44
	movslq	-32(%rbp), %rax
	.loc	1 79 49 is_stmt 0       # hw_interface.c:79:49
	movslq	-36(%rbp), %rdi
	.loc	1 79 25                 # hw_interface.c:79:25
	imulq	%rax, %rdi
	.loc	1 79 18                 # hw_interface.c:79:18
	callq	malloc
	.loc	1 79 13                 # hw_interface.c:79:13
	movq	%rax, -64(%rbp)
.Ltmp192:
	#DEBUG_VALUE: convolve_bypass_hw_iface1:out <- [RBP+-72]
	.loc	1 80 45 is_stmt 1       # hw_interface.c:80:45
	movslq	-32(%rbp), %rax
	.loc	1 80 50 is_stmt 0       # hw_interface.c:80:50
	movslq	-36(%rbp), %rdi
	.loc	1 80 26                 # hw_interface.c:80:26
	imulq	%rax, %rdi
	.loc	1 80 19                 # hw_interface.c:80:19
	callq	malloc
	.loc	1 80 13                 # hw_interface.c:80:13
	movq	%rax, -72(%rbp)
.Ltmp193:
	#DEBUG_VALUE: convolve_bypass_hw_iface1:i <- [RBP+-76]
	.loc	1 82 7 is_stmt 1        # hw_interface.c:82:7
	movl	$0, -76(%rbp)
.Ltmp194:
	#DEBUG_VALUE: convolve_bypass_hw_iface1:j <- [RBP+-80]
	.loc	1 82 14 is_stmt 0       # hw_interface.c:82:14
	movl	$0, -80(%rbp)
	.loc	1 83 8 is_stmt 1        # hw_interface.c:83:8
.Ltmp195:
	movl	$0, -76(%rbp)
	jmp	.LBB6_7
	.align	16, 0x90
.LBB6_8:                                # %for.inc
                                        #   in Loop: Header=BB6_7 Depth=1
	#DEBUG_VALUE: convolve_bypass_hw_iface1:in <- [RBP+-64]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:out <- [RBP+-72]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:i <- [RBP+-76]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:j <- [RBP+-80]
	.loc	1 84 5                  # hw_interface.c:84:5
.Ltmp196:
	movslq	-76(%rbp), %rdi
	movslq	-32(%rbp), %rdx
	.loc	1 84 25 is_stmt 0       # hw_interface.c:84:25
	movq	-8(%rbp), %rax
	movq	(%rax,%rdi,8), %rsi
	.loc	1 84 16                 # hw_interface.c:84:16
	imulq	%rdx, %rdi
	.loc	1 84 5                  # hw_interface.c:84:5
	addq	-64(%rbp), %rdi
	callq	memcpy
	.loc	1 83 23 is_stmt 1       # hw_interface.c:83:23
	incl	-76(%rbp)
.LBB6_7:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: convolve_bypass_hw_iface1:in <- [RBP+-64]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:out <- [RBP+-72]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:i <- [RBP+-76]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:j <- [RBP+-80]
	.loc	1 83 15 is_stmt 0 discriminator 2 # hw_interface.c:83:15
.Ltmp197:
	movl	-76(%rbp), %eax
.Ltmp198:
	.loc	1 83 3                  # hw_interface.c:83:3
	cmpl	-36(%rbp), %eax
	jl	.LBB6_8
.Ltmp199:
# BB#9:                                 # %for.end
	#DEBUG_VALUE: convolve_bypass_hw_iface1:in <- [RBP+-64]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:out <- [RBP+-72]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:i <- [RBP+-76]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:j <- [RBP+-80]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:ifaceptr <- [RBP+-88]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:max_init <- [RBP+-96]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:dlhandle <- [RBP+-104]
	.loc	1 91 27 is_stmt 1       # hw_interface.c:91:27
	movq	-56(%rbp), %rdi
	movl	$257, %esi              # imm = 0x101
	.loc	1 91 20 is_stmt 0       # hw_interface.c:91:20
	callq	dlopen
	.loc	1 91 9                  # hw_interface.c:91:9
	movq	%rax, -104(%rbp)
	.loc	1 93 7 is_stmt 1        # hw_interface.c:93:7
	testq	%rax, %rax
	je	.LBB6_10
# BB#11:                                # %if.end30
	#DEBUG_VALUE: convolve_bypass_hw_iface1:in <- [RBP+-64]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:out <- [RBP+-72]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:i <- [RBP+-76]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:j <- [RBP+-80]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:ifaceptr <- [RBP+-88]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:max_init <- [RBP+-96]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:dlhandle <- [RBP+-104]
	.loc	1 100 20                # hw_interface.c:100:20
	movq	-104(%rbp), %rdi
	.loc	1 100 14 is_stmt 0      # hw_interface.c:100:14
	movl	$.L.str10, %esi
	callq	dlsym
	.loc	1 100 3                 # hw_interface.c:100:3
	movq	%rax, -88(%rbp)
	.loc	1 101 16 is_stmt 1      # hw_interface.c:101:16
.Ltmp200:
	callq	dlerror
	.loc	1 101 8 is_stmt 0       # hw_interface.c:101:8
	movq	%rax, -48(%rbp)
.Ltmp201:
	.loc	1 101 7                 # hw_interface.c:101:7
	testq	%rax, %rax
	jne	.LBB6_12
# BB#13:                                # %if.end37
	#DEBUG_VALUE: convolve_bypass_hw_iface1:in <- [RBP+-64]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:out <- [RBP+-72]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:i <- [RBP+-76]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:j <- [RBP+-80]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:ifaceptr <- [RBP+-88]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:max_init <- [RBP+-96]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:dlhandle <- [RBP+-104]
	.loc	1 106 20 is_stmt 1      # hw_interface.c:106:20
	movq	-104(%rbp), %rdi
	.loc	1 106 14 is_stmt 0      # hw_interface.c:106:14
	movl	$.L.str12, %esi
	callq	dlsym
	.loc	1 106 3                 # hw_interface.c:106:3
	movq	%rax, -96(%rbp)
	.loc	1 107 16 is_stmt 1      # hw_interface.c:107:16
.Ltmp202:
	callq	dlerror
	.loc	1 107 8 is_stmt 0       # hw_interface.c:107:8
	movq	%rax, -48(%rbp)
.Ltmp203:
	.loc	1 107 7                 # hw_interface.c:107:7
	testq	%rax, %rax
	je	.LBB6_14
.LBB6_12:                               # %if.then35
	#DEBUG_VALUE: convolve_bypass_hw_iface1:in <- [RBP+-64]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:out <- [RBP+-72]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:i <- [RBP+-76]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:j <- [RBP+-80]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:ifaceptr <- [RBP+-88]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:max_init <- [RBP+-96]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:dlhandle <- [RBP+-104]
	.loc	1 102 47 is_stmt 1      # hw_interface.c:102:47
.Ltmp204:
	movq	-48(%rbp), %rsi
	.loc	1 102 5 is_stmt 0       # hw_interface.c:102:5
	movl	$.L.str11, %edi
	xorl	%eax, %eax
	callq	printf
	jmp	.LBB6_18
.Ltmp205:
.LBB6_10:                               # %if.then27
	#DEBUG_VALUE: convolve_bypass_hw_iface1:in <- [RBP+-64]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:out <- [RBP+-72]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:i <- [RBP+-76]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:j <- [RBP+-80]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:ifaceptr <- [RBP+-88]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:max_init <- [RBP+-96]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:dlhandle <- [RBP+-104]
	.loc	1 94 13 is_stmt 1       # hw_interface.c:94:13
	callq	dlerror
	movq	%rax, %rcx
	.loc	1 94 5 is_stmt 0        # hw_interface.c:94:5
	movq	%rcx, -48(%rbp)
	.loc	1 95 5 is_stmt 1        # hw_interface.c:95:5
	movl	$.L.str9, %edi
	xorl	%eax, %eax
	movq	%rcx, %rsi
	callq	printf
	jmp	.LBB6_18
.Ltmp206:
.LBB6_19:                               # %if.else7
	.loc	1 75 47                 # hw_interface.c:75:47
	movl	-28(%rbp), %esi
	.loc	1 75 4 is_stmt 0        # hw_interface.c:75:4
	movl	$.L.str8, %edi
	xorl	%eax, %eax
	callq	printf
	jmp	.LBB6_18
.Ltmp207:
.LBB6_14:                               # %if.end44
	#DEBUG_VALUE: convolve_bypass_hw_iface1:in <- [RBP+-64]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:out <- [RBP+-72]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:i <- [RBP+-76]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:j <- [RBP+-80]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:ifaceptr <- [RBP+-88]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:max_init <- [RBP+-96]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:dlhandle <- [RBP+-104]
	.loc	1 112 3 is_stmt 1       # hw_interface.c:112:3
	movl	$.L.str13, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 116 15                # hw_interface.c:116:15
	movslq	-32(%rbp), %rsi
	movslq	-36(%rbp), %rdx
	movq	%rsi, %rdi
	imulq	%rdx, %rdi
	.loc	1 116 32 is_stmt 0      # hw_interface.c:116:32
	movq	-24(%rbp), %rcx
	.loc	1 116 40                # hw_interface.c:116:40
	movq	-64(%rbp), %r8
	.loc	1 116 44                # hw_interface.c:116:44
	movq	-72(%rbp), %r9
	.loc	1 116 5                 # hw_interface.c:116:5
                                        # kill: ESI<def> ESI<kill> RSI<kill>
                                        # kill: EDX<def> EDX<kill> RDX<kill>
	callq	*-88(%rbp)
	.loc	1 118 3 is_stmt 1       # hw_interface.c:118:3
	movl	$.L.str14, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 120 11                # hw_interface.c:120:11
	movq	-104(%rbp), %rdi
	.loc	1 120 3 is_stmt 0       # hw_interface.c:120:3
	callq	dlclose
	.loc	1 122 8 is_stmt 1       # hw_interface.c:122:8
.Ltmp208:
	movl	$0, -76(%rbp)
	jmp	.LBB6_15
	.align	16, 0x90
.LBB6_16:                               # %for.inc61
                                        #   in Loop: Header=BB6_15 Depth=1
	#DEBUG_VALUE: convolve_bypass_hw_iface1:in <- [RBP+-64]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:out <- [RBP+-72]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:i <- [RBP+-76]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:j <- [RBP+-80]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:ifaceptr <- [RBP+-88]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:max_init <- [RBP+-96]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:dlhandle <- [RBP+-104]
	.loc	1 123 12                # hw_interface.c:123:12
.Ltmp209:
	movslq	-76(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	(%rax,%rsi,8), %rdi
	.loc	1 123 5 is_stmt 0       # hw_interface.c:123:5
	movslq	-32(%rbp), %rdx
	.loc	1 123 25                # hw_interface.c:123:25
	imulq	%rdx, %rsi
	.loc	1 123 5                 # hw_interface.c:123:5
	addq	-72(%rbp), %rsi
	callq	memcpy
	.loc	1 122 23 is_stmt 1      # hw_interface.c:122:23
	incl	-76(%rbp)
.LBB6_15:                               # %for.cond50
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: convolve_bypass_hw_iface1:in <- [RBP+-64]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:out <- [RBP+-72]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:i <- [RBP+-76]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:j <- [RBP+-80]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:ifaceptr <- [RBP+-88]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:max_init <- [RBP+-96]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:dlhandle <- [RBP+-104]
	.loc	1 122 15 is_stmt 0 discriminator 2 # hw_interface.c:122:15
.Ltmp210:
	movl	-76(%rbp), %eax
.Ltmp211:
	.loc	1 122 3                 # hw_interface.c:122:3
	cmpl	-36(%rbp), %eax
	jl	.LBB6_16
.Ltmp212:
# BB#17:                                # %for.end63
	#DEBUG_VALUE: convolve_bypass_hw_iface1:in <- [RBP+-64]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:out <- [RBP+-72]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:i <- [RBP+-76]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:j <- [RBP+-80]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:ifaceptr <- [RBP+-88]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:max_init <- [RBP+-96]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:dlhandle <- [RBP+-104]
	.loc	1 125 8 is_stmt 1       # hw_interface.c:125:8
	movq	-64(%rbp), %rdi
	.loc	1 125 3 is_stmt 0       # hw_interface.c:125:3
	callq	free
	.loc	1 126 8 is_stmt 1       # hw_interface.c:126:8
	movq	-72(%rbp), %rdi
	.loc	1 126 3 is_stmt 0       # hw_interface.c:126:3
	callq	free
.LBB6_18:                               # %return
	.loc	1 137 1 is_stmt 1 discriminator 1 # hw_interface.c:137:1
	addq	$112, %rsp
	popq	%rbp
	retq
.Ltmp213:
.Ltmp214:
	.size	convolve_bypass_hw_iface1, .Ltmp214-convolve_bypass_hw_iface1
.Lfunc_end6:
	.cfi_endproc

	.globl	free_array_2d
	.align	16, 0x90
	.type	free_array_2d,@function
free_array_2d:                          # @free_array_2d
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp215:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp216:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp217:
	.cfi_def_cfa_offset 32
.Ltmp218:
	.cfi_offset %rbx, -32
.Ltmp219:
	.cfi_offset %r14, -24
.Ltmp220:
	.cfi_offset %r15, -16
	movq	%rsi, %r14
	movq	%rdi, %r15
	testq	%r15, %r15
	je	.LBB7_3
# BB#1:
	movq	%r14, %rbx
	.align	16, 0x90
.LBB7_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rbx), %rdi
	callq	free
	addq	$8, %rbx
	decq	%r15
	jne	.LBB7_2
.LBB7_3:                                # %for.end
	movq	%r14, %rdi
	popq	%rbx
	popq	%r14
	popq	%r15
	jmp	free                    # TAILCALL
.Ltmp221:
	.size	free_array_2d, .Ltmp221-free_array_2d
	.cfi_endproc

	.globl	create_array_2d
	.align	16, 0x90
	.type	create_array_2d,@function
create_array_2d:                        # @create_array_2d
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp222:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp223:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp224:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp225:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp226:
	.cfi_def_cfa_offset 48
.Ltmp227:
	.cfi_offset %rbx, -48
.Ltmp228:
	.cfi_offset %r12, -40
.Ltmp229:
	.cfi_offset %r14, -32
.Ltmp230:
	.cfi_offset %r15, -24
.Ltmp231:
	.cfi_offset %rbp, -16
	movl	%edx, %ebp
	movq	%rsi, %r14
	movq	%rdi, %rbx
	leaq	(,%rbx,8), %rdi
	callq	malloc
	movq	%rax, %r15
	testq	%rbx, %rbx
	je	.LBB8_5
# BB#1:                                 # %for.body.lr.ph
	movzbl	%bpl, %r12d
	movq	%r15, %rbp
	.align	16, 0x90
.LBB8_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	callq	malloc
	testq	%r14, %r14
	movq	%rax, (%rbp)
	je	.LBB8_4
# BB#3:                                 # %for.body8.lr.ph
                                        #   in Loop: Header=BB8_2 Depth=1
	movq	%rax, %rdi
	movl	%r12d, %esi
	movq	%r14, %rdx
	callq	memset
.LBB8_4:                                # %for.inc13
                                        #   in Loop: Header=BB8_2 Depth=1
	addq	$8, %rbp
	decq	%rbx
	jne	.LBB8_2
.LBB8_5:                                # %for.end15
	movq	%r15, %rax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp232:
	.size	create_array_2d, .Ltmp232-create_array_2d
	.cfi_endproc

	.globl	arr_set_value
	.align	16, 0x90
	.type	arr_set_value,@function
arr_set_value:                          # @arr_set_value
	.cfi_startproc
# BB#0:                                 # %entry
	testq	%rsi, %rsi
	je	.LBB9_6
# BB#1:                                 # %for.cond2.preheader.lr.ph
	decq	%rsi
	xorl	%r8d, %r8d
	.align	16, 0x90
.LBB9_2:                                # %for.cond2.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB9_4 Depth 2
	testq	%rdx, %rdx
	je	.LBB9_5
# BB#3:                                 # %for.body6.lr.ph
                                        #   in Loop: Header=BB9_2 Depth=1
	xorl	%r9d, %r9d
	.align	16, 0x90
.LBB9_4:                                # %for.body6
                                        #   Parent Loop BB9_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rdi,%r8,8), %rax
	movb	%cl, (%rax,%r9)
	incq	%r9
	cmpq	%r9, %rdx
	jne	.LBB9_4
.LBB9_5:                                # %for.inc9
                                        #   in Loop: Header=BB9_2 Depth=1
	cmpq	%rsi, %r8
	leaq	1(%r8), %r8
	jne	.LBB9_2
.LBB9_6:                                # %for.end11
	retq
.Ltmp233:
	.size	arr_set_value, .Ltmp233-arr_set_value
	.cfi_endproc

	.globl	arr_copy
	.align	16, 0x90
	.type	arr_copy,@function
arr_copy:                               # @arr_copy
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp234:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp235:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp236:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp237:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Ltmp238:
	.cfi_def_cfa_offset 48
.Ltmp239:
	.cfi_offset %rbx, -40
.Ltmp240:
	.cfi_offset %r12, -32
.Ltmp241:
	.cfi_offset %r14, -24
.Ltmp242:
	.cfi_offset %r15, -16
	movq	%rcx, %r14
	movq	%rdx, %r15
	movq	%rsi, %r12
	movq	%rdi, %rbx
	testq	%r15, %r15
	je	.LBB10_2
	.align	16, 0x90
.LBB10_1:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rdi
	movq	(%rbx), %rsi
	movq	%r14, %rdx
	callq	memcpy
	addq	$8, %rbx
	addq	$8, %r12
	decq	%r15
	jne	.LBB10_1
.LBB10_2:                               # %for.end
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Ltmp243:
	.size	arr_copy, .Ltmp243-arr_copy
	.cfi_endproc

	.globl	jpeg_decompress
	.align	16, 0x90
	.type	jpeg_decompress,@function
jpeg_decompress:                        # @jpeg_decompress
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp244:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp245:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp246:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp247:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp248:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp249:
	.cfi_def_cfa_offset 56
	subq	$840, %rsp              # imm = 0x348
.Ltmp250:
	.cfi_def_cfa_offset 896
.Ltmp251:
	.cfi_offset %rbx, -56
.Ltmp252:
	.cfi_offset %r12, -48
.Ltmp253:
	.cfi_offset %r13, -40
.Ltmp254:
	.cfi_offset %r14, -32
.Ltmp255:
	.cfi_offset %r15, -24
.Ltmp256:
	.cfi_offset %rbp, -16
	movq	%r8, %r14
	movq	%rcx, %r13
	movq	%rdx, %r12
	movq	%rsi, %rbx
	movq	%rdi, %rbp
	leaq	672(%rsp), %rdi
	callq	jpeg_std_error
	movq	%rax, 16(%rsp)
	leaq	16(%rsp), %rdi
	movl	$80, %esi
	movl	$656, %edx              # imm = 0x290
	callq	jpeg_CreateDecompress
	movl	$.L.str29, %esi
	movq	%r14, %rdi
	callq	fopen
	movq	%rax, %r15
	testq	%r15, %r15
	je	.LBB11_1
# BB#2:                                 # %if.end
	movq	%rbp, 8(%rsp)           # 8-byte Spill
	leaq	16(%rsp), %r14
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	jpeg_stdio_src
	movq	%r13, %rbp
	movl	$1, %r13d
	movl	$1, %esi
	movq	%r14, %rdi
	callq	jpeg_read_header
	movq	%r14, %rdi
	callq	jpeg_start_decompress
	movq	152(%rsp), %r14
	movl	%r14d, (%rbx)
	shrq	$32, %r14
	movl	%r14d, (%r12)
	movl	172(%rsp), %edx
	movl	%edx, (%rbp)
	cmpl	$2, %edx
	jae	.LBB11_3
# BB#4:                                 # %if.end10
	movl	(%rbx), %r13d
	movl	(%r12), %ebp
	movl	%ebp, %eax
	orl	%r13d, %eax
	je	.LBB11_5
# BB#6:                                 # %if.end15
	leaq	(,%rbp,8), %rdi
	callq	malloc
	movq	%rax, %r12
	testl	%ebp, %ebp
	je	.LBB11_11
# BB#7:                                 # %for.body.lr.ph.i
	movq	%r12, %rbx
	.align	16, 0x90
.LBB11_8:                               # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	movq	%r13, %rdi
	callq	malloc
	testl	%r13d, %r13d
	movq	%rax, (%rbx)
	je	.LBB11_10
# BB#9:                                 # %for.body8.lr.ph.i
                                        #   in Loop: Header=BB11_8 Depth=1
	xorl	%esi, %esi
	movq	%rax, %rdi
	movq	%r13, %rdx
	callq	memset
.LBB11_10:                              # %for.inc13.i
                                        #   in Loop: Header=BB11_8 Depth=1
	addq	$8, %rbx
	decq	%rbp
	jne	.LBB11_8
.LBB11_11:                              # %while.cond.preheader
	movl	184(%rsp), %eax
	cmpl	%r14d, %eax
	jae	.LBB11_14
# BB#12:
	leaq	16(%rsp), %rbx
	.align	16, 0x90
.LBB11_13:                              # %while.body
                                        # =>This Inner Loop Header: Depth=1
	movl	%eax, %eax
	leaq	(%r12,%rax,8), %rsi
	movl	$1, %edx
	movq	%rbx, %rdi
	callq	jpeg_read_scanlines
	movl	184(%rsp), %eax
	cmpl	156(%rsp), %eax
	jb	.LBB11_13
.LBB11_14:                              # %while.end
	movq	8(%rsp), %rax           # 8-byte Reload
	movq	%r12, (%rax)
	leaq	16(%rsp), %rbx
	movq	%rbx, %rdi
	callq	jpeg_finish_decompress
	movq	%rbx, %rdi
	callq	jpeg_destroy_decompress
	movq	%r15, %rdi
	callq	fclose
	xorl	%r13d, %r13d
.LBB11_15:                              # %cleanup
	movl	%r13d, %eax
	addq	$840, %rsp              # imm = 0x348
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB11_1:                               # %if.then
	movq	stderr(%rip), %rdi
	movl	$.L.str130, %esi
	xorl	%eax, %eax
	movq	%r14, %rdx
	callq	fprintf
	movl	$1, %r13d
	jmp	.LBB11_15
.LBB11_3:                               # %if.then7
	movq	stderr(%rip), %rdi
	movl	$.L.str231, %esi
	xorl	%eax, %eax
	callq	fprintf
	leaq	16(%rsp), %rbx
	movq	%rbx, %rdi
	callq	jpeg_finish_decompress
	movq	%rbx, %rdi
	callq	jpeg_destroy_decompress
	jmp	.LBB11_15
.LBB11_5:                               # %if.then13
	movq	stderr(%rip), %rcx
	movl	$.L.str332, %edi
	movl	$12, %esi
	movl	$1, %edx
	callq	fwrite
	movl	$1, %r13d
	jmp	.LBB11_15
.Ltmp257:
	.size	jpeg_decompress, .Ltmp257-jpeg_decompress
	.cfi_endproc

	.globl	jpeg_compress
	.align	16, 0x90
	.type	jpeg_compress,@function
jpeg_compress:                          # @jpeg_compress
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp258:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp259:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp260:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp261:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp262:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp263:
	.cfi_def_cfa_offset 56
	subq	$760, %rsp              # imm = 0x2F8
.Ltmp264:
	.cfi_def_cfa_offset 816
.Ltmp265:
	.cfi_offset %rbx, -56
.Ltmp266:
	.cfi_offset %r12, -48
.Ltmp267:
	.cfi_offset %r13, -40
.Ltmp268:
	.cfi_offset %r14, -32
.Ltmp269:
	.cfi_offset %r15, -24
.Ltmp270:
	.cfi_offset %rbp, -16
	movq	%r8, %r13
	movl	%ecx, %r12d
	movl	%edx, %ebx
	movl	%esi, %ebp
	movq	%rdi, %r15
	movl	$.L.str433, %esi
	movq	%r13, %rdi
	callq	fopen
	movq	%rax, %r14
	testq	%r14, %r14
	je	.LBB12_1
# BB#2:                                 # %if.end
	leaq	8(%rsp), %rdi
	callq	jpeg_std_error
	movq	%rax, 176(%rsp)
	leaq	176(%rsp), %r13
	movl	$80, %esi
	movl	$584, %edx              # imm = 0x248
	movq	%r13, %rdi
	callq	jpeg_CreateCompress
	movq	%r13, %rdi
	movq	%r14, %rsi
	callq	jpeg_stdio_dest
	movl	%ebp, 224(%rsp)
	movl	%ebx, 228(%rsp)
	movl	%r12d, 232(%rsp)
	cmpl	$3, %r12d
	jne	.LBB12_3
# BB#6:                                 # %if.then5
	movl	$2, 236(%rsp)
	jmp	.LBB12_7
.LBB12_3:                               # %if.end
	cmpl	$1, %r12d
	jne	.LBB12_5
# BB#4:                                 # %if.then3
	movl	$1, 236(%rsp)
.LBB12_7:                               # %if.end10
	leaq	176(%rsp), %rbx
	movq	%rbx, %rdi
	callq	jpeg_set_defaults
	movl	$75, %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	callq	jpeg_set_quality
	movl	$1, %esi
	movq	%rbx, %rdi
	callq	jpeg_start_compress
	movl	516(%rsp), %eax
	cmpl	228(%rsp), %eax
	jae	.LBB12_10
# BB#8:
	leaq	176(%rsp), %rbp
	leaq	(%rsp), %rbx
	.align	16, 0x90
.LBB12_9:                               # %while.body
                                        # =>This Inner Loop Header: Depth=1
	movl	%eax, %eax
	movq	(%r15,%rax,8), %rax
	movq	%rax, (%rsp)
	movl	$1, %edx
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	callq	jpeg_write_scanlines
	movl	516(%rsp), %eax
	cmpl	228(%rsp), %eax
	jb	.LBB12_9
.LBB12_10:                              # %while.end
	leaq	176(%rsp), %rdi
	callq	jpeg_finish_compress
	movq	%r14, %rdi
	callq	fclose
	xorl	%eax, %eax
.LBB12_11:                              # %return
	addq	$760, %rsp              # imm = 0x2F8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB12_1:                               # %if.then
	movq	stderr(%rip), %rdi
	movl	$.L.str534, %esi
	xorl	%eax, %eax
	movq	%r13, %rdx
	callq	fprintf
	movl	$1, %eax
	jmp	.LBB12_11
.LBB12_5:                               # %if.else7
	movq	stderr(%rip), %rdi
	movl	$.L.str635, %esi
	xorl	%eax, %eax
	movl	%r12d, %edx
	callq	fprintf
	movl	$1, %eax
	jmp	.LBB12_11
.Ltmp271:
	.size	jpeg_compress, .Ltmp271-jpeg_compress
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"f:v::"
	.size	.L.str, 6

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	"Usage: %s -f [file...]\n"
	.size	.L.str1, 24

	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	"jpeg decompression failed\n"
	.size	.L.str3, 27

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	"dummy"
	.size	.L.str2, 6

	.type	.L.str4,@object         # @.str4
	.section	.rodata,"a",@progbits
.L.str4:
	.asciz	"_transformed.jpg\000"
	.size	.L.str4, 18

	.type	.L.str5,@object         # @.str5
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str5:
	.asciz	"%d\t"
	.size	.L.str5, 4

	.type	libfilename_3_3,@object # @libfilename_3_3
	.data
	.globl	libfilename_3_3
	.align	8
libfilename_3_3:
	.quad	.L.str15
	.size	libfilename_3_3, 8

	.type	libfilename_5_5,@object # @libfilename_5_5
	.globl	libfilename_5_5
	.align	8
libfilename_5_5:
	.quad	.L.str116
	.size	libfilename_5_5, 8

	.type	libfilename_7_7,@object # @libfilename_7_7
	.globl	libfilename_7_7
	.align	8
libfilename_7_7:
	.quad	.L.str217
	.size	libfilename_7_7, 8

	.type	env_allow_hw,@object    # @env_allow_hw
	.globl	env_allow_hw
	.align	8
env_allow_hw:
	.quad	.L.str318
	.size	env_allow_hw, 8

	.type	.L.str41,@object        # @.str41
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str41:
	.asciz	"Filter size %d, nx: %d, ny: %d\n"
	.size	.L.str41, 32

	.type	.L.str52,@object        # @.str52
.L.str52:
	.asciz	"HW bypass 0 called\n"
	.size	.L.str52, 20

	.type	.L.str6,@object         # @.str6
.L.str6:
	.asciz	"Parameters:\nsrc: %p\ndst: %p\nkernel: %p\nFilter size: %d\nData size x: %d\nData size y: %d\n"
	.size	.L.str6, 88

	.type	.L.str7,@object         # @.str7
.L.str7:
	.asciz	"HW bypass 1 called\n"
	.size	.L.str7, 20

	.type	.L.str8,@object         # @.str8
.L.str8:
	.asciz	"No maxfile for filter size: %d\n"
	.size	.L.str8, 32

	.type	.L.str9,@object         # @.str9
.L.str9:
	.asciz	"Could not load shared library! %s\n"
	.size	.L.str9, 35

	.type	.L.str10,@object        # @.str10
.L.str10:
	.asciz	"MemStream"
	.size	.L.str10, 10

	.type	.L.str11,@object        # @.str11
.L.str11:
	.asciz	"Could not find interface: %s \n"
	.size	.L.str11, 31

	.type	.L.str12,@object        # @.str12
.L.str12:
	.asciz	"MemStream_init"
	.size	.L.str12, 15

	.type	.L.str13,@object        # @.str13
.L.str13:
	.asciz	"Initializing DFE\n"
	.size	.L.str13, 18

	.type	.L.str14,@object        # @.str14
.L.str14:
	.asciz	"DFE finished\n"
	.size	.L.str14, 14

	.type	.L.str15,@object        # @.str15
.L.str15:
	.asciz	"/home/lfunke/overlays/slic_convolution_3_3.so"
	.size	.L.str15, 46

	.type	.L.str116,@object       # @.str116
.L.str116:
	.asciz	"/home/lfunke/overlays/slic_convolution_5_5.so"
	.size	.L.str116, 46

	.type	.L.str217,@object       # @.str217
.L.str217:
	.asciz	"/home/lfunke/overlays/slic_convolution_7_7.so"
	.size	.L.str217, 46

	.type	.L.str318,@object       # @.str318
.L.str318:
	.asciz	"ALLOW_OP_MIGRATE"
	.size	.L.str318, 17

	.type	.L.str29,@object        # @.str29
.L.str29:
	.asciz	"rb"
	.size	.L.str29, 3

	.type	.L.str130,@object       # @.str130
.L.str130:
	.asciz	"can't open %s\n"
	.size	.L.str130, 15

	.type	.L.str231,@object       # @.str231
.L.str231:
	.asciz	"Only greyscale images supported! Channels: %d\n"
	.size	.L.str231, 47

	.type	.L.str332,@object       # @.str332
.L.str332:
	.asciz	"Image empty\n"
	.size	.L.str332, 13

	.type	.L.str433,@object       # @.str433
.L.str433:
	.asciz	"wb"
	.size	.L.str433, 3

	.type	.L.str534,@object       # @.str534
.L.str534:
	.asciz	"can't open: %s"
	.size	.L.str534, 15

	.type	.L.str635,@object       # @.str635
.L.str635:
	.asciz	"Cannot handle color space, channels: %d"
	.size	.L.str635, 40

	.data
.Ldebug_end0:
	.text
.Ldebug_end1:
	.file	5 "/usr/include/x86_64-linux-gnu/sys/types.h"
	.file	6 "/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/slic/include/slic_typedefs.h"
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)"
.Linfo_string1:
	.asciz	"transformation.c"
.Linfo_string2:
	.asciz	"/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/affine"
.Linfo_string3:
	.asciz	"int"
.Linfo_string4:
	.asciz	"transformation_driver.c"
.Linfo_string5:
	.asciz	"char"
.Linfo_string6:
	.asciz	"hw_interface.c"
.Linfo_string7:
	.asciz	"libfilename_3_3"
.Linfo_string8:
	.asciz	"libfilename_5_5"
.Linfo_string9:
	.asciz	"libfilename_7_7"
.Linfo_string10:
	.asciz	"env_allow_hw"
.Linfo_string11:
	.asciz	"matrix_multiply"
.Linfo_string12:
	.asciz	"l"
.Linfo_string13:
	.asciz	"m"
.Linfo_string14:
	.asciz	"n"
.Linfo_string15:
	.asciz	"i"
.Linfo_string16:
	.asciz	"atoi"
.Linfo_string17:
	.asciz	"__nptr"
.Linfo_string18:
	.asciz	"transform"
.Linfo_string19:
	.asciz	"main"
.Linfo_string20:
	.asciz	"do_it"
.Linfo_string21:
	.asciz	"convolve_hw_use_accelerator"
.Linfo_string22:
	.asciz	"_Bool"
.Linfo_string23:
	.asciz	"convolve_bypass_hw_iface0"
.Linfo_string24:
	.asciz	"convolve_bypass_hw_iface1"
.Linfo_string25:
	.asciz	"A"
.Linfo_string26:
	.asciz	"float"
.Linfo_string27:
	.asciz	"sizetype"
.Linfo_string28:
	.asciz	"B"
.Linfo_string29:
	.asciz	"C"
.Linfo_string30:
	.asciz	"T"
.Linfo_string31:
	.asciz	"data_in"
.Linfo_string32:
	.asciz	"unsigned char"
.Linfo_string33:
	.asciz	"u_int8_t"
.Linfo_string34:
	.asciz	"data_out"
.Linfo_string35:
	.asciz	"nx"
.Linfo_string36:
	.asciz	"ny"
.Linfo_string37:
	.asciz	"j"
.Linfo_string38:
	.asciz	"M"
.Linfo_string39:
	.asciz	"__x"
.Linfo_string40:
	.asciz	"__y"
.Linfo_string41:
	.asciz	"argc"
.Linfo_string42:
	.asciz	"argv"
.Linfo_string43:
	.asciz	"_size_arr"
.Linfo_string44:
	.asciz	"arg"
.Linfo_string45:
	.asciz	"verbose_output"
.Linfo_string46:
	.asciz	"index"
.Linfo_string47:
	.asciz	"filename_out"
.Linfo_string48:
	.asciz	"filename_in"
.Linfo_string49:
	.asciz	"opt"
.Linfo_string50:
	.asciz	"data_input"
.Linfo_string51:
	.asciz	"ncols"
.Linfo_string52:
	.asciz	"unsigned int"
.Linfo_string53:
	.asciz	"u_int32_t"
.Linfo_string54:
	.asciz	"nrows"
.Linfo_string55:
	.asciz	"nchannels"
.Linfo_string56:
	.asciz	"data_output"
.Linfo_string57:
	.asciz	"S"
.Linfo_string58:
	.asciz	"SH"
.Linfo_string59:
	.asciz	"in"
.Linfo_string60:
	.asciz	"out"
.Linfo_string61:
	.asciz	"shy"
.Linfo_string62:
	.asciz	"shx"
.Linfo_string63:
	.asciz	"sy"
.Linfo_string64:
	.asciz	"sx"
.Linfo_string65:
	.asciz	"dy"
.Linfo_string66:
	.asciz	"dx"
.Linfo_string67:
	.asciz	"filter_size"
.Linfo_string68:
	.asciz	"int32_t"
.Linfo_string69:
	.asciz	"allow_hw"
.Linfo_string70:
	.asciz	"pAllowHWAccelerationEnv"
.Linfo_string71:
	.asciz	"src"
.Linfo_string72:
	.asciz	"dst"
.Linfo_string73:
	.asciz	"kernel"
.Linfo_string74:
	.asciz	"error"
.Linfo_string75:
	.asciz	"libfile"
.Linfo_string76:
	.asciz	"ifaceptr"
.Linfo_string77:
	.asciz	"long int"
.Linfo_string78:
	.asciz	"int64_t"
.Linfo_string79:
	.asciz	"max_init"
.Linfo_string80:
	.asciz	"errors"
.Linfo_string81:
	.asciz	"max_errors"
.Linfo_string82:
	.asciz	"max_errors_t"
.Linfo_string83:
	.asciz	"maxfile_internal"
.Linfo_string84:
	.asciz	"max_file_internal"
.Linfo_string85:
	.asciz	"max_file_internal_t"
.Linfo_string86:
	.asciz	"max_file"
.Linfo_string87:
	.asciz	"max_file_t"
.Linfo_string88:
	.asciz	"dlhandle"
	.section	.debug_info,"",@progbits
.L.debug_info_begin0:
	.long	535                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x210 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x7 DW_TAG_base_type
	.long	.Linfo_string3          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	3                       # Abbrev [3] 0x31:0x62 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	147                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x44:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	155                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x4d:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc1            # DW_AT_location
	.long	166                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x56:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc2            # DW_AT_location
	.long	177                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x5f:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc3            # DW_AT_location
	.long	.Linfo_string25         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
	.long	462                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x6e:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc4            # DW_AT_location
	.long	.Linfo_string28         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
	.long	462                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x7d:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc5            # DW_AT_location
	.long	.Linfo_string29         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
	.long	462                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x8c:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	188                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0x93:0x35 DW_TAG_subprogram
	.long	.Linfo_string11         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	1                       # DW_AT_inline
	.byte	8                       # Abbrev [8] 0x9b:0xb DW_TAG_formal_parameter
	.long	.Linfo_string12         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	8                       # Abbrev [8] 0xa6:0xb DW_TAG_formal_parameter
	.long	.Linfo_string13         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	8                       # Abbrev [8] 0xb1:0xb DW_TAG_formal_parameter
	.long	.Linfo_string14         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0xbc:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	14                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	10                      # Abbrev [10] 0xc8:0x106 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string18         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	27                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	5                       # Abbrev [5] 0xdd:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc6            # DW_AT_location
	.long	.Linfo_string31         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	27                      # DW_AT_decl_line
	.long	510                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0xec:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc7            # DW_AT_location
	.long	.Linfo_string34         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	27                      # DW_AT_decl_line
	.long	510                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0xfb:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc8            # DW_AT_location
	.long	.Linfo_string35         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	27                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	5                       # Abbrev [5] 0x10a:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc9            # DW_AT_location
	.long	.Linfo_string36         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	27                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	5                       # Abbrev [5] 0x119:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc10           # DW_AT_location
	.long	.Linfo_string12         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	27                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	5                       # Abbrev [5] 0x128:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc11           # DW_AT_location
	.long	.Linfo_string13         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	27                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	8                       # Abbrev [8] 0x137:0xb DW_TAG_formal_parameter
	.long	.Linfo_string38         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	27                      # DW_AT_decl_line
	.long	462                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x142:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	72
	.long	.Linfo_string30         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
	.long	492                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x150:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.long	.Linfo_string25         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	32                      # DW_AT_decl_line
	.long	492                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x15f:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string37         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	29                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x16b:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string15         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	29                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	13                      # Abbrev [13] 0x177:0x56 DW_TAG_lexical_block
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	14                      # Abbrev [14] 0x17c:0xf DW_TAG_variable
	.long	.Ldebug_loc12           # DW_AT_location
	.long	.Linfo_string39         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	42                      # DW_AT_decl_line
	.long	478                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x18b:0xf DW_TAG_variable
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string40         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	43                      # DW_AT_decl_line
	.long	478                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x19a:0x32 DW_TAG_inlined_subroutine
	.long	147                     # DW_AT_abstract_origin
	.quad	.Ltmp60                 # DW_AT_low_pc
	.long	.Ltmp71-.Ltmp60         # DW_AT_high_pc
	.byte	2                       # DW_AT_call_file
	.byte	40                      # DW_AT_call_line
	.byte	16                      # Abbrev [16] 0x1ad:0x9 DW_TAG_formal_parameter
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\250\177"
	.long	155                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x1b6:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc14           # DW_AT_location
	.long	166                     # DW_AT_abstract_origin
	.byte	17                      # Abbrev [17] 0x1bf:0x6 DW_TAG_formal_parameter
	.byte	1                       # DW_AT_const_value
	.long	177                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x1c5:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	188                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	18                      # Abbrev [18] 0x1ce:0x5 DW_TAG_pointer_type
	.long	467                     # DW_AT_type
	.byte	19                      # Abbrev [19] 0x1d3:0xb DW_TAG_array_type
	.long	478                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1d8:0x5 DW_TAG_subrange_type
	.long	485                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	2                       # Abbrev [2] 0x1de:0x7 DW_TAG_base_type
	.long	.Linfo_string26         # DW_AT_name
	.byte	4                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	21                      # Abbrev [21] 0x1e5:0x7 DW_TAG_base_type
	.long	.Linfo_string27         # DW_AT_name
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # DW_AT_encoding
	.byte	19                      # Abbrev [19] 0x1ec:0x12 DW_TAG_array_type
	.long	478                     # DW_AT_type
	.byte	22                      # Abbrev [22] 0x1f1:0x6 DW_TAG_subrange_type
	.long	485                     # DW_AT_type
	.byte	3                       # DW_AT_count
	.byte	22                      # Abbrev [22] 0x1f7:0x6 DW_TAG_subrange_type
	.long	485                     # DW_AT_type
	.byte	1                       # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	18                      # Abbrev [18] 0x1fe:0x5 DW_TAG_pointer_type
	.long	515                     # DW_AT_type
	.byte	18                      # Abbrev [18] 0x203:0x5 DW_TAG_pointer_type
	.long	520                     # DW_AT_type
	.byte	23                      # Abbrev [23] 0x208:0xb DW_TAG_typedef
	.long	531                     # DW_AT_type
	.long	.Linfo_string33         # DW_AT_name
	.byte	5                       # DW_AT_decl_file
	.byte	200                     # DW_AT_decl_line
	.byte	2                       # Abbrev [2] 0x213:0x7 DW_TAG_base_type
	.long	.Linfo_string32         # DW_AT_name
	.byte	8                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	0                       # End Of Children Mark
.L.debug_info_begin1:
	.long	620                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	24                      # Abbrev [24] 0xb:0x265 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string4          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_APPLE_optimized
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin2 # DW_AT_high_pc
	.byte	18                      # Abbrev [18] 0x2a:0x5 DW_TAG_pointer_type
	.long	47                      # DW_AT_type
	.byte	2                       # Abbrev [2] 0x2f:0x7 DW_TAG_base_type
	.long	.Linfo_string5          # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	18                      # Abbrev [18] 0x36:0x5 DW_TAG_pointer_type
	.long	42                      # DW_AT_type
	.byte	25                      # Abbrev [25] 0x3b:0x1 DW_TAG_pointer_type
	.byte	26                      # Abbrev [26] 0x3c:0x1a DW_TAG_subprogram
	.long	.Linfo_string16         # DW_AT_name
	.byte	4                       # DW_AT_decl_file
	.short	278                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	.Lsection_info+42       # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	27                      # Abbrev [27] 0x49:0xc DW_TAG_formal_parameter
	.long	.Linfo_string17         # DW_AT_name
	.byte	4                       # DW_AT_decl_file
	.short	278                     # DW_AT_decl_line
	.long	.Lsection_info+1226     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	28                      # Abbrev [28] 0x56:0x118 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string19         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	22                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	.Lsection_info+42       # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	29                      # Abbrev [29] 0x6f:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc15           # DW_AT_location
	.long	.Linfo_string41         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	22                      # DW_AT_decl_line
	.long	.Lsection_info+42       # DW_AT_type
	.byte	5                       # Abbrev [5] 0x7e:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc16           # DW_AT_location
	.long	.Linfo_string42         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	22                      # DW_AT_decl_line
	.long	54                      # DW_AT_type
	.byte	30                      # Abbrev [30] 0x8d:0xf DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	.Linfo_string43         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	28                      # DW_AT_decl_line
	.long	.Lsection_info+42       # DW_AT_type
	.byte	31                      # Abbrev [31] 0x9c:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string37         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.long	.Lsection_info+42       # DW_AT_type
	.byte	31                      # Abbrev [31] 0xa8:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string15         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.long	.Lsection_info+42       # DW_AT_type
	.byte	31                      # Abbrev [31] 0xb4:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string44         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.long	.Lsection_info+42       # DW_AT_type
	.byte	31                      # Abbrev [31] 0xc0:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string45         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.long	.Lsection_info+42       # DW_AT_type
	.byte	31                      # Abbrev [31] 0xcc:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string46         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.long	.Lsection_info+42       # DW_AT_type
	.byte	14                      # Abbrev [14] 0xd8:0xf DW_TAG_variable
	.long	.Ldebug_loc18           # DW_AT_location
	.long	.Linfo_string47         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	37                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	14                      # Abbrev [14] 0xe7:0xf DW_TAG_variable
	.long	.Ldebug_loc19           # DW_AT_location
	.long	.Linfo_string48         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	30                      # Abbrev [30] 0xf6:0xf DW_TAG_variable
	.long	.Ldebug_loc20           # DW_AT_location
	.long	.Linfo_string49         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
	.long	.Lsection_info+42       # DW_AT_type
	.byte	30                      # Abbrev [30] 0x105:0xf DW_TAG_variable
	.long	.Ldebug_loc21           # DW_AT_location
	.long	.Linfo_string50         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	30                      # DW_AT_decl_line
	.long	.Lsection_info+510      # DW_AT_type
	.byte	14                      # Abbrev [14] 0x114:0xf DW_TAG_variable
	.long	.Ldebug_loc22           # DW_AT_location
	.long	.Linfo_string51         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	33                      # DW_AT_decl_line
	.long	580                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x123:0xf DW_TAG_variable
	.long	.Ldebug_loc23           # DW_AT_location
	.long	.Linfo_string54         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	33                      # DW_AT_decl_line
	.long	580                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x132:0xf DW_TAG_variable
	.long	.Ldebug_loc24           # DW_AT_location
	.long	.Linfo_string55         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	33                      # DW_AT_decl_line
	.long	580                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x141:0xf DW_TAG_variable
	.long	.Ldebug_loc25           # DW_AT_location
	.long	.Linfo_string56         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
	.long	.Lsection_info+510      # DW_AT_type
	.byte	15                      # Abbrev [15] 0x150:0x1d DW_TAG_inlined_subroutine
	.long	60                      # DW_AT_abstract_origin
	.quad	.Ltmp122                # DW_AT_low_pc
	.long	.Ltmp123-.Ltmp122       # DW_AT_high_pc
	.byte	3                       # DW_AT_call_file
	.byte	58                      # DW_AT_call_line
	.byte	4                       # Abbrev [4] 0x163:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc26           # DW_AT_location
	.long	73                      # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	32                      # Abbrev [32] 0x16e:0xd6 DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string20         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	106                     # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	29                      # Abbrev [29] 0x183:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc27           # DW_AT_location
	.long	.Linfo_string59         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	106                     # DW_AT_decl_line
	.long	.Lsection_info+510      # DW_AT_type
	.byte	29                      # Abbrev [29] 0x192:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc28           # DW_AT_location
	.long	.Linfo_string60         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	106                     # DW_AT_decl_line
	.long	.Lsection_info+510      # DW_AT_type
	.byte	29                      # Abbrev [29] 0x1a1:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc29           # DW_AT_location
	.long	.Linfo_string35         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	106                     # DW_AT_decl_line
	.long	.Lsection_info+42       # DW_AT_type
	.byte	29                      # Abbrev [29] 0x1b0:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc30           # DW_AT_location
	.long	.Linfo_string36         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	106                     # DW_AT_decl_line
	.long	.Lsection_info+42       # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1bf:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.asciz	"\360"
	.long	.Linfo_string30         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	121                     # DW_AT_decl_line
	.long	598                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1ce:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.asciz	"\300"
	.long	.Linfo_string57         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	124                     # DW_AT_decl_line
	.long	598                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1dd:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	16
	.long	.Linfo_string58         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	127                     # DW_AT_decl_line
	.long	598                     # DW_AT_type
	.byte	33                      # Abbrev [33] 0x1eb:0x10 DW_TAG_variable
	.byte	4                       # DW_AT_const_value
	.byte	0
	.byte	0
	.byte	0
	.byte	63
	.long	.Linfo_string61         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	111                     # DW_AT_decl_line
	.long	.Lsection_info+478      # DW_AT_type
	.byte	33                      # Abbrev [33] 0x1fb:0x10 DW_TAG_variable
	.byte	4                       # DW_AT_const_value
	.byte	0
	.byte	0
	.byte	0
	.byte	63
	.long	.Linfo_string62         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	111                     # DW_AT_decl_line
	.long	.Lsection_info+478      # DW_AT_type
	.byte	33                      # Abbrev [33] 0x20b:0x10 DW_TAG_variable
	.byte	4                       # DW_AT_const_value
	.byte	0
	.byte	0
	.byte	0
	.byte	63
	.long	.Linfo_string63         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	110                     # DW_AT_decl_line
	.long	.Lsection_info+478      # DW_AT_type
	.byte	33                      # Abbrev [33] 0x21b:0x10 DW_TAG_variable
	.byte	4                       # DW_AT_const_value
	.byte	0
	.byte	0
	.byte	0
	.byte	63
	.long	.Linfo_string64         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	110                     # DW_AT_decl_line
	.long	.Lsection_info+478      # DW_AT_type
	.byte	31                      # Abbrev [31] 0x22b:0xc DW_TAG_variable
	.byte	50                      # DW_AT_const_value
	.long	.Linfo_string65         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	108                     # DW_AT_decl_line
	.long	.Lsection_info+42       # DW_AT_type
	.byte	31                      # Abbrev [31] 0x237:0xc DW_TAG_variable
	.byte	50                      # DW_AT_const_value
	.long	.Linfo_string66         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	108                     # DW_AT_decl_line
	.long	.Lsection_info+42       # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	23                      # Abbrev [23] 0x244:0xb DW_TAG_typedef
	.long	591                     # DW_AT_type
	.long	.Linfo_string53         # DW_AT_name
	.byte	5                       # DW_AT_decl_file
	.byte	202                     # DW_AT_decl_line
	.byte	2                       # Abbrev [2] 0x24f:0x7 DW_TAG_base_type
	.long	.Linfo_string52         # DW_AT_name
	.byte	7                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	34                      # Abbrev [34] 0x256:0x12 DW_TAG_array_type
	.long	.Lsection_info+478      # DW_AT_type
	.byte	22                      # Abbrev [22] 0x25b:0x6 DW_TAG_subrange_type
	.long	616                     # DW_AT_type
	.byte	3                       # DW_AT_count
	.byte	22                      # Abbrev [22] 0x261:0x6 DW_TAG_subrange_type
	.long	616                     # DW_AT_type
	.byte	3                       # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	21                      # Abbrev [21] 0x268:0x7 DW_TAG_base_type
	.long	.Linfo_string27         # DW_AT_name
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # DW_AT_encoding
	.byte	0                       # End Of Children Mark
.L.debug_info_begin2:
	.long	774                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x2ff DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string6          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
	.quad	.Lfunc_begin4           # DW_AT_low_pc
	.long	.Lfunc_end6-.Lfunc_begin4 # DW_AT_high_pc
	.byte	35                      # Abbrev [35] 0x2a:0x15 DW_TAG_variable
	.long	.Linfo_string7          # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	17                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	libfilename_3_3
	.byte	18                      # Abbrev [18] 0x3f:0x5 DW_TAG_pointer_type
	.long	68                      # DW_AT_type
	.byte	36                      # Abbrev [36] 0x44:0x5 DW_TAG_const_type
	.long	.Lsection_info+586      # DW_AT_type
	.byte	35                      # Abbrev [35] 0x49:0x15 DW_TAG_variable
	.long	.Linfo_string8          # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	libfilename_5_5
	.byte	35                      # Abbrev [35] 0x5e:0x15 DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	21                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	libfilename_7_7
	.byte	35                      # Abbrev [35] 0x73:0x15 DW_TAG_variable
	.long	.Linfo_string10         # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	23                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	env_allow_hw
	.byte	37                      # Abbrev [37] 0x88:0x60 DW_TAG_subprogram
	.quad	.Lfunc_begin4           # DW_AT_low_pc
	.long	.Lfunc_end4-.Lfunc_begin4 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	33                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	576                     # DW_AT_type
                                        # DW_AT_external
	.byte	38                      # Abbrev [38] 0xa1:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	120
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	33                      # DW_AT_decl_line
	.long	583                     # DW_AT_type
	.byte	38                      # Abbrev [38] 0xaf:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	116
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	33                      # DW_AT_decl_line
	.long	583                     # DW_AT_type
	.byte	38                      # Abbrev [38] 0xbd:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	33                      # DW_AT_decl_line
	.long	583                     # DW_AT_type
	.byte	39                      # Abbrev [39] 0xcb:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	111
	.long	.Linfo_string69         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	34                      # DW_AT_decl_line
	.long	.Lsection_info+520      # DW_AT_type
	.byte	39                      # Abbrev [39] 0xd9:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	96
	.long	.Linfo_string70         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	.Lsection_info+581      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	10                      # Abbrev [10] 0xe8:0x6a DW_TAG_subprogram
	.quad	.Lfunc_begin5           # DW_AT_low_pc
	.long	.Lfunc_end5-.Lfunc_begin5 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	40                      # Abbrev [40] 0xfd:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	120
	.long	.Linfo_string71         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
	.long	.Lsection_info+515      # DW_AT_type
	.byte	40                      # Abbrev [40] 0x10b:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.long	.Linfo_string72         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
	.long	.Lsection_info+515      # DW_AT_type
	.byte	38                      # Abbrev [38] 0x119:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	104
	.long	.Linfo_string73         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
	.long	594                     # DW_AT_type
	.byte	38                      # Abbrev [38] 0x127:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	100
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
	.long	583                     # DW_AT_type
	.byte	38                      # Abbrev [38] 0x135:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	96
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
	.long	583                     # DW_AT_type
	.byte	38                      # Abbrev [38] 0x143:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	92
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	52                      # DW_AT_decl_line
	.long	583                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	10                      # Abbrev [10] 0x152:0xee DW_TAG_subprogram
	.quad	.Lfunc_begin6           # DW_AT_low_pc
	.long	.Lfunc_end6-.Lfunc_begin6 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	58                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	40                      # Abbrev [40] 0x167:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	120
	.long	.Linfo_string71         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	58                      # DW_AT_decl_line
	.long	.Lsection_info+510      # DW_AT_type
	.byte	40                      # Abbrev [40] 0x175:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.long	.Linfo_string72         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	58                      # DW_AT_decl_line
	.long	.Lsection_info+510      # DW_AT_type
	.byte	38                      # Abbrev [38] 0x183:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	104
	.long	.Linfo_string73         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	58                      # DW_AT_decl_line
	.long	594                     # DW_AT_type
	.byte	38                      # Abbrev [38] 0x191:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	100
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	58                      # DW_AT_decl_line
	.long	583                     # DW_AT_type
	.byte	38                      # Abbrev [38] 0x19f:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	96
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	58                      # DW_AT_decl_line
	.long	583                     # DW_AT_type
	.byte	38                      # Abbrev [38] 0x1ad:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	92
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	583                     # DW_AT_type
	.byte	39                      # Abbrev [39] 0x1bb:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	80
	.long	.Linfo_string74         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	60                      # DW_AT_decl_line
	.long	.Lsection_info+581      # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1c9:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	72
	.long	.Linfo_string75         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	66                      # DW_AT_decl_line
	.long	63                      # DW_AT_type
	.byte	39                      # Abbrev [39] 0x1d7:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	64
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	79                      # DW_AT_decl_line
	.long	.Lsection_info+515      # DW_AT_type
	.byte	39                      # Abbrev [39] 0x1e5:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.long	.Linfo_string60         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	80                      # DW_AT_decl_line
	.long	.Lsection_info+515      # DW_AT_type
	.byte	39                      # Abbrev [39] 0x1f4:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\264\177"
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	82                      # DW_AT_decl_line
	.long	.Lsection_info+42       # DW_AT_type
	.byte	39                      # Abbrev [39] 0x203:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	82                      # DW_AT_decl_line
	.long	.Lsection_info+42       # DW_AT_type
	.byte	11                      # Abbrev [11] 0x212:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\250\177"
	.long	.Linfo_string76         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	86                      # DW_AT_decl_line
	.long	599                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x221:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\240\177"
	.long	.Linfo_string79         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	89                      # DW_AT_decl_line
	.long	674                     # DW_AT_type
	.byte	39                      # Abbrev [39] 0x230:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\230\177"
	.long	.Linfo_string88         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	91                      # DW_AT_decl_line
	.long	.Lsection_info+598      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	2                       # Abbrev [2] 0x240:0x7 DW_TAG_base_type
	.long	.Linfo_string22         # DW_AT_name
	.byte	2                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	41                      # Abbrev [41] 0x247:0xb DW_TAG_typedef
	.long	.Lsection_info+42       # DW_AT_type
	.long	.Linfo_string68         # DW_AT_name
	.byte	5                       # DW_AT_decl_file
	.byte	196                     # DW_AT_decl_line
	.byte	42                      # Abbrev [42] 0x252:0x5 DW_TAG_pointer_type
	.long	.Lsection_info+478      # DW_AT_type
	.byte	18                      # Abbrev [18] 0x257:0x5 DW_TAG_pointer_type
	.long	604                     # DW_AT_type
	.byte	43                      # Abbrev [43] 0x25c:0x20 DW_TAG_subroutine_type
                                        # DW_AT_prototyped
	.byte	44                      # Abbrev [44] 0x25d:0x5 DW_TAG_formal_parameter
	.long	636                     # DW_AT_type
	.byte	44                      # Abbrev [44] 0x262:0x5 DW_TAG_formal_parameter
	.long	583                     # DW_AT_type
	.byte	44                      # Abbrev [44] 0x267:0x5 DW_TAG_formal_parameter
	.long	583                     # DW_AT_type
	.byte	44                      # Abbrev [44] 0x26c:0x5 DW_TAG_formal_parameter
	.long	654                     # DW_AT_type
	.byte	44                      # Abbrev [44] 0x271:0x5 DW_TAG_formal_parameter
	.long	664                     # DW_AT_type
	.byte	45                      # Abbrev [45] 0x276:0x5 DW_TAG_formal_parameter
	.long	.Lsection_info+515      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	23                      # Abbrev [23] 0x27c:0xb DW_TAG_typedef
	.long	647                     # DW_AT_type
	.long	.Linfo_string78         # DW_AT_name
	.byte	5                       # DW_AT_decl_file
	.byte	197                     # DW_AT_decl_line
	.byte	2                       # Abbrev [2] 0x287:0x7 DW_TAG_base_type
	.long	.Linfo_string77         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	18                      # Abbrev [18] 0x28e:0x5 DW_TAG_pointer_type
	.long	659                     # DW_AT_type
	.byte	36                      # Abbrev [36] 0x293:0x5 DW_TAG_const_type
	.long	.Lsection_info+478      # DW_AT_type
	.byte	18                      # Abbrev [18] 0x298:0x5 DW_TAG_pointer_type
	.long	669                     # DW_AT_type
	.byte	36                      # Abbrev [36] 0x29d:0x5 DW_TAG_const_type
	.long	.Lsection_info+520      # DW_AT_type
	.byte	18                      # Abbrev [18] 0x2a2:0x5 DW_TAG_pointer_type
	.long	679                     # DW_AT_type
	.byte	46                      # Abbrev [46] 0x2a7:0x7 DW_TAG_subroutine_type
	.long	686                     # DW_AT_type
	.byte	47                      # Abbrev [47] 0x2ac:0x1 DW_TAG_unspecified_parameters
	.byte	0                       # End Of Children Mark
	.byte	18                      # Abbrev [18] 0x2ae:0x5 DW_TAG_pointer_type
	.long	691                     # DW_AT_type
	.byte	23                      # Abbrev [23] 0x2b3:0xb DW_TAG_typedef
	.long	702                     # DW_AT_type
	.long	.Linfo_string87         # DW_AT_name
	.byte	6                       # DW_AT_decl_file
	.byte	176                     # DW_AT_decl_line
	.byte	48                      # Abbrev [48] 0x2be:0x21 DW_TAG_structure_type
	.long	.Linfo_string86         # DW_AT_name
	.byte	16                      # DW_AT_byte_size
	.byte	6                       # DW_AT_decl_file
	.byte	173                     # DW_AT_decl_line
	.byte	49                      # Abbrev [49] 0x2c6:0xc DW_TAG_member
	.long	.Linfo_string80         # DW_AT_name
	.long	735                     # DW_AT_type
	.byte	6                       # DW_AT_decl_file
	.byte	174                     # DW_AT_decl_line
	.byte	0                       # DW_AT_data_member_location
	.byte	49                      # Abbrev [49] 0x2d2:0xc DW_TAG_member
	.long	.Linfo_string83         # DW_AT_name
	.long	756                     # DW_AT_type
	.byte	6                       # DW_AT_decl_file
	.byte	175                     # DW_AT_decl_line
	.byte	8                       # DW_AT_data_member_location
	.byte	0                       # End Of Children Mark
	.byte	18                      # Abbrev [18] 0x2df:0x5 DW_TAG_pointer_type
	.long	740                     # DW_AT_type
	.byte	23                      # Abbrev [23] 0x2e4:0xb DW_TAG_typedef
	.long	751                     # DW_AT_type
	.long	.Linfo_string82         # DW_AT_name
	.byte	6                       # DW_AT_decl_file
	.byte	94                      # DW_AT_decl_line
	.byte	50                      # Abbrev [50] 0x2ef:0x5 DW_TAG_structure_type
	.long	.Linfo_string81         # DW_AT_name
                                        # DW_AT_declaration
	.byte	18                      # Abbrev [18] 0x2f4:0x5 DW_TAG_pointer_type
	.long	761                     # DW_AT_type
	.byte	23                      # Abbrev [23] 0x2f9:0xb DW_TAG_typedef
	.long	772                     # DW_AT_type
	.long	.Linfo_string85         # DW_AT_name
	.byte	6                       # DW_AT_decl_file
	.byte	97                      # DW_AT_decl_line
	.byte	50                      # Abbrev [50] 0x304:0x5 DW_TAG_structure_type
	.long	.Linfo_string84         # DW_AT_name
                                        # DW_AT_declaration
	.byte	0                       # End Of Children Mark
	.section	.debug_abbrev,"",@progbits
	.byte	1                       # Abbreviation Code
	.byte	17                      # DW_TAG_compile_unit
	.byte	1                       # DW_CHILDREN_yes
	.byte	37                      # DW_AT_producer
	.byte	14                      # DW_FORM_strp
	.byte	19                      # DW_AT_language
	.byte	5                       # DW_FORM_data2
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	16                      # DW_AT_stmt_list
	.byte	23                      # DW_FORM_sec_offset
	.byte	27                      # DW_AT_comp_dir
	.byte	14                      # DW_FORM_strp
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	2                       # Abbreviation Code
	.byte	36                      # DW_TAG_base_type
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	62                      # DW_AT_encoding
	.byte	11                      # DW_FORM_data1
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	3                       # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	4                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	5                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	6                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	7                       # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	32                      # DW_AT_inline
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	8                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	9                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	10                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	11                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	12                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	13                      # Abbreviation Code
	.byte	11                      # DW_TAG_lexical_block
	.byte	1                       # DW_CHILDREN_yes
	.byte	85                      # DW_AT_ranges
	.byte	23                      # DW_FORM_sec_offset
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	14                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	15                      # Abbreviation Code
	.byte	29                      # DW_TAG_inlined_subroutine
	.byte	1                       # DW_CHILDREN_yes
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	88                      # DW_AT_call_file
	.byte	11                      # DW_FORM_data1
	.byte	89                      # DW_AT_call_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	16                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	17                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	18                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	19                      # Abbreviation Code
	.byte	1                       # DW_TAG_array_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	20                      # Abbreviation Code
	.byte	33                      # DW_TAG_subrange_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	21                      # Abbreviation Code
	.byte	36                      # DW_TAG_base_type
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	62                      # DW_AT_encoding
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	22                      # Abbreviation Code
	.byte	33                      # DW_TAG_subrange_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	55                      # DW_AT_count
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	23                      # Abbreviation Code
	.byte	22                      # DW_TAG_typedef
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	24                      # Abbreviation Code
	.byte	17                      # DW_TAG_compile_unit
	.byte	1                       # DW_CHILDREN_yes
	.byte	37                      # DW_AT_producer
	.byte	14                      # DW_FORM_strp
	.byte	19                      # DW_AT_language
	.byte	5                       # DW_FORM_data2
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	16                      # DW_AT_stmt_list
	.byte	23                      # DW_FORM_sec_offset
	.byte	27                      # DW_AT_comp_dir
	.byte	14                      # DW_FORM_strp
	.ascii	"\341\177"              # DW_AT_APPLE_optimized
	.byte	25                      # DW_FORM_flag_present
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	25                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	26                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	73                      # DW_AT_type
	.byte	16                      # DW_FORM_ref_addr
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.ascii	"\341\177"              # DW_AT_APPLE_optimized
	.byte	25                      # DW_FORM_flag_present
	.byte	32                      # DW_AT_inline
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	27                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	73                      # DW_AT_type
	.byte	16                      # DW_FORM_ref_addr
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	28                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.ascii	"\347\177"              # DW_AT_APPLE_omit_frame_ptr
	.byte	25                      # DW_FORM_flag_present
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	73                      # DW_AT_type
	.byte	16                      # DW_FORM_ref_addr
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.ascii	"\341\177"              # DW_AT_APPLE_optimized
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	29                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	16                      # DW_FORM_ref_addr
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	30                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	16                      # DW_FORM_ref_addr
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	31                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	16                      # DW_FORM_ref_addr
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	32                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.ascii	"\347\177"              # DW_AT_APPLE_omit_frame_ptr
	.byte	25                      # DW_FORM_flag_present
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.ascii	"\341\177"              # DW_AT_APPLE_optimized
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	33                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	10                      # DW_FORM_block1
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	16                      # DW_FORM_ref_addr
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	34                      # Abbreviation Code
	.byte	1                       # DW_TAG_array_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	73                      # DW_AT_type
	.byte	16                      # DW_FORM_ref_addr
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	35                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	36                      # Abbreviation Code
	.byte	38                      # DW_TAG_const_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	16                      # DW_FORM_ref_addr
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	37                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	38                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	39                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	16                      # DW_FORM_ref_addr
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	40                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	16                      # DW_FORM_ref_addr
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	41                      # Abbreviation Code
	.byte	22                      # DW_TAG_typedef
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	16                      # DW_FORM_ref_addr
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	42                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	16                      # DW_FORM_ref_addr
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	43                      # Abbreviation Code
	.byte	21                      # DW_TAG_subroutine_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	44                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	45                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	16                      # DW_FORM_ref_addr
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	46                      # Abbreviation Code
	.byte	21                      # DW_TAG_subroutine_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	47                      # Abbreviation Code
	.byte	24                      # DW_TAG_unspecified_parameters
	.byte	0                       # DW_CHILDREN_no
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	48                      # Abbreviation Code
	.byte	19                      # DW_TAG_structure_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	49                      # Abbreviation Code
	.byte	13                      # DW_TAG_member
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	56                      # DW_AT_data_member_location
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	50                      # Abbreviation Code
	.byte	19                      # DW_TAG_structure_type
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	60                      # DW_AT_declaration
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp55-.Lfunc_begin0
	.quad	.Ltmp58-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	0
	.quad	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp16-.Lfunc_begin0
	.short	.Ltmp273-.Ltmp272       # Loc expr size
.Ltmp272:
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp273:
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp11-.Lfunc_begin0
	.short	.Ltmp275-.Ltmp274       # Loc expr size
.Ltmp274:
	.byte	84                      # super-register DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp275:
	.quad	.Ltmp11-.Lfunc_begin0
	.quad	.Ltmp32-.Lfunc_begin0
	.short	.Ltmp277-.Ltmp276       # Loc expr size
.Ltmp276:
	.byte	93                      # super-register DW_OP_reg13
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp277:
	.quad	0
	.quad	0
.Ldebug_loc2:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp13-.Lfunc_begin0
	.short	.Ltmp279-.Ltmp278       # Loc expr size
.Ltmp278:
	.byte	81                      # super-register DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp279:
	.quad	.Ltmp13-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	.Ltmp281-.Ltmp280       # Loc expr size
.Ltmp280:
	.byte	118                     # DW_OP_breg6
	.byte	84                      # -44
.Ltmp281:
	.quad	0
	.quad	0
.Ldebug_loc3:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp10-.Lfunc_begin0
	.short	.Ltmp283-.Ltmp282       # Loc expr size
.Ltmp282:
	.byte	82                      # DW_OP_reg2
.Ltmp283:
	.quad	.Ltmp10-.Lfunc_begin0
	.quad	.Ltmp22-.Lfunc_begin0
	.short	.Ltmp285-.Ltmp284       # Loc expr size
.Ltmp284:
	.byte	95                      # DW_OP_reg15
.Ltmp285:
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp9-.Lfunc_begin0
	.short	.Ltmp287-.Ltmp286       # Loc expr size
.Ltmp286:
	.byte	88                      # DW_OP_reg8
.Ltmp287:
	.quad	.Ltmp9-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	.Ltmp289-.Ltmp288       # Loc expr size
.Ltmp288:
	.byte	118                     # DW_OP_breg6
	.ascii	"\250\177"              # -88
.Ltmp289:
	.quad	0
	.quad	0
.Ldebug_loc5:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp8-.Lfunc_begin0
	.short	.Ltmp291-.Ltmp290       # Loc expr size
.Ltmp290:
	.byte	89                      # DW_OP_reg9
.Ltmp291:
	.quad	.Ltmp8-.Lfunc_begin0
	.quad	.Ltmp32-.Lfunc_begin0
	.short	.Ltmp293-.Ltmp292       # Loc expr size
.Ltmp292:
	.byte	83                      # DW_OP_reg3
.Ltmp293:
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	.Ltmp295-.Ltmp294       # Loc expr size
.Ltmp294:
	.byte	85                      # DW_OP_reg5
.Ltmp295:
	.quad	.Ltmp47-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	.Ltmp297-.Ltmp296       # Loc expr size
.Ltmp296:
	.byte	118                     # DW_OP_breg6
	.ascii	"\230\177"              # -104
.Ltmp297:
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp46-.Lfunc_begin0
	.short	.Ltmp299-.Ltmp298       # Loc expr size
.Ltmp298:
	.byte	84                      # DW_OP_reg4
.Ltmp299:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	.Ltmp301-.Ltmp300       # Loc expr size
.Ltmp300:
	.byte	118                     # DW_OP_breg6
	.ascii	"\240\177"              # -96
.Ltmp301:
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.short	.Ltmp303-.Ltmp302       # Loc expr size
.Ltmp302:
	.byte	81                      # super-register DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp303:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	.Ltmp305-.Ltmp304       # Loc expr size
.Ltmp304:
	.byte	118                     # DW_OP_breg6
	.ascii	"\370~"                 # -136
.Ltmp305:
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.short	.Ltmp307-.Ltmp306       # Loc expr size
.Ltmp306:
	.byte	82                      # super-register DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp307:
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp44-.Lfunc_begin0
	.short	.Ltmp309-.Ltmp308       # Loc expr size
.Ltmp308:
	.byte	88                      # super-register DW_OP_reg8
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp309:
	.quad	.Ltmp44-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	.Ltmp311-.Ltmp310       # Loc expr size
.Ltmp310:
	.byte	118                     # DW_OP_breg6
	.ascii	"\250\177"              # -88
.Ltmp311:
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	.Ltmp313-.Ltmp312       # Loc expr size
.Ltmp312:
	.byte	89                      # super-register DW_OP_reg9
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp313:
	.quad	.Ltmp43-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.short	.Ltmp315-.Ltmp314       # Loc expr size
.Ltmp314:
	.byte	95                      # super-register DW_OP_reg15
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp315:
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Ltmp54-.Lfunc_begin0
	.quad	.Ltmp72-.Lfunc_begin0
	.short	.Ltmp317-.Ltmp316       # Loc expr size
.Ltmp316:
	.byte	118                     # DW_OP_breg6
	.ascii	"\214\177"              # -116
.Ltmp317:
	.quad	.Ltmp72-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	.Ltmp319-.Ltmp318       # Loc expr size
.Ltmp318:
.Ltmp319:
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Ltmp56-.Lfunc_begin0
	.quad	.Ltmp75-.Lfunc_begin0
	.short	.Ltmp321-.Ltmp320       # Loc expr size
.Ltmp320:
	.byte	118                     # DW_OP_breg6
	.ascii	"\210\177"              # -120
.Ltmp321:
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	.Ltmp323-.Ltmp322       # Loc expr size
.Ltmp322:
.Ltmp323:
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Ltmp64-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
	.short	.Ltmp325-.Ltmp324       # Loc expr size
.Ltmp324:
	.byte	95                      # super-register DW_OP_reg15
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp325:
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	.Lfunc_begin2-.Lfunc_begin2
	.quad	.Ltmp96-.Lfunc_begin2
	.short	.Ltmp327-.Ltmp326       # Loc expr size
.Ltmp326:
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp327:
	.quad	.Ltmp96-.Lfunc_begin2
	.quad	.Ltmp105-.Lfunc_begin2
	.short	.Ltmp329-.Ltmp328       # Loc expr size
.Ltmp328:
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp329:
	.quad	.Ltmp106-.Lfunc_begin2
	.quad	.Ltmp107-.Lfunc_begin2
	.short	.Ltmp331-.Ltmp330       # Loc expr size
.Ltmp330:
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp331:
	.quad	.Ltmp115-.Lfunc_begin2
	.quad	.Ltmp118-.Lfunc_begin2
	.short	.Ltmp333-.Ltmp332       # Loc expr size
.Ltmp332:
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp333:
	.quad	0
	.quad	0
.Ldebug_loc16:
	.quad	.Lfunc_begin2-.Lfunc_begin2
	.quad	.Ltmp95-.Lfunc_begin2
	.short	.Ltmp335-.Ltmp334       # Loc expr size
.Ltmp334:
	.byte	84                      # DW_OP_reg4
.Ltmp335:
	.quad	.Ltmp95-.Lfunc_begin2
	.quad	.Ltmp107-.Lfunc_begin2
	.short	.Ltmp337-.Ltmp336       # Loc expr size
.Ltmp336:
	.byte	92                      # DW_OP_reg12
.Ltmp337:
	.quad	.Ltmp115-.Lfunc_begin2
	.quad	.Ltmp119-.Lfunc_begin2
	.short	.Ltmp339-.Ltmp338       # Loc expr size
.Ltmp338:
	.byte	92                      # DW_OP_reg12
.Ltmp339:
	.quad	0
	.quad	0
.Ldebug_loc17:
	.quad	.Ltmp97-.Lfunc_begin2
	.quad	.Ltmp123-.Lfunc_begin2
	.short	.Ltmp341-.Ltmp340       # Loc expr size
.Ltmp340:
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
.Ltmp341:
	.quad	.Ltmp123-.Lfunc_begin2
	.quad	.Ltmp123-.Lfunc_begin2
	.short	.Ltmp343-.Ltmp342       # Loc expr size
.Ltmp342:
	.byte	94                      # super-register DW_OP_reg14
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp343:
	.quad	.Ltmp123-.Lfunc_begin2
	.quad	.Lfunc_end2-.Lfunc_begin2
	.short	.Ltmp345-.Ltmp344       # Loc expr size
.Ltmp344:
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
.Ltmp345:
	.quad	0
	.quad	0
.Ldebug_loc18:
	.quad	.Ltmp98-.Lfunc_begin2
	.quad	.Ltmp99-.Lfunc_begin2
	.short	.Ltmp347-.Ltmp346       # Loc expr size
.Ltmp346:
	.byte	82                      # DW_OP_reg2
.Ltmp347:
	.quad	.Ltmp129-.Lfunc_begin2
	.quad	.Ltmp130-.Lfunc_begin2
	.short	.Ltmp349-.Ltmp348       # Loc expr size
.Ltmp348:
	.byte	83                      # DW_OP_reg3
.Ltmp349:
	.quad	.Ltmp130-.Lfunc_begin2
	.quad	.Ltmp131-.Lfunc_begin2
	.short	.Ltmp351-.Ltmp350       # Loc expr size
.Ltmp350:
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 8
.Ltmp351:
	.quad	.Ltmp132-.Lfunc_begin2
	.quad	.Ltmp136-.Lfunc_begin2
	.short	.Ltmp353-.Ltmp352       # Loc expr size
.Ltmp352:
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 8
.Ltmp353:
	.quad	.Ltmp137-.Lfunc_begin2
	.quad	.Ltmp138-.Lfunc_begin2
	.short	.Ltmp355-.Ltmp354       # Loc expr size
.Ltmp354:
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 8
.Ltmp355:
	.quad	.Ltmp139-.Lfunc_begin2
	.quad	.Ltmp140-.Lfunc_begin2
	.short	.Ltmp357-.Ltmp356       # Loc expr size
.Ltmp356:
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 8
.Ltmp357:
	.quad	0
	.quad	0
.Ldebug_loc19:
	.quad	.Ltmp101-.Lfunc_begin2
	.quad	.Ltmp101-.Lfunc_begin2
	.short	.Ltmp359-.Ltmp358       # Loc expr size
.Ltmp358:
	.byte	95                      # DW_OP_reg15
.Ltmp359:
	.quad	0
	.quad	0
.Ldebug_loc20:
	.quad	.Ltmp102-.Lfunc_begin2
	.quad	.Ltmp105-.Lfunc_begin2
	.short	.Ltmp361-.Ltmp360       # Loc expr size
.Ltmp360:
	.byte	80                      # super-register DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp361:
	.quad	0
	.quad	0
.Ldebug_loc21:
	.quad	.Ltmp108-.Lfunc_begin2
	.quad	.Ltmp113-.Lfunc_begin2
	.short	.Ltmp363-.Ltmp362       # Loc expr size
.Ltmp362:
	.byte	117                     # DW_OP_breg5
	.byte	0                       # 0
.Ltmp363:
	.quad	.Ltmp125-.Lfunc_begin2
	.quad	.Ltmp126-.Lfunc_begin2
	.short	.Ltmp365-.Ltmp364       # Loc expr size
.Ltmp364:
	.byte	80                      # DW_OP_reg0
.Ltmp365:
	.quad	0
	.quad	0
.Ldebug_loc22:
	.quad	.Ltmp109-.Lfunc_begin2
	.quad	.Ltmp113-.Lfunc_begin2
	.short	.Ltmp367-.Ltmp366       # Loc expr size
.Ltmp366:
	.byte	116                     # DW_OP_breg4
	.byte	0                       # 0
.Ltmp367:
	.quad	0
	.quad	0
.Ldebug_loc23:
	.quad	.Ltmp110-.Lfunc_begin2
	.quad	.Ltmp113-.Lfunc_begin2
	.short	.Ltmp369-.Ltmp368       # Loc expr size
.Ltmp368:
	.byte	113                     # DW_OP_breg1
	.byte	0                       # 0
.Ltmp369:
	.quad	0
	.quad	0
.Ldebug_loc24:
	.quad	.Ltmp111-.Lfunc_begin2
	.quad	.Ltmp113-.Lfunc_begin2
	.short	.Ltmp371-.Ltmp370       # Loc expr size
.Ltmp370:
	.byte	114                     # DW_OP_breg2
	.byte	0                       # 0
.Ltmp371:
	.quad	0
	.quad	0
.Ldebug_loc25:
	.quad	.Ltmp114-.Lfunc_begin2
	.quad	.Ltmp115-.Lfunc_begin2
	.short	.Ltmp373-.Ltmp372       # Loc expr size
.Ltmp372:
	.byte	93                      # DW_OP_reg13
.Ltmp373:
	.quad	.Ltmp127-.Lfunc_begin2
	.quad	.Ltmp128-.Lfunc_begin2
	.short	.Ltmp375-.Ltmp374       # Loc expr size
.Ltmp374:
	.byte	93                      # DW_OP_reg13
.Ltmp375:
	.quad	0
	.quad	0
.Ldebug_loc26:
	.quad	.Ltmp121-.Lfunc_begin2
	.quad	.Ltmp123-.Lfunc_begin2
	.short	.Ltmp377-.Ltmp376       # Loc expr size
.Ltmp376:
	.byte	85                      # DW_OP_reg5
.Ltmp377:
	.quad	0
	.quad	0
.Ldebug_loc27:
	.quad	.Lfunc_begin3-.Lfunc_begin2
	.quad	.Ltmp154-.Lfunc_begin2
	.short	.Ltmp379-.Ltmp378       # Loc expr size
.Ltmp378:
	.byte	85                      # DW_OP_reg5
.Ltmp379:
	.quad	.Ltmp154-.Lfunc_begin2
	.quad	.Ltmp160-.Lfunc_begin2
	.short	.Ltmp381-.Ltmp380       # Loc expr size
.Ltmp380:
	.byte	94                      # DW_OP_reg14
.Ltmp381:
	.quad	0
	.quad	0
.Ldebug_loc28:
	.quad	.Lfunc_begin3-.Lfunc_begin2
	.quad	.Ltmp153-.Lfunc_begin2
	.short	.Ltmp383-.Ltmp382       # Loc expr size
.Ltmp382:
	.byte	84                      # DW_OP_reg4
.Ltmp383:
	.quad	.Ltmp153-.Lfunc_begin2
	.quad	.Ltmp161-.Lfunc_begin2
	.short	.Ltmp385-.Ltmp384       # Loc expr size
.Ltmp384:
	.byte	95                      # DW_OP_reg15
.Ltmp385:
	.quad	0
	.quad	0
.Ldebug_loc29:
	.quad	.Lfunc_begin3-.Lfunc_begin2
	.quad	.Ltmp156-.Lfunc_begin2
	.short	.Ltmp387-.Ltmp386       # Loc expr size
.Ltmp386:
	.byte	81                      # super-register DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp387:
	.quad	0
	.quad	0
.Ldebug_loc30:
	.quad	.Lfunc_begin3-.Lfunc_begin2
	.quad	.Ltmp155-.Lfunc_begin2
	.short	.Ltmp389-.Ltmp388       # Loc expr size
.Ltmp388:
	.byte	82                      # super-register DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp389:
	.quad	0
	.quad	0
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end0-.LpubNames_begin0 # Length of Public Names Info
.LpubNames_begin0:
	.short	2                       # DWARF Version
	.long	.L.debug_info_begin0    # Offset of Compilation Unit Info
	.long	539                     # Compilation Unit Length
	.long	147                     # DIE offset
	.asciz	"matrix_multiply"       # External Name
	.long	200                     # DIE offset
	.asciz	"transform"             # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.long	.LpubNames_end1-.LpubNames_begin1 # Length of Public Names Info
.LpubNames_begin1:
	.short	2                       # DWARF Version
	.long	.L.debug_info_begin1    # Offset of Compilation Unit Info
	.long	624                     # Compilation Unit Length
	.long	86                      # DIE offset
	.asciz	"main"                  # External Name
	.long	60                      # DIE offset
	.asciz	"atoi"                  # External Name
	.long	366                     # DIE offset
	.asciz	"do_it"                 # External Name
	.long	0                       # End Mark
.LpubNames_end1:
	.long	.LpubNames_end2-.LpubNames_begin2 # Length of Public Names Info
.LpubNames_begin2:
	.short	2                       # DWARF Version
	.long	.L.debug_info_begin2    # Offset of Compilation Unit Info
	.long	778                     # Compilation Unit Length
	.long	73                      # DIE offset
	.asciz	"libfilename_5_5"       # External Name
	.long	232                     # DIE offset
	.asciz	"convolve_bypass_hw_iface0" # External Name
	.long	338                     # DIE offset
	.asciz	"convolve_bypass_hw_iface1" # External Name
	.long	94                      # DIE offset
	.asciz	"libfilename_7_7"       # External Name
	.long	115                     # DIE offset
	.asciz	"env_allow_hw"          # External Name
	.long	136                     # DIE offset
	.asciz	"convolve_hw_use_accelerator" # External Name
	.long	42                      # DIE offset
	.asciz	"libfilename_3_3"       # External Name
	.long	0                       # End Mark
.LpubNames_end2:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.L.debug_info_begin0    # Offset of Compilation Unit Info
	.long	539                     # Compilation Unit Length
	.long	478                     # DIE offset
	.asciz	"float"                 # External Name
	.long	520                     # DIE offset
	.asciz	"u_int8_t"              # External Name
	.long	42                      # DIE offset
	.asciz	"int"                   # External Name
	.long	531                     # DIE offset
	.asciz	"unsigned char"         # External Name
	.long	0                       # End Mark
.LpubTypes_end0:
	.long	.LpubTypes_end1-.LpubTypes_begin1 # Length of Public Types Info
.LpubTypes_begin1:
	.short	2                       # DWARF Version
	.long	.L.debug_info_begin1    # Offset of Compilation Unit Info
	.long	624                     # Compilation Unit Length
	.long	580                     # DIE offset
	.asciz	"u_int32_t"             # External Name
	.long	591                     # DIE offset
	.asciz	"unsigned int"          # External Name
	.long	47                      # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end1:
	.long	.LpubTypes_end2-.LpubTypes_begin2 # Length of Public Types Info
.LpubTypes_begin2:
	.short	2                       # DWARF Version
	.long	.L.debug_info_begin2    # Offset of Compilation Unit Info
	.long	778                     # Compilation Unit Length
	.long	583                     # DIE offset
	.asciz	"int32_t"               # External Name
	.long	761                     # DIE offset
	.asciz	"max_file_internal_t"   # External Name
	.long	702                     # DIE offset
	.asciz	"max_file"              # External Name
	.long	740                     # DIE offset
	.asciz	"max_errors_t"          # External Name
	.long	636                     # DIE offset
	.asciz	"int64_t"               # External Name
	.long	691                     # DIE offset
	.asciz	"max_file_t"            # External Name
	.long	576                     # DIE offset
	.asciz	"_Bool"                 # External Name
	.long	647                     # DIE offset
	.asciz	"long int"              # External Name
	.long	0                       # End Mark
.LpubTypes_end2:

	.ident	"clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)"
	.ident	"clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)"
	.ident	"clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)"
	.ident	"clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
