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


.subsections_via_symbols
