	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14
	.intel_syntax noprefix
	.globl	_validate_ascii_fast_avx2 ## -- Begin function validate_ascii_fast_avx2
	.p2align	4, 0x90
_validate_ascii_fast_avx2:              ## @validate_ascii_fast_avx2
## %bb.0:
	push	rbp
	mov	rbp, rsp
	push	r14
	push	rbx
	and	rsp, -8
	xor	eax, eax
	cmp	rsi, 32
	jb	LBB0_1
## %bb.2:
	lea	rbx, [rsi - 32]
	vpxor	xmm0, xmm0, xmm0
	xor	ecx, ecx
	.p2align	4, 0x90
LBB0_3:                                 ## =>This Inner Loop Header: Depth=1
	vpor	ymm0, ymm0, ymmword ptr [rdi + rcx]
	add	rcx, 32
	cmp	rcx, rbx
	jbe	LBB0_3
## %bb.4:
	vpmovmskb	r8d, ymm0
	cmp	rcx, rsi
	jb	LBB0_5
	jmp	LBB0_17
LBB0_1:
	vpxor	xmm0, xmm0, xmm0
	xor	ecx, ecx
	vpmovmskb	r8d, ymm0
	cmp	rcx, rsi
	jae	LBB0_17
LBB0_5:
	mov	r10, rsi
	sub	r10, rcx
	xor	eax, eax
	cmp	r10, 32
	jb	LBB0_14
## %bb.6:
	mov	r9, r10
	and	r9, -32
	lea	rbx, [r9 - 32]
	mov	rax, rbx
	shr	rax, 5
	lea	r11d, [rax + 1]
	and	r11d, 1
	test	rbx, rbx
	je	LBB0_7
## %bb.8:
	lea	rbx, [rdi + rcx + 56]
	lea	r14, [r11 - 1]
	sub	r14, rax
	vpxor	xmm0, xmm0, xmm0
	xor	eax, eax
	vpxor	xmm1, xmm1, xmm1
	vpxor	xmm2, xmm2, xmm2
	vpxor	xmm3, xmm3, xmm3
	.p2align	4, 0x90
LBB0_9:                                 ## =>This Inner Loop Header: Depth=1
	vpmovsxbd	ymm4, qword ptr [rbx + rax - 56]
	vpor	ymm0, ymm0, ymm4
	vpmovsxbd	ymm4, qword ptr [rbx + rax - 48]
	vpor	ymm1, ymm1, ymm4
	vpmovsxbd	ymm4, qword ptr [rbx + rax - 40]
	vpor	ymm2, ymm2, ymm4
	vpmovsxbd	ymm4, qword ptr [rbx + rax - 32]
	vpor	ymm3, ymm3, ymm4
	vpmovsxbd	ymm4, qword ptr [rbx + rax - 24]
	vpor	ymm0, ymm0, ymm4
	vpmovsxbd	ymm4, qword ptr [rbx + rax - 16]
	vpor	ymm1, ymm1, ymm4
	vpmovsxbd	ymm4, qword ptr [rbx + rax - 8]
	vpor	ymm2, ymm2, ymm4
	vpmovsxbd	ymm4, qword ptr [rbx + rax]
	vpor	ymm3, ymm3, ymm4
	add	rax, 64
	add	r14, 2
	jne	LBB0_9
## %bb.10:
	test	r11, r11
	je	LBB0_12
LBB0_11:
	add	rax, rcx
	vpmovsxbd	ymm4, qword ptr [rdi + rax + 24]
	vpor	ymm3, ymm3, ymm4
	vpmovsxbd	ymm4, qword ptr [rdi + rax + 16]
	vpor	ymm2, ymm2, ymm4
	vpmovsxbd	ymm4, qword ptr [rdi + rax + 8]
	vpor	ymm1, ymm1, ymm4
	vpmovsxbd	ymm4, qword ptr [rdi + rax]
	vpor	ymm0, ymm0, ymm4
LBB0_12:
	vpor	ymm1, ymm1, ymm3
	vpor	ymm0, ymm0, ymm2
	vpor	ymm0, ymm0, ymm1
	vextracti128	xmm1, ymm0, 1
	vpor	ymm0, ymm0, ymm1
	vpshufd	xmm1, xmm0, 78          ## xmm1 = xmm0[2,3,0,1]
	vpor	ymm0, ymm0, ymm1
	vpshufd	xmm1, xmm0, 229         ## xmm1 = xmm0[1,1,2,3]
	vpor	ymm0, ymm0, ymm1
	vmovd	eax, xmm0
	cmp	r10, r9
	je	LBB0_16
## %bb.13:
	add	rcx, r9
LBB0_14:
	sub	rsi, rcx
	add	rdi, rcx
	.p2align	4, 0x90
LBB0_15:                                ## =>This Inner Loop Header: Depth=1
	movsx	ecx, byte ptr [rdi]
	or	eax, ecx
	inc	rdi
	dec	rsi
	jne	LBB0_15
LBB0_16:
	and	eax, 128
LBB0_17:
	xor	ecx, ecx
	or	eax, r8d
	sete	cl
	mov	qword ptr [rdx], rcx
	lea	rsp, [rbp - 16]
	pop	rbx
	pop	r14
	pop	rbp
	vzeroupper
	ret
LBB0_7:
	vpxor	xmm0, xmm0, xmm0
	xor	eax, eax
	vpxor	xmm1, xmm1, xmm1
	vpxor	xmm2, xmm2, xmm2
	vpxor	xmm3, xmm3, xmm3
	test	r11, r11
	jne	LBB0_11
	jmp	LBB0_12
                                        ## -- End function

.subsections_via_symbols
