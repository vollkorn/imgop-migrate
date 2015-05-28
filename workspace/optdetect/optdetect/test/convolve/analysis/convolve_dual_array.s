	.text
	.file	"convolve_dual_array.bc"
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
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	%ecx, -28(%rbp)
	movl	%r8d, -32(%rbp)
	movl	%r9d, -36(%rbp)
	movl	%r9d, %eax
	shrl	$31, %eax
	addl	%r9d, %eax
	sarl	%eax
	movl	%eax, -40(%rbp)
	movl	$0, -44(%rbp)
	movl	$0, -48(%rbp)
	xorl	%eax, %eax
	subl	-40(%rbp), %eax
	movl	%eax, -52(%rbp)
	jmp	.LBB0_1
	.align	16, 0x90
.LBB0_5:                                # %for.inc10
                                        #   in Loop: Header=BB0_1 Depth=1
	incl	-52(%rbp)
.LBB0_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	movl	-52(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jg	.LBB0_6
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	xorl	%eax, %eax
	subl	-40(%rbp), %eax
	movl	%eax, -56(%rbp)
	jmp	.LBB0_3
	.align	16, 0x90
.LBB0_4:                                # %for.inc
                                        #   in Loop: Header=BB0_3 Depth=2
	movslq	-52(%rbp), %rax
	movslq	-40(%rbp), %rcx
	addq	%rcx, %rax
	movslq	-56(%rbp), %rdx
	addq	%rcx, %rdx
	movq	-24(%rbp), %rcx
	movq	(%rcx,%rdx,8), %rcx
	cvtsi2ssl	-44(%rbp), %xmm0
	addss	(%rcx,%rax,4), %xmm0
	cvttss2si	%xmm0, %eax
	movl	%eax, -44(%rbp)
	incl	-56(%rbp)
.LBB0_3:                                # %for.cond2
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-56(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jle	.LBB0_4
	jmp	.LBB0_5
.LBB0_6:                                # %for.end12
	movl	-40(%rbp), %eax
	movl	%eax, -60(%rbp)
	jmp	.LBB0_7
	.align	16, 0x90
.LBB0_17:                               # %for.inc64
                                        #   in Loop: Header=BB0_7 Depth=1
	incl	-60(%rbp)
.LBB0_7:                                # %for.cond13
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_9 Depth 2
                                        #       Child Loop BB0_11 Depth 3
                                        #         Child Loop BB0_13 Depth 4
	movl	-28(%rbp), %eax
	subl	-40(%rbp), %eax
	cmpl	%eax, -60(%rbp)
	jge	.LBB0_18
# BB#8:                                 # %for.body17
                                        #   in Loop: Header=BB0_7 Depth=1
	movl	-40(%rbp), %eax
	movl	%eax, -64(%rbp)
	jmp	.LBB0_9
	.align	16, 0x90
.LBB0_16:                               # %for.inc61
                                        #   in Loop: Header=BB0_9 Depth=2
	movss	-68(%rbp), %xmm0        # xmm0 = mem[0],zero,zero,zero
	cvtsi2ssl	-44(%rbp), %xmm1
	divss	%xmm1, %xmm0
	cvttss2si	%xmm0, %eax
	movslq	-64(%rbp), %rcx
	movslq	-60(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	(%rsi,%rdx,8), %rdx
	movb	%al, (%rdx,%rcx)
	incl	-64(%rbp)
.LBB0_9:                                # %for.cond18
                                        #   Parent Loop BB0_7 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_11 Depth 3
                                        #         Child Loop BB0_13 Depth 4
	movl	-32(%rbp), %eax
	subl	-40(%rbp), %eax
	cmpl	%eax, -64(%rbp)
	jge	.LBB0_17
# BB#10:                                # %for.body22
                                        #   in Loop: Header=BB0_9 Depth=2
	movl	$0, -68(%rbp)
	movl	$0, -72(%rbp)
	xorl	%eax, %eax
	subl	-40(%rbp), %eax
	movl	%eax, -76(%rbp)
	jmp	.LBB0_11
	.align	16, 0x90
.LBB0_15:                               # %for.inc51
                                        #   in Loop: Header=BB0_11 Depth=3
	incl	-76(%rbp)
.LBB0_11:                               # %for.cond25
                                        #   Parent Loop BB0_7 Depth=1
                                        #     Parent Loop BB0_9 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_13 Depth 4
	movl	-76(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jg	.LBB0_16
# BB#12:                                # %for.body28
                                        #   in Loop: Header=BB0_11 Depth=3
	xorl	%eax, %eax
	subl	-40(%rbp), %eax
	movl	%eax, -80(%rbp)
	jmp	.LBB0_13
	.align	16, 0x90
.LBB0_14:                               # %for.inc48
                                        #   in Loop: Header=BB0_13 Depth=4
	movslq	-64(%rbp), %rax
	movslq	-60(%rbp), %rcx
	movq	-8(%rbp), %rdx
	movq	(%rdx,%rcx,8), %rcx
	movzbl	(%rcx,%rax), %eax
	cvtsi2ssl	%eax, %xmm0
	movslq	-76(%rbp), %rax
	movslq	-40(%rbp), %rcx
	addq	%rcx, %rax
	movslq	-80(%rbp), %rdx
	addq	%rcx, %rdx
	movq	-24(%rbp), %rcx
	movq	(%rcx,%rdx,8), %rcx
	mulss	(%rcx,%rax,4), %xmm0
	addss	-68(%rbp), %xmm0
	movss	%xmm0, -68(%rbp)
	incl	-80(%rbp)
.LBB0_13:                               # %for.cond31
                                        #   Parent Loop BB0_7 Depth=1
                                        #     Parent Loop BB0_9 Depth=2
                                        #       Parent Loop BB0_11 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	-80(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jle	.LBB0_14
	jmp	.LBB0_15
.LBB0_18:                               # %for.end66
	popq	%rbp
	retq
.Ltmp3:
	.size	convolve_dual_array, .Ltmp3-convolve_dual_array
	.cfi_endproc


	.ident	"clang version 3.7.0 (http://llvm.org/git/clang.git 33947ed22c57e11e7aa88e803bfdd664fe50412f) (http://llvm.org/git/llvm.git 186332c0c98aab21acb91ae11055e44ec1acb95a)"
	.section	".note.GNU-stack","",@progbits
