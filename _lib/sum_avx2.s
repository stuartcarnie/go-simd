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
	vxorpd	xmm0, xmm0, xmm0
	test	rsi, rsi
	je	.LBB1_13
# BB#1:
	cmp	rsi, 31
	jbe	.LBB1_2
# BB#5:
	mov	r9, rsi
	and	r9, -32
	je	.LBB1_2
# BB#6:
	lea	rax, [r9 - 32]
	mov	rcx, rax
	shr	rcx, 5
	bt	eax, 5
	jb	.LBB1_7
# BB#8:
	vmovupd	ymm0, ymmword ptr [rdi]
	vmovupd	ymm2, ymmword ptr [rdi + 32]
	vmovupd	ymm1, ymmword ptr [rdi + 64]
	vmovupd	ymm3, ymmword ptr [rdi + 96]
	vmovupd	ymm5, ymmword ptr [rdi + 160]
	vmovupd	ymm4, ymmword ptr [rdi + 128]
	vmovupd	ymm7, ymmword ptr [rdi + 224]
	vmovupd	ymm6, ymmword ptr [rdi + 192]
	mov	r8d, 32
	test	rcx, rcx
	jne	.LBB1_10
	jmp	.LBB1_12
.LBB1_2:
	xor	r9d, r9d
.LBB1_3:
	lea	rax, [rdi + 8*r9]
	sub	rsi, r9
	.p2align	4, 0x90
.LBB1_4:                                # =>This Inner Loop Header: Depth=1
	vaddsd	xmm0, xmm0, qword ptr [rax]
	add	rax, 8
	dec	rsi
	jne	.LBB1_4
.LBB1_13:
	vmovsd	qword ptr [rdx], xmm0
	mov	rsp, rbp
	pop	rbp
	vzeroupper
	ret
.LBB1_7:
	vxorpd	ymm0, ymm0, ymm0
	xor	r8d, r8d
	vxorpd	ymm2, ymm2, ymm2
	vxorpd	ymm1, ymm1, ymm1
	vxorpd	ymm3, ymm3, ymm3
	vxorpd	ymm4, ymm4, ymm4
	vxorpd	ymm5, ymm5, ymm5
	vxorpd	ymm6, ymm6, ymm6
	vxorpd	ymm7, ymm7, ymm7
	test	rcx, rcx
	je	.LBB1_12
.LBB1_10:
	mov	rcx, r9
	sub	rcx, r8
	lea	rax, [rdi + 8*r8 + 448]
	.p2align	4, 0x90
.LBB1_11:                               # =>This Inner Loop Header: Depth=1
	vaddpd	ymm2, ymm2, ymmword ptr [rax - 416]
	vaddpd	ymm0, ymm0, ymmword ptr [rax - 448]
	vaddpd	ymm3, ymm3, ymmword ptr [rax - 352]
	vaddpd	ymm1, ymm1, ymmword ptr [rax - 384]
	vaddpd	ymm5, ymm5, ymmword ptr [rax - 288]
	vaddpd	ymm4, ymm4, ymmword ptr [rax - 320]
	vaddpd	ymm7, ymm7, ymmword ptr [rax - 224]
	vaddpd	ymm6, ymm6, ymmword ptr [rax - 256]
	vaddpd	ymm0, ymm0, ymmword ptr [rax - 192]
	vaddpd	ymm2, ymm2, ymmword ptr [rax - 160]
	vaddpd	ymm1, ymm1, ymmword ptr [rax - 128]
	vaddpd	ymm3, ymm3, ymmword ptr [rax - 96]
	vaddpd	ymm4, ymm4, ymmword ptr [rax - 64]
	vaddpd	ymm5, ymm5, ymmword ptr [rax - 32]
	vaddpd	ymm6, ymm6, ymmword ptr [rax]
	vaddpd	ymm7, ymm7, ymmword ptr [rax + 32]
	add	rax, 512
	add	rcx, -64
	jne	.LBB1_11
.LBB1_12:
	vaddpd	ymm2, ymm2, ymm5
	vaddpd	ymm0, ymm0, ymm4
	vaddpd	ymm1, ymm1, ymm6
	vaddpd	ymm0, ymm0, ymm1
	vaddpd	ymm1, ymm3, ymm7
	vaddpd	ymm1, ymm2, ymm1
	vaddpd	ymm0, ymm0, ymm1
	vextractf128	xmm1, ymm0, 1
	vaddpd	ymm0, ymm0, ymm1
	vhaddpd	ymm0, ymm0, ymm0
	cmp	r9, rsi
	jne	.LBB1_3
	jmp	.LBB1_13
.Lfunc_end1:
	.size	sum_float64_avx2, .Lfunc_end1-sum_float64_avx2


	.ident	"Apple LLVM version 9.0.0 (clang-900.0.39.2)"
	.section	".note.GNU-stack","",@progbits
