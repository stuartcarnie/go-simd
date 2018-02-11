	.text
	.intel_syntax noprefix
	.file	"_lib/sum.c"
	.globl	sum_float64_sse4
	.p2align	4, 0x90
	.type	sum_float64_sse4,@function
sum_float64_sse4:                       # @sum_float64_sse4
# BB#0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
                                        # kill: %ESI<def> %ESI<kill> %RSI<def>
	test	esi, esi
	jle	.LBB0_1
# BB#2:
	mov	eax, esi
	xorpd	xmm0, xmm0
	cmp	esi, 3
	jbe	.LBB0_3
# BB#6:
	and	esi, 3
	mov	r8, rax
	sub	r8, rsi
	je	.LBB0_3
# BB#7:
	lea	rcx, [rdi + 16]
	xorpd	xmm1, xmm1
	mov	r9, r8
	xorpd	xmm0, xmm0
	.p2align	4, 0x90
.LBB0_8:                                # =>This Inner Loop Header: Depth=1
	movupd	xmm2, xmmword ptr [rcx - 16]
	movupd	xmm3, xmmword ptr [rcx]
	addpd	xmm1, xmm2
	addpd	xmm0, xmm3
	add	rcx, 32
	add	r9, -4
	jne	.LBB0_8
# BB#9:
	addpd	xmm0, xmm1
	haddpd	xmm0, xmm0
	test	esi, esi
	jne	.LBB0_4
	jmp	.LBB0_10
.LBB0_3:
	xor	r8d, r8d
.LBB0_4:
	lea	rcx, [rdi + 8*r8]
	sub	rax, r8
	.p2align	4, 0x90
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	addsd	xmm0, qword ptr [rcx]
	add	rcx, 8
	dec	rax
	jne	.LBB0_5
	jmp	.LBB0_10
.LBB0_1:
	xorpd	xmm0, xmm0
.LBB0_10:
	movsd	qword ptr [rdx], xmm0
	mov	rsp, rbp
	pop	rbp
	ret
.Lfunc_end0:
	.size	sum_float64_sse4, .Lfunc_end0-sum_float64_sse4


	.ident	"Apple LLVM version 9.0.0 (clang-900.0.39.2)"
	.section	".note.GNU-stack","",@progbits
