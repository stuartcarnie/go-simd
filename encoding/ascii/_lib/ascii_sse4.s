	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14
	.intel_syntax noprefix
	.globl	_validate_ascii_fast_sse4 ## -- Begin function validate_ascii_fast_sse4
	.p2align	4, 0x90
_validate_ascii_fast_sse4:              ## @validate_ascii_fast_sse4
## %bb.0:
	push	rbp
	mov	rbp, rsp
	push	r14
	push	rbx
	and	rsp, -8
	xor	eax, eax
	cmp	rsi, 16
	jb	LBB0_1
## %bb.2:
	lea	rbx, [rsi - 16]
	pxor	xmm0, xmm0
	xor	ecx, ecx
	.p2align	4, 0x90
LBB0_3:                                 ## =>This Inner Loop Header: Depth=1
	movdqu	xmm1, xmmword ptr [rdi + rcx]
	por	xmm0, xmm1
	add	rcx, 16
	cmp	rcx, rbx
	jbe	LBB0_3
## %bb.4:
	pmovmskb	r8d, xmm0
	cmp	rcx, rsi
	jb	LBB0_5
	jmp	LBB0_18
LBB0_1:
	pxor	xmm0, xmm0
	xor	ecx, ecx
	pmovmskb	r8d, xmm0
	cmp	rcx, rsi
	jae	LBB0_18
LBB0_5:
	mov	r10, rsi
	sub	r10, rcx
	xor	eax, eax
	cmp	r10, 8
	jb	LBB0_15
## %bb.6:
	mov	r9, r10
	and	r9, -8
	lea	rbx, [r9 - 8]
	mov	rax, rbx
	shr	rax, 3
	lea	r11d, [rax + 1]
	and	r11d, 3
	cmp	rbx, 24
	jae	LBB0_8
## %bb.7:
	pxor	xmm0, xmm0
	xor	eax, eax
	pxor	xmm1, xmm1
	test	r11, r11
	jne	LBB0_11
	jmp	LBB0_13
LBB0_8:
	lea	rbx, [rdi + rcx + 28]
	lea	r14, [r11 - 1]
	sub	r14, rax
	pxor	xmm0, xmm0
	xor	eax, eax
	pxor	xmm1, xmm1
	.p2align	4, 0x90
LBB0_9:                                 ## =>This Inner Loop Header: Depth=1
	pmovsxbd	xmm2, dword ptr [rbx + rax - 28]
	por	xmm2, xmm0
	pmovsxbd	xmm0, dword ptr [rbx + rax - 24]
	por	xmm0, xmm1
	pmovsxbd	xmm1, dword ptr [rbx + rax - 20]
	pmovsxbd	xmm3, dword ptr [rbx + rax - 16]
	pmovsxbd	xmm4, dword ptr [rbx + rax - 12]
	por	xmm4, xmm1
	por	xmm4, xmm2
	pmovsxbd	xmm2, dword ptr [rbx + rax - 8]
	por	xmm2, xmm3
	por	xmm2, xmm0
	pmovsxbd	xmm0, dword ptr [rbx + rax - 4]
	pmovsxbd	xmm1, dword ptr [rbx + rax]
	por	xmm0, xmm4
	por	xmm1, xmm2
	add	rax, 32
	add	r14, 4
	jne	LBB0_9
## %bb.10:
	test	r11, r11
	je	LBB0_13
LBB0_11:
	add	rax, rcx
	lea	rax, [rdi + rax + 4]
	neg	r11
	.p2align	4, 0x90
LBB0_12:                                ## =>This Inner Loop Header: Depth=1
	pmovsxbd	xmm2, dword ptr [rax - 4]
	pmovsxbd	xmm3, dword ptr [rax]
	por	xmm0, xmm2
	por	xmm1, xmm3
	add	rax, 8
	inc	r11
	jne	LBB0_12
LBB0_13:
	por	xmm0, xmm1
	pshufd	xmm1, xmm0, 78          ## xmm1 = xmm0[2,3,0,1]
	por	xmm1, xmm0
	pshufd	xmm0, xmm1, 229         ## xmm0 = xmm1[1,1,2,3]
	por	xmm0, xmm1
	movd	eax, xmm0
	cmp	r10, r9
	je	LBB0_17
## %bb.14:
	add	rcx, r9
LBB0_15:
	sub	rsi, rcx
	add	rdi, rcx
	.p2align	4, 0x90
LBB0_16:                                ## =>This Inner Loop Header: Depth=1
	movsx	ecx, byte ptr [rdi]
	or	eax, ecx
	inc	rdi
	dec	rsi
	jne	LBB0_16
LBB0_17:
	and	eax, 128
LBB0_18:
	xor	ecx, ecx
	or	eax, r8d
	sete	cl
	mov	qword ptr [rdx], rcx
	lea	rsp, [rbp - 16]
	pop	rbx
	pop	r14
	pop	rbp
	ret
                                        ## -- End function

.subsections_via_symbols
