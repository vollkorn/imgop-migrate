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
	.file	1 "/usr/include/x86_64-linux-gnu/sys/types.h"
	.file	2 "/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_hw_interface.c"
	.text
	.globl	filter_kernel
	.align	16, 0x90
	.type	filter_kernel,@function
filter_kernel:                          # @filter_kernel
.Lfunc_begin0:
	.file	3 "/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve.c"
	.loc	3 22 0                  # convolve.c:22:0
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
	#DEBUG_VALUE: filter_kernel:in <- RDI
	#DEBUG_VALUE: filter_kernel:out <- RSI
	#DEBUG_VALUE: filter_kernel:kernel <- RDX
	#DEBUG_VALUE: filter_kernel:kn <- ECX
	#DEBUG_VALUE: filter_kernel:m <- R8D
	#DEBUG_VALUE: filter_kernel:n <- R9D
	#DEBUG_VALUE: filter_kernel:size_y <- [RBP+24]
	movl	16(%rbp), %r10d
	#DEBUG_VALUE: filter_kernel:size_x <- R10D
	.loc	3 23 23 prologue_end    # convolve.c:23:23
.Ltmp8:
	movl	%ecx, %eax
	shrl	$31, %eax
	addl	%ecx, %eax
	sarl	%eax
.Ltmp9:
	#DEBUG_VALUE: filter_kernel:c <- 0
	#DEBUG_VALUE: filter_kernel:pixel <- 0.000000e+00
	#DEBUG_VALUE: filter_kernel:khalf <- EAX
	.loc	3 29 18                 # convolve.c:29:18
	movl	%eax, %ebx
	negl	%ebx
	.loc	3 29 26 is_stmt 0       # convolve.c:29:26
.Ltmp10:
	cmpl	%ebx, %eax
	jge	.LBB0_2
.Ltmp11:
# BB#1:
	#DEBUG_VALUE: filter_kernel:out <- RSI
	#DEBUG_VALUE: filter_kernel:m <- R8D
	#DEBUG_VALUE: filter_kernel:n <- R9D
	#DEBUG_VALUE: filter_kernel:size_y <- [RBP+24]
	#DEBUG_VALUE: filter_kernel:size_x <- R10D
	#DEBUG_VALUE: filter_kernel:pixel <- 0.000000e+00
	#DEBUG_VALUE: filter_kernel:c <- 0
	xorl	%eax, %eax
	jmp	.LBB0_7
.Ltmp12:
.LBB0_2:                                # %for.inc.preheader.preheader
	#DEBUG_VALUE: filter_kernel:in <- RDI
	#DEBUG_VALUE: filter_kernel:out <- RSI
	#DEBUG_VALUE: filter_kernel:kernel <- RDX
	#DEBUG_VALUE: filter_kernel:kn <- ECX
	#DEBUG_VALUE: filter_kernel:m <- R8D
	#DEBUG_VALUE: filter_kernel:n <- R9D
	#DEBUG_VALUE: filter_kernel:size_y <- [RBP+24]
	#DEBUG_VALUE: filter_kernel:size_x <- R10D
	#DEBUG_VALUE: filter_kernel:khalf <- EAX
	#DEBUG_VALUE: filter_kernel:pixel <- 0.000000e+00
	#DEBUG_VALUE: filter_kernel:c <- 0
	movslq	%ebx, %r11
	.loc	3 29 10                 # convolve.c:29:10
	cltq
.Ltmp13:
	movslq	%ebx, %rbx
	movslq	%ecx, %r14
	.loc	3 30 18 is_stmt 1       # convolve.c:30:18
.Ltmp14:
	movq	%r14, %rcx
.Ltmp15:
	notq	%rcx
	imulq	%rbx, %rcx
	leaq	8(%rdx,%rcx,4), %r13
	shlq	$2, %r14
	negq	%r14
	movslq	%r9d, %rcx
	subq	%rbx, %rcx
	movslq	%r10d, %r15
.Ltmp16:
	#DEBUG_VALUE: filter_kernel:size_x <- undef
	imulq	%r15, %rcx
	movslq	%r8d, %rdx
.Ltmp17:
	addq	%rcx, %rdx
	subq	%rbx, %rdx
	leaq	-1(%rbx), %r12
	addq	%rdx, %rdi
.Ltmp18:
	negq	%r15
	xorps	%xmm0, %xmm0
	.align	16, 0x90
.LBB0_3:                                # %for.inc.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
	#DEBUG_VALUE: filter_kernel:out <- RSI
	#DEBUG_VALUE: filter_kernel:m <- R8D
	#DEBUG_VALUE: filter_kernel:n <- R9D
	#DEBUG_VALUE: filter_kernel:size_y <- [RBP+24]
	#DEBUG_VALUE: filter_kernel:size_x <- undef
	#DEBUG_VALUE: filter_kernel:pixel <- 0.000000e+00
	#DEBUG_VALUE: filter_kernel:c <- 0
	movq	%rdi, %rbx
	movq	%r13, %rdx
	movq	%r12, %rcx
	.align	16, 0x90
.LBB0_4:                                # %for.inc
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: filter_kernel:out <- RSI
	#DEBUG_VALUE: filter_kernel:m <- R8D
	#DEBUG_VALUE: filter_kernel:n <- R9D
	#DEBUG_VALUE: filter_kernel:size_y <- [RBP+24]
	#DEBUG_VALUE: filter_kernel:size_x <- undef
	#DEBUG_VALUE: filter_kernel:pixel <- 0.000000e+00
	#DEBUG_VALUE: filter_kernel:c <- 0
	movaps	%xmm0, %xmm1
	.loc	3 31 22                 # convolve.c:31:22
.Ltmp19:
	movzbl	(%rbx), %r10d
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%r10d, %xmm0
	mulss	(%rdx), %xmm0
	.loc	3 31 13 is_stmt 0       # convolve.c:31:13
	addss	%xmm1, %xmm0
.Ltmp20:
	#DEBUG_VALUE: filter_kernel:pixel <- XMM0
	.loc	3 30 30 is_stmt 1       # convolve.c:30:30
	incq	%rcx
	addq	$-4, %rdx
	decq	%rbx
	cmpq	%rax, %rcx
.Ltmp21:
	.loc	3 30 9 is_stmt 0        # convolve.c:30:9
	jl	.LBB0_4
.Ltmp22:
# BB#5:                                 # %for.inc16
                                        #   in Loop: Header=BB0_3 Depth=1
	#DEBUG_VALUE: filter_kernel:out <- RSI
	#DEBUG_VALUE: filter_kernel:m <- R8D
	#DEBUG_VALUE: filter_kernel:n <- R9D
	#DEBUG_VALUE: filter_kernel:size_y <- [RBP+24]
	#DEBUG_VALUE: filter_kernel:size_x <- undef
	#DEBUG_VALUE: filter_kernel:pixel <- XMM0
	#DEBUG_VALUE: filter_kernel:c <- 0
	.loc	3 29 5 is_stmt 1        # convolve.c:29:5
	addq	%r14, %r13
	addq	%r15, %rdi
	.loc	3 29 26 is_stmt 0       # convolve.c:29:26
.Ltmp23:
	cmpq	%rax, %r11
	.loc	3 29 5                  # convolve.c:29:5
	leaq	1(%r11), %r11
	jl	.LBB0_3
.Ltmp24:
# BB#6:                                 # %for.end18.loopexit
	#DEBUG_VALUE: filter_kernel:out <- RSI
	#DEBUG_VALUE: filter_kernel:m <- R8D
	#DEBUG_VALUE: filter_kernel:n <- R9D
	#DEBUG_VALUE: filter_kernel:size_y <- [RBP+24]
	#DEBUG_VALUE: filter_kernel:size_x <- undef
	#DEBUG_VALUE: filter_kernel:pixel <- XMM0
	#DEBUG_VALUE: filter_kernel:c <- 0
	cvttss2si	%xmm0, %eax
	movl	16(%rbp), %r10d
.Ltmp25:
	#DEBUG_VALUE: filter_kernel:size_x <- R10D
.LBB0_7:                                # %for.end18
	#DEBUG_VALUE: filter_kernel:out <- RSI
	#DEBUG_VALUE: filter_kernel:m <- R8D
	#DEBUG_VALUE: filter_kernel:n <- R9D
	#DEBUG_VALUE: filter_kernel:size_y <- [RBP+24]
	#DEBUG_VALUE: filter_kernel:size_x <- R10D
	#DEBUG_VALUE: filter_kernel:pixel <- 0.000000e+00
	#DEBUG_VALUE: filter_kernel:c <- 0
	.loc	3 33 9 is_stmt 1        # convolve.c:33:9
	imull	%r9d, %r10d
.Ltmp26:
	addl	%r8d, %r10d
	.loc	3 33 5 is_stmt 0        # convolve.c:33:5
	movslq	%r10d, %rcx
	movb	%al, (%rsi,%rcx)
	.loc	3 35 1 is_stmt 1        # convolve.c:35:1
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp27:
.Ltmp28:
	.size	filter_kernel, .Ltmp28-filter_kernel
.Lfunc_end0:
	.cfi_endproc

	.globl	filter_kernel_2d
	.align	16, 0x90
	.type	filter_kernel_2d,@function
filter_kernel_2d:                       # @filter_kernel_2d
.Lfunc_begin1:
	.loc	3 43 0                  # convolve.c:43:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp29:
	.cfi_def_cfa_offset 16
.Ltmp30:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp31:
	.cfi_def_cfa_register %rbp
	.loc	3 44 23 prologue_end    # convolve.c:44:23
.Ltmp32:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
.Ltmp33:
	.cfi_offset %rbx, -56
.Ltmp34:
	.cfi_offset %r12, -48
.Ltmp35:
	.cfi_offset %r13, -40
.Ltmp36:
	.cfi_offset %r14, -32
.Ltmp37:
	.cfi_offset %r15, -24
	#DEBUG_VALUE: filter_kernel_2d:in <- RDI
	#DEBUG_VALUE: filter_kernel_2d:out <- RSI
	#DEBUG_VALUE: filter_kernel_2d:kernel <- RDX
	#DEBUG_VALUE: filter_kernel_2d:kn <- ECX
	#DEBUG_VALUE: filter_kernel_2d:x <- R8D
	#DEBUG_VALUE: filter_kernel_2d:y <- R9D
	movl	%ecx, %eax
	shrl	$31, %eax
	addl	%ecx, %eax
	sarl	%eax
.Ltmp38:
	#DEBUG_VALUE: filter_kernel_2d:c <- 0
	#DEBUG_VALUE: filter_kernel_2d:pixel <- 0.000000e+00
	#DEBUG_VALUE: filter_kernel_2d:khalf <- EAX
	.loc	3 50 18                 # convolve.c:50:18
	movl	%eax, %ecx
.Ltmp39:
	negl	%ecx
.Ltmp40:
	#DEBUG_VALUE: j <- ECX
	#DEBUG_VALUE: i <- ECX
	.loc	3 50 10 is_stmt 0       # convolve.c:50:10
	movslq	%r8d, %r8
.Ltmp41:
	movslq	%r9d, %r9
.Ltmp42:
	.loc	3 50 26                 # convolve.c:50:26
	cmpl	%ecx, %eax
	jge	.LBB1_2
.Ltmp43:
# BB#1:
	#DEBUG_VALUE: filter_kernel_2d:out <- RSI
	#DEBUG_VALUE: filter_kernel_2d:pixel <- 0.000000e+00
	#DEBUG_VALUE: filter_kernel_2d:c <- 0
	xorl	%eax, %eax
	jmp	.LBB1_7
.LBB1_2:                                # %for.body.preheader
	#DEBUG_VALUE: filter_kernel_2d:in <- RDI
	#DEBUG_VALUE: filter_kernel_2d:out <- RSI
	#DEBUG_VALUE: filter_kernel_2d:kernel <- RDX
.Ltmp44:
	#DEBUG_VALUE: filter_kernel_2d:khalf <- EAX
	#DEBUG_VALUE: filter_kernel_2d:pixel <- 0.000000e+00
	#DEBUG_VALUE: filter_kernel_2d:c <- 0
	#DEBUG_VALUE: i <- ECX
	#DEBUG_VALUE: j <- ECX
	movslq	%ecx, %r11
	.loc	3 50 10                 # convolve.c:50:10
	movslq	%eax, %r12
.Ltmp45:
	.loc	3 46 11 is_stmt 1       # convolve.c:46:11
	movq	%r11, %rax
.Ltmp46:
	negq	%rax
	leaq	1(%r12,%rax), %r10
	xorps	%xmm0, %xmm0
	xorl	%r15d, %r15d
	.loc	3 51 18                 # convolve.c:51:18
.Ltmp47:
	leaq	-1(%r11), %r14
.Ltmp48:
	.align	16, 0x90
.LBB1_3:                                # %for.inc.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_4 Depth 2
	#DEBUG_VALUE: filter_kernel_2d:in <- RDI
	#DEBUG_VALUE: filter_kernel_2d:out <- RSI
	#DEBUG_VALUE: filter_kernel_2d:kernel <- RDX
	#DEBUG_VALUE: filter_kernel_2d:pixel <- 0.000000e+00
	#DEBUG_VALUE: filter_kernel_2d:c <- 0
	.loc	3 52 25                 # convolve.c:52:25
	leaq	(%r11,%r9), %rax
	movslq	%r15d, %r15
	leaq	(%rdx,%r15,4), %rbx
	movq	(%rdi,%rax,8), %r13
	addq	%r8, %r13
	movq	%r14, %rcx
	.align	16, 0x90
.LBB1_4:                                # %for.inc
                                        #   Parent Loop BB1_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: filter_kernel_2d:in <- RDI
	#DEBUG_VALUE: filter_kernel_2d:out <- RSI
	#DEBUG_VALUE: filter_kernel_2d:kernel <- RDX
	#DEBUG_VALUE: filter_kernel_2d:pixel <- 0.000000e+00
	#DEBUG_VALUE: filter_kernel_2d:c <- 0
	movaps	%xmm0, %xmm1
	.loc	3 52 22 is_stmt 0       # convolve.c:52:22
	movzbl	1(%r13,%rcx), %eax
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	mulss	(%rbx), %xmm0
	.loc	3 52 13                 # convolve.c:52:13
	addss	%xmm1, %xmm0
.Ltmp49:
	#DEBUG_VALUE: filter_kernel_2d:pixel <- XMM0
	.loc	3 51 30 is_stmt 1       # convolve.c:51:30
	addq	$4, %rbx
	incq	%rcx
	cmpq	%r12, %rcx
.Ltmp50:
	.loc	3 51 9 is_stmt 0        # convolve.c:51:9
	jl	.LBB1_4
.Ltmp51:
# BB#5:                                 # %for.inc13
                                        #   in Loop: Header=BB1_3 Depth=1
	#DEBUG_VALUE: filter_kernel_2d:in <- RDI
	#DEBUG_VALUE: filter_kernel_2d:out <- RSI
	#DEBUG_VALUE: filter_kernel_2d:kernel <- RDX
	#DEBUG_VALUE: filter_kernel_2d:pixel <- XMM0
	#DEBUG_VALUE: filter_kernel_2d:c <- 0
	.loc	3 46 11 is_stmt 1       # convolve.c:46:11
	addq	%r10, %r15
	.loc	3 50 26                 # convolve.c:50:26
.Ltmp52:
	cmpq	%r12, %r11
	.loc	3 50 5 is_stmt 0        # convolve.c:50:5
	leaq	1(%r11), %r11
	jl	.LBB1_3
.Ltmp53:
# BB#6:                                 # %for.end15.loopexit
	#DEBUG_VALUE: filter_kernel_2d:out <- RSI
	#DEBUG_VALUE: filter_kernel_2d:pixel <- XMM0
	#DEBUG_VALUE: filter_kernel_2d:c <- 0
	cvttss2si	%xmm0, %eax
.Ltmp54:
.LBB1_7:                                # %for.end15
	#DEBUG_VALUE: filter_kernel_2d:out <- RSI
	#DEBUG_VALUE: filter_kernel_2d:pixel <- 0.000000e+00
	#DEBUG_VALUE: filter_kernel_2d:c <- 0
	.loc	3 54 5 is_stmt 1        # convolve.c:54:5
	movq	(%rsi,%r9,8), %rcx
	movb	%al, (%rcx,%r8)
	.loc	3 56 1                  # convolve.c:56:1
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp55:
.Ltmp56:
	.size	filter_kernel_2d, .Ltmp56-filter_kernel_2d
.Lfunc_end1:
	.cfi_endproc

	.globl	convolve_arr_linear
	.align	16, 0x90
	.type	convolve_arr_linear,@function
convolve_arr_linear:                    # @convolve_arr_linear
.Lfunc_begin2:
	.loc	3 91 0                  # convolve.c:91:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp57:
	.cfi_def_cfa_offset 16
.Ltmp58:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp59:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$88, %rsp
.Ltmp60:
	.cfi_offset %rbx, -56
.Ltmp61:
	.cfi_offset %r12, -48
.Ltmp62:
	.cfi_offset %r13, -40
.Ltmp63:
	.cfi_offset %r14, -32
.Ltmp64:
	.cfi_offset %r15, -24
	#DEBUG_VALUE: convolve_arr_linear:in <- RDI
	#DEBUG_VALUE: convolve_arr_linear:out <- RSI
	#DEBUG_VALUE: convolve_arr_linear:kernel <- RDX
	#DEBUG_VALUE: convolve_arr_linear:kn <- ECX
	#DEBUG_VALUE: convolve_arr_linear:dim_x <- R8D
	#DEBUG_VALUE: convolve_arr_linear:dim_y <- R9D
	movl	%r9d, %r13d
.Ltmp65:
	#DEBUG_VALUE: convolve_arr_linear:dim_y <- R13D
	movl	%ecx, %r14d
.Ltmp66:
	#DEBUG_VALUE: convolve_arr_linear:kn <- R14D
	movq	%rsi, -64(%rbp)         # 8-byte Spill
.Ltmp67:
	#DEBUG_VALUE: convolve_arr_linear:out <- [RBP+-64]
	movq	%rdi, %rbx
.Ltmp68:
	#DEBUG_VALUE: convolve_arr_linear:in <- RBX
	.loc	3 92 23 prologue_end    # convolve.c:92:23
	movl	%r14d, %eax
	shrl	$31, %eax
	addl	%r14d, %eax
	sarl	%eax
.Ltmp69:
	#DEBUG_VALUE: m <- EAX
	#DEBUG_VALUE: convolve_arr_linear:khalf <- EAX
	#DEBUG_VALUE: filter_kernel:khalf <- EAX
	.loc	3 94 29                 # convolve.c:94:29
	movl	%r8d, %r15d
	subl	%eax, %r15d
.Ltmp70:
	.loc	3 94 5 is_stmt 0        # convolve.c:94:5
	cmpl	%r15d, %eax
	movl	%eax, %r12d
.Ltmp71:
	#DEBUG_VALUE: m <- R12D
	#DEBUG_VALUE: convolve_arr_linear:khalf <- R12D
	#DEBUG_VALUE: filter_kernel:khalf <- R12D
	jge	.LBB2_10
.Ltmp72:
# BB#1:                                 # %bypassdesc
	#DEBUG_VALUE: convolve_arr_linear:in <- RBX
	#DEBUG_VALUE: convolve_arr_linear:out <- [RBP+-64]
	#DEBUG_VALUE: convolve_arr_linear:kernel <- RDX
	#DEBUG_VALUE: convolve_arr_linear:kn <- R14D
	#DEBUG_VALUE: convolve_arr_linear:dim_x <- R8D
	#DEBUG_VALUE: convolve_arr_linear:dim_y <- R13D
	#DEBUG_VALUE: convolve_arr_linear:khalf <- R12D
	movq	%rdx, -48(%rbp)         # 8-byte Spill
.Ltmp73:
	#DEBUG_VALUE: convolve_arr_linear:kernel <- [RBP+-48]
	movl	%r14d, %edi
	movl	%r13d, %esi
	movl	%r8d, %edx
	movl	%r8d, -68(%rbp)         # 4-byte Spill
.Ltmp74:
	#DEBUG_VALUE: convolve_arr_linear:dim_x <- [RBP+-68]
	callq	convolve_hw_use_accelerator
	testb	%al, %al
	je	.LBB2_2
.Ltmp75:
# BB#11:                                # %acc
	#DEBUG_VALUE: convolve_arr_linear:in <- RBX
	#DEBUG_VALUE: convolve_arr_linear:out <- [RBP+-64]
	#DEBUG_VALUE: convolve_arr_linear:kernel <- [RBP+-48]
	#DEBUG_VALUE: convolve_arr_linear:kn <- R14D
	#DEBUG_VALUE: convolve_arr_linear:dim_x <- [RBP+-68]
	#DEBUG_VALUE: convolve_arr_linear:dim_y <- R13D
	#DEBUG_VALUE: filter_kernel:in <- RBX
	#DEBUG_VALUE: filter_kernel:kernel <- [RBP+-48]
	#DEBUG_VALUE: filter_kernel:kn <- R14D
	#DEBUG_VALUE: filter_kernel:size_y <- R13D
	#DEBUG_VALUE: filter_kernel:size_x <- [RBP+-68]
	movq	%rbx, %rdi
	movq	-64(%rbp), %rsi         # 8-byte Reload
	movq	-48(%rbp), %rdx         # 8-byte Reload
	movl	%r14d, %ecx
	movl	%r13d, %r8d
	movl	-68(%rbp), %r9d         # 4-byte Reload
	addq	$88, %rsp
	popq	%rbx
.Ltmp76:
	popq	%r12
	popq	%r13
.Ltmp77:
	popq	%r14
.Ltmp78:
	popq	%r15
	popq	%rbp
	jmp	convolve_bypass_hw_iface0 # TAILCALL
.LBB2_2:                                # %for.cond1.preheader.preheader
.Ltmp79:
	#DEBUG_VALUE: convolve_arr_linear:in <- RBX
	#DEBUG_VALUE: convolve_arr_linear:out <- [RBP+-64]
	#DEBUG_VALUE: convolve_arr_linear:kernel <- [RBP+-48]
	#DEBUG_VALUE: convolve_arr_linear:kn <- R14D
	#DEBUG_VALUE: convolve_arr_linear:dim_x <- [RBP+-68]
	#DEBUG_VALUE: convolve_arr_linear:dim_y <- R13D
	#DEBUG_VALUE: convolve_arr_linear:khalf <- R12D
	movl	%r12d, -52(%rbp)        # 4-byte Spill
	movslq	%r12d, %rax
	.loc	3 94 10                 # convolve.c:94:10
	movslq	-68(%rbp), %r8          # 4-byte Folded Reload
	.loc	3 95 33 is_stmt 1       # convolve.c:95:33
.Ltmp80:
	subl	%r12d, %r13d
.Ltmp81:
	.loc	3 29 18                 # convolve.c:29:18
	movl	%r13d, -108(%rbp)       # 4-byte Spill
.Ltmp82:
	#DEBUG_VALUE: convolve_arr_linear:khalf <- [RBP+-52]
	negl	%r12d
.Ltmp83:
	.loc	3 96 13                 # convolve.c:96:13
	movl	%r12d, -68(%rbp)        # 4-byte Spill
	movslq	%r12d, %rdi
	movq	%rdi, -80(%rbp)         # 8-byte Spill
	movslq	%r13d, %rcx
	.loc	3 95 33                 # convolve.c:95:33
	decq	%rcx
	movq	%rcx, -88(%rbp)         # 8-byte Spill
	movslq	%r15d, %rcx
	decq	%rcx
	movq	%rcx, -120(%rbp)        # 8-byte Spill
	leaq	1(%rax), %r12
	subq	%rdi, %r12
	movslq	%r14d, %rdx
	movq	%rdx, %rcx
	notq	%rcx
	imulq	%rdi, %rcx
	movq	-48(%rbp), %rsi         # 8-byte Reload
	leaq	8(%rsi,%rcx,4), %rcx
	movq	%rcx, -96(%rbp)         # 8-byte Spill
	shlq	$2, %rdx
	negq	%rdx
	movq	%rax, %rcx
	subq	%rdi, %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	subq	%rdi, %rcx
	addq	%rcx, %rbx
.Ltmp84:
	movq	%r8, %rcx
	movq	%r8, %rsi
	negq	%rcx
	movq	%rax, -48(%rbp)         # 8-byte Spill
.Ltmp85:
	.align	16, 0x90
.LBB2_3:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_4 Depth 2
                                        #       Child Loop BB2_5 Depth 3
                                        #         Child Loop BB2_6 Depth 4
	#DEBUG_VALUE: convolve_arr_linear:out <- [RBP+-64]
	#DEBUG_VALUE: convolve_arr_linear:khalf <- [RBP+-52]
	.loc	3 95 9 is_stmt 0        # convolve.c:95:9
	movq	%rbx, -104(%rbp)        # 8-byte Spill
	cmpl	%r13d, -52(%rbp)        # 4-byte Folded Reload
	movq	%rbx, %r8
	movq	%rax, %r15
	jge	.LBB2_9
	.align	16, 0x90
.LBB2_4:                                # %for.body4
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_5 Depth 3
                                        #         Child Loop BB2_6 Depth 4
	#DEBUG_VALUE: convolve_arr_linear:out <- [RBP+-64]
	#DEBUG_VALUE: convolve_arr_linear:khalf <- [RBP+-52]
	movl	-68(%rbp), %edi         # 4-byte Reload
	cmpl	%edi, -52(%rbp)         # 4-byte Folded Reload
.Ltmp86:
	#DEBUG_VALUE: filter_kernel:c <- 0
	#DEBUG_VALUE: filter_kernel:pixel <- 0.000000e+00
	xorps	%xmm0, %xmm0
	movq	%r8, %r10
	movq	-96(%rbp), %r9          # 8-byte Reload
	.loc	3 96 13 is_stmt 1       # convolve.c:96:13
.Ltmp87:
	movq	-80(%rbp), %r11         # 8-byte Reload
	jl	.LBB2_8
	.align	16, 0x90
.LBB2_5:                                # %for.inc.i.preheader
                                        #   Parent Loop BB2_3 Depth=1
                                        #     Parent Loop BB2_4 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB2_6 Depth 4
	#DEBUG_VALUE: convolve_arr_linear:out <- [RBP+-64]
	#DEBUG_VALUE: convolve_arr_linear:khalf <- [RBP+-52]
	movq	%r10, %r14
	movq	%r9, %r13
	movq	%r12, %rbx
	.align	16, 0x90
.LBB2_6:                                # %for.inc.i
                                        #   Parent Loop BB2_3 Depth=1
                                        #     Parent Loop BB2_4 Depth=2
                                        #       Parent Loop BB2_5 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	#DEBUG_VALUE: convolve_arr_linear:out <- [RBP+-64]
	#DEBUG_VALUE: convolve_arr_linear:khalf <- [RBP+-52]
	movaps	%xmm0, %xmm1
	.loc	3 31 22                 # convolve.c:31:22
.Ltmp88:
	movzbl	(%r14), %edi
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%edi, %xmm0
	mulss	(%r13), %xmm0
	.loc	3 31 13 is_stmt 0       # convolve.c:31:13
	addss	%xmm1, %xmm0
.Ltmp89:
	.loc	3 30 9 is_stmt 1        # convolve.c:30:9
	addq	$-4, %r13
	decq	%r14
	decq	%rbx
	jne	.LBB2_6
.Ltmp90:
# BB#7:                                 # %for.inc16.i
                                        #   in Loop: Header=BB2_5 Depth=3
	#DEBUG_VALUE: convolve_arr_linear:out <- [RBP+-64]
	#DEBUG_VALUE: convolve_arr_linear:khalf <- [RBP+-52]
	.loc	3 29 5                  # convolve.c:29:5
	addq	%rdx, %r9
	addq	%rcx, %r10
	cmpq	%rax, %r11
	.loc	3 29 5 is_stmt 0        # convolve.c:29:5
.Ltmp91:
	leaq	1(%r11), %r11
	jne	.LBB2_5
.Ltmp92:
.LBB2_8:                                # %filter_kernel.exit
                                        #   in Loop: Header=BB2_4 Depth=2
	#DEBUG_VALUE: convolve_arr_linear:out <- [RBP+-64]
	#DEBUG_VALUE: convolve_arr_linear:khalf <- [RBP+-52]
	#DEBUG_VALUE: filter_kernel:pixel <- 0.000000e+00
	#DEBUG_VALUE: filter_kernel:c <- 0
	.loc	3 33 27 is_stmt 1       # convolve.c:33:27
	cvttss2si	%xmm0, %r9d
	.loc	3 33 9 is_stmt 0        # convolve.c:33:9
	movq	%r15, %rbx
	movq	%rsi, %rdi
	imulq	%rdi, %rbx
	addq	-48(%rbp), %rbx         # 8-byte Folded Reload
.Ltmp93:
	#DEBUG_VALUE: filter_kernel:out <- [RBP+-64]
	.loc	3 33 5                  # convolve.c:33:5
	movq	-64(%rbp), %rsi         # 8-byte Reload
	movb	%r9b, (%rsi,%rbx)
.Ltmp94:
	.loc	3 95 9 is_stmt 1        # convolve.c:95:9
	addq	%rdi, %r8
	movq	%rdi, %rsi
	cmpq	-88(%rbp), %r15         # 8-byte Folded Reload
	.loc	3 95 9 is_stmt 0        # convolve.c:95:9
.Ltmp95:
	leaq	1(%r15), %r15
	jne	.LBB2_4
.Ltmp96:
.LBB2_9:                                # %for.inc5
                                        #   in Loop: Header=BB2_3 Depth=1
	#DEBUG_VALUE: convolve_arr_linear:out <- [RBP+-64]
	#DEBUG_VALUE: convolve_arr_linear:khalf <- [RBP+-52]
	movq	-104(%rbp), %rbx        # 8-byte Reload
	.loc	3 94 5 is_stmt 1        # convolve.c:94:5
	incq	%rbx
	movq	-48(%rbp), %rdi         # 8-byte Reload
	cmpq	-120(%rbp), %rdi        # 8-byte Folded Reload
	.loc	3 94 5 is_stmt 0        # convolve.c:94:5
.Ltmp97:
	leaq	1(%rdi), %rdi
	movq	%rdi, -48(%rbp)         # 8-byte Spill
	movl	-108(%rbp), %r13d       # 4-byte Reload
	jne	.LBB2_3
.Ltmp98:
.LBB2_10:                               # %for.end7
	.loc	3 97 1 is_stmt 1        # convolve.c:97:1
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp99:
.Ltmp100:
	.size	convolve_arr_linear, .Ltmp100-convolve_arr_linear
.Lfunc_end2:
	.cfi_endproc

	.globl	convolve_arr_indirection
	.align	16, 0x90
	.type	convolve_arr_indirection,@function
convolve_arr_indirection:               # @convolve_arr_indirection
.Lfunc_begin3:
	.loc	3 106 0                 # convolve.c:106:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp101:
	.cfi_def_cfa_offset 16
.Ltmp102:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp103:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
.Ltmp104:
	.cfi_offset %rbx, -56
.Ltmp105:
	.cfi_offset %r12, -48
.Ltmp106:
	.cfi_offset %r13, -40
.Ltmp107:
	.cfi_offset %r14, -32
.Ltmp108:
	.cfi_offset %r15, -24
	#DEBUG_VALUE: convolve_arr_indirection:in <- RDI
	#DEBUG_VALUE: convolve_arr_indirection:out <- RSI
	#DEBUG_VALUE: convolve_arr_indirection:kernel <- RDX
	#DEBUG_VALUE: convolve_arr_indirection:kn <- ECX
	#DEBUG_VALUE: convolve_arr_indirection:dim_x <- R8D
	#DEBUG_VALUE: convolve_arr_indirection:dim_y <- R9D
	movl	%r9d, %r15d
.Ltmp109:
	#DEBUG_VALUE: convolve_arr_indirection:dim_y <- R15D
	movq	%rdx, %r12
.Ltmp110:
	#DEBUG_VALUE: convolve_arr_indirection:kernel <- R12
	movq	%rsi, -56(%rbp)         # 8-byte Spill
.Ltmp111:
	#DEBUG_VALUE: convolve_arr_indirection:out <- [RBP+-56]
	movq	%rdi, %rbx
.Ltmp112:
	#DEBUG_VALUE: convolve_arr_indirection:in <- RBX
	.loc	3 107 23 prologue_end   # convolve.c:107:23
	movl	%ecx, %eax
	shrl	$31, %eax
	addl	%ecx, %eax
	sarl	%eax
.Ltmp113:
	#DEBUG_VALUE: m <- EAX
	#DEBUG_VALUE: convolve_arr_indirection:khalf <- EAX
	#DEBUG_VALUE: filter_kernel_2d:khalf <- EAX
	.loc	3 109 29                # convolve.c:109:29
	movl	%r8d, %r14d
	subl	%eax, %r14d
.Ltmp114:
	.loc	3 109 5 is_stmt 0       # convolve.c:109:5
	cmpl	%r14d, %eax
	movl	%eax, %r13d
.Ltmp115:
	#DEBUG_VALUE: m <- R13D
	#DEBUG_VALUE: convolve_arr_indirection:khalf <- R13D
	#DEBUG_VALUE: filter_kernel_2d:khalf <- R13D
	jge	.LBB3_11
.Ltmp116:
# BB#1:                                 # %bypassdesc
	#DEBUG_VALUE: convolve_arr_indirection:in <- RBX
	#DEBUG_VALUE: convolve_arr_indirection:out <- [RBP+-56]
	#DEBUG_VALUE: convolve_arr_indirection:kernel <- R12
	#DEBUG_VALUE: convolve_arr_indirection:kn <- ECX
	#DEBUG_VALUE: convolve_arr_indirection:dim_x <- R8D
	#DEBUG_VALUE: convolve_arr_indirection:dim_y <- R15D
	#DEBUG_VALUE: convolve_arr_indirection:khalf <- R13D
	movl	%ecx, %edi
	movl	%ecx, -72(%rbp)         # 4-byte Spill
.Ltmp117:
	#DEBUG_VALUE: convolve_arr_indirection:kn <- [RBP+-72]
	movl	%r15d, %esi
	movl	%r8d, %edx
	movl	%r8d, -64(%rbp)         # 4-byte Spill
.Ltmp118:
	#DEBUG_VALUE: convolve_arr_indirection:dim_x <- [RBP+-64]
	callq	convolve_hw_use_accelerator
	testb	%al, %al
	je	.LBB3_2
.Ltmp119:
# BB#12:                                # %acc
	#DEBUG_VALUE: convolve_arr_indirection:in <- RBX
	#DEBUG_VALUE: convolve_arr_indirection:out <- [RBP+-56]
	#DEBUG_VALUE: convolve_arr_indirection:kernel <- R12
	#DEBUG_VALUE: convolve_arr_indirection:kn <- [RBP+-72]
	#DEBUG_VALUE: convolve_arr_indirection:dim_x <- [RBP+-64]
	#DEBUG_VALUE: convolve_arr_indirection:dim_y <- R15D
	#DEBUG_VALUE: filter_kernel_2d:kn <- [RBP+-72]
	movq	%rbx, %rdi
	movq	-56(%rbp), %rsi         # 8-byte Reload
	movq	%r12, %rdx
	movl	-72(%rbp), %ecx         # 4-byte Reload
	movl	%r15d, %r8d
	movl	-64(%rbp), %r9d         # 4-byte Reload
	addq	$56, %rsp
	popq	%rbx
.Ltmp120:
	popq	%r12
.Ltmp121:
	popq	%r13
	popq	%r14
	popq	%r15
.Ltmp122:
	popq	%rbp
	jmp	convolve_bypass_hw_iface1 # TAILCALL
.LBB3_2:                                # %for.cond1.preheader.preheader
.Ltmp123:
	#DEBUG_VALUE: convolve_arr_indirection:in <- RBX
	#DEBUG_VALUE: convolve_arr_indirection:out <- [RBP+-56]
	#DEBUG_VALUE: convolve_arr_indirection:kernel <- R12
	#DEBUG_VALUE: convolve_arr_indirection:dim_y <- R15D
	#DEBUG_VALUE: convolve_arr_indirection:khalf <- R13D
	movl	%r13d, -44(%rbp)        # 4-byte Spill
	movslq	%r13d, %rdi
	.loc	3 51 9 is_stmt 1        # convolve.c:51:9
.Ltmp124:
	leaq	1(%rdi), %r10
.Ltmp125:
	.loc	3 109 10                # convolve.c:109:10
	movl	%edi, %eax
	negl	%eax
.Ltmp126:
	#DEBUG_VALUE: j <- EAX
	#DEBUG_VALUE: i <- EAX
	cltq
.Ltmp127:
	.loc	3 51 9                  # convolve.c:51:9
	movq	%rax, -64(%rbp)         # 8-byte Spill
	movq	%r10, %rsi
	subq	%rax, %rsi
.Ltmp128:
	.loc	3 110 33                # convolve.c:110:33
	subl	%r13d, %r15d
.Ltmp129:
	#DEBUG_VALUE: convolve_arr_indirection:khalf <- [RBP+-44]
	movl	%r15d, -76(%rbp)        # 4-byte Spill
	movslq	%r15d, %rcx
	decq	%rcx
	movq	%rcx, -72(%rbp)         # 8-byte Spill
	movslq	%r14d, %rcx
	decq	%rcx
	movq	%rcx, -88(%rbp)         # 8-byte Spill
	cltq
	subq	%rax, %r10
	addq	%rdi, %rax
	movq	%rax, -96(%rbp)         # 8-byte Spill
	movq	%rdi, %rax
.Ltmp130:
	.align	16, 0x90
.LBB3_3:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_5 Depth 2
                                        #       Child Loop BB3_6 Depth 3
                                        #         Child Loop BB3_7 Depth 4
	#DEBUG_VALUE: convolve_arr_indirection:in <- RBX
	#DEBUG_VALUE: convolve_arr_indirection:out <- [RBP+-56]
	#DEBUG_VALUE: convolve_arr_indirection:kernel <- R12
	#DEBUG_VALUE: convolve_arr_indirection:khalf <- [RBP+-44]
	.loc	3 110 9 is_stmt 0       # convolve.c:110:9
	cmpl	%r15d, -44(%rbp)        # 4-byte Folded Reload
	jge	.LBB3_10
.Ltmp131:
# BB#4:                                 # %for.body4.preheader
                                        #   in Loop: Header=BB3_3 Depth=1
	#DEBUG_VALUE: convolve_arr_indirection:in <- RBX
	#DEBUG_VALUE: convolve_arr_indirection:out <- [RBP+-56]
	#DEBUG_VALUE: convolve_arr_indirection:kernel <- R12
	#DEBUG_VALUE: convolve_arr_indirection:khalf <- [RBP+-44]
	movq	-96(%rbp), %rdx         # 8-byte Reload
	movq	%rdi, %r14
.Ltmp132:
	.align	16, 0x90
.LBB3_5:                                # %for.body4
                                        #   Parent Loop BB3_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_6 Depth 3
                                        #         Child Loop BB3_7 Depth 4
	#DEBUG_VALUE: convolve_arr_indirection:in <- RBX
	#DEBUG_VALUE: convolve_arr_indirection:out <- [RBP+-56]
	#DEBUG_VALUE: convolve_arr_indirection:kernel <- R12
	#DEBUG_VALUE: convolve_arr_indirection:khalf <- [RBP+-44]
	movq	-64(%rbp), %r11         # 8-byte Reload
	cmpl	%r11d, -44(%rbp)        # 4-byte Folded Reload
.Ltmp133:
	#DEBUG_VALUE: filter_kernel_2d:pixel <- 0.000000e+00
	xorps	%xmm0, %xmm0
.Ltmp134:
	#DEBUG_VALUE: filter_kernel_2d:c <- 0
	movl	$0, %r9d
	jl	.LBB3_9
.Ltmp135:
	.align	16, 0x90
.LBB3_6:                                # %for.inc.i.preheader
                                        #   Parent Loop BB3_3 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB3_7 Depth 4
	#DEBUG_VALUE: convolve_arr_indirection:in <- RBX
	#DEBUG_VALUE: convolve_arr_indirection:out <- [RBP+-56]
	#DEBUG_VALUE: convolve_arr_indirection:kernel <- R12
	#DEBUG_VALUE: convolve_arr_indirection:khalf <- [RBP+-44]
	#DEBUG_VALUE: filter_kernel_2d:pixel <- 0.000000e+00
	#DEBUG_VALUE: filter_kernel_2d:c <- 0
	#DEBUG_VALUE: filter_kernel_2d:kernel <- R12
	movslq	%r9d, %r9
.Ltmp136:
	#DEBUG_VALUE: filter_kernel_2d:in <- RBX
	.loc	3 52 25 is_stmt 1       # convolve.c:52:25
	leaq	(%r11,%rax), %rcx
	leaq	(%r12,%r9,4), %r15
	movq	(%rbx,%rcx,8), %r13
	addq	%rdx, %r13
	movq	%r10, %rcx
.Ltmp137:
	.align	16, 0x90
.LBB3_7:                                # %for.inc.i
                                        #   Parent Loop BB3_3 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        #       Parent Loop BB3_6 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	#DEBUG_VALUE: convolve_arr_indirection:in <- RBX
	#DEBUG_VALUE: convolve_arr_indirection:out <- [RBP+-56]
	#DEBUG_VALUE: convolve_arr_indirection:kernel <- R12
	#DEBUG_VALUE: convolve_arr_indirection:khalf <- [RBP+-44]
	#DEBUG_VALUE: filter_kernel_2d:pixel <- 0.000000e+00
	#DEBUG_VALUE: filter_kernel_2d:c <- 0
	#DEBUG_VALUE: filter_kernel_2d:kernel <- R12
	#DEBUG_VALUE: filter_kernel_2d:in <- RBX
	.loc	3 111 10                # convolve.c:111:10
	movaps	%xmm0, %xmm1
	.loc	3 52 22                 # convolve.c:52:22
.Ltmp138:
	movzbl	(%r13), %r8d
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%r8d, %xmm0
	mulss	(%r15), %xmm0
	.loc	3 52 13 is_stmt 0       # convolve.c:52:13
	addss	%xmm1, %xmm0
.Ltmp139:
	.loc	3 51 9 is_stmt 1        # convolve.c:51:9
	addq	$4, %r15
	incq	%r13
	decq	%rcx
	jne	.LBB3_7
.Ltmp140:
# BB#8:                                 # %for.inc13.i
                                        #   in Loop: Header=BB3_6 Depth=3
	#DEBUG_VALUE: convolve_arr_indirection:in <- RBX
	#DEBUG_VALUE: convolve_arr_indirection:out <- [RBP+-56]
	#DEBUG_VALUE: convolve_arr_indirection:kernel <- R12
	#DEBUG_VALUE: convolve_arr_indirection:khalf <- [RBP+-44]
	#DEBUG_VALUE: filter_kernel_2d:pixel <- 0.000000e+00
	#DEBUG_VALUE: filter_kernel_2d:c <- 0
	#DEBUG_VALUE: filter_kernel_2d:kernel <- R12
	#DEBUG_VALUE: filter_kernel_2d:in <- RBX
	addq	%rsi, %r9
.Ltmp141:
	.loc	3 50 5                  # convolve.c:50:5
	cmpq	%rdi, %r11
	.loc	3 50 5 is_stmt 0        # convolve.c:50:5
.Ltmp142:
	leaq	1(%r11), %r11
	jne	.LBB3_6
.Ltmp143:
.LBB3_9:                                # %filter_kernel_2d.exit
                                        #   in Loop: Header=BB3_5 Depth=2
	#DEBUG_VALUE: convolve_arr_indirection:in <- RBX
	#DEBUG_VALUE: convolve_arr_indirection:out <- [RBP+-56]
	#DEBUG_VALUE: convolve_arr_indirection:kernel <- R12
	#DEBUG_VALUE: convolve_arr_indirection:khalf <- [RBP+-44]
	#DEBUG_VALUE: filter_kernel_2d:pixel <- 0.000000e+00
	#DEBUG_VALUE: filter_kernel_2d:c <- 0
	.loc	3 54 17 is_stmt 1       # convolve.c:54:17
	cvttss2si	%xmm0, %r8d
.Ltmp144:
	#DEBUG_VALUE: filter_kernel_2d:out <- [RBP+-56]
	.loc	3 54 5 is_stmt 0        # convolve.c:54:5
	movq	-56(%rbp), %rcx         # 8-byte Reload
	movq	(%rcx,%rax,8), %rcx
	movb	%r8b, (%rcx,%r14)
.Ltmp145:
	.loc	3 110 9 is_stmt 1       # convolve.c:110:9
	incq	%rdx
	cmpq	-72(%rbp), %r14         # 8-byte Folded Reload
	.loc	3 110 9 is_stmt 0       # convolve.c:110:9
.Ltmp146:
	leaq	1(%r14), %r14
	jne	.LBB3_5
.Ltmp147:
.LBB3_10:                               # %for.inc5
                                        #   in Loop: Header=BB3_3 Depth=1
	#DEBUG_VALUE: convolve_arr_indirection:in <- RBX
	#DEBUG_VALUE: convolve_arr_indirection:out <- [RBP+-56]
	#DEBUG_VALUE: convolve_arr_indirection:kernel <- R12
	#DEBUG_VALUE: convolve_arr_indirection:khalf <- [RBP+-44]
	.loc	3 109 5 is_stmt 1       # convolve.c:109:5
	cmpq	-88(%rbp), %rax         # 8-byte Folded Reload
	.loc	3 109 5 is_stmt 0       # convolve.c:109:5
.Ltmp148:
	leaq	1(%rax), %rax
	movl	-76(%rbp), %r15d        # 4-byte Reload
	jne	.LBB3_3
.Ltmp149:
.LBB3_11:                               # %for.end7
	.loc	3 112 1 is_stmt 1       # convolve.c:112:1
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp150:
.Ltmp151:
	.size	convolve_arr_indirection, .Ltmp151-convolve_arr_indirection
.Lfunc_end3:
	.cfi_endproc

	.globl	convolve_loop_nest
	.align	16, 0x90
	.type	convolve_loop_nest,@function
convolve_loop_nest:                     # @convolve_loop_nest
.Lfunc_begin4:
	.loc	3 121 0                 # convolve.c:121:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp152:
	.cfi_def_cfa_offset 16
.Ltmp153:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp154:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
.Ltmp155:
	.cfi_offset %rbx, -56
.Ltmp156:
	.cfi_offset %r12, -48
.Ltmp157:
	.cfi_offset %r13, -40
.Ltmp158:
	.cfi_offset %r14, -32
.Ltmp159:
	.cfi_offset %r15, -24
	#DEBUG_VALUE: convolve_loop_nest:in <- RDI
	#DEBUG_VALUE: convolve_loop_nest:out <- RSI
	#DEBUG_VALUE: convolve_loop_nest:kernel <- RDX
	#DEBUG_VALUE: convolve_loop_nest:kn <- ECX
	#DEBUG_VALUE: convolve_loop_nest:dim_x <- R8D
	#DEBUG_VALUE: convolve_loop_nest:dim_y <- R9D
	movl	%r9d, %ebx
.Ltmp160:
	#DEBUG_VALUE: convolve_loop_nest:dim_y <- EBX
	movq	%rdx, %r12
.Ltmp161:
	#DEBUG_VALUE: convolve_loop_nest:kernel <- R12
	movq	%rsi, -56(%rbp)         # 8-byte Spill
.Ltmp162:
	#DEBUG_VALUE: convolve_loop_nest:out <- [RBP+-56]
	movq	%rdi, %r14
.Ltmp163:
	#DEBUG_VALUE: convolve_loop_nest:in <- R14
	.loc	3 122 23 prologue_end   # convolve.c:122:23
	movl	%ecx, %eax
	shrl	$31, %eax
	addl	%ecx, %eax
	sarl	%eax
.Ltmp164:
	#DEBUG_VALUE: y <- EAX
	#DEBUG_VALUE: convolve_loop_nest:khalf <- EAX
	.loc	3 124 29                # convolve.c:124:29
	movl	%r8d, %r15d
	subl	%eax, %r15d
.Ltmp165:
	.loc	3 124 5 is_stmt 0       # convolve.c:124:5
	cmpl	%r15d, %eax
	movl	%eax, %r13d
.Ltmp166:
	#DEBUG_VALUE: y <- R13D
	#DEBUG_VALUE: convolve_loop_nest:khalf <- R13D
	jge	.LBB4_10
.Ltmp167:
# BB#1:                                 # %bypassdesc
	#DEBUG_VALUE: convolve_loop_nest:in <- R14
	#DEBUG_VALUE: convolve_loop_nest:out <- [RBP+-56]
	#DEBUG_VALUE: convolve_loop_nest:kernel <- R12
	#DEBUG_VALUE: convolve_loop_nest:kn <- ECX
	#DEBUG_VALUE: convolve_loop_nest:dim_x <- R8D
	#DEBUG_VALUE: convolve_loop_nest:dim_y <- EBX
	#DEBUG_VALUE: convolve_loop_nest:khalf <- R13D
	movl	%ecx, %edi
	movl	%ecx, -68(%rbp)         # 4-byte Spill
.Ltmp168:
	#DEBUG_VALUE: convolve_loop_nest:kn <- [RBP+-68]
	movl	%ebx, %esi
	movl	%r8d, %edx
	movl	%r8d, -64(%rbp)         # 4-byte Spill
.Ltmp169:
	#DEBUG_VALUE: convolve_loop_nest:dim_x <- [RBP+-64]
	callq	convolve_hw_use_accelerator
	testb	%al, %al
	je	.LBB4_2
.Ltmp170:
# BB#11:                                # %acc
	#DEBUG_VALUE: convolve_loop_nest:in <- R14
	#DEBUG_VALUE: convolve_loop_nest:out <- [RBP+-56]
	#DEBUG_VALUE: convolve_loop_nest:kernel <- R12
	#DEBUG_VALUE: convolve_loop_nest:kn <- [RBP+-68]
	#DEBUG_VALUE: convolve_loop_nest:dim_x <- [RBP+-64]
	#DEBUG_VALUE: convolve_loop_nest:dim_y <- EBX
	movq	%r14, %rdi
	movq	-56(%rbp), %rsi         # 8-byte Reload
	movq	%r12, %rdx
	movl	-68(%rbp), %ecx         # 4-byte Reload
	movl	%ebx, %r8d
	movl	-64(%rbp), %r9d         # 4-byte Reload
	addq	$40, %rsp
	popq	%rbx
.Ltmp171:
	popq	%r12
.Ltmp172:
	popq	%r13
	popq	%r14
.Ltmp173:
	popq	%r15
	popq	%rbp
	jmp	convolve_bypass_hw_iface1 # TAILCALL
.LBB4_2:                                # %for.cond1.preheader.preheader
.Ltmp174:
	#DEBUG_VALUE: convolve_loop_nest:in <- R14
	#DEBUG_VALUE: convolve_loop_nest:out <- [RBP+-56]
	#DEBUG_VALUE: convolve_loop_nest:kernel <- R12
	#DEBUG_VALUE: convolve_loop_nest:dim_y <- EBX
	#DEBUG_VALUE: convolve_loop_nest:khalf <- R13D
	.loc	3 124 10                # convolve.c:124:10
	movl	%r13d, -44(%rbp)        # 4-byte Spill
	movl	%r13d, %eax
	negl	%eax
	movslq	%eax, %r10
	movslq	%r13d, %rcx
	.loc	3 125 31 is_stmt 1      # convolve.c:125:31
.Ltmp175:
	subl	%r13d, %ebx
.Ltmp176:
	#DEBUG_VALUE: convolve_loop_nest:khalf <- [RBP+-44]
	.loc	3 126 15                # convolve.c:126:15
	movl	%ebx, -68(%rbp)         # 4-byte Spill
	leaq	1(%rcx), %r11
	subq	%r10, %r11
	movslq	%ebx, %rax
.Ltmp177:
	.loc	3 125 31                # convolve.c:125:31
	decq	%rax
	movq	%rax, -64(%rbp)         # 8-byte Spill
	movslq	%r15d, %rax
	decq	%rax
	movq	%rax, -80(%rbp)         # 8-byte Spill
	leaq	-1(%r10), %r13
	movq	%rcx, %rsi
.Ltmp178:
	.align	16, 0x90
.LBB4_3:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_4 Depth 2
                                        #       Child Loop BB4_5 Depth 3
                                        #         Child Loop BB4_6 Depth 4
	#DEBUG_VALUE: convolve_loop_nest:in <- R14
	#DEBUG_VALUE: convolve_loop_nest:out <- [RBP+-56]
	#DEBUG_VALUE: convolve_loop_nest:kernel <- R12
	#DEBUG_VALUE: convolve_loop_nest:khalf <- [RBP+-44]
	.loc	3 125 7 is_stmt 0       # convolve.c:125:7
	cmpl	%ebx, -44(%rbp)         # 4-byte Folded Reload
	movq	%rcx, %rax
	jge	.LBB4_9
.Ltmp179:
	.align	16, 0x90
.LBB4_4:                                # %for.body4
                                        #   Parent Loop BB4_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_5 Depth 3
                                        #         Child Loop BB4_6 Depth 4
	#DEBUG_VALUE: convolve_loop_nest:in <- R14
	#DEBUG_VALUE: convolve_loop_nest:out <- [RBP+-56]
	#DEBUG_VALUE: convolve_loop_nest:kernel <- R12
	#DEBUG_VALUE: convolve_loop_nest:khalf <- [RBP+-44]
	cmpl	%r10d, -44(%rbp)        # 4-byte Folded Reload
.Ltmp180:
	#DEBUG_VALUE: pixel <- 0.000000e+00
	xorps	%xmm0, %xmm0
.Ltmp181:
	#DEBUG_VALUE: c <- 0
	movl	$0, %ebx
	movq	%r10, %rdx
	jl	.LBB4_8
.Ltmp182:
	.align	16, 0x90
.LBB4_5:                                # %for.inc.preheader
                                        #   Parent Loop BB4_3 Depth=1
                                        #     Parent Loop BB4_4 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB4_6 Depth 4
	#DEBUG_VALUE: convolve_loop_nest:in <- R14
	#DEBUG_VALUE: convolve_loop_nest:out <- [RBP+-56]
	#DEBUG_VALUE: convolve_loop_nest:kernel <- R12
	#DEBUG_VALUE: convolve_loop_nest:khalf <- [RBP+-44]
	#DEBUG_VALUE: pixel <- 0.000000e+00
	#DEBUG_VALUE: c <- 0
	.loc	3 132 25 is_stmt 1      # convolve.c:132:25
	leaq	(%rdx,%rax), %rdi
	movslq	%ebx, %rbx
	leaq	(%r12,%rbx,4), %r8
	movq	(%r14,%rdi,8), %r15
	addq	%rsi, %r15
	movq	%r13, %rdi
.Ltmp183:
	.align	16, 0x90
.LBB4_6:                                # %for.inc
                                        #   Parent Loop BB4_3 Depth=1
                                        #     Parent Loop BB4_4 Depth=2
                                        #       Parent Loop BB4_5 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	#DEBUG_VALUE: convolve_loop_nest:in <- R14
	#DEBUG_VALUE: convolve_loop_nest:out <- [RBP+-56]
	#DEBUG_VALUE: convolve_loop_nest:kernel <- R12
	#DEBUG_VALUE: convolve_loop_nest:khalf <- [RBP+-44]
	#DEBUG_VALUE: pixel <- 0.000000e+00
	#DEBUG_VALUE: c <- 0
	movaps	%xmm0, %xmm1
	.loc	3 132 22 is_stmt 0      # convolve.c:132:22
	movzbl	1(%r15,%rdi), %r9d
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%r9d, %xmm0
	mulss	(%r8), %xmm0
	.loc	3 132 13                # convolve.c:132:13
	addss	%xmm1, %xmm0
.Ltmp184:
	#DEBUG_VALUE: pixel <- XMM0
	.loc	3 131 32 is_stmt 1      # convolve.c:131:32
	addq	$4, %r8
	incq	%rdi
	cmpq	%rcx, %rdi
.Ltmp185:
	.loc	3 131 11 is_stmt 0      # convolve.c:131:11
	jl	.LBB4_6
.Ltmp186:
# BB#7:                                 # %for.inc21
                                        #   in Loop: Header=BB4_5 Depth=3
	#DEBUG_VALUE: convolve_loop_nest:in <- R14
	#DEBUG_VALUE: convolve_loop_nest:out <- [RBP+-56]
	#DEBUG_VALUE: convolve_loop_nest:kernel <- R12
	#DEBUG_VALUE: convolve_loop_nest:khalf <- [RBP+-44]
	#DEBUG_VALUE: pixel <- XMM0
	#DEBUG_VALUE: c <- 0
	.loc	3 126 15 is_stmt 1      # convolve.c:126:15
	addq	%r11, %rbx
	.loc	3 130 30                # convolve.c:130:30
.Ltmp187:
	cmpq	%rcx, %rdx
	.loc	3 130 9 is_stmt 0       # convolve.c:130:9
	leaq	1(%rdx), %rdx
	jl	.LBB4_5
.Ltmp188:
.LBB4_8:                                # %for.end23
                                        #   in Loop: Header=BB4_4 Depth=2
	#DEBUG_VALUE: convolve_loop_nest:in <- R14
	#DEBUG_VALUE: convolve_loop_nest:out <- [RBP+-56]
	#DEBUG_VALUE: convolve_loop_nest:kernel <- R12
	#DEBUG_VALUE: convolve_loop_nest:khalf <- [RBP+-44]
	#DEBUG_VALUE: pixel <- 0.000000e+00
	#DEBUG_VALUE: c <- 0
	.loc	3 134 21 is_stmt 1      # convolve.c:134:21
	cvttss2si	%xmm0, %edx
	.loc	3 134 9 is_stmt 0       # convolve.c:134:9
	movq	-56(%rbp), %rdi         # 8-byte Reload
	movq	(%rdi,%rax,8), %rdi
	movb	%dl, (%rdi,%rsi)
.Ltmp189:
	.loc	3 125 7 is_stmt 1       # convolve.c:125:7
	cmpq	-64(%rbp), %rax         # 8-byte Folded Reload
	.loc	3 125 7 is_stmt 0       # convolve.c:125:7
.Ltmp190:
	leaq	1(%rax), %rax
	jne	.LBB4_4
.Ltmp191:
.LBB4_9:                                # %for.inc32
                                        #   in Loop: Header=BB4_3 Depth=1
	#DEBUG_VALUE: convolve_loop_nest:in <- R14
	#DEBUG_VALUE: convolve_loop_nest:out <- [RBP+-56]
	#DEBUG_VALUE: convolve_loop_nest:kernel <- R12
	#DEBUG_VALUE: convolve_loop_nest:khalf <- [RBP+-44]
	.loc	3 124 5 is_stmt 1       # convolve.c:124:5
	cmpq	-80(%rbp), %rsi         # 8-byte Folded Reload
	.loc	3 124 5 is_stmt 0       # convolve.c:124:5
.Ltmp192:
	leaq	1(%rsi), %rsi
	movl	-68(%rbp), %ebx         # 4-byte Reload
	jne	.LBB4_3
.Ltmp193:
.LBB4_10:                               # %for.end34
	.loc	3 136 1 is_stmt 1       # convolve.c:136:1
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp194:
.Ltmp195:
	.size	convolve_loop_nest, .Ltmp195-convolve_loop_nest
.Lfunc_end4:
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin5:
	.file	4 "/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve/convolve_driver.c"
	.loc	4 26 0                  # convolve_driver.c:26:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp196:
	.cfi_def_cfa_offset 16
.Ltmp197:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp198:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$464, %rsp              # imm = 0x1D0
.Ltmp199:
	.cfi_offset %rbx, -32
.Ltmp200:
	.cfi_offset %r14, -24
	movl	$0, -20(%rbp)
	movl	%edi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	.loc	4 28 2 prologue_end     # convolve_driver.c:28:2
.Ltmp201:
	movl	$0, opterr(%rip)
	.loc	4 30 6                  # convolve_driver.c:30:6
	movl	$0, -36(%rbp)
	.loc	4 30 17 is_stmt 0       # convolve_driver.c:30:17
	movl	$0, -40(%rbp)
	.loc	4 30 37                 # convolve_driver.c:30:37
	movl	$0, -44(%rbp)
	.loc	4 32 6 is_stmt 1        # convolve_driver.c:32:6
	movl	$0, -48(%rbp)
	.loc	4 32 22 is_stmt 0       # convolve_driver.c:32:22
	movl	$0, -52(%rbp)
	.loc	4 40 11 is_stmt 1       # convolve_driver.c:40:11
	movq	$0, -96(%rbp)
	.loc	4 41 11                 # convolve_driver.c:41:11
	movq	$0, -104(%rbp)
	jmp	.LBB5_1
	.align	16, 0x90
.LBB5_5:                                # %sw.bb1
                                        #   in Loop: Header=BB5_1 Depth=1
	.loc	4 49 8                  # convolve_driver.c:49:8
.Ltmp202:
	movl	$1, -40(%rbp)
.Ltmp203:
.LBB5_1:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	.loc	4 43 26 discriminator 2 # convolve_driver.c:43:26
	movl	-24(%rbp), %edi
.Ltmp204:
	.loc	4 43 32 is_stmt 0       # convolve_driver.c:43:32
	movq	-32(%rbp), %rsi
	.loc	4 43 19                 # convolve_driver.c:43:19
	movl	$.L.str, %edx
	callq	getopt
	.loc	4 43 13                 # convolve_driver.c:43:13
	movl	%eax, -88(%rbp)
	.loc	4 43 5                  # convolve_driver.c:43:5
	cmpl	$-1, %eax
	je	.LBB5_7
# BB#2:                                 # %while.body
                                        #   in Loop: Header=BB5_1 Depth=1
	.loc	4 44 15 is_stmt 1       # convolve_driver.c:44:15
.Ltmp205:
	movl	-88(%rbp), %eax
	.loc	4 44 7 is_stmt 0        # convolve_driver.c:44:7
	cmpl	$118, %eax
	je	.LBB5_5
# BB#3:                                 # %while.body
                                        #   in Loop: Header=BB5_1 Depth=1
	cmpl	$102, %eax
	jne	.LBB5_6
# BB#4:                                 # %sw.bb
                                        #   in Loop: Header=BB5_1 Depth=1
	.loc	4 46 22 is_stmt 1       # convolve_driver.c:46:22
.Ltmp206:
	movq	optarg(%rip), %rax
	.loc	4 46 8 is_stmt 0        # convolve_driver.c:46:8
	movq	%rax, -96(%rbp)
	jmp	.LBB5_1
.Ltmp207:
.LBB5_7:                                # %while.end
	.loc	4 57 9 is_stmt 1        # convolve_driver.c:57:9
	cmpq	$0, -96(%rbp)
	je	.LBB5_8
# BB#15:                                # %if.else
	.loc	4 79 66                 # convolve_driver.c:79:66
.Ltmp208:
	movq	-96(%rbp), %r8
	leaq	-64(%rbp), %rdi
	leaq	-80(%rbp), %rsi
	leaq	-76(%rbp), %rdx
	leaq	-84(%rbp), %rcx
	.loc	4 79 9 is_stmt 0        # convolve_driver.c:79:9
	callq	jpeg_decompress
.Ltmp209:
	.loc	4 79 9                  # convolve_driver.c:79:9
	testl	%eax, %eax
	je	.LBB5_17
# BB#16:                                # %if.then20
	.loc	4 80 15 is_stmt 1       # convolve_driver.c:80:15
.Ltmp210:
	movq	stderr(%rip), %rdi
	.loc	4 80 7 is_stmt 0        # convolve_driver.c:80:7
	movl	$.L.str3, %esi
	xorl	%eax, %eax
	callq	fprintf
	.loc	4 81 7 is_stmt 1        # convolve_driver.c:81:7
	movl	$1, -20(%rbp)
	jmp	.LBB5_37
.Ltmp211:
.LBB5_8:                                # %if.then
	.loc	4 58 20                 # convolve_driver.c:58:20
	movl	optind(%rip), %eax
	.loc	4 58 12 is_stmt 0       # convolve_driver.c:58:12
	movl	%eax, -36(%rbp)
	jmp	.LBB5_9
	.align	16, 0x90
.LBB5_14:                               # %for.inc
                                        #   in Loop: Header=BB5_9 Depth=1
	.loc	4 58 42                 # convolve_driver.c:58:42
.Ltmp212:
	incl	-36(%rbp)
.LBB5_9:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	.loc	4 58 28 discriminator 2 # convolve_driver.c:58:28
.Ltmp213:
	movl	-36(%rbp), %eax
.Ltmp214:
	.loc	4 58 7                  # convolve_driver.c:58:7
	cmpl	-24(%rbp), %eax
	jge	.LBB5_22
# BB#10:                                # %for.body
                                        #   in Loop: Header=BB5_9 Depth=1
	.loc	4 60 17 is_stmt 1       # convolve_driver.c:60:17
.Ltmp215:
	movl	-44(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -44(%rbp)
	.loc	4 60 9 is_stmt 0        # convolve_driver.c:60:9
	cmpl	$1, %eax
	jne	.LBB5_11
# BB#13:                                # %sw.bb7
                                        #   in Loop: Header=BB5_9 Depth=1
	.loc	4 65 31 is_stmt 1       # convolve_driver.c:65:31
.Ltmp216:
	movslq	-36(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	(%rcx,%rax,8), %rdi
	.loc	4 65 26 is_stmt 0       # convolve_driver.c:65:26
	callq	atoi
	.loc	4 65 11                 # convolve_driver.c:65:11
	movl	%eax, -52(%rbp)
	jmp	.LBB5_14
	.align	16, 0x90
.LBB5_11:                               # %for.body
                                        #   in Loop: Header=BB5_9 Depth=1
	testl	%eax, %eax
	jne	.LBB5_14
# BB#12:                                # %sw.bb4
                                        #   in Loop: Header=BB5_9 Depth=1
	.loc	4 62 27 is_stmt 1       # convolve_driver.c:62:27
	movslq	-36(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	(%rcx,%rax,8), %rdi
	.loc	4 62 22 is_stmt 0       # convolve_driver.c:62:22
	callq	atoi
	.loc	4 62 10                 # convolve_driver.c:62:10
	movl	%eax, -48(%rbp)
.Ltmp217:
	.loc	4 58 42 is_stmt 1       # convolve_driver.c:58:42
	incl	-36(%rbp)
	jmp	.LBB5_9
.Ltmp218:
.LBB5_22:                               # %for.end
	.loc	4 70 23                 # convolve_driver.c:70:23
	movl	-48(%rbp), %eax
	.loc	4 70 15 is_stmt 0       # convolve_driver.c:70:15
	movl	%eax, -80(%rbp)
	.loc	4 70 7                  # convolve_driver.c:70:7
	movl	%eax, -76(%rbp)
	.loc	4 72 7 is_stmt 1        # convolve_driver.c:72:7
	movq	$.L.str2, -96(%rbp)
	.loc	4 74 37                 # convolve_driver.c:74:37
	movl	-76(%rbp), %edi
	.loc	4 74 44 is_stmt 0       # convolve_driver.c:74:44
	movl	-80(%rbp), %esi
	movl	$1, %edx
	.loc	4 74 21                 # convolve_driver.c:74:21
	callq	create_array_2d
	.loc	4 74 7                  # convolve_driver.c:74:7
	movq	%rax, -64(%rbp)
	jmp	.LBB5_23
.Ltmp219:
.LBB5_17:                               # %if.end
	.loc	4 84 22 is_stmt 1       # convolve_driver.c:84:22
	movl	optind(%rip), %eax
	.loc	4 84 14 is_stmt 0       # convolve_driver.c:84:14
	movl	%eax, -36(%rbp)
	jmp	.LBB5_18
	.align	16, 0x90
.LBB5_21:                               # %for.inc32
                                        #   in Loop: Header=BB5_18 Depth=1
	.loc	4 84 44                 # convolve_driver.c:84:44
.Ltmp220:
	incl	-36(%rbp)
.LBB5_18:                               # %for.cond22
                                        # =>This Inner Loop Header: Depth=1
	.loc	4 84 30 discriminator 2 # convolve_driver.c:84:30
.Ltmp221:
	movl	-36(%rbp), %eax
.Ltmp222:
	.loc	4 84 9                  # convolve_driver.c:84:9
	cmpl	-24(%rbp), %eax
	jge	.LBB5_23
# BB#19:                                # %for.body25
                                        #   in Loop: Header=BB5_18 Depth=1
	.loc	4 85 19 is_stmt 1       # convolve_driver.c:85:19
.Ltmp223:
	movl	-44(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -44(%rbp)
	.loc	4 85 11 is_stmt 0       # convolve_driver.c:85:11
	testl	%eax, %eax
	jne	.LBB5_21
# BB#20:                                # %sw.bb27
                                        #   in Loop: Header=BB5_18 Depth=1
	.loc	4 87 33 is_stmt 1       # convolve_driver.c:87:33
.Ltmp224:
	movslq	-36(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	(%rcx,%rax,8), %rdi
	.loc	4 87 28 is_stmt 0       # convolve_driver.c:87:28
	callq	atoi
	.loc	4 87 13                 # convolve_driver.c:87:13
	movl	%eax, -52(%rbp)
	jmp	.LBB5_21
.Ltmp225:
.LBB5_23:                               # %for.end34
	.loc	4 92 36 is_stmt 1       # convolve_driver.c:92:36
	movl	-76(%rbp), %edi
	.loc	4 92 43 is_stmt 0       # convolve_driver.c:92:43
	movl	-80(%rbp), %esi
	xorl	%edx, %edx
	.loc	4 92 20                 # convolve_driver.c:92:20
	callq	create_array_2d
	.loc	4 92 6                  # convolve_driver.c:92:6
	movq	%rax, -72(%rbp)
.Ltmp226:
	.loc	4 95 56 is_stmt 1       # convolve_driver.c:95:56
	movq	-96(%rbp), %rdi
	.loc	4 95 49 is_stmt 0       # convolve_driver.c:95:49
	callq	strlen
	leaq	18(%rax), %rsi
	movl	$1, %edi
	.loc	4 95 28                 # convolve_driver.c:95:28
	callq	calloc
	movq	%rax, %r14
	.loc	4 95 5                  # convolve_driver.c:95:5
	movq	%r14, -104(%rbp)
	.loc	4 96 27 is_stmt 1       # convolve_driver.c:96:27
	movq	-96(%rbp), %rbx
	.loc	4 96 40 is_stmt 0       # convolve_driver.c:96:40
	movq	%rbx, %rdi
	callq	strlen
	.loc	4 96 5                  # convolve_driver.c:96:5
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	strncpy
	.loc	4 97 12 is_stmt 1       # convolve_driver.c:97:12
	movq	-104(%rbp), %rdi
	.loc	4 97 5 is_stmt 0        # convolve_driver.c:97:5
	movl	$.L.str4, %esi
	callq	strcat
.Ltmp227:
	#DEBUG_VALUE: main:i <- [RBP+-108]
	.loc	4 99 9 is_stmt 1        # convolve_driver.c:99:9
	movl	$0, -108(%rbp)
.Ltmp228:
	#DEBUG_VALUE: main:j <- [RBP+-112]
	.loc	4 99 16 is_stmt 0       # convolve_driver.c:99:16
	movl	$0, -112(%rbp)
.Ltmp229:
	#DEBUG_VALUE: main:kernel_3_3 <- [RBP+-160]
	.loc	4 101 11 is_stmt 1      # convolve_driver.c:101:11
	movl	.Lmain.kernel_3_3+32(%rip), %eax
	movl	%eax, -128(%rbp)
	movaps	.Lmain.kernel_3_3+16(%rip), %xmm0
	movaps	%xmm0, -144(%rbp)
	movaps	.Lmain.kernel_3_3(%rip), %xmm0
	movaps	%xmm0, -160(%rbp)
.Ltmp230:
	#DEBUG_VALUE: main:kernel_5_5 <- [RBP+-272]
	.loc	4 105 11                # convolve_driver.c:105:11
	movl	.Lmain.kernel_5_5+96(%rip), %eax
	movl	%eax, -176(%rbp)
	movaps	.Lmain.kernel_5_5+80(%rip), %xmm0
	movaps	%xmm0, -192(%rbp)
	movaps	.Lmain.kernel_5_5+64(%rip), %xmm0
	movaps	%xmm0, -208(%rbp)
	movaps	.Lmain.kernel_5_5+48(%rip), %xmm0
	movaps	%xmm0, -224(%rbp)
	movaps	.Lmain.kernel_5_5+32(%rip), %xmm0
	movaps	%xmm0, -240(%rbp)
	movaps	.Lmain.kernel_5_5+16(%rip), %xmm0
	movaps	%xmm0, -256(%rbp)
	movaps	.Lmain.kernel_5_5(%rip), %xmm0
	movaps	%xmm0, -272(%rbp)
.Ltmp231:
	#DEBUG_VALUE: main:kernel_7_7 <- [RBP+-480]
	leaq	-480(%rbp), %rdi
	.loc	4 111 11                # convolve_driver.c:111:11
	movl	$.Lmain.kernel_7_7, %esi
	movl	$196, %edx
	callq	memcpy
	.loc	4 120 8                 # convolve_driver.c:120:8
	cmpl	$3, -52(%rbp)
	jne	.LBB5_25
# BB#24:                                # %if.then47
	#DEBUG_VALUE: main:i <- [RBP+-108]
	#DEBUG_VALUE: main:j <- [RBP+-112]
	#DEBUG_VALUE: main:kernel_3_3 <- [RBP+-160]
	#DEBUG_VALUE: main:kernel_5_5 <- [RBP+-272]
	#DEBUG_VALUE: main:kernel_7_7 <- [RBP+-480]
	.loc	4 121 43                # convolve_driver.c:121:43
.Ltmp232:
	movq	-64(%rbp), %rdi
	.loc	4 121 55 is_stmt 0      # convolve_driver.c:121:55
	movq	-72(%rbp), %rsi
	.loc	4 121 87                # convolve_driver.c:121:87
	movl	-80(%rbp), %r8d
	.loc	4 121 94                # convolve_driver.c:121:94
	movl	-76(%rbp), %r9d
	leaq	-160(%rbp), %rdx
	movl	$3, %ecx
	jmp	.LBB5_29
.LBB5_25:                               # %if.else49
	#DEBUG_VALUE: main:i <- [RBP+-108]
	#DEBUG_VALUE: main:j <- [RBP+-112]
	#DEBUG_VALUE: main:kernel_3_3 <- [RBP+-160]
	#DEBUG_VALUE: main:kernel_5_5 <- [RBP+-272]
	#DEBUG_VALUE: main:kernel_7_7 <- [RBP+-480]
	.loc	4 122 13 is_stmt 1      # convolve_driver.c:122:13
	cmpl	$5, -52(%rbp)
	jne	.LBB5_27
# BB#26:                                # %if.then52
	#DEBUG_VALUE: main:i <- [RBP+-108]
	#DEBUG_VALUE: main:j <- [RBP+-112]
	#DEBUG_VALUE: main:kernel_3_3 <- [RBP+-160]
	#DEBUG_VALUE: main:kernel_5_5 <- [RBP+-272]
	#DEBUG_VALUE: main:kernel_7_7 <- [RBP+-480]
	.loc	4 123 43                # convolve_driver.c:123:43
.Ltmp233:
	movq	-64(%rbp), %rdi
	.loc	4 123 55 is_stmt 0      # convolve_driver.c:123:55
	movq	-72(%rbp), %rsi
	.loc	4 123 87                # convolve_driver.c:123:87
	movl	-80(%rbp), %r8d
	.loc	4 123 94                # convolve_driver.c:123:94
	movl	-76(%rbp), %r9d
	leaq	-272(%rbp), %rdx
	movl	$5, %ecx
	jmp	.LBB5_29
.LBB5_27:                               # %if.else54
	#DEBUG_VALUE: main:i <- [RBP+-108]
	#DEBUG_VALUE: main:j <- [RBP+-112]
	#DEBUG_VALUE: main:kernel_3_3 <- [RBP+-160]
	#DEBUG_VALUE: main:kernel_5_5 <- [RBP+-272]
	#DEBUG_VALUE: main:kernel_7_7 <- [RBP+-480]
	.loc	4 124 13 is_stmt 1      # convolve_driver.c:124:13
	cmpl	$7, -52(%rbp)
	jne	.LBB5_38
# BB#28:                                # %if.then57
	#DEBUG_VALUE: main:i <- [RBP+-108]
	#DEBUG_VALUE: main:j <- [RBP+-112]
	#DEBUG_VALUE: main:kernel_3_3 <- [RBP+-160]
	#DEBUG_VALUE: main:kernel_5_5 <- [RBP+-272]
	#DEBUG_VALUE: main:kernel_7_7 <- [RBP+-480]
	.loc	4 125 43                # convolve_driver.c:125:43
.Ltmp234:
	movq	-64(%rbp), %rdi
	.loc	4 125 55 is_stmt 0      # convolve_driver.c:125:55
	movq	-72(%rbp), %rsi
	.loc	4 125 87                # convolve_driver.c:125:87
	movl	-80(%rbp), %r8d
	.loc	4 125 94                # convolve_driver.c:125:94
	movl	-76(%rbp), %r9d
	leaq	-480(%rbp), %rdx
	movl	$7, %ecx
.LBB5_29:                               # %if.end65
	.loc	4 125 6                 # convolve_driver.c:125:6
	callq	convolve_loop_nest
	#DEBUG_VALUE: main:i <- [RBP+-108]
	#DEBUG_VALUE: main:j <- [RBP+-112]
	#DEBUG_VALUE: main:kernel_3_3 <- [RBP+-160]
	#DEBUG_VALUE: main:kernel_5_5 <- [RBP+-272]
	#DEBUG_VALUE: main:kernel_7_7 <- [RBP+-480]
.Ltmp235:
	.loc	4 132 9 is_stmt 1       # convolve_driver.c:132:9
	cmpl	$0, -40(%rbp)
	je	.LBB5_36
# BB#30:                                # %if.then67
	#DEBUG_VALUE: main:i <- [RBP+-108]
	#DEBUG_VALUE: main:j <- [RBP+-112]
	#DEBUG_VALUE: main:kernel_3_3 <- [RBP+-160]
	#DEBUG_VALUE: main:kernel_5_5 <- [RBP+-272]
	#DEBUG_VALUE: main:kernel_7_7 <- [RBP+-480]
	.loc	4 133 12                # convolve_driver.c:133:12
.Ltmp236:
	movl	$0, -112(%rbp)
	jmp	.LBB5_31
	.align	16, 0x90
.LBB5_35:                               # %for.inc86
                                        #   in Loop: Header=BB5_31 Depth=1
	#DEBUG_VALUE: main:i <- [RBP+-108]
	#DEBUG_VALUE: main:j <- [RBP+-112]
	#DEBUG_VALUE: main:kernel_3_3 <- [RBP+-160]
	#DEBUG_VALUE: main:kernel_5_5 <- [RBP+-272]
	#DEBUG_VALUE: main:kernel_7_7 <- [RBP+-480]
	.loc	4 137 9                 # convolve_driver.c:137:9
.Ltmp237:
	movl	$.L.str7, %edi
	xorl	%eax, %eax
	callq	printf
.Ltmp238:
	.loc	4 133 34                # convolve_driver.c:133:34
	incl	-112(%rbp)
.LBB5_31:                               # %for.cond68
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_33 Depth 2
	#DEBUG_VALUE: main:i <- [RBP+-108]
	#DEBUG_VALUE: main:j <- [RBP+-112]
	#DEBUG_VALUE: main:kernel_3_3 <- [RBP+-160]
	#DEBUG_VALUE: main:kernel_5_5 <- [RBP+-272]
	#DEBUG_VALUE: main:kernel_7_7 <- [RBP+-480]
	.loc	4 133 19 is_stmt 0 discriminator 2 # convolve_driver.c:133:19
.Ltmp239:
	movl	-112(%rbp), %eax
.Ltmp240:
	.loc	4 133 7                 # convolve_driver.c:133:7
	cmpl	-48(%rbp), %eax
	jge	.LBB5_36
# BB#32:                                # %for.body71
                                        #   in Loop: Header=BB5_31 Depth=1
	#DEBUG_VALUE: main:i <- [RBP+-108]
	#DEBUG_VALUE: main:j <- [RBP+-112]
	#DEBUG_VALUE: main:kernel_3_3 <- [RBP+-160]
	#DEBUG_VALUE: main:kernel_5_5 <- [RBP+-272]
	#DEBUG_VALUE: main:kernel_7_7 <- [RBP+-480]
	.loc	4 134 14 is_stmt 1      # convolve_driver.c:134:14
.Ltmp241:
	movl	$0, -108(%rbp)
	jmp	.LBB5_33
	.align	16, 0x90
.LBB5_34:                               # %for.inc82
                                        #   in Loop: Header=BB5_33 Depth=2
	#DEBUG_VALUE: main:i <- [RBP+-108]
	#DEBUG_VALUE: main:j <- [RBP+-112]
	#DEBUG_VALUE: main:kernel_3_3 <- [RBP+-160]
	#DEBUG_VALUE: main:kernel_5_5 <- [RBP+-272]
	#DEBUG_VALUE: main:kernel_7_7 <- [RBP+-480]
	.loc	4 135 26                # convolve_driver.c:135:26
.Ltmp242:
	movslq	-112(%rbp), %rax
	movslq	-108(%rbp), %rcx
	movq	-72(%rbp), %rdx
	movq	(%rdx,%rcx,8), %rcx
	movzbl	(%rcx,%rax), %esi
	.loc	4 135 11 is_stmt 0      # convolve_driver.c:135:11
	movl	$.L.str6, %edi
	xorl	%eax, %eax
	callq	printf
.Ltmp243:
	.loc	4 134 36 is_stmt 1      # convolve_driver.c:134:36
	incl	-108(%rbp)
.LBB5_33:                               # %for.cond72
                                        #   Parent Loop BB5_31 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: main:i <- [RBP+-108]
	#DEBUG_VALUE: main:j <- [RBP+-112]
	#DEBUG_VALUE: main:kernel_3_3 <- [RBP+-160]
	#DEBUG_VALUE: main:kernel_5_5 <- [RBP+-272]
	#DEBUG_VALUE: main:kernel_7_7 <- [RBP+-480]
	.loc	4 134 21 is_stmt 0 discriminator 2 # convolve_driver.c:134:21
.Ltmp244:
	movl	-108(%rbp), %eax
.Ltmp245:
	.loc	4 134 9                 # convolve_driver.c:134:9
	cmpl	-48(%rbp), %eax
	jl	.LBB5_34
	jmp	.LBB5_35
.Ltmp246:
.LBB5_36:                               # %if.end89
	#DEBUG_VALUE: main:i <- [RBP+-108]
	#DEBUG_VALUE: main:j <- [RBP+-112]
	#DEBUG_VALUE: main:kernel_3_3 <- [RBP+-160]
	#DEBUG_VALUE: main:kernel_5_5 <- [RBP+-272]
	#DEBUG_VALUE: main:kernel_7_7 <- [RBP+-480]
	.loc	4 141 19 is_stmt 1      # convolve_driver.c:141:19
	movq	-72(%rbp), %rdi
	.loc	4 141 32 is_stmt 0      # convolve_driver.c:141:32
	movl	-80(%rbp), %esi
	.loc	4 141 39                # convolve_driver.c:141:39
	movl	-76(%rbp), %edx
	.loc	4 141 49                # convolve_driver.c:141:49
	movq	-104(%rbp), %r8
	movl	$1, %ecx
	.loc	4 141 5                 # convolve_driver.c:141:5
	callq	jpeg_compress
	.loc	4 143 19 is_stmt 1      # convolve_driver.c:143:19
	movl	-76(%rbp), %edi
	.loc	4 143 26 is_stmt 0      # convolve_driver.c:143:26
	movq	-64(%rbp), %rsi
	.loc	4 143 5                 # convolve_driver.c:143:5
	callq	free_array_2d
	.loc	4 144 19 is_stmt 1      # convolve_driver.c:144:19
	movl	-76(%rbp), %edi
	.loc	4 144 26 is_stmt 0      # convolve_driver.c:144:26
	movq	-72(%rbp), %rsi
	.loc	4 144 5                 # convolve_driver.c:144:5
	callq	free_array_2d
	.loc	4 146 5 is_stmt 1       # convolve_driver.c:146:5
	movl	$0, -20(%rbp)
.LBB5_37:                               # %return
	.loc	4 147 1                 # convolve_driver.c:147:1
	movl	-20(%rbp), %eax
	addq	$464, %rsp              # imm = 0x1D0
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.LBB5_38:                               # %if.else59
	#DEBUG_VALUE: main:i <- [RBP+-108]
	#DEBUG_VALUE: main:j <- [RBP+-112]
	#DEBUG_VALUE: main:kernel_3_3 <- [RBP+-160]
	#DEBUG_VALUE: main:kernel_5_5 <- [RBP+-272]
	#DEBUG_VALUE: main:kernel_7_7 <- [RBP+-480]
	.loc	4 127 7                 # convolve_driver.c:127:7
.Ltmp247:
	movl	$.L.str5, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	4 128 21                # convolve_driver.c:128:21
	movl	-76(%rbp), %edi
	.loc	4 128 28 is_stmt 0      # convolve_driver.c:128:28
	movq	-64(%rbp), %rsi
	.loc	4 128 7                 # convolve_driver.c:128:7
	callq	free_array_2d
	.loc	4 129 21 is_stmt 1      # convolve_driver.c:129:21
	movl	-76(%rbp), %edi
	.loc	4 129 28 is_stmt 0      # convolve_driver.c:129:28
	movq	-72(%rbp), %rsi
	.loc	4 129 7                 # convolve_driver.c:129:7
	callq	free_array_2d
	.loc	4 130 7 is_stmt 1       # convolve_driver.c:130:7
	movl	$1, -20(%rbp)
	jmp	.LBB5_37
.Ltmp248:
.LBB5_6:                                # %sw.default
	.loc	4 52 17                 # convolve_driver.c:52:17
	movq	stderr(%rip), %rdi
	.loc	4 52 53 is_stmt 0       # convolve_driver.c:52:53
	movq	-32(%rbp), %rax
	movq	(%rax), %rdx
	.loc	4 52 9                  # convolve_driver.c:52:9
	movl	$.L.str1, %esi
	xorl	%eax, %eax
	callq	fprintf
	movl	$1, %edi
	.loc	4 53 9 is_stmt 1        # convolve_driver.c:53:9
	callq	exit
.Ltmp249:
.Ltmp250:
	.size	main, .Ltmp250-main
.Lfunc_end5:
	.cfi_endproc

	.globl	convolve_hw_use_accelerator
	.align	16, 0x90
	.type	convolve_hw_use_accelerator,@function
convolve_hw_use_accelerator:            # @convolve_hw_use_accelerator
.Lfunc_begin6:
	.loc	2 33 0                  # convolve_hw_interface.c:33:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp251:
	.cfi_def_cfa_offset 16
.Ltmp252:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp253:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	%edi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	.loc	2 34 12 prologue_end    # convolve_hw_interface.c:34:12
.Ltmp254:
	movb	$0, -17(%rbp)
	.loc	2 36 42                 # convolve_hw_interface.c:36:42
	movq	env_allow_hw(%rip), %rdi
	.loc	2 36 35 is_stmt 0       # convolve_hw_interface.c:36:35
	callq	getenv
	.loc	2 36 9                  # convolve_hw_interface.c:36:9
	movq	%rax, -32(%rbp)
	.loc	2 37 7 is_stmt 1        # convolve_hw_interface.c:37:7
	testq	%rax, %rax
	je	.LBB6_2
# BB#1:                                 # %if.then
	.loc	2 38 23                 # convolve_hw_interface.c:38:23
.Ltmp255:
	movq	-32(%rbp), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	.loc	2 38 16 is_stmt 0       # convolve_hw_interface.c:38:16
	callq	strtol
	.loc	2 38 5                  # convolve_hw_interface.c:38:5
	movb	%al, -17(%rbp)
.Ltmp256:
.LBB6_2:                                # %if.end
	.loc	2 41 7 is_stmt 1        # convolve_hw_interface.c:41:7
	cmpb	$0, -17(%rbp)
	je	.LBB6_7
# BB#3:                                 # %if.then3
	.loc	2 42 48                 # convolve_hw_interface.c:42:48
.Ltmp257:
	movl	-8(%rbp), %esi
	.loc	2 42 61 is_stmt 0       # convolve_hw_interface.c:42:61
	movl	-12(%rbp), %edx
	.loc	2 42 65                 # convolve_hw_interface.c:42:65
	movl	-16(%rbp), %ecx
	.loc	2 42 5                  # convolve_hw_interface.c:42:5
	movl	$.L.str47, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	2 43 9 is_stmt 1        # convolve_hw_interface.c:43:9
	cmpl	$10, -12(%rbp)
	jl	.LBB6_7
# BB#4:                                 # %land.lhs.true
	cmpl	$10, -16(%rbp)
	jl	.LBB6_7
# BB#5:                                 # %if.then8
	.loc	2 44 11                 # convolve_hw_interface.c:44:11
.Ltmp258:
	cmpl	$3, -8(%rbp)
	jl	.LBB6_7
# BB#6:                                 # %if.then11
	.loc	2 45 9                  # convolve_hw_interface.c:45:9
.Ltmp259:
	movb	$1, -1(%rbp)
	jmp	.LBB6_8
.Ltmp260:
.LBB6_7:                                # %if.end14
	.loc	2 48 3                  # convolve_hw_interface.c:48:3
	movb	$0, -1(%rbp)
.LBB6_8:                                # %return
	.loc	2 49 1                  # convolve_hw_interface.c:49:1
	movb	-1(%rbp), %al
	addq	$32, %rsp
	popq	%rbp
	retq
.Ltmp261:
.Ltmp262:
	.size	convolve_hw_use_accelerator, .Ltmp262-convolve_hw_use_accelerator
.Lfunc_end6:
	.cfi_endproc

	.globl	convolve_bypass_hw_iface0
	.align	16, 0x90
	.type	convolve_bypass_hw_iface0,@function
convolve_bypass_hw_iface0:              # @convolve_bypass_hw_iface0
.Lfunc_begin7:
	.loc	2 52 0                  # convolve_hw_interface.c:52:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp263:
	.cfi_def_cfa_offset 16
.Ltmp264:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp265:
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	%ecx, -28(%rbp)
	movl	%r8d, -32(%rbp)
	movl	%r9d, -36(%rbp)
	.loc	2 54 3 prologue_end     # convolve_hw_interface.c:54:3
.Ltmp266:
	movl	$.L.str58, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	2 55 108                # convolve_hw_interface.c:55:108
	movq	-8(%rbp), %rsi
	.loc	2 55 113 is_stmt 0      # convolve_hw_interface.c:55:113
	movq	-16(%rbp), %rdx
	.loc	2 56 10 is_stmt 1       # convolve_hw_interface.c:56:10
	movq	-24(%rbp), %rcx
	.loc	2 56 18 is_stmt 0       # convolve_hw_interface.c:56:18
	movl	-28(%rbp), %r8d
	.loc	2 56 31                 # convolve_hw_interface.c:56:31
	movl	-32(%rbp), %r9d
	.loc	2 56 35                 # convolve_hw_interface.c:56:35
	movl	-36(%rbp), %eax
	.loc	2 55 3 is_stmt 1        # convolve_hw_interface.c:55:3
	movl	%eax, (%rsp)
	movl	$.L.str69, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	2 57 1                  # convolve_hw_interface.c:57:1
	addq	$48, %rsp
	popq	%rbp
	retq
.Ltmp267:
.Ltmp268:
	.size	convolve_bypass_hw_iface0, .Ltmp268-convolve_bypass_hw_iface0
.Lfunc_end7:
	.cfi_endproc

	.globl	convolve_bypass_hw_iface1
	.align	16, 0x90
	.type	convolve_bypass_hw_iface1,@function
convolve_bypass_hw_iface1:              # @convolve_bypass_hw_iface1
.Lfunc_begin8:
	.loc	2 59 0                  # convolve_hw_interface.c:59:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp269:
	.cfi_def_cfa_offset 16
.Ltmp270:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp271:
	.cfi_def_cfa_register %rbp
	subq	$112, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	%ecx, -28(%rbp)
	movl	%r8d, -32(%rbp)
	movl	%r9d, -36(%rbp)
	.loc	2 62 3 prologue_end     # convolve_hw_interface.c:62:3
.Ltmp272:
	movl	$.L.str710, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	2 63 108                # convolve_hw_interface.c:63:108
	movq	-8(%rbp), %rsi
	.loc	2 63 113 is_stmt 0      # convolve_hw_interface.c:63:113
	movq	-16(%rbp), %rdx
	.loc	2 64 10 is_stmt 1       # convolve_hw_interface.c:64:10
	movq	-24(%rbp), %rcx
	.loc	2 64 18 is_stmt 0       # convolve_hw_interface.c:64:18
	movl	-28(%rbp), %r8d
	.loc	2 64 31                 # convolve_hw_interface.c:64:31
	movl	-32(%rbp), %r9d
	.loc	2 64 35                 # convolve_hw_interface.c:64:35
	movl	-36(%rbp), %eax
	.loc	2 63 3 is_stmt 1        # convolve_hw_interface.c:63:3
	movl	%eax, (%rsp)
	movl	$.L.str69, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	2 67 7                  # convolve_hw_interface.c:67:7
	cmpl	$3, -28(%rbp)
	jne	.LBB8_2
# BB#1:                                 # %if.then
	.loc	2 68 14                 # convolve_hw_interface.c:68:14
.Ltmp273:
	movq	libfilename_3_3(%rip), %rax
	jmp	.LBB8_6
.Ltmp274:
.LBB8_2:                                # %if.else
	.loc	2 69 14                 # convolve_hw_interface.c:69:14
	cmpl	$5, -28(%rbp)
	jne	.LBB8_4
# BB#3:                                 # %if.then3
	.loc	2 70 14                 # convolve_hw_interface.c:70:14
.Ltmp275:
	movq	libfilename_5_5(%rip), %rax
	jmp	.LBB8_6
.Ltmp276:
.LBB8_4:                                # %if.else4
	.loc	2 71 13                 # convolve_hw_interface.c:71:13
	cmpl	$7, -28(%rbp)
	jne	.LBB8_19
# BB#5:                                 # %if.then6
	.loc	2 72 14                 # convolve_hw_interface.c:72:14
.Ltmp277:
	movq	libfilename_7_7(%rip), %rax
.LBB8_6:                                # %if.end10
	.loc	2 72 4 is_stmt 0        # convolve_hw_interface.c:72:4
	movq	%rax, -56(%rbp)
.Ltmp278:
	#DEBUG_VALUE: convolve_bypass_hw_iface1:in <- [RBP+-64]
	.loc	2 79 44 is_stmt 1       # convolve_hw_interface.c:79:44
	movslq	-32(%rbp), %rax
	.loc	2 79 49 is_stmt 0       # convolve_hw_interface.c:79:49
	movslq	-36(%rbp), %rdi
	.loc	2 79 25                 # convolve_hw_interface.c:79:25
	imulq	%rax, %rdi
	.loc	2 79 18                 # convolve_hw_interface.c:79:18
	callq	malloc
	.loc	2 79 13                 # convolve_hw_interface.c:79:13
	movq	%rax, -64(%rbp)
.Ltmp279:
	#DEBUG_VALUE: convolve_bypass_hw_iface1:out <- [RBP+-72]
	.loc	2 80 45 is_stmt 1       # convolve_hw_interface.c:80:45
	movslq	-32(%rbp), %rax
	.loc	2 80 50 is_stmt 0       # convolve_hw_interface.c:80:50
	movslq	-36(%rbp), %rdi
	.loc	2 80 26                 # convolve_hw_interface.c:80:26
	imulq	%rax, %rdi
	.loc	2 80 19                 # convolve_hw_interface.c:80:19
	callq	malloc
	.loc	2 80 13                 # convolve_hw_interface.c:80:13
	movq	%rax, -72(%rbp)
.Ltmp280:
	#DEBUG_VALUE: convolve_bypass_hw_iface1:i <- [RBP+-76]
	.loc	2 82 7 is_stmt 1        # convolve_hw_interface.c:82:7
	movl	$0, -76(%rbp)
.Ltmp281:
	#DEBUG_VALUE: convolve_bypass_hw_iface1:j <- [RBP+-80]
	.loc	2 82 14 is_stmt 0       # convolve_hw_interface.c:82:14
	movl	$0, -80(%rbp)
	.loc	2 83 8 is_stmt 1        # convolve_hw_interface.c:83:8
.Ltmp282:
	movl	$0, -76(%rbp)
	jmp	.LBB8_7
	.align	16, 0x90
.LBB8_8:                                # %for.inc
                                        #   in Loop: Header=BB8_7 Depth=1
	#DEBUG_VALUE: convolve_bypass_hw_iface1:in <- [RBP+-64]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:out <- [RBP+-72]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:i <- [RBP+-76]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:j <- [RBP+-80]
	.loc	2 84 5                  # convolve_hw_interface.c:84:5
.Ltmp283:
	movslq	-76(%rbp), %rdi
	movslq	-32(%rbp), %rdx
	.loc	2 84 25 is_stmt 0       # convolve_hw_interface.c:84:25
	movq	-8(%rbp), %rax
	movq	(%rax,%rdi,8), %rsi
	.loc	2 84 16                 # convolve_hw_interface.c:84:16
	imulq	%rdx, %rdi
	.loc	2 84 5                  # convolve_hw_interface.c:84:5
	addq	-64(%rbp), %rdi
	callq	memcpy
	.loc	2 83 23 is_stmt 1       # convolve_hw_interface.c:83:23
	incl	-76(%rbp)
.LBB8_7:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: convolve_bypass_hw_iface1:in <- [RBP+-64]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:out <- [RBP+-72]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:i <- [RBP+-76]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:j <- [RBP+-80]
	.loc	2 83 15 is_stmt 0 discriminator 2 # convolve_hw_interface.c:83:15
.Ltmp284:
	movl	-76(%rbp), %eax
.Ltmp285:
	.loc	2 83 3                  # convolve_hw_interface.c:83:3
	cmpl	-36(%rbp), %eax
	jl	.LBB8_8
.Ltmp286:
# BB#9:                                 # %for.end
	#DEBUG_VALUE: convolve_bypass_hw_iface1:in <- [RBP+-64]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:out <- [RBP+-72]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:i <- [RBP+-76]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:j <- [RBP+-80]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:ifaceptr <- [RBP+-88]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:max_init <- [RBP+-96]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:dlhandle <- [RBP+-104]
	.loc	2 91 27 is_stmt 1       # convolve_hw_interface.c:91:27
	movq	-56(%rbp), %rdi
	movl	$257, %esi              # imm = 0x101
	.loc	2 91 20 is_stmt 0       # convolve_hw_interface.c:91:20
	callq	dlopen
	.loc	2 91 9                  # convolve_hw_interface.c:91:9
	movq	%rax, -104(%rbp)
	.loc	2 93 7 is_stmt 1        # convolve_hw_interface.c:93:7
	testq	%rax, %rax
	je	.LBB8_10
# BB#11:                                # %if.end30
	#DEBUG_VALUE: convolve_bypass_hw_iface1:in <- [RBP+-64]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:out <- [RBP+-72]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:i <- [RBP+-76]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:j <- [RBP+-80]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:ifaceptr <- [RBP+-88]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:max_init <- [RBP+-96]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:dlhandle <- [RBP+-104]
	.loc	2 100 20                # convolve_hw_interface.c:100:20
	movq	-104(%rbp), %rdi
	.loc	2 100 14 is_stmt 0      # convolve_hw_interface.c:100:14
	movl	$.L.str10, %esi
	callq	dlsym
	.loc	2 100 3                 # convolve_hw_interface.c:100:3
	movq	%rax, -88(%rbp)
	.loc	2 101 16 is_stmt 1      # convolve_hw_interface.c:101:16
.Ltmp287:
	callq	dlerror
	.loc	2 101 8 is_stmt 0       # convolve_hw_interface.c:101:8
	movq	%rax, -48(%rbp)
.Ltmp288:
	.loc	2 101 7                 # convolve_hw_interface.c:101:7
	testq	%rax, %rax
	jne	.LBB8_12
# BB#13:                                # %if.end37
	#DEBUG_VALUE: convolve_bypass_hw_iface1:in <- [RBP+-64]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:out <- [RBP+-72]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:i <- [RBP+-76]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:j <- [RBP+-80]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:ifaceptr <- [RBP+-88]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:max_init <- [RBP+-96]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:dlhandle <- [RBP+-104]
	.loc	2 106 20 is_stmt 1      # convolve_hw_interface.c:106:20
	movq	-104(%rbp), %rdi
	.loc	2 106 14 is_stmt 0      # convolve_hw_interface.c:106:14
	movl	$.L.str12, %esi
	callq	dlsym
	.loc	2 106 3                 # convolve_hw_interface.c:106:3
	movq	%rax, -96(%rbp)
	.loc	2 107 16 is_stmt 1      # convolve_hw_interface.c:107:16
.Ltmp289:
	callq	dlerror
	.loc	2 107 8 is_stmt 0       # convolve_hw_interface.c:107:8
	movq	%rax, -48(%rbp)
.Ltmp290:
	.loc	2 107 7                 # convolve_hw_interface.c:107:7
	testq	%rax, %rax
	je	.LBB8_14
.LBB8_12:                               # %if.then35
	#DEBUG_VALUE: convolve_bypass_hw_iface1:in <- [RBP+-64]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:out <- [RBP+-72]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:i <- [RBP+-76]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:j <- [RBP+-80]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:ifaceptr <- [RBP+-88]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:max_init <- [RBP+-96]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:dlhandle <- [RBP+-104]
	.loc	2 102 47 is_stmt 1      # convolve_hw_interface.c:102:47
.Ltmp291:
	movq	-48(%rbp), %rsi
	.loc	2 102 5 is_stmt 0       # convolve_hw_interface.c:102:5
	movl	$.L.str11, %edi
	xorl	%eax, %eax
	callq	printf
	jmp	.LBB8_18
.Ltmp292:
.LBB8_10:                               # %if.then27
	#DEBUG_VALUE: convolve_bypass_hw_iface1:in <- [RBP+-64]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:out <- [RBP+-72]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:i <- [RBP+-76]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:j <- [RBP+-80]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:ifaceptr <- [RBP+-88]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:max_init <- [RBP+-96]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:dlhandle <- [RBP+-104]
	.loc	2 94 13 is_stmt 1       # convolve_hw_interface.c:94:13
	callq	dlerror
	movq	%rax, %rcx
	.loc	2 94 5 is_stmt 0        # convolve_hw_interface.c:94:5
	movq	%rcx, -48(%rbp)
	.loc	2 95 5 is_stmt 1        # convolve_hw_interface.c:95:5
	movl	$.L.str9, %edi
	xorl	%eax, %eax
	movq	%rcx, %rsi
	callq	printf
	jmp	.LBB8_18
.Ltmp293:
.LBB8_19:                               # %if.else7
	.loc	2 75 47                 # convolve_hw_interface.c:75:47
	movl	-28(%rbp), %esi
	.loc	2 75 4 is_stmt 0        # convolve_hw_interface.c:75:4
	movl	$.L.str8, %edi
	xorl	%eax, %eax
	callq	printf
	jmp	.LBB8_18
.Ltmp294:
.LBB8_14:                               # %if.end44
	#DEBUG_VALUE: convolve_bypass_hw_iface1:in <- [RBP+-64]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:out <- [RBP+-72]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:i <- [RBP+-76]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:j <- [RBP+-80]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:ifaceptr <- [RBP+-88]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:max_init <- [RBP+-96]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:dlhandle <- [RBP+-104]
	.loc	2 112 3 is_stmt 1       # convolve_hw_interface.c:112:3
	movl	$.L.str13, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	2 116 15                # convolve_hw_interface.c:116:15
	movslq	-32(%rbp), %rsi
	movslq	-36(%rbp), %rdx
	movq	%rsi, %rdi
	imulq	%rdx, %rdi
	.loc	2 116 32 is_stmt 0      # convolve_hw_interface.c:116:32
	movq	-24(%rbp), %rcx
	.loc	2 116 40                # convolve_hw_interface.c:116:40
	movq	-64(%rbp), %r8
	.loc	2 116 44                # convolve_hw_interface.c:116:44
	movq	-72(%rbp), %r9
	.loc	2 116 5                 # convolve_hw_interface.c:116:5
                                        # kill: ESI<def> ESI<kill> RSI<kill>
                                        # kill: EDX<def> EDX<kill> RDX<kill>
	callq	*-88(%rbp)
	.loc	2 118 3 is_stmt 1       # convolve_hw_interface.c:118:3
	movl	$.L.str14, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	2 120 11                # convolve_hw_interface.c:120:11
	movq	-104(%rbp), %rdi
	.loc	2 120 3 is_stmt 0       # convolve_hw_interface.c:120:3
	callq	dlclose
	.loc	2 122 8 is_stmt 1       # convolve_hw_interface.c:122:8
.Ltmp295:
	movl	$0, -76(%rbp)
	jmp	.LBB8_15
	.align	16, 0x90
.LBB8_16:                               # %for.inc61
                                        #   in Loop: Header=BB8_15 Depth=1
	#DEBUG_VALUE: convolve_bypass_hw_iface1:in <- [RBP+-64]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:out <- [RBP+-72]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:i <- [RBP+-76]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:j <- [RBP+-80]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:ifaceptr <- [RBP+-88]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:max_init <- [RBP+-96]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:dlhandle <- [RBP+-104]
	.loc	2 123 12                # convolve_hw_interface.c:123:12
.Ltmp296:
	movslq	-76(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	(%rax,%rsi,8), %rdi
	.loc	2 123 5 is_stmt 0       # convolve_hw_interface.c:123:5
	movslq	-32(%rbp), %rdx
	.loc	2 123 25                # convolve_hw_interface.c:123:25
	imulq	%rdx, %rsi
	.loc	2 123 5                 # convolve_hw_interface.c:123:5
	addq	-72(%rbp), %rsi
	callq	memcpy
	.loc	2 122 23 is_stmt 1      # convolve_hw_interface.c:122:23
	incl	-76(%rbp)
.LBB8_15:                               # %for.cond50
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: convolve_bypass_hw_iface1:in <- [RBP+-64]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:out <- [RBP+-72]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:i <- [RBP+-76]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:j <- [RBP+-80]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:ifaceptr <- [RBP+-88]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:max_init <- [RBP+-96]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:dlhandle <- [RBP+-104]
	.loc	2 122 15 is_stmt 0 discriminator 2 # convolve_hw_interface.c:122:15
.Ltmp297:
	movl	-76(%rbp), %eax
.Ltmp298:
	.loc	2 122 3                 # convolve_hw_interface.c:122:3
	cmpl	-36(%rbp), %eax
	jl	.LBB8_16
.Ltmp299:
# BB#17:                                # %for.end63
	#DEBUG_VALUE: convolve_bypass_hw_iface1:in <- [RBP+-64]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:out <- [RBP+-72]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:i <- [RBP+-76]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:j <- [RBP+-80]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:ifaceptr <- [RBP+-88]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:max_init <- [RBP+-96]
	#DEBUG_VALUE: convolve_bypass_hw_iface1:dlhandle <- [RBP+-104]
	.loc	2 125 8 is_stmt 1       # convolve_hw_interface.c:125:8
	movq	-64(%rbp), %rdi
	.loc	2 125 3 is_stmt 0       # convolve_hw_interface.c:125:3
	callq	free
	.loc	2 126 8 is_stmt 1       # convolve_hw_interface.c:126:8
	movq	-72(%rbp), %rdi
	.loc	2 126 3 is_stmt 0       # convolve_hw_interface.c:126:3
	callq	free
.LBB8_18:                               # %return
	.loc	2 137 1 is_stmt 1 discriminator 1 # convolve_hw_interface.c:137:1
	addq	$112, %rsp
	popq	%rbp
	retq
.Ltmp300:
.Ltmp301:
	.size	convolve_bypass_hw_iface1, .Ltmp301-convolve_bypass_hw_iface1
.Lfunc_end8:
	.cfi_endproc

	.globl	free_array_2d
	.align	16, 0x90
	.type	free_array_2d,@function
free_array_2d:                          # @free_array_2d
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp302:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp303:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp304:
	.cfi_def_cfa_offset 32
.Ltmp305:
	.cfi_offset %rbx, -32
.Ltmp306:
	.cfi_offset %r14, -24
.Ltmp307:
	.cfi_offset %r15, -16
	movq	%rsi, %r14
	movq	%rdi, %r15
	testq	%r15, %r15
	je	.LBB9_3
# BB#1:
	movq	%r14, %rbx
	.align	16, 0x90
.LBB9_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rbx), %rdi
	callq	free
	addq	$8, %rbx
	decq	%r15
	jne	.LBB9_2
.LBB9_3:                                # %for.end
	movq	%r14, %rdi
	popq	%rbx
	popq	%r14
	popq	%r15
	jmp	free                    # TAILCALL
.Ltmp308:
	.size	free_array_2d, .Ltmp308-free_array_2d
	.cfi_endproc

	.globl	create_array_2d
	.align	16, 0x90
	.type	create_array_2d,@function
create_array_2d:                        # @create_array_2d
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp309:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp310:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp311:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp312:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp313:
	.cfi_def_cfa_offset 48
.Ltmp314:
	.cfi_offset %rbx, -48
.Ltmp315:
	.cfi_offset %r12, -40
.Ltmp316:
	.cfi_offset %r14, -32
.Ltmp317:
	.cfi_offset %r15, -24
.Ltmp318:
	.cfi_offset %rbp, -16
	movl	%edx, %ebp
	movq	%rsi, %r14
	movq	%rdi, %rbx
	leaq	(,%rbx,8), %rdi
	callq	malloc
	movq	%rax, %r15
	testq	%rbx, %rbx
	je	.LBB10_5
# BB#1:                                 # %for.body.lr.ph
	movzbl	%bpl, %r12d
	movq	%r15, %rbp
	.align	16, 0x90
.LBB10_2:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	callq	malloc
	testq	%r14, %r14
	movq	%rax, (%rbp)
	je	.LBB10_4
# BB#3:                                 # %for.body8.lr.ph
                                        #   in Loop: Header=BB10_2 Depth=1
	movq	%rax, %rdi
	movl	%r12d, %esi
	movq	%r14, %rdx
	callq	memset
.LBB10_4:                               # %for.inc13
                                        #   in Loop: Header=BB10_2 Depth=1
	addq	$8, %rbp
	decq	%rbx
	jne	.LBB10_2
.LBB10_5:                               # %for.end15
	movq	%r15, %rax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp319:
	.size	create_array_2d, .Ltmp319-create_array_2d
	.cfi_endproc

	.globl	jpeg_decompress
	.align	16, 0x90
	.type	jpeg_decompress,@function
jpeg_decompress:                        # @jpeg_decompress
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp320:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp321:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp322:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp323:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp324:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp325:
	.cfi_def_cfa_offset 56
	subq	$840, %rsp              # imm = 0x348
.Ltmp326:
	.cfi_def_cfa_offset 896
.Ltmp327:
	.cfi_offset %rbx, -56
.Ltmp328:
	.cfi_offset %r12, -48
.Ltmp329:
	.cfi_offset %r13, -40
.Ltmp330:
	.cfi_offset %r14, -32
.Ltmp331:
	.cfi_offset %r15, -24
.Ltmp332:
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
	movl	$.L.str27, %esi
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
	movl	$.L.str128, %esi
	xorl	%eax, %eax
	movq	%r14, %rdx
	callq	fprintf
	movl	$1, %r13d
	jmp	.LBB11_15
.LBB11_3:                               # %if.then7
	movq	stderr(%rip), %rdi
	movl	$.L.str229, %esi
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
	movl	$.L.str330, %edi
	movl	$12, %esi
	movl	$1, %edx
	callq	fwrite
	movl	$1, %r13d
	jmp	.LBB11_15
.Ltmp333:
	.size	jpeg_decompress, .Ltmp333-jpeg_decompress
	.cfi_endproc

	.globl	jpeg_compress
	.align	16, 0x90
	.type	jpeg_compress,@function
jpeg_compress:                          # @jpeg_compress
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp334:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp335:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp336:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp337:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp338:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp339:
	.cfi_def_cfa_offset 56
	subq	$760, %rsp              # imm = 0x2F8
.Ltmp340:
	.cfi_def_cfa_offset 816
.Ltmp341:
	.cfi_offset %rbx, -56
.Ltmp342:
	.cfi_offset %r12, -48
.Ltmp343:
	.cfi_offset %r13, -40
.Ltmp344:
	.cfi_offset %r14, -32
.Ltmp345:
	.cfi_offset %r15, -24
.Ltmp346:
	.cfi_offset %rbp, -16
	movq	%r8, %r13
	movl	%ecx, %r12d
	movl	%edx, %ebx
	movl	%esi, %ebp
	movq	%rdi, %r15
	movl	$.L.str431, %esi
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
	movl	$.L.str532, %esi
	xorl	%eax, %eax
	movq	%r13, %rdx
	callq	fprintf
	movl	$1, %eax
	jmp	.LBB12_11
.LBB12_5:                               # %if.else7
	movq	stderr(%rip), %rdi
	movl	$.L.str633, %esi
	xorl	%eax, %eax
	movl	%r12d, %edx
	callq	fprintf
	movl	$1, %eax
	jmp	.LBB12_11
.Ltmp347:
	.size	jpeg_compress, .Ltmp347-jpeg_compress
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

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	"dummy"
	.size	.L.str2, 6

	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	"jpeg decompression failed\n"
	.size	.L.str3, 27

	.type	.L.str4,@object         # @.str4
	.section	.rodata,"a",@progbits
.L.str4:
	.asciz	"_compressed.jpg\000"
	.size	.L.str4, 17

	.type	.Lmain.kernel_3_3,@object # @main.kernel_3_3
	.align	16
.Lmain.kernel_3_3:
	.long	1036831949              # float 1.000000e-01
	.long	1036831949              # float 1.000000e-01
	.long	1036831949              # float 1.000000e-01
	.long	1036831949              # float 1.000000e-01
	.long	1036831949              # float 1.000000e-01
	.long	1036831949              # float 1.000000e-01
	.long	1036831949              # float 1.000000e-01
	.long	1036831949              # float 1.000000e-01
	.long	1036831949              # float 1.000000e-01
	.size	.Lmain.kernel_3_3, 36

	.type	.Lmain.kernel_5_5,@object # @main.kernel_5_5
	.align	16
.Lmain.kernel_5_5:
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.size	.Lmain.kernel_5_5, 100

	.type	.Lmain.kernel_7_7,@object # @main.kernel_7_7
	.align	16
.Lmain.kernel_7_7:
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.long	1073741824              # float 2.000000e+00
	.size	.Lmain.kernel_7_7, 196

	.type	.L.str5,@object         # @.str5
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str5:
	.asciz	"invalid filter size!\n"
	.size	.L.str5, 22

	.type	.L.str6,@object         # @.str6
.L.str6:
	.asciz	"%d\t"
	.size	.L.str6, 4

	.type	.L.str7,@object         # @.str7
.L.str7:
	.asciz	"\n"
	.size	.L.str7, 2

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

	.type	.L.str47,@object        # @.str47
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str47:
	.asciz	"Filter size %d, nx: %d, ny: %d\n"
	.size	.L.str47, 32

	.type	.L.str58,@object        # @.str58
.L.str58:
	.asciz	"HW bypass 0 called\n"
	.size	.L.str58, 20

	.type	.L.str69,@object        # @.str69
.L.str69:
	.asciz	"Parameters:\nsrc: %p\ndst: %p\nkernel: %p\nFilter size: %d\nData size x: %d\nData size y: %d\n"
	.size	.L.str69, 88

	.type	.L.str710,@object       # @.str710
.L.str710:
	.asciz	"HW bypass 1 called\n"
	.size	.L.str710, 20

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

	.type	.L.str27,@object        # @.str27
.L.str27:
	.asciz	"rb"
	.size	.L.str27, 3

	.type	.L.str128,@object       # @.str128
.L.str128:
	.asciz	"can't open %s\n"
	.size	.L.str128, 15

	.type	.L.str229,@object       # @.str229
.L.str229:
	.asciz	"Only greyscale images supported! Channels: %d\n"
	.size	.L.str229, 47

	.type	.L.str330,@object       # @.str330
.L.str330:
	.asciz	"Image empty\n"
	.size	.L.str330, 13

	.type	.L.str431,@object       # @.str431
.L.str431:
	.asciz	"wb"
	.size	.L.str431, 3

	.type	.L.str532,@object       # @.str532
.L.str532:
	.asciz	"can't open: %s"
	.size	.L.str532, 15

	.type	.L.str633,@object       # @.str633
.L.str633:
	.asciz	"Cannot handle color space, channels: %d"
	.size	.L.str633, 40

	.data
.Ldebug_end0:
	.text
.Ldebug_end1:
	.file	5 "/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/slic/include/slic_typedefs.h"
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 3.6.1 (http://llvm.org/git/clang.git 14545f84de5008e75ea9b5ad1f7fce043e717ae7) (http://llvm.org/git/llvm.git 8dff69720e837083bf37bc2fe3fdf144319c83f3)"
.Linfo_string1:
	.asciz	"convolve.c"
.Linfo_string2:
	.asciz	"/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/convolve"
.Linfo_string3:
	.asciz	"unsigned char"
.Linfo_string4:
	.asciz	"u_int8_t"
.Linfo_string5:
	.asciz	"convolve_driver.c"
.Linfo_string6:
	.asciz	"char"
.Linfo_string7:
	.asciz	"convolve_hw_interface.c"
.Linfo_string8:
	.asciz	"libfilename_3_3"
.Linfo_string9:
	.asciz	"libfilename_5_5"
.Linfo_string10:
	.asciz	"libfilename_7_7"
.Linfo_string11:
	.asciz	"env_allow_hw"
.Linfo_string12:
	.asciz	"filter_kernel"
.Linfo_string13:
	.asciz	"in"
.Linfo_string14:
	.asciz	"out"
.Linfo_string15:
	.asciz	"kernel"
.Linfo_string16:
	.asciz	"float"
.Linfo_string17:
	.asciz	"kn"
.Linfo_string18:
	.asciz	"int"
.Linfo_string19:
	.asciz	"size_x"
.Linfo_string20:
	.asciz	"size_y"
.Linfo_string21:
	.asciz	"khalf"
.Linfo_string22:
	.asciz	"c"
.Linfo_string23:
	.asciz	"pixel"
.Linfo_string24:
	.asciz	"filter_kernel_2d"
.Linfo_string25:
	.asciz	"j"
.Linfo_string26:
	.asciz	"i"
.Linfo_string27:
	.asciz	"convolve_arr_linear"
.Linfo_string28:
	.asciz	"convolve_arr_indirection"
.Linfo_string29:
	.asciz	"convolve_loop_nest"
.Linfo_string30:
	.asciz	"main"
.Linfo_string31:
	.asciz	"convolve_hw_use_accelerator"
.Linfo_string32:
	.asciz	"_Bool"
.Linfo_string33:
	.asciz	"convolve_bypass_hw_iface0"
.Linfo_string34:
	.asciz	"convolve_bypass_hw_iface1"
.Linfo_string35:
	.asciz	"m"
.Linfo_string36:
	.asciz	"n"
.Linfo_string37:
	.asciz	"x"
.Linfo_string38:
	.asciz	"y"
.Linfo_string39:
	.asciz	"dim_x"
.Linfo_string40:
	.asciz	"dim_y"
.Linfo_string41:
	.asciz	"argc"
.Linfo_string42:
	.asciz	"argv"
.Linfo_string43:
	.asciz	"index"
.Linfo_string44:
	.asciz	"verbose_output"
.Linfo_string45:
	.asciz	"arg"
.Linfo_string46:
	.asciz	"_size_arr"
.Linfo_string47:
	.asciz	"_size_filter"
.Linfo_string48:
	.asciz	"data_input"
.Linfo_string49:
	.asciz	"data_output"
.Linfo_string50:
	.asciz	"nrows"
.Linfo_string51:
	.asciz	"unsigned int"
.Linfo_string52:
	.asciz	"u_int32_t"
.Linfo_string53:
	.asciz	"ncols"
.Linfo_string54:
	.asciz	"nchannels"
.Linfo_string55:
	.asciz	"opt"
.Linfo_string56:
	.asciz	"filename_in"
.Linfo_string57:
	.asciz	"filename_out"
.Linfo_string58:
	.asciz	"kernel_3_3"
.Linfo_string59:
	.asciz	"sizetype"
.Linfo_string60:
	.asciz	"kernel_5_5"
.Linfo_string61:
	.asciz	"kernel_7_7"
.Linfo_string62:
	.asciz	"filter_size"
.Linfo_string63:
	.asciz	"int32_t"
.Linfo_string64:
	.asciz	"nx"
.Linfo_string65:
	.asciz	"ny"
.Linfo_string66:
	.asciz	"allow_hw"
.Linfo_string67:
	.asciz	"pAllowHWAccelerationEnv"
.Linfo_string68:
	.asciz	"src"
.Linfo_string69:
	.asciz	"dst"
.Linfo_string70:
	.asciz	"error"
.Linfo_string71:
	.asciz	"libfile"
.Linfo_string72:
	.asciz	"ifaceptr"
.Linfo_string73:
	.asciz	"long int"
.Linfo_string74:
	.asciz	"int64_t"
.Linfo_string75:
	.asciz	"max_init"
.Linfo_string76:
	.asciz	"errors"
.Linfo_string77:
	.asciz	"max_errors"
.Linfo_string78:
	.asciz	"max_errors_t"
.Linfo_string79:
	.asciz	"maxfile_internal"
.Linfo_string80:
	.asciz	"max_file_internal"
.Linfo_string81:
	.asciz	"max_file_internal_t"
.Linfo_string82:
	.asciz	"max_file"
.Linfo_string83:
	.asciz	"max_file_t"
.Linfo_string84:
	.asciz	"dlhandle"
	.section	.debug_info,"",@progbits
.L.debug_info_begin0:
	.long	1275                    # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x4f4 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end4-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0xb DW_TAG_typedef
	.long	53                      # DW_AT_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	200                     # DW_AT_decl_line
	.byte	3                       # Abbrev [3] 0x35:0x7 DW_TAG_base_type
	.long	.Linfo_string3          # DW_AT_name
	.byte	8                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	4                       # Abbrev [4] 0x3c:0x7d DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	327                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x4f:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	335                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x58:0x7 DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	84
	.long	346                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x5f:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc1            # DW_AT_location
	.long	357                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x68:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc2            # DW_AT_location
	.long	368                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x71:0xf DW_TAG_formal_parameter
	.byte	3                       # DW_AT_location
	.byte	88
	.byte	147
	.byte	4
	.long	.Linfo_string35         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	18                      # DW_AT_decl_line
	.long	457                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x80:0xf DW_TAG_formal_parameter
	.byte	3                       # DW_AT_location
	.byte	89
	.byte	147
	.byte	4
	.long	.Linfo_string36         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
	.long	457                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x8f:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc3            # DW_AT_location
	.long	379                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x98:0x8 DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	24
	.long	390                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0xa0:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	412                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0xa6:0x9 DW_TAG_variable
	.long	.Ldebug_loc4            # DW_AT_location
	.long	423                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0xaf:0x9 DW_TAG_variable
	.long	.Ldebug_loc5            # DW_AT_location
	.long	401                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	4                       # Abbrev [4] 0xb9:0x8e DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	714                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0xcc:0x7 DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	85
	.long	722                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0xd3:0x7 DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	84
	.long	733                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0xda:0x7 DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	81
	.long	744                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0xe1:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc6            # DW_AT_location
	.long	755                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0xea:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc7            # DW_AT_location
	.long	.Linfo_string37         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	41                      # DW_AT_decl_line
	.long	457                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0xf9:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc8            # DW_AT_location
	.long	.Linfo_string38         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	42                      # DW_AT_decl_line
	.long	457                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x108:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	788                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x10e:0x9 DW_TAG_variable
	.long	.Ldebug_loc9            # DW_AT_location
	.long	777                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x117:0x9 DW_TAG_variable
	.long	.Ldebug_loc10           # DW_AT_location
	.long	766                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x120:0x26 DW_TAG_lexical_block
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	9                       # Abbrev [9] 0x125:0x9 DW_TAG_variable
	.long	.Ldebug_loc11           # DW_AT_location
	.long	800                     # DW_AT_abstract_origin
	.byte	12                      # Abbrev [12] 0x12e:0x17 DW_TAG_lexical_block
	.quad	.Ltmp47                 # DW_AT_low_pc
	.long	.Ltmp51-.Ltmp47         # DW_AT_high_pc
	.byte	9                       # Abbrev [9] 0x13b:0x9 DW_TAG_variable
	.long	.Ldebug_loc12           # DW_AT_location
	.long	812                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	13                      # Abbrev [13] 0x147:0x6c DW_TAG_subprogram
	.long	.Linfo_string12         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	14                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	1                       # DW_AT_inline
	.byte	14                      # Abbrev [14] 0x14f:0xb DW_TAG_formal_parameter
	.long	.Linfo_string13         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	14                      # DW_AT_decl_line
	.long	.Lsection_info+1338     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x15a:0xb DW_TAG_formal_parameter
	.long	.Linfo_string14         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x165:0xb DW_TAG_formal_parameter
	.long	.Linfo_string15         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	16                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x170:0xb DW_TAG_formal_parameter
	.long	.Linfo_string17         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	17                      # DW_AT_decl_line
	.long	457                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x17b:0xb DW_TAG_formal_parameter
	.long	.Linfo_string19         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	20                      # DW_AT_decl_line
	.long	457                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x186:0xb DW_TAG_formal_parameter
	.long	.Linfo_string20         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	21                      # DW_AT_decl_line
	.long	457                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x191:0xb DW_TAG_variable
	.long	.Linfo_string21         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	23                      # DW_AT_decl_line
	.long	457                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x19c:0xb DW_TAG_variable
	.long	.Linfo_string22         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.long	462                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x1a7:0xb DW_TAG_variable
	.long	.Linfo_string23         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	25                      # DW_AT_decl_line
	.long	450                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	17                      # Abbrev [17] 0x1b3:0x5 DW_TAG_pointer_type
	.long	42                      # DW_AT_type
	.byte	17                      # Abbrev [17] 0x1b8:0x5 DW_TAG_pointer_type
	.long	445                     # DW_AT_type
	.byte	18                      # Abbrev [18] 0x1bd:0x5 DW_TAG_const_type
	.long	450                     # DW_AT_type
	.byte	3                       # Abbrev [3] 0x1c2:0x7 DW_TAG_base_type
	.long	.Linfo_string16         # DW_AT_name
	.byte	4                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	18                      # Abbrev [18] 0x1c9:0x5 DW_TAG_const_type
	.long	462                     # DW_AT_type
	.byte	3                       # Abbrev [3] 0x1ce:0x7 DW_TAG_base_type
	.long	.Linfo_string18         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	19                      # Abbrev [19] 0x1d5:0xf5 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string27         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	83                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	20                      # Abbrev [20] 0x1ea:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string13         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	84                      # DW_AT_decl_line
	.long	.Lsection_info+1338     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x1f9:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc14           # DW_AT_location
	.long	.Linfo_string14         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	85                      # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x208:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc15           # DW_AT_location
	.long	.Linfo_string15         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	86                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x217:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc16           # DW_AT_location
	.long	.Linfo_string17         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	87                      # DW_AT_decl_line
	.long	457                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x226:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc17           # DW_AT_location
	.long	.Linfo_string39         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	88                      # DW_AT_decl_line
	.long	457                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x235:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc18           # DW_AT_location
	.long	.Linfo_string40         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	89                      # DW_AT_decl_line
	.long	457                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x244:0xf DW_TAG_variable
	.long	.Ldebug_loc20           # DW_AT_location
	.long	.Linfo_string21         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	92                      # DW_AT_decl_line
	.long	457                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x253:0x76 DW_TAG_lexical_block
	.quad	.Ltmp69                 # DW_AT_low_pc
	.long	.Ltmp98-.Ltmp69         # DW_AT_high_pc
	.byte	21                      # Abbrev [21] 0x260:0xf DW_TAG_variable
	.long	.Ldebug_loc19           # DW_AT_location
	.long	.Linfo_string35         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	94                      # DW_AT_decl_line
	.long	462                     # DW_AT_type
	.byte	22                      # Abbrev [22] 0x26f:0x59 DW_TAG_inlined_subroutine
	.long	327                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges1         # DW_AT_ranges
	.byte	3                       # DW_AT_call_file
	.byte	96                      # DW_AT_call_line
	.byte	5                       # Abbrev [5] 0x27a:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc22           # DW_AT_location
	.long	335                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x283:0x8 DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	64
	.long	346                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x28b:0x8 DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	80
	.long	357                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x293:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc23           # DW_AT_location
	.long	368                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x29c:0x9 DW_TAG_formal_parameter
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\274\177"
	.long	379                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x2a5:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc24           # DW_AT_location
	.long	390                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x2ae:0x9 DW_TAG_variable
	.long	.Ldebug_loc21           # DW_AT_location
	.long	401                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x2b7:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	412                     # DW_AT_abstract_origin
	.byte	23                      # Abbrev [23] 0x2bd:0xa DW_TAG_variable
	.byte	4                       # DW_AT_const_value
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.long	423                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	13                      # Abbrev [13] 0x2ca:0x70 DW_TAG_subprogram
	.long	.Linfo_string24         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	37                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	1                       # DW_AT_inline
	.byte	14                      # Abbrev [14] 0x2d2:0xb DW_TAG_formal_parameter
	.long	.Linfo_string13         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	37                      # DW_AT_decl_line
	.long	.Lsection_info+1333     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x2dd:0xb DW_TAG_formal_parameter
	.long	.Linfo_string14         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	38                      # DW_AT_decl_line
	.long	826                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x2e8:0xb DW_TAG_formal_parameter
	.long	.Linfo_string15         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	39                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x2f3:0xb DW_TAG_formal_parameter
	.long	.Linfo_string17         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	40                      # DW_AT_decl_line
	.long	457                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x2fe:0xb DW_TAG_variable
	.long	.Linfo_string21         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	44                      # DW_AT_decl_line
	.long	457                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x309:0xb DW_TAG_variable
	.long	.Linfo_string23         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	46                      # DW_AT_decl_line
	.long	450                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x314:0xb DW_TAG_variable
	.long	.Linfo_string22         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	47                      # DW_AT_decl_line
	.long	462                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x31f:0x1a DW_TAG_lexical_block
	.byte	16                      # Abbrev [16] 0x320:0xb DW_TAG_variable
	.long	.Linfo_string25         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	50                      # DW_AT_decl_line
	.long	462                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x32b:0xd DW_TAG_lexical_block
	.byte	16                      # Abbrev [16] 0x32c:0xb DW_TAG_variable
	.long	.Linfo_string26         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
	.long	462                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	17                      # Abbrev [17] 0x33a:0x5 DW_TAG_pointer_type
	.long	435                     # DW_AT_type
	.byte	19                      # Abbrev [19] 0x33f:0x102 DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string28         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	99                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	20                      # Abbrev [20] 0x354:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc25           # DW_AT_location
	.long	.Linfo_string13         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	100                     # DW_AT_decl_line
	.long	.Lsection_info+1333     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x363:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc26           # DW_AT_location
	.long	.Linfo_string14         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	101                     # DW_AT_decl_line
	.long	826                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x372:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc27           # DW_AT_location
	.long	.Linfo_string15         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	102                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x381:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc28           # DW_AT_location
	.long	.Linfo_string17         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	103                     # DW_AT_decl_line
	.long	457                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x390:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc29           # DW_AT_location
	.long	.Linfo_string39         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	104                     # DW_AT_decl_line
	.long	457                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x39f:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc30           # DW_AT_location
	.long	.Linfo_string40         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	105                     # DW_AT_decl_line
	.long	457                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x3ae:0xf DW_TAG_variable
	.long	.Ldebug_loc32           # DW_AT_location
	.long	.Linfo_string21         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	107                     # DW_AT_decl_line
	.long	457                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x3bd:0x83 DW_TAG_lexical_block
	.quad	.Ltmp113                # DW_AT_low_pc
	.long	.Ltmp149-.Ltmp113       # DW_AT_high_pc
	.byte	21                      # Abbrev [21] 0x3ca:0xf DW_TAG_variable
	.long	.Ldebug_loc31           # DW_AT_location
	.long	.Linfo_string35         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	109                     # DW_AT_decl_line
	.long	462                     # DW_AT_type
	.byte	22                      # Abbrev [22] 0x3d9:0x66 DW_TAG_inlined_subroutine
	.long	714                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges2         # DW_AT_ranges
	.byte	3                       # DW_AT_call_file
	.byte	111                     # DW_AT_call_line
	.byte	5                       # Abbrev [5] 0x3e4:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc37           # DW_AT_location
	.long	722                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x3ed:0x8 DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	72
	.long	733                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x3f5:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc36           # DW_AT_location
	.long	744                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x3fe:0x9 DW_TAG_formal_parameter
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.long	755                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x407:0x9 DW_TAG_variable
	.long	.Ldebug_loc33           # DW_AT_location
	.long	766                     # DW_AT_abstract_origin
	.byte	23                      # Abbrev [23] 0x410:0xa DW_TAG_variable
	.byte	4                       # DW_AT_const_value
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.long	777                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x41a:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	788                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x420:0x1e DW_TAG_lexical_block
	.long	.Ldebug_ranges4         # DW_AT_ranges
	.byte	9                       # Abbrev [9] 0x425:0x9 DW_TAG_variable
	.long	.Ldebug_loc34           # DW_AT_location
	.long	800                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x42e:0xf DW_TAG_lexical_block
	.long	.Ldebug_ranges3         # DW_AT_ranges
	.byte	9                       # Abbrev [9] 0x433:0x9 DW_TAG_variable
	.long	.Ldebug_loc35           # DW_AT_location
	.long	812                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	19                      # Abbrev [19] 0x441:0xbd DW_TAG_subprogram
	.quad	.Lfunc_begin4           # DW_AT_low_pc
	.long	.Lfunc_end4-.Lfunc_begin4 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string29         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	114                     # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	20                      # Abbrev [20] 0x456:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc38           # DW_AT_location
	.long	.Linfo_string13         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	115                     # DW_AT_decl_line
	.long	.Lsection_info+1333     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x465:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc39           # DW_AT_location
	.long	.Linfo_string14         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	116                     # DW_AT_decl_line
	.long	826                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x474:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc40           # DW_AT_location
	.long	.Linfo_string15         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	117                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x483:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc41           # DW_AT_location
	.long	.Linfo_string17         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	118                     # DW_AT_decl_line
	.long	457                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x492:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc42           # DW_AT_location
	.long	.Linfo_string39         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	119                     # DW_AT_decl_line
	.long	457                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x4a1:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc43           # DW_AT_location
	.long	.Linfo_string40         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	120                     # DW_AT_decl_line
	.long	457                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x4b0:0xf DW_TAG_variable
	.long	.Ldebug_loc45           # DW_AT_location
	.long	.Linfo_string21         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	122                     # DW_AT_decl_line
	.long	457                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x4bf:0x3e DW_TAG_lexical_block
	.quad	.Ltmp164                # DW_AT_low_pc
	.long	.Ltmp193-.Ltmp164       # DW_AT_high_pc
	.byte	21                      # Abbrev [21] 0x4cc:0xf DW_TAG_variable
	.long	.Ldebug_loc44           # DW_AT_location
	.long	.Linfo_string38         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	124                     # DW_AT_decl_line
	.long	462                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x4db:0x21 DW_TAG_lexical_block
	.long	.Ldebug_ranges5         # DW_AT_ranges
	.byte	21                      # Abbrev [21] 0x4e0:0xf DW_TAG_variable
	.long	.Ldebug_loc46           # DW_AT_location
	.long	.Linfo_string23         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	126                     # DW_AT_decl_line
	.long	450                     # DW_AT_type
	.byte	25                      # Abbrev [25] 0x4ef:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string22         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	127                     # DW_AT_decl_line
	.long	462                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
.L.debug_info_begin1:
	.long	450                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x1bb DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string5          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
	.quad	.Lfunc_begin5           # DW_AT_low_pc
	.long	.Lfunc_end5-.Lfunc_begin5 # DW_AT_high_pc
	.byte	17                      # Abbrev [17] 0x2a:0x5 DW_TAG_pointer_type
	.long	47                      # DW_AT_type
	.byte	3                       # Abbrev [3] 0x2f:0x7 DW_TAG_base_type
	.long	.Linfo_string6          # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	17                      # Abbrev [17] 0x36:0x5 DW_TAG_pointer_type
	.long	59                      # DW_AT_type
	.byte	17                      # Abbrev [17] 0x3b:0x5 DW_TAG_pointer_type
	.long	64                      # DW_AT_type
	.byte	26                      # Abbrev [26] 0x40:0x5 DW_TAG_const_type
	.long	.Lsection_info+42       # DW_AT_type
	.byte	27                      # Abbrev [27] 0x45:0x13e DW_TAG_subprogram
	.quad	.Lfunc_begin5           # DW_AT_low_pc
	.long	.Lfunc_end5-.Lfunc_begin5 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string30         # DW_AT_name
	.byte	4                       # DW_AT_decl_file
	.byte	25                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	.Lsection_info+462      # DW_AT_type
                                        # DW_AT_external
	.byte	28                      # Abbrev [28] 0x5e:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	104
	.long	.Linfo_string41         # DW_AT_name
	.byte	4                       # DW_AT_decl_file
	.byte	25                      # DW_AT_decl_line
	.long	.Lsection_info+462      # DW_AT_type
	.byte	7                       # Abbrev [7] 0x6c:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	96
	.long	.Linfo_string42         # DW_AT_name
	.byte	4                       # DW_AT_decl_file
	.byte	25                      # DW_AT_decl_line
	.long	387                     # DW_AT_type
	.byte	29                      # Abbrev [29] 0x7a:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	92
	.long	.Linfo_string43         # DW_AT_name
	.byte	4                       # DW_AT_decl_file
	.byte	30                      # DW_AT_decl_line
	.long	.Lsection_info+462      # DW_AT_type
	.byte	29                      # Abbrev [29] 0x88:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	88
	.long	.Linfo_string44         # DW_AT_name
	.byte	4                       # DW_AT_decl_file
	.byte	30                      # DW_AT_decl_line
	.long	.Lsection_info+462      # DW_AT_type
	.byte	29                      # Abbrev [29] 0x96:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	84
	.long	.Linfo_string45         # DW_AT_name
	.byte	4                       # DW_AT_decl_file
	.byte	30                      # DW_AT_decl_line
	.long	.Lsection_info+462      # DW_AT_type
	.byte	29                      # Abbrev [29] 0xa4:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	80
	.long	.Linfo_string46         # DW_AT_name
	.byte	4                       # DW_AT_decl_file
	.byte	32                      # DW_AT_decl_line
	.long	.Lsection_info+462      # DW_AT_type
	.byte	29                      # Abbrev [29] 0xb2:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	76
	.long	.Linfo_string47         # DW_AT_name
	.byte	4                       # DW_AT_decl_file
	.byte	32                      # DW_AT_decl_line
	.long	.Lsection_info+462      # DW_AT_type
	.byte	29                      # Abbrev [29] 0xc0:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	64
	.long	.Linfo_string48         # DW_AT_name
	.byte	4                       # DW_AT_decl_file
	.byte	34                      # DW_AT_decl_line
	.long	.Lsection_info+826      # DW_AT_type
	.byte	29                      # Abbrev [29] 0xce:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.long	.Linfo_string49         # DW_AT_name
	.byte	4                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
	.long	.Lsection_info+826      # DW_AT_type
	.byte	30                      # Abbrev [30] 0xdd:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\264\177"
	.long	.Linfo_string50         # DW_AT_name
	.byte	4                       # DW_AT_decl_file
	.byte	37                      # DW_AT_decl_line
	.long	392                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0xec:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.long	.Linfo_string53         # DW_AT_name
	.byte	4                       # DW_AT_decl_file
	.byte	37                      # DW_AT_decl_line
	.long	392                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0xfb:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\254\177"
	.long	.Linfo_string54         # DW_AT_name
	.byte	4                       # DW_AT_decl_file
	.byte	37                      # DW_AT_decl_line
	.long	392                     # DW_AT_type
	.byte	29                      # Abbrev [29] 0x10a:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\250\177"
	.long	.Linfo_string55         # DW_AT_name
	.byte	4                       # DW_AT_decl_file
	.byte	39                      # DW_AT_decl_line
	.long	.Lsection_info+462      # DW_AT_type
	.byte	30                      # Abbrev [30] 0x119:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\240\177"
	.long	.Linfo_string56         # DW_AT_name
	.byte	4                       # DW_AT_decl_file
	.byte	40                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	30                      # Abbrev [30] 0x128:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\230\177"
	.long	.Linfo_string57         # DW_AT_name
	.byte	4                       # DW_AT_decl_file
	.byte	41                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	29                      # Abbrev [29] 0x137:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\224\177"
	.long	.Linfo_string26         # DW_AT_name
	.byte	4                       # DW_AT_decl_file
	.byte	99                      # DW_AT_decl_line
	.long	.Lsection_info+462      # DW_AT_type
	.byte	29                      # Abbrev [29] 0x146:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\220\177"
	.long	.Linfo_string25         # DW_AT_name
	.byte	4                       # DW_AT_decl_file
	.byte	99                      # DW_AT_decl_line
	.long	.Lsection_info+462      # DW_AT_type
	.byte	30                      # Abbrev [30] 0x155:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\340~"
	.long	.Linfo_string58         # DW_AT_name
	.byte	4                       # DW_AT_decl_file
	.byte	101                     # DW_AT_decl_line
	.long	410                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x164:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\360}"
	.long	.Linfo_string60         # DW_AT_name
	.byte	4                       # DW_AT_decl_file
	.byte	105                     # DW_AT_decl_line
	.long	429                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x173:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\240|"
	.long	.Linfo_string61         # DW_AT_name
	.byte	4                       # DW_AT_decl_file
	.byte	111                     # DW_AT_decl_line
	.long	441                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	17                      # Abbrev [17] 0x183:0x5 DW_TAG_pointer_type
	.long	42                      # DW_AT_type
	.byte	2                       # Abbrev [2] 0x188:0xb DW_TAG_typedef
	.long	403                     # DW_AT_type
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	202                     # DW_AT_decl_line
	.byte	3                       # Abbrev [3] 0x193:0x7 DW_TAG_base_type
	.long	.Linfo_string51         # DW_AT_name
	.byte	7                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	31                      # Abbrev [31] 0x19a:0xc DW_TAG_array_type
	.long	.Lsection_info+450      # DW_AT_type
	.byte	32                      # Abbrev [32] 0x19f:0x6 DW_TAG_subrange_type
	.long	422                     # DW_AT_type
	.byte	9                       # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	33                      # Abbrev [33] 0x1a6:0x7 DW_TAG_base_type
	.long	.Linfo_string59         # DW_AT_name
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # DW_AT_encoding
	.byte	31                      # Abbrev [31] 0x1ad:0xc DW_TAG_array_type
	.long	.Lsection_info+450      # DW_AT_type
	.byte	32                      # Abbrev [32] 0x1b2:0x6 DW_TAG_subrange_type
	.long	422                     # DW_AT_type
	.byte	25                      # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	31                      # Abbrev [31] 0x1b9:0xc DW_TAG_array_type
	.long	.Lsection_info+450      # DW_AT_type
	.byte	32                      # Abbrev [32] 0x1be:0x6 DW_TAG_subrange_type
	.long	422                     # DW_AT_type
	.byte	49                      # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
.L.debug_info_begin2:
	.long	755                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x2ec DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string7          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
	.quad	.Lfunc_begin6           # DW_AT_low_pc
	.long	.Lfunc_end8-.Lfunc_begin6 # DW_AT_high_pc
	.byte	34                      # Abbrev [34] 0x2a:0x15 DW_TAG_variable
	.long	.Linfo_string8          # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	2                       # DW_AT_decl_file
	.byte	17                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	libfilename_3_3
	.byte	17                      # Abbrev [17] 0x3f:0x5 DW_TAG_pointer_type
	.long	68                      # DW_AT_type
	.byte	26                      # Abbrev [26] 0x44:0x5 DW_TAG_const_type
	.long	.Lsection_info+1326     # DW_AT_type
	.byte	34                      # Abbrev [34] 0x49:0x15 DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	2                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	libfilename_5_5
	.byte	34                      # Abbrev [34] 0x5e:0x15 DW_TAG_variable
	.long	.Linfo_string10         # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	2                       # DW_AT_decl_file
	.byte	21                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	libfilename_7_7
	.byte	34                      # Abbrev [34] 0x73:0x15 DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	2                       # DW_AT_decl_file
	.byte	23                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	env_allow_hw
	.byte	35                      # Abbrev [35] 0x88:0x1 DW_TAG_pointer_type
	.byte	36                      # Abbrev [36] 0x89:0x60 DW_TAG_subprogram
	.quad	.Lfunc_begin6           # DW_AT_low_pc
	.long	.Lfunc_end6-.Lfunc_begin6 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string31         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	33                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	577                     # DW_AT_type
                                        # DW_AT_external
	.byte	7                       # Abbrev [7] 0xa2:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	120
	.long	.Linfo_string62         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	33                      # DW_AT_decl_line
	.long	584                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0xb0:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	116
	.long	.Linfo_string64         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	33                      # DW_AT_decl_line
	.long	584                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0xbe:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.long	.Linfo_string65         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	33                      # DW_AT_decl_line
	.long	584                     # DW_AT_type
	.byte	29                      # Abbrev [29] 0xcc:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	111
	.long	.Linfo_string66         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	34                      # DW_AT_decl_line
	.long	.Lsection_info+42       # DW_AT_type
	.byte	29                      # Abbrev [29] 0xda:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	96
	.long	.Linfo_string67         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	.Lsection_info+1321     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	19                      # Abbrev [19] 0xe9:0x6a DW_TAG_subprogram
	.quad	.Lfunc_begin7           # DW_AT_low_pc
	.long	.Lfunc_end7-.Lfunc_begin7 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string33         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	28                      # Abbrev [28] 0xfe:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	120
	.long	.Linfo_string68         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
	.long	.Lsection_info+435      # DW_AT_type
	.byte	28                      # Abbrev [28] 0x10c:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.long	.Linfo_string69         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
	.long	.Lsection_info+435      # DW_AT_type
	.byte	7                       # Abbrev [7] 0x11a:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	104
	.long	.Linfo_string15         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
	.long	595                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x128:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	100
	.long	.Linfo_string62         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
	.long	584                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x136:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	96
	.long	.Linfo_string64         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
	.long	584                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x144:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	92
	.long	.Linfo_string65         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	52                      # DW_AT_decl_line
	.long	584                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	19                      # Abbrev [19] 0x153:0xee DW_TAG_subprogram
	.quad	.Lfunc_begin8           # DW_AT_low_pc
	.long	.Lfunc_end8-.Lfunc_begin8 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string34         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	58                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	28                      # Abbrev [28] 0x168:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	120
	.long	.Linfo_string68         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	58                      # DW_AT_decl_line
	.long	.Lsection_info+826      # DW_AT_type
	.byte	28                      # Abbrev [28] 0x176:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.long	.Linfo_string69         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	58                      # DW_AT_decl_line
	.long	.Lsection_info+826      # DW_AT_type
	.byte	7                       # Abbrev [7] 0x184:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	104
	.long	.Linfo_string15         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	58                      # DW_AT_decl_line
	.long	595                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x192:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	100
	.long	.Linfo_string62         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	58                      # DW_AT_decl_line
	.long	584                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x1a0:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	96
	.long	.Linfo_string64         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	58                      # DW_AT_decl_line
	.long	584                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x1ae:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	92
	.long	.Linfo_string65         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	584                     # DW_AT_type
	.byte	29                      # Abbrev [29] 0x1bc:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	80
	.long	.Linfo_string70         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	60                      # DW_AT_decl_line
	.long	.Lsection_info+1321     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x1ca:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	72
	.long	.Linfo_string71         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	66                      # DW_AT_decl_line
	.long	63                      # DW_AT_type
	.byte	29                      # Abbrev [29] 0x1d8:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	64
	.long	.Linfo_string13         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	79                      # DW_AT_decl_line
	.long	.Lsection_info+435      # DW_AT_type
	.byte	29                      # Abbrev [29] 0x1e6:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.long	.Linfo_string14         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	80                      # DW_AT_decl_line
	.long	.Lsection_info+435      # DW_AT_type
	.byte	29                      # Abbrev [29] 0x1f5:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\264\177"
	.long	.Linfo_string26         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	82                      # DW_AT_decl_line
	.long	.Lsection_info+462      # DW_AT_type
	.byte	29                      # Abbrev [29] 0x204:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.long	.Linfo_string25         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	82                      # DW_AT_decl_line
	.long	.Lsection_info+462      # DW_AT_type
	.byte	30                      # Abbrev [30] 0x213:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\250\177"
	.long	.Linfo_string72         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	86                      # DW_AT_decl_line
	.long	600                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x222:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\240\177"
	.long	.Linfo_string75         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	89                      # DW_AT_decl_line
	.long	655                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x231:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\230\177"
	.long	.Linfo_string84         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	91                      # DW_AT_decl_line
	.long	136                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	3                       # Abbrev [3] 0x241:0x7 DW_TAG_base_type
	.long	.Linfo_string32         # DW_AT_name
	.byte	2                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	37                      # Abbrev [37] 0x248:0xb DW_TAG_typedef
	.long	.Lsection_info+462      # DW_AT_type
	.long	.Linfo_string63         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	196                     # DW_AT_decl_line
	.byte	38                      # Abbrev [38] 0x253:0x5 DW_TAG_pointer_type
	.long	.Lsection_info+450      # DW_AT_type
	.byte	17                      # Abbrev [17] 0x258:0x5 DW_TAG_pointer_type
	.long	605                     # DW_AT_type
	.byte	39                      # Abbrev [39] 0x25d:0x20 DW_TAG_subroutine_type
                                        # DW_AT_prototyped
	.byte	40                      # Abbrev [40] 0x25e:0x5 DW_TAG_formal_parameter
	.long	637                     # DW_AT_type
	.byte	40                      # Abbrev [40] 0x263:0x5 DW_TAG_formal_parameter
	.long	584                     # DW_AT_type
	.byte	40                      # Abbrev [40] 0x268:0x5 DW_TAG_formal_parameter
	.long	584                     # DW_AT_type
	.byte	41                      # Abbrev [41] 0x26d:0x5 DW_TAG_formal_parameter
	.long	.Lsection_info+440      # DW_AT_type
	.byte	41                      # Abbrev [41] 0x272:0x5 DW_TAG_formal_parameter
	.long	.Lsection_info+1338     # DW_AT_type
	.byte	41                      # Abbrev [41] 0x277:0x5 DW_TAG_formal_parameter
	.long	.Lsection_info+435      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	2                       # Abbrev [2] 0x27d:0xb DW_TAG_typedef
	.long	648                     # DW_AT_type
	.long	.Linfo_string74         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	197                     # DW_AT_decl_line
	.byte	3                       # Abbrev [3] 0x288:0x7 DW_TAG_base_type
	.long	.Linfo_string73         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	17                      # Abbrev [17] 0x28f:0x5 DW_TAG_pointer_type
	.long	660                     # DW_AT_type
	.byte	42                      # Abbrev [42] 0x294:0x7 DW_TAG_subroutine_type
	.long	667                     # DW_AT_type
	.byte	43                      # Abbrev [43] 0x299:0x1 DW_TAG_unspecified_parameters
	.byte	0                       # End Of Children Mark
	.byte	17                      # Abbrev [17] 0x29b:0x5 DW_TAG_pointer_type
	.long	672                     # DW_AT_type
	.byte	2                       # Abbrev [2] 0x2a0:0xb DW_TAG_typedef
	.long	683                     # DW_AT_type
	.long	.Linfo_string83         # DW_AT_name
	.byte	5                       # DW_AT_decl_file
	.byte	176                     # DW_AT_decl_line
	.byte	44                      # Abbrev [44] 0x2ab:0x21 DW_TAG_structure_type
	.long	.Linfo_string82         # DW_AT_name
	.byte	16                      # DW_AT_byte_size
	.byte	5                       # DW_AT_decl_file
	.byte	173                     # DW_AT_decl_line
	.byte	45                      # Abbrev [45] 0x2b3:0xc DW_TAG_member
	.long	.Linfo_string76         # DW_AT_name
	.long	716                     # DW_AT_type
	.byte	5                       # DW_AT_decl_file
	.byte	174                     # DW_AT_decl_line
	.byte	0                       # DW_AT_data_member_location
	.byte	45                      # Abbrev [45] 0x2bf:0xc DW_TAG_member
	.long	.Linfo_string79         # DW_AT_name
	.long	737                     # DW_AT_type
	.byte	5                       # DW_AT_decl_file
	.byte	175                     # DW_AT_decl_line
	.byte	8                       # DW_AT_data_member_location
	.byte	0                       # End Of Children Mark
	.byte	17                      # Abbrev [17] 0x2cc:0x5 DW_TAG_pointer_type
	.long	721                     # DW_AT_type
	.byte	2                       # Abbrev [2] 0x2d1:0xb DW_TAG_typedef
	.long	732                     # DW_AT_type
	.long	.Linfo_string78         # DW_AT_name
	.byte	5                       # DW_AT_decl_file
	.byte	94                      # DW_AT_decl_line
	.byte	46                      # Abbrev [46] 0x2dc:0x5 DW_TAG_structure_type
	.long	.Linfo_string77         # DW_AT_name
                                        # DW_AT_declaration
	.byte	17                      # Abbrev [17] 0x2e1:0x5 DW_TAG_pointer_type
	.long	742                     # DW_AT_type
	.byte	2                       # Abbrev [2] 0x2e6:0xb DW_TAG_typedef
	.long	753                     # DW_AT_type
	.long	.Linfo_string81         # DW_AT_name
	.byte	5                       # DW_AT_decl_file
	.byte	97                      # DW_AT_decl_line
	.byte	46                      # Abbrev [46] 0x2f1:0x5 DW_TAG_structure_type
	.long	.Linfo_string80         # DW_AT_name
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
	.byte	3                       # Abbreviation Code
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
	.byte	4                       # Abbreviation Code
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
	.byte	5                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	6                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	7                       # Abbreviation Code
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
	.byte	8                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	9                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	10                      # Abbreviation Code
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
	.byte	11                      # Abbreviation Code
	.byte	11                      # DW_TAG_lexical_block
	.byte	1                       # DW_CHILDREN_yes
	.byte	85                      # DW_AT_ranges
	.byte	23                      # DW_FORM_sec_offset
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	12                      # Abbreviation Code
	.byte	11                      # DW_TAG_lexical_block
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	13                      # Abbreviation Code
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
	.byte	14                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
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
	.byte	15                      # Abbreviation Code
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
	.byte	16                      # Abbreviation Code
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
	.byte	17                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	18                      # Abbreviation Code
	.byte	38                      # DW_TAG_const_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	19                      # Abbreviation Code
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
	.byte	20                      # Abbreviation Code
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
	.byte	21                      # Abbreviation Code
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
	.byte	22                      # Abbreviation Code
	.byte	29                      # DW_TAG_inlined_subroutine
	.byte	1                       # DW_CHILDREN_yes
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	85                      # DW_AT_ranges
	.byte	23                      # DW_FORM_sec_offset
	.byte	88                      # DW_AT_call_file
	.byte	11                      # DW_FORM_data1
	.byte	89                      # DW_AT_call_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	23                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	10                      # DW_FORM_block1
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	24                      # Abbreviation Code
	.byte	11                      # DW_TAG_lexical_block
	.byte	1                       # DW_CHILDREN_yes
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	25                      # Abbreviation Code
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
	.byte	26                      # Abbreviation Code
	.byte	38                      # DW_TAG_const_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	16                      # DW_FORM_ref_addr
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	27                      # Abbreviation Code
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
	.byte	16                      # DW_FORM_ref_addr
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	28                      # Abbreviation Code
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
	.byte	29                      # Abbreviation Code
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
	.byte	30                      # Abbreviation Code
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
	.byte	31                      # Abbreviation Code
	.byte	1                       # DW_TAG_array_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	73                      # DW_AT_type
	.byte	16                      # DW_FORM_ref_addr
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	32                      # Abbreviation Code
	.byte	33                      # DW_TAG_subrange_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	55                      # DW_AT_count
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	33                      # Abbreviation Code
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
	.byte	34                      # Abbreviation Code
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
	.byte	35                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	36                      # Abbreviation Code
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
	.byte	37                      # Abbreviation Code
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
	.byte	38                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	16                      # DW_FORM_ref_addr
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	39                      # Abbreviation Code
	.byte	21                      # DW_TAG_subroutine_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	40                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	41                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	16                      # DW_FORM_ref_addr
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	42                      # Abbreviation Code
	.byte	21                      # DW_TAG_subroutine_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	43                      # Abbreviation Code
	.byte	24                      # DW_TAG_unspecified_parameters
	.byte	0                       # DW_CHILDREN_no
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	44                      # Abbreviation Code
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
	.byte	45                      # Abbreviation Code
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
	.byte	46                      # Abbreviation Code
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
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	0
	.quad	0
.Ldebug_ranges1:
	.quad	.Ltmp81-.Lfunc_begin0
	.quad	.Ltmp83-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.quad	0
	.quad	0
.Ldebug_ranges2:
	.quad	.Ltmp124-.Lfunc_begin0
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp127-.Lfunc_begin0
	.quad	.Ltmp128-.Lfunc_begin0
	.quad	.Ltmp136-.Lfunc_begin0
	.quad	.Ltmp137-.Lfunc_begin0
	.quad	.Ltmp138-.Lfunc_begin0
	.quad	.Ltmp145-.Lfunc_begin0
	.quad	0
	.quad	0
.Ldebug_ranges3:
	.quad	.Ltmp124-.Lfunc_begin0
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp127-.Lfunc_begin0
	.quad	.Ltmp128-.Lfunc_begin0
	.quad	.Ltmp136-.Lfunc_begin0
	.quad	.Ltmp137-.Lfunc_begin0
	.quad	.Ltmp138-.Lfunc_begin0
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	0
	.quad	0
.Ldebug_ranges4:
	.quad	.Ltmp124-.Lfunc_begin0
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp127-.Lfunc_begin0
	.quad	.Ltmp128-.Lfunc_begin0
	.quad	.Ltmp136-.Lfunc_begin0
	.quad	.Ltmp137-.Lfunc_begin0
	.quad	.Ltmp138-.Lfunc_begin0
	.quad	.Ltmp143-.Lfunc_begin0
	.quad	0
	.quad	0
.Ldebug_ranges5:
	.quad	.Ltmp176-.Lfunc_begin0
	.quad	.Ltmp177-.Lfunc_begin0
	.quad	.Ltmp182-.Lfunc_begin0
	.quad	.Ltmp189-.Lfunc_begin0
	.quad	0
	.quad	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp11-.Lfunc_begin0
	.short	.Ltmp349-.Ltmp348       # Loc expr size
.Ltmp348:
	.byte	85                      # DW_OP_reg5
.Ltmp349:
	.quad	.Ltmp12-.Lfunc_begin0
	.quad	.Ltmp18-.Lfunc_begin0
	.short	.Ltmp351-.Ltmp350       # Loc expr size
.Ltmp350:
	.byte	85                      # DW_OP_reg5
.Ltmp351:
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp11-.Lfunc_begin0
	.short	.Ltmp353-.Ltmp352       # Loc expr size
.Ltmp352:
	.byte	81                      # DW_OP_reg1
.Ltmp353:
	.quad	.Ltmp12-.Lfunc_begin0
	.quad	.Ltmp17-.Lfunc_begin0
	.short	.Ltmp355-.Ltmp354       # Loc expr size
.Ltmp354:
	.byte	81                      # DW_OP_reg1
.Ltmp355:
	.quad	0
	.quad	0
.Ldebug_loc2:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp11-.Lfunc_begin0
	.short	.Ltmp357-.Ltmp356       # Loc expr size
.Ltmp356:
	.byte	82                      # super-register DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp357:
	.quad	.Ltmp12-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	.Ltmp359-.Ltmp358       # Loc expr size
.Ltmp358:
	.byte	82                      # super-register DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp359:
	.quad	0
	.quad	0
.Ldebug_loc3:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp16-.Lfunc_begin0
	.short	.Ltmp361-.Ltmp360       # Loc expr size
.Ltmp360:
	.byte	90                      # super-register DW_OP_reg10
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp361:
	.quad	.Ltmp25-.Lfunc_begin0
	.quad	.Ltmp26-.Lfunc_begin0
	.short	.Ltmp363-.Ltmp362       # Loc expr size
.Ltmp362:
	.byte	90                      # super-register DW_OP_reg10
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp363:
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Ltmp9-.Lfunc_begin0
	.quad	.Ltmp20-.Lfunc_begin0
	.short	.Ltmp365-.Ltmp364       # Loc expr size
.Ltmp364:
.Ltmp365:
	.quad	.Ltmp20-.Lfunc_begin0
	.quad	.Ltmp25-.Lfunc_begin0
	.short	.Ltmp367-.Ltmp366       # Loc expr size
.Ltmp366:
	.byte	97                      # DW_OP_reg17
.Ltmp367:
	.quad	.Ltmp25-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	.Ltmp369-.Ltmp368       # Loc expr size
.Ltmp368:
.Ltmp369:
	.quad	0
	.quad	0
.Ldebug_loc5:
	.quad	.Ltmp9-.Lfunc_begin0
	.quad	.Ltmp11-.Lfunc_begin0
	.short	.Ltmp371-.Ltmp370       # Loc expr size
.Ltmp370:
	.byte	80                      # super-register DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp371:
	.quad	.Ltmp12-.Lfunc_begin0
	.quad	.Ltmp13-.Lfunc_begin0
	.short	.Ltmp373-.Ltmp372       # Loc expr size
.Ltmp372:
	.byte	80                      # super-register DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp373:
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
	.short	.Ltmp375-.Ltmp374       # Loc expr size
.Ltmp374:
	.byte	82                      # super-register DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp375:
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp41-.Lfunc_begin0
	.short	.Ltmp377-.Ltmp376       # Loc expr size
.Ltmp376:
	.byte	88                      # super-register DW_OP_reg8
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp377:
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.short	.Ltmp379-.Ltmp378       # Loc expr size
.Ltmp378:
	.byte	89                      # super-register DW_OP_reg9
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp379:
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Ltmp49-.Lfunc_begin0
	.short	.Ltmp381-.Ltmp380       # Loc expr size
.Ltmp380:
.Ltmp381:
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp54-.Lfunc_begin0
	.short	.Ltmp383-.Ltmp382       # Loc expr size
.Ltmp382:
	.byte	97                      # DW_OP_reg17
.Ltmp383:
	.quad	.Ltmp54-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	.Ltmp385-.Ltmp384       # Loc expr size
.Ltmp384:
.Ltmp385:
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	.Ltmp387-.Ltmp386       # Loc expr size
.Ltmp386:
	.byte	80                      # super-register DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp387:
	.quad	.Ltmp44-.Lfunc_begin0
	.quad	.Ltmp46-.Lfunc_begin0
	.short	.Ltmp389-.Ltmp388       # Loc expr size
.Ltmp388:
	.byte	80                      # super-register DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp389:
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	.Ltmp391-.Ltmp390       # Loc expr size
.Ltmp390:
	.byte	82                      # super-register DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp391:
	.quad	.Ltmp44-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.short	.Ltmp393-.Ltmp392       # Loc expr size
.Ltmp392:
	.byte	82                      # super-register DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp393:
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	.Ltmp395-.Ltmp394       # Loc expr size
.Ltmp394:
	.byte	82                      # super-register DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp395:
	.quad	.Ltmp44-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.short	.Ltmp397-.Ltmp396       # Loc expr size
.Ltmp396:
	.byte	82                      # super-register DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp397:
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.short	.Ltmp399-.Ltmp398       # Loc expr size
.Ltmp398:
	.byte	85                      # DW_OP_reg5
.Ltmp399:
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Ltmp76-.Lfunc_begin0
	.short	.Ltmp401-.Ltmp400       # Loc expr size
.Ltmp400:
	.byte	83                      # DW_OP_reg3
.Ltmp401:
	.quad	.Ltmp79-.Lfunc_begin0
	.quad	.Ltmp84-.Lfunc_begin0
	.short	.Ltmp403-.Ltmp402       # Loc expr size
.Ltmp402:
	.byte	83                      # DW_OP_reg3
.Ltmp403:
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp67-.Lfunc_begin0
	.short	.Ltmp405-.Ltmp404       # Loc expr size
.Ltmp404:
	.byte	84                      # DW_OP_reg4
.Ltmp405:
	.quad	.Ltmp67-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	.Ltmp407-.Ltmp406       # Loc expr size
.Ltmp406:
	.byte	118                     # DW_OP_breg6
	.byte	64                      # -64
.Ltmp407:
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	.Ltmp409-.Ltmp408       # Loc expr size
.Ltmp408:
	.byte	81                      # DW_OP_reg1
.Ltmp409:
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	.Ltmp411-.Ltmp410       # Loc expr size
.Ltmp410:
	.byte	118                     # DW_OP_breg6
	.byte	80                      # -48
.Ltmp411:
	.quad	0
	.quad	0
.Ldebug_loc16:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp66-.Lfunc_begin0
	.short	.Ltmp413-.Ltmp412       # Loc expr size
.Ltmp412:
	.byte	82                      # super-register DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp413:
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp78-.Lfunc_begin0
	.short	.Ltmp415-.Ltmp414       # Loc expr size
.Ltmp414:
	.byte	94                      # super-register DW_OP_reg14
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp415:
	.quad	.Ltmp79-.Lfunc_begin0
	.quad	.Ltmp85-.Lfunc_begin0
	.short	.Ltmp417-.Ltmp416       # Loc expr size
.Ltmp416:
	.byte	94                      # super-register DW_OP_reg14
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp417:
	.quad	0
	.quad	0
.Ldebug_loc17:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	.Ltmp419-.Ltmp418       # Loc expr size
.Ltmp418:
	.byte	88                      # super-register DW_OP_reg8
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp419:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	.Ltmp421-.Ltmp420       # Loc expr size
.Ltmp420:
	.byte	118                     # DW_OP_breg6
	.ascii	"\274\177"              # -68
.Ltmp421:
	.quad	0
	.quad	0
.Ldebug_loc18:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.short	.Ltmp423-.Ltmp422       # Loc expr size
.Ltmp422:
	.byte	89                      # super-register DW_OP_reg9
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp423:
	.quad	.Ltmp65-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	.Ltmp425-.Ltmp424       # Loc expr size
.Ltmp424:
	.byte	93                      # super-register DW_OP_reg13
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp425:
	.quad	.Ltmp79-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.short	.Ltmp427-.Ltmp426       # Loc expr size
.Ltmp426:
	.byte	93                      # super-register DW_OP_reg13
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp427:
	.quad	0
	.quad	0
.Ldebug_loc19:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
	.short	.Ltmp429-.Ltmp428       # Loc expr size
.Ltmp428:
	.byte	80                      # super-register DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp429:
	.quad	.Ltmp71-.Lfunc_begin0
	.quad	.Ltmp72-.Lfunc_begin0
	.short	.Ltmp431-.Ltmp430       # Loc expr size
.Ltmp430:
	.byte	92                      # super-register DW_OP_reg12
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp431:
	.quad	0
	.quad	0
.Ldebug_loc20:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
	.short	.Ltmp433-.Ltmp432       # Loc expr size
.Ltmp432:
	.byte	80                      # super-register DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp433:
	.quad	.Ltmp71-.Lfunc_begin0
	.quad	.Ltmp75-.Lfunc_begin0
	.short	.Ltmp435-.Ltmp434       # Loc expr size
.Ltmp434:
	.byte	92                      # super-register DW_OP_reg12
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp435:
	.quad	.Ltmp79-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	.Ltmp437-.Ltmp436       # Loc expr size
.Ltmp436:
	.byte	92                      # super-register DW_OP_reg12
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp437:
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	.Ltmp439-.Ltmp438       # Loc expr size
.Ltmp438:
	.byte	118                     # DW_OP_breg6
	.byte	76                      # -52
.Ltmp439:
	.quad	0
	.quad	0
.Ldebug_loc21:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
	.short	.Ltmp441-.Ltmp440       # Loc expr size
.Ltmp440:
	.byte	80                      # super-register DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp441:
	.quad	.Ltmp71-.Lfunc_begin0
	.quad	.Ltmp72-.Lfunc_begin0
	.short	.Ltmp443-.Ltmp442       # Loc expr size
.Ltmp442:
	.byte	92                      # super-register DW_OP_reg12
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp443:
	.quad	0
	.quad	0
.Ldebug_loc22:
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Ltmp76-.Lfunc_begin0
	.short	.Ltmp445-.Ltmp444       # Loc expr size
.Ltmp444:
	.byte	83                      # DW_OP_reg3
.Ltmp445:
	.quad	0
	.quad	0
.Ldebug_loc23:
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Ltmp78-.Lfunc_begin0
	.short	.Ltmp447-.Ltmp446       # Loc expr size
.Ltmp446:
	.byte	94                      # super-register DW_OP_reg14
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp447:
	.quad	0
	.quad	0
.Ldebug_loc24:
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	.Ltmp449-.Ltmp448       # Loc expr size
.Ltmp448:
	.byte	93                      # super-register DW_OP_reg13
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp449:
	.quad	0
	.quad	0
.Ldebug_loc25:
	.quad	.Lfunc_begin3-.Lfunc_begin0
	.quad	.Ltmp112-.Lfunc_begin0
	.short	.Ltmp451-.Ltmp450       # Loc expr size
.Ltmp450:
	.byte	85                      # DW_OP_reg5
.Ltmp451:
	.quad	.Ltmp112-.Lfunc_begin0
	.quad	.Ltmp120-.Lfunc_begin0
	.short	.Ltmp453-.Ltmp452       # Loc expr size
.Ltmp452:
	.byte	83                      # DW_OP_reg3
.Ltmp453:
	.quad	.Ltmp123-.Lfunc_begin0
	.quad	.Ltmp149-.Lfunc_begin0
	.short	.Ltmp455-.Ltmp454       # Loc expr size
.Ltmp454:
	.byte	83                      # DW_OP_reg3
.Ltmp455:
	.quad	0
	.quad	0
.Ldebug_loc26:
	.quad	.Lfunc_begin3-.Lfunc_begin0
	.quad	.Ltmp111-.Lfunc_begin0
	.short	.Ltmp457-.Ltmp456       # Loc expr size
.Ltmp456:
	.byte	84                      # DW_OP_reg4
.Ltmp457:
	.quad	.Ltmp111-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	.Ltmp459-.Ltmp458       # Loc expr size
.Ltmp458:
	.byte	118                     # DW_OP_breg6
	.byte	72                      # -56
.Ltmp459:
	.quad	0
	.quad	0
.Ldebug_loc27:
	.quad	.Lfunc_begin3-.Lfunc_begin0
	.quad	.Ltmp110-.Lfunc_begin0
	.short	.Ltmp461-.Ltmp460       # Loc expr size
.Ltmp460:
	.byte	81                      # DW_OP_reg1
.Ltmp461:
	.quad	.Ltmp110-.Lfunc_begin0
	.quad	.Ltmp121-.Lfunc_begin0
	.short	.Ltmp463-.Ltmp462       # Loc expr size
.Ltmp462:
	.byte	92                      # DW_OP_reg12
.Ltmp463:
	.quad	.Ltmp123-.Lfunc_begin0
	.quad	.Ltmp149-.Lfunc_begin0
	.short	.Ltmp465-.Ltmp464       # Loc expr size
.Ltmp464:
	.byte	92                      # DW_OP_reg12
.Ltmp465:
	.quad	0
	.quad	0
.Ldebug_loc28:
	.quad	.Lfunc_begin3-.Lfunc_begin0
	.quad	.Ltmp117-.Lfunc_begin0
	.short	.Ltmp467-.Ltmp466       # Loc expr size
.Ltmp466:
	.byte	82                      # super-register DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp467:
	.quad	.Ltmp117-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	.Ltmp469-.Ltmp468       # Loc expr size
.Ltmp468:
	.byte	118                     # DW_OP_breg6
	.ascii	"\270\177"              # -72
.Ltmp469:
	.quad	0
	.quad	0
.Ldebug_loc29:
	.quad	.Lfunc_begin3-.Lfunc_begin0
	.quad	.Ltmp118-.Lfunc_begin0
	.short	.Ltmp471-.Ltmp470       # Loc expr size
.Ltmp470:
	.byte	88                      # super-register DW_OP_reg8
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp471:
	.quad	.Ltmp118-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	.Ltmp473-.Ltmp472       # Loc expr size
.Ltmp472:
	.byte	118                     # DW_OP_breg6
	.byte	64                      # -64
.Ltmp473:
	.quad	0
	.quad	0
.Ldebug_loc30:
	.quad	.Lfunc_begin3-.Lfunc_begin0
	.quad	.Ltmp109-.Lfunc_begin0
	.short	.Ltmp475-.Ltmp474       # Loc expr size
.Ltmp474:
	.byte	89                      # super-register DW_OP_reg9
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp475:
	.quad	.Ltmp109-.Lfunc_begin0
	.quad	.Ltmp122-.Lfunc_begin0
	.short	.Ltmp477-.Ltmp476       # Loc expr size
.Ltmp476:
	.byte	95                      # super-register DW_OP_reg15
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp477:
	.quad	.Ltmp123-.Lfunc_begin0
	.quad	.Ltmp129-.Lfunc_begin0
	.short	.Ltmp479-.Ltmp478       # Loc expr size
.Ltmp478:
	.byte	95                      # super-register DW_OP_reg15
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp479:
	.quad	0
	.quad	0
.Ldebug_loc31:
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp115-.Lfunc_begin0
	.short	.Ltmp481-.Ltmp480       # Loc expr size
.Ltmp480:
	.byte	80                      # super-register DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp481:
	.quad	.Ltmp115-.Lfunc_begin0
	.quad	.Ltmp116-.Lfunc_begin0
	.short	.Ltmp483-.Ltmp482       # Loc expr size
.Ltmp482:
	.byte	93                      # super-register DW_OP_reg13
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp483:
	.quad	0
	.quad	0
.Ldebug_loc32:
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp115-.Lfunc_begin0
	.short	.Ltmp485-.Ltmp484       # Loc expr size
.Ltmp484:
	.byte	80                      # super-register DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp485:
	.quad	.Ltmp115-.Lfunc_begin0
	.quad	.Ltmp119-.Lfunc_begin0
	.short	.Ltmp487-.Ltmp486       # Loc expr size
.Ltmp486:
	.byte	93                      # super-register DW_OP_reg13
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp487:
	.quad	.Ltmp123-.Lfunc_begin0
	.quad	.Ltmp129-.Lfunc_begin0
	.short	.Ltmp489-.Ltmp488       # Loc expr size
.Ltmp488:
	.byte	93                      # super-register DW_OP_reg13
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp489:
	.quad	.Ltmp129-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	.Ltmp491-.Ltmp490       # Loc expr size
.Ltmp490:
	.byte	118                     # DW_OP_breg6
	.byte	84                      # -44
.Ltmp491:
	.quad	0
	.quad	0
.Ldebug_loc33:
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp115-.Lfunc_begin0
	.short	.Ltmp493-.Ltmp492       # Loc expr size
.Ltmp492:
	.byte	80                      # super-register DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp493:
	.quad	.Ltmp115-.Lfunc_begin0
	.quad	.Ltmp116-.Lfunc_begin0
	.short	.Ltmp495-.Ltmp494       # Loc expr size
.Ltmp494:
	.byte	93                      # super-register DW_OP_reg13
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp495:
	.quad	0
	.quad	0
.Ldebug_loc34:
	.quad	.Ltmp126-.Lfunc_begin0
	.quad	.Ltmp127-.Lfunc_begin0
	.short	.Ltmp497-.Ltmp496       # Loc expr size
.Ltmp496:
	.byte	80                      # super-register DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp497:
	.quad	0
	.quad	0
.Ldebug_loc35:
	.quad	.Ltmp126-.Lfunc_begin0
	.quad	.Ltmp127-.Lfunc_begin0
	.short	.Ltmp499-.Ltmp498       # Loc expr size
.Ltmp498:
	.byte	80                      # super-register DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp499:
	.quad	0
	.quad	0
.Ldebug_loc36:
	.quad	.Ltmp135-.Lfunc_begin0
	.quad	.Ltmp143-.Lfunc_begin0
	.short	.Ltmp501-.Ltmp500       # Loc expr size
.Ltmp500:
	.byte	92                      # DW_OP_reg12
.Ltmp501:
	.quad	0
	.quad	0
.Ldebug_loc37:
	.quad	.Ltmp136-.Lfunc_begin0
	.quad	.Ltmp143-.Lfunc_begin0
	.short	.Ltmp503-.Ltmp502       # Loc expr size
.Ltmp502:
	.byte	83                      # DW_OP_reg3
.Ltmp503:
	.quad	0
	.quad	0
.Ldebug_loc38:
	.quad	.Lfunc_begin4-.Lfunc_begin0
	.quad	.Ltmp163-.Lfunc_begin0
	.short	.Ltmp505-.Ltmp504       # Loc expr size
.Ltmp504:
	.byte	85                      # DW_OP_reg5
.Ltmp505:
	.quad	.Ltmp163-.Lfunc_begin0
	.quad	.Ltmp173-.Lfunc_begin0
	.short	.Ltmp507-.Ltmp506       # Loc expr size
.Ltmp506:
	.byte	94                      # DW_OP_reg14
.Ltmp507:
	.quad	.Ltmp174-.Lfunc_begin0
	.quad	.Ltmp193-.Lfunc_begin0
	.short	.Ltmp509-.Ltmp508       # Loc expr size
.Ltmp508:
	.byte	94                      # DW_OP_reg14
.Ltmp509:
	.quad	0
	.quad	0
.Ldebug_loc39:
	.quad	.Lfunc_begin4-.Lfunc_begin0
	.quad	.Ltmp162-.Lfunc_begin0
	.short	.Ltmp511-.Ltmp510       # Loc expr size
.Ltmp510:
	.byte	84                      # DW_OP_reg4
.Ltmp511:
	.quad	.Ltmp162-.Lfunc_begin0
	.quad	.Lfunc_end4-.Lfunc_begin0
	.short	.Ltmp513-.Ltmp512       # Loc expr size
.Ltmp512:
	.byte	118                     # DW_OP_breg6
	.byte	72                      # -56
.Ltmp513:
	.quad	0
	.quad	0
.Ldebug_loc40:
	.quad	.Lfunc_begin4-.Lfunc_begin0
	.quad	.Ltmp161-.Lfunc_begin0
	.short	.Ltmp515-.Ltmp514       # Loc expr size
.Ltmp514:
	.byte	81                      # DW_OP_reg1
.Ltmp515:
	.quad	.Ltmp161-.Lfunc_begin0
	.quad	.Ltmp172-.Lfunc_begin0
	.short	.Ltmp517-.Ltmp516       # Loc expr size
.Ltmp516:
	.byte	92                      # DW_OP_reg12
.Ltmp517:
	.quad	.Ltmp174-.Lfunc_begin0
	.quad	.Ltmp193-.Lfunc_begin0
	.short	.Ltmp519-.Ltmp518       # Loc expr size
.Ltmp518:
	.byte	92                      # DW_OP_reg12
.Ltmp519:
	.quad	0
	.quad	0
.Ldebug_loc41:
	.quad	.Lfunc_begin4-.Lfunc_begin0
	.quad	.Ltmp168-.Lfunc_begin0
	.short	.Ltmp521-.Ltmp520       # Loc expr size
.Ltmp520:
	.byte	82                      # super-register DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp521:
	.quad	.Ltmp168-.Lfunc_begin0
	.quad	.Lfunc_end4-.Lfunc_begin0
	.short	.Ltmp523-.Ltmp522       # Loc expr size
.Ltmp522:
	.byte	118                     # DW_OP_breg6
	.ascii	"\274\177"              # -68
.Ltmp523:
	.quad	0
	.quad	0
.Ldebug_loc42:
	.quad	.Lfunc_begin4-.Lfunc_begin0
	.quad	.Ltmp169-.Lfunc_begin0
	.short	.Ltmp525-.Ltmp524       # Loc expr size
.Ltmp524:
	.byte	88                      # super-register DW_OP_reg8
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp525:
	.quad	.Ltmp169-.Lfunc_begin0
	.quad	.Lfunc_end4-.Lfunc_begin0
	.short	.Ltmp527-.Ltmp526       # Loc expr size
.Ltmp526:
	.byte	118                     # DW_OP_breg6
	.byte	64                      # -64
.Ltmp527:
	.quad	0
	.quad	0
.Ldebug_loc43:
	.quad	.Lfunc_begin4-.Lfunc_begin0
	.quad	.Ltmp160-.Lfunc_begin0
	.short	.Ltmp529-.Ltmp528       # Loc expr size
.Ltmp528:
	.byte	89                      # super-register DW_OP_reg9
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp529:
	.quad	.Ltmp160-.Lfunc_begin0
	.quad	.Ltmp171-.Lfunc_begin0
	.short	.Ltmp531-.Ltmp530       # Loc expr size
.Ltmp530:
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp531:
	.quad	.Ltmp174-.Lfunc_begin0
	.quad	.Ltmp176-.Lfunc_begin0
	.short	.Ltmp533-.Ltmp532       # Loc expr size
.Ltmp532:
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp533:
	.quad	0
	.quad	0
.Ldebug_loc44:
	.quad	.Ltmp164-.Lfunc_begin0
	.quad	.Ltmp166-.Lfunc_begin0
	.short	.Ltmp535-.Ltmp534       # Loc expr size
.Ltmp534:
	.byte	80                      # super-register DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp535:
	.quad	.Ltmp166-.Lfunc_begin0
	.quad	.Ltmp167-.Lfunc_begin0
	.short	.Ltmp537-.Ltmp536       # Loc expr size
.Ltmp536:
	.byte	93                      # super-register DW_OP_reg13
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp537:
	.quad	0
	.quad	0
.Ldebug_loc45:
	.quad	.Ltmp164-.Lfunc_begin0
	.quad	.Ltmp166-.Lfunc_begin0
	.short	.Ltmp539-.Ltmp538       # Loc expr size
.Ltmp538:
	.byte	80                      # super-register DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp539:
	.quad	.Ltmp166-.Lfunc_begin0
	.quad	.Ltmp170-.Lfunc_begin0
	.short	.Ltmp541-.Ltmp540       # Loc expr size
.Ltmp540:
	.byte	93                      # super-register DW_OP_reg13
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp541:
	.quad	.Ltmp174-.Lfunc_begin0
	.quad	.Ltmp176-.Lfunc_begin0
	.short	.Ltmp543-.Ltmp542       # Loc expr size
.Ltmp542:
	.byte	93                      # super-register DW_OP_reg13
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp543:
	.quad	.Ltmp176-.Lfunc_begin0
	.quad	.Lfunc_end4-.Lfunc_begin0
	.short	.Ltmp545-.Ltmp544       # Loc expr size
.Ltmp544:
	.byte	118                     # DW_OP_breg6
	.byte	84                      # -44
.Ltmp545:
	.quad	0
	.quad	0
.Ldebug_loc46:
	.quad	.Ltmp180-.Lfunc_begin0
	.quad	.Ltmp184-.Lfunc_begin0
	.short	.Ltmp547-.Ltmp546       # Loc expr size
.Ltmp546:
.Ltmp547:
	.quad	.Ltmp184-.Lfunc_begin0
	.quad	.Ltmp188-.Lfunc_begin0
	.short	.Ltmp549-.Ltmp548       # Loc expr size
.Ltmp548:
	.byte	97                      # DW_OP_reg17
.Ltmp549:
	.quad	.Ltmp188-.Lfunc_begin0
	.quad	.Lfunc_end4-.Lfunc_begin0
	.short	.Ltmp551-.Ltmp550       # Loc expr size
.Ltmp550:
.Ltmp551:
	.quad	0
	.quad	0
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end0-.LpubNames_begin0 # Length of Public Names Info
.LpubNames_begin0:
	.short	2                       # DWARF Version
	.long	.L.debug_info_begin0    # Offset of Compilation Unit Info
	.long	1279                    # Compilation Unit Length
	.long	327                     # DIE offset
	.asciz	"filter_kernel"         # External Name
	.long	831                     # DIE offset
	.asciz	"convolve_arr_indirection" # External Name
	.long	469                     # DIE offset
	.asciz	"convolve_arr_linear"   # External Name
	.long	714                     # DIE offset
	.asciz	"filter_kernel_2d"      # External Name
	.long	1089                    # DIE offset
	.asciz	"convolve_loop_nest"    # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.long	.LpubNames_end1-.LpubNames_begin1 # Length of Public Names Info
.LpubNames_begin1:
	.short	2                       # DWARF Version
	.long	.L.debug_info_begin1    # Offset of Compilation Unit Info
	.long	454                     # Compilation Unit Length
	.long	69                      # DIE offset
	.asciz	"main"                  # External Name
	.long	0                       # End Mark
.LpubNames_end1:
	.long	.LpubNames_end2-.LpubNames_begin2 # Length of Public Names Info
.LpubNames_begin2:
	.short	2                       # DWARF Version
	.long	.L.debug_info_begin2    # Offset of Compilation Unit Info
	.long	759                     # Compilation Unit Length
	.long	73                      # DIE offset
	.asciz	"libfilename_5_5"       # External Name
	.long	233                     # DIE offset
	.asciz	"convolve_bypass_hw_iface0" # External Name
	.long	339                     # DIE offset
	.asciz	"convolve_bypass_hw_iface1" # External Name
	.long	94                      # DIE offset
	.asciz	"libfilename_7_7"       # External Name
	.long	115                     # DIE offset
	.asciz	"env_allow_hw"          # External Name
	.long	137                     # DIE offset
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
	.long	1279                    # Compilation Unit Length
	.long	450                     # DIE offset
	.asciz	"float"                 # External Name
	.long	42                      # DIE offset
	.asciz	"u_int8_t"              # External Name
	.long	53                      # DIE offset
	.asciz	"unsigned char"         # External Name
	.long	462                     # DIE offset
	.asciz	"int"                   # External Name
	.long	0                       # End Mark
.LpubTypes_end0:
	.long	.LpubTypes_end1-.LpubTypes_begin1 # Length of Public Types Info
.LpubTypes_begin1:
	.short	2                       # DWARF Version
	.long	.L.debug_info_begin1    # Offset of Compilation Unit Info
	.long	454                     # Compilation Unit Length
	.long	392                     # DIE offset
	.asciz	"u_int32_t"             # External Name
	.long	403                     # DIE offset
	.asciz	"unsigned int"          # External Name
	.long	47                      # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end1:
	.long	.LpubTypes_end2-.LpubTypes_begin2 # Length of Public Types Info
.LpubTypes_begin2:
	.short	2                       # DWARF Version
	.long	.L.debug_info_begin2    # Offset of Compilation Unit Info
	.long	759                     # Compilation Unit Length
	.long	584                     # DIE offset
	.asciz	"int32_t"               # External Name
	.long	742                     # DIE offset
	.asciz	"max_file_internal_t"   # External Name
	.long	683                     # DIE offset
	.asciz	"max_file"              # External Name
	.long	721                     # DIE offset
	.asciz	"max_errors_t"          # External Name
	.long	637                     # DIE offset
	.asciz	"int64_t"               # External Name
	.long	672                     # DIE offset
	.asciz	"max_file_t"            # External Name
	.long	577                     # DIE offset
	.asciz	"_Bool"                 # External Name
	.long	648                     # DIE offset
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
