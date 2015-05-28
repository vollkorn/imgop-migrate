	.text
	.file	"convolve_dual_array_opt.ll"
	.globl	convolve_dual_array
	.align	16, 0x90
	.type	convolve_dual_array,@function
convolve_dual_array:                    # @convolve_dual_array
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
	movl	%r8d, -60(%rbp)         # 4-byte Spill
	movl	%ecx, -52(%rbp)         # 4-byte Spill
	movq	%rsi, -48(%rbp)         # 8-byte Spill
	movl	%r9d, %r11d
	shrl	$31, %r11d
	addl	%r9d, %r11d
	sarl	%r11d
	movl	%r11d, %esi
	negl	%esi
	xorps	%xmm0, %xmm0
	cmpl	%esi, %r11d
	jl	.LBB0_6
# BB#1:                                 # %for.cond2.preheader.lr.ph
	movslq	%esi, %r14
	movslq	%r11d, %r15
	movslq	%esi, %r10
	decq	%r10
	leaq	(%rdx,%r15,8), %r12
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB0_2:                                # %for.body4.lr.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	leaq	(%r14,%r15), %r13
	movq	%r10, %rcx
	.align	16, 0x90
.LBB0_3:                                # %for.body4
                                        #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	8(%r12,%rcx,8), %rax
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%ebx, %xmm0
	addss	(%rax,%r13,4), %xmm0
	cvttss2si	%xmm0, %ebx
	incq	%rcx
	cmpq	%r15, %rcx
	jl	.LBB0_3
# BB#4:                                 # %for.inc10
                                        #   in Loop: Header=BB0_2 Depth=1
	cmpq	%r15, %r14
	leaq	1(%r14), %r14
	jl	.LBB0_2
# BB#5:                                 # %for.cond13.preheader.loopexit
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%ebx, %xmm0
.LBB0_6:                                # %for.cond13.preheader
	movl	-52(%rbp), %eax         # 4-byte Reload
	subl	%r11d, %eax
	cmpl	%eax, %r11d
	jge	.LBB0_16
# BB#7:                                 # %for.cond18.preheader.lr.ph
	movl	-60(%rbp), %r8d         # 4-byte Reload
	movl	%r8d, %ecx
	subl	%r11d, %ecx
	movl	%ecx, -56(%rbp)         # 4-byte Spill
	movslq	%esi, %r14
	movslq	%r11d, %rbx
	decl	%r8d
	subl	%r11d, %r8d
	movl	-52(%rbp), %eax         # 4-byte Reload
	decl	%eax
	subl	%r11d, %eax
	movl	%eax, -52(%rbp)         # 4-byte Spill
	movslq	%esi, %r9
	decq	%r9
	leaq	(%rdx,%rbx,8), %rdx
	movq	%rbx, %r12
	.align	16, 0x90
.LBB0_8:                                # %for.cond18.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_10 Depth 2
                                        #       Child Loop BB0_11 Depth 3
                                        #         Child Loop BB0_12 Depth 4
	cmpl	-56(%rbp), %r11d        # 4-byte Folded Reload
	jge	.LBB0_15
# BB#9:                                 # %for.cond25.preheader.lr.ph
                                        #   in Loop: Header=BB0_8 Depth=1
	movq	%rbx, %r13
	.align	16, 0x90
.LBB0_10:                               # %for.cond25.preheader
                                        #   Parent Loop BB0_8 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_11 Depth 3
                                        #         Child Loop BB0_12 Depth 4
	xorps	%xmm1, %xmm1
	cmpl	%esi, %r11d
	movq	%r14, %rax
	jl	.LBB0_14
	.align	16, 0x90
.LBB0_11:                               # %for.body34.lr.ph
                                        #   Parent Loop BB0_8 Depth=1
                                        #     Parent Loop BB0_10 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_12 Depth 4
	movq	(%rdi,%r12,8), %rcx
	movzbl	(%rcx,%r13), %ecx
	cvtsi2ssl	%ecx, %xmm2
	leaq	(%rax,%rbx), %r10
	movq	%r9, %r15
	.align	16, 0x90
.LBB0_12:                               # %for.body34
                                        #   Parent Loop BB0_8 Depth=1
                                        #     Parent Loop BB0_10 Depth=2
                                        #       Parent Loop BB0_11 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movaps	%xmm1, %xmm3
	movq	8(%rdx,%r15,8), %rcx
	movss	(%rcx,%r10,4), %xmm1    # xmm1 = mem[0],zero,zero,zero
	mulss	%xmm2, %xmm1
	addss	%xmm3, %xmm1
	incq	%r15
	cmpq	%rbx, %r15
	jl	.LBB0_12
# BB#13:                                # %for.inc51
                                        #   in Loop: Header=BB0_11 Depth=3
	cmpq	%rbx, %rax
	leaq	1(%rax), %rax
	jl	.LBB0_11
.LBB0_14:                               # %for.end53
                                        #   in Loop: Header=BB0_10 Depth=2
	divss	%xmm0, %xmm1
	cvttss2si	%xmm1, %eax
	movq	-48(%rbp), %rcx         # 8-byte Reload
	movq	(%rcx,%r12,8), %rcx
	movb	%al, (%rcx,%r13)
	cmpl	%r8d, %r13d
	leaq	1(%r13), %r13
	jne	.LBB0_10
.LBB0_15:                               # %for.inc64
                                        #   in Loop: Header=BB0_8 Depth=1
	cmpl	-52(%rbp), %r12d        # 4-byte Folded Reload
	leaq	1(%r12), %r12
	jne	.LBB0_8
.LBB0_16:                               # %for.end66
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp8:
	.size	convolve_dual_array, .Ltmp8-convolve_dual_array
	.cfi_endproc


	.ident	"clang version 3.7.0 (http://llvm.org/git/clang.git 33947ed22c57e11e7aa88e803bfdd664fe50412f) (http://llvm.org/git/llvm.git 186332c0c98aab21acb91ae11055e44ec1acb95a)"
	.section	".note.GNU-stack","",@progbits
