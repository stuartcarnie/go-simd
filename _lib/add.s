	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.intel_syntax noprefix
	.globl	_SumFloat64
	.p2align	4, 0x90
_SumFloat64:                            ## @SumFloat64
## BB#0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
	test	sil, 3
	jne	LBB0_9
## BB#1:
	test	rsi, rsi
	je	LBB0_2
## BB#3:
	lea	r8, [rsi - 1]
	mov	ecx, r8d
	shr	ecx, 2
	add	ecx, 1
	and	rcx, 7
	je	LBB0_4
## BB#5:
	neg	rcx
	vxorpd	ymm0, ymm0, ymm0
	xor	eax, eax
	.p2align	4, 0x90
LBB0_6:                                 ## =>This Inner Loop Header: Depth=1
	vaddpd	ymm0, ymm0, ymmword ptr [rdi + 8*rax]
	add	rax, 4
	add	rcx, 1
	jne	LBB0_6
	jmp	LBB0_7
LBB0_2:
	vxorpd	ymm0, ymm0, ymm0
	jmp	LBB0_8
LBB0_4:
	xor	eax, eax
	vxorpd	ymm0, ymm0, ymm0
LBB0_7:
	cmp	r8, 28
	jb	LBB0_8
	.p2align	4, 0x90
LBB0_10:                                ## =>This Inner Loop Header: Depth=1
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
	jb	LBB0_10
LBB0_8:
	vhaddpd	ymm0, ymm0, ymm0
	vextractf128	xmm1, ymm0, 1
	vaddsd	xmm0, xmm0, xmm1
	vmovsd	qword ptr [rdx], xmm0
LBB0_9:
	mov	rsp, rbp
	pop	rbp
	vzeroupper
	ret

	.globl	_SumFloat64b
	.p2align	4, 0x90
_SumFloat64b:                           ## @SumFloat64b
## BB#0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
	vxorpd	xmm0, xmm0, xmm0
	test	rsi, rsi
	je	LBB1_14
## BB#1:
	cmp	rsi, 15
	jbe	LBB1_2
## BB#5:
	mov	r9, rsi
	and	r9, -16
	je	LBB1_2
## BB#6:
	lea	r8, [r9 - 16]
	mov	eax, r8d
	shr	eax, 4
	add	eax, 1
	and	rax, 3
	je	LBB1_7
## BB#8:
	neg	rax
	vxorpd	ymm0, ymm0, ymm0
	xor	ecx, ecx
	vxorpd	ymm1, ymm1, ymm1
	vxorpd	ymm2, ymm2, ymm2
	vxorpd	ymm3, ymm3, ymm3
	.p2align	4, 0x90
LBB1_9:                                 ## =>This Inner Loop Header: Depth=1
	vaddpd	ymm0, ymm0, ymmword ptr [rdi + 8*rcx]
	vaddpd	ymm1, ymm1, ymmword ptr [rdi + 8*rcx + 32]
	vaddpd	ymm2, ymm2, ymmword ptr [rdi + 8*rcx + 64]
	vaddpd	ymm3, ymm3, ymmword ptr [rdi + 8*rcx + 96]
	add	rcx, 16
	add	rax, 1
	jne	LBB1_9
	jmp	LBB1_10
LBB1_2:
	xor	r9d, r9d
LBB1_3:
	lea	rax, [rdi + 8*r9]
	sub	rsi, r9
	.p2align	4, 0x90
LBB1_4:                                 ## =>This Inner Loop Header: Depth=1
	vaddsd	xmm0, xmm0, qword ptr [rax]
	add	rax, 8
	add	rsi, -1
	jne	LBB1_4
LBB1_14:
	vmovsd	qword ptr [rdx], xmm0
	mov	rsp, rbp
	pop	rbp
	vzeroupper
	ret
LBB1_7:
	xor	ecx, ecx
	vxorpd	ymm0, ymm0, ymm0
	vxorpd	ymm1, ymm1, ymm1
	vxorpd	ymm2, ymm2, ymm2
	vxorpd	ymm3, ymm3, ymm3
LBB1_10:
	cmp	r8, 48
	jb	LBB1_13
## BB#11:
	mov	rax, r9
	sub	rax, rcx
	lea	rcx, [rdi + 8*rcx + 480]
	.p2align	4, 0x90
LBB1_12:                                ## =>This Inner Loop Header: Depth=1
	vaddpd	ymm0, ymm0, ymmword ptr [rcx - 480]
	vaddpd	ymm1, ymm1, ymmword ptr [rcx - 448]
	vaddpd	ymm2, ymm2, ymmword ptr [rcx - 416]
	vaddpd	ymm3, ymm3, ymmword ptr [rcx - 384]
	vaddpd	ymm0, ymm0, ymmword ptr [rcx - 352]
	vaddpd	ymm1, ymm1, ymmword ptr [rcx - 320]
	vaddpd	ymm2, ymm2, ymmword ptr [rcx - 288]
	vaddpd	ymm3, ymm3, ymmword ptr [rcx - 256]
	vaddpd	ymm0, ymm0, ymmword ptr [rcx - 224]
	vaddpd	ymm1, ymm1, ymmword ptr [rcx - 192]
	vaddpd	ymm2, ymm2, ymmword ptr [rcx - 160]
	vaddpd	ymm3, ymm3, ymmword ptr [rcx - 128]
	vaddpd	ymm0, ymm0, ymmword ptr [rcx - 96]
	vaddpd	ymm1, ymm1, ymmword ptr [rcx - 64]
	vaddpd	ymm2, ymm2, ymmword ptr [rcx - 32]
	vaddpd	ymm3, ymm3, ymmword ptr [rcx]
	add	rcx, 512
	add	rax, -64
	jne	LBB1_12
LBB1_13:
	vaddpd	ymm0, ymm1, ymm0
	vaddpd	ymm0, ymm2, ymm0
	vaddpd	ymm0, ymm3, ymm0
	vextractf128	xmm1, ymm0, 1
	vaddpd	ymm0, ymm0, ymm1
	vhaddpd	ymm0, ymm0, ymm0
	cmp	r9, rsi
	jne	LBB1_3
	jmp	LBB1_14


.subsections_via_symbols
