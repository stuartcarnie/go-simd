	.text
	.intel_syntax noprefix
	.file	"_lib/sum.c"
	.globl	sum_float64_avx_intrinsics
	.p2align	4, 0x90
	.type	sum_float64_avx_intrinsics,@function
sum_float64_avx_intrinsics:             # @sum_float64_avx_intrinsics
# BB#0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
	test	sil, 3
	jne	.LBB0_9
# BB#1:
	test	rsi, rsi
	je	.LBB0_2
# BB#3:
	lea	r8, [rsi - 1]
	mov	ecx, r8d
	shr	ecx, 2
	inc	ecx
	and	rcx, 7
	je	.LBB0_4
# BB#5:
	neg	rcx
	vxorpd	ymm0, ymm0, ymm0
	xor	eax, eax
	.p2align	4, 0x90
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	vaddpd	ymm0, ymm0, ymmword ptr [rdi + 8*rax]
	add	rax, 4
	inc	rcx
	jne	.LBB0_6
	jmp	.LBB0_7
.LBB0_2:
	vxorpd	ymm0, ymm0, ymm0
	jmp	.LBB0_8
.LBB0_4:
	xor	eax, eax
	vxorpd	ymm0, ymm0, ymm0
.LBB0_7:
	cmp	r8, 28
	jb	.LBB0_8
	.p2align	4, 0x90
.LBB0_10:                               # =>This Inner Loop Header: Depth=1
	vaddpd	ymm0, ymm0, ymmword ptr [rdi + 8*rax]
	vaddpd	ymm0, ymm0, ymmword ptr [rdi + 8*rax + 32]
	vaddpd	ymm0, ymm0, ymmword ptr [rdi + 8*rax + 64]
	vaddpd	ymm0, ymm0, ymmword ptr [rdi + 8*rax + 96]
	vaddpd	ymm0, ymm0, ymmword ptr [rdi + 8*rax + 128]
	vaddpd	ymm0, ymm0, ymmword ptr [rdi + 8*rax + 160]
	vaddpd	ymm0, ymm0, ymmword ptr [rdi + 8*rax + 192]
	vaddpd	ymm0, ymm0, ymmword ptr [rdi + 8*rax + 224]
	add	rax, 32
	cmp	rax, rsi
	jb	.LBB0_10
.LBB0_8:
	vhaddpd	ymm0, ymm0, ymm0
	vextractf128	xmm1, ymm0, 1
	vaddsd	xmm0, xmm0, xmm1
	vmovsd	qword ptr [rdx], xmm0
.LBB0_9:
	mov	rsp, rbp
	pop	rbp
	vzeroupper
	ret
.Lfunc_end0:
	.size	sum_float64_avx_intrinsics, .Lfunc_end0-sum_float64_avx_intrinsics

	.globl	sum_float64_avx2
	.p2align	4, 0x90
	.type	sum_float64_avx2,@function
sum_float64_avx2:                       # @sum_float64_avx2
# BB#0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
                                        # kill: %ESI<def> %ESI<kill> %RSI<def>
	test	esi, esi
	jle	.LBB1_1
# BB#2:
	mov	eax, esi
	vxorpd	xmm0, xmm0, xmm0
	cmp	esi, 31
	jbe	.LBB1_3
# BB#6:
	and	esi, 31
	mov	r8, rax
	sub	r8, rsi
	je	.LBB1_3
# BB#7:
	lea	rcx, [rdi + 192]
	vxorpd	ymm0, ymm0, ymm0
	mov	r9, r8
	vxorpd	ymm1, ymm1, ymm1
	vxorpd	ymm3, ymm3, ymm3
	vxorpd	ymm4, ymm4, ymm4
	vxorpd	ymm2, ymm2, ymm2
	vxorpd	ymm7, ymm7, ymm7
	vxorpd	ymm5, ymm5, ymm5
	vxorpd	ymm6, ymm6, ymm6
	.p2align	4, 0x90
.LBB1_8:                                # =>This Inner Loop Header: Depth=1
	vaddpd	ymm0, ymm0, ymmword ptr [rcx - 192]
	vaddpd	ymm1, ymm1, ymmword ptr [rcx - 160]
	vaddpd	ymm3, ymm3, ymmword ptr [rcx - 128]
	vaddpd	ymm4, ymm4, ymmword ptr [rcx - 96]
	vaddpd	ymm2, ymm2, ymmword ptr [rcx - 64]
	vaddpd	ymm7, ymm7, ymmword ptr [rcx - 32]
	vaddpd	ymm5, ymm5, ymmword ptr [rcx]
	vaddpd	ymm6, ymm6, ymmword ptr [rcx + 32]
	add	rcx, 256
	add	r9, -32
	jne	.LBB1_8
# BB#9:
	vaddpd	ymm0, ymm3, ymm0
	vaddpd	ymm1, ymm4, ymm1
	vaddpd	ymm1, ymm7, ymm1
	vaddpd	ymm0, ymm2, ymm0
	vaddpd	ymm0, ymm5, ymm0
	vaddpd	ymm1, ymm6, ymm1
	vaddpd	ymm0, ymm0, ymm1
	vextractf128	xmm1, ymm0, 1
	vaddpd	ymm0, ymm0, ymm1
	vhaddpd	ymm0, ymm0, ymm0
	test	esi, esi
	jne	.LBB1_4
	jmp	.LBB1_10
.LBB1_3:
	xor	r8d, r8d
.LBB1_4:
	lea	rcx, [rdi + 8*r8]
	sub	rax, r8
	.p2align	4, 0x90
.LBB1_5:                                # =>This Inner Loop Header: Depth=1
	vaddsd	xmm0, xmm0, qword ptr [rcx]
	add	rcx, 8
	dec	rax
	jne	.LBB1_5
	jmp	.LBB1_10
.LBB1_1:
	vxorpd	xmm0, xmm0, xmm0
.LBB1_10:
	vmovsd	qword ptr [rdx], xmm0
	mov	rsp, rbp
	pop	rbp
	vzeroupper
	ret
.Lfunc_end1:
	.size	sum_float64_avx2, .Lfunc_end1-sum_float64_avx2


	.ident	"Apple LLVM version 9.0.0 (clang-900.0.39.2)"
	.section	".note.GNU-stack","",@progbits
