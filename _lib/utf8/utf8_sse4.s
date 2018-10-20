	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14
	.intel_syntax noprefix
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function validate_utf8_fast_sse4
LCPI0_0:
	.space	16,15
LCPI0_1:
	.space	16,244
LCPI0_2:
	.byte	1                       ## 0x1
	.byte	1                       ## 0x1
	.byte	1                       ## 0x1
	.byte	1                       ## 0x1
	.byte	1                       ## 0x1
	.byte	1                       ## 0x1
	.byte	1                       ## 0x1
	.byte	1                       ## 0x1
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	2                       ## 0x2
	.byte	2                       ## 0x2
	.byte	3                       ## 0x3
	.byte	4                       ## 0x4
LCPI0_3:
	.space	16,1
LCPI0_4:
	.space	16,2
LCPI0_5:
	.space	16,237
LCPI0_6:
	.space	16,159
LCPI0_7:
	.space	16,143
LCPI0_8:
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	194                     ## 0xc2
	.byte	128                     ## 0x80
	.byte	225                     ## 0xe1
	.byte	241                     ## 0xf1
LCPI0_9:
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	127                     ## 0x7f
	.byte	127                     ## 0x7f
	.byte	160                     ## 0xa0
	.byte	144                     ## 0x90
LCPI0_10:
	.byte	9                       ## 0x9
	.byte	9                       ## 0x9
	.byte	9                       ## 0x9
	.byte	9                       ## 0x9
	.byte	9                       ## 0x9
	.byte	9                       ## 0x9
	.byte	9                       ## 0x9
	.byte	9                       ## 0x9
	.byte	9                       ## 0x9
	.byte	9                       ## 0x9
	.byte	9                       ## 0x9
	.byte	9                       ## 0x9
	.byte	9                       ## 0x9
	.byte	9                       ## 0x9
	.byte	9                       ## 0x9
	.byte	1                       ## 0x1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_validate_utf8_fast_sse4
	.p2align	4, 0x90
_validate_utf8_fast_sse4:               ## @validate_utf8_fast_sse4
## %bb.0:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r12
	push	rbx
	and	rsp, -8
	cmp	rdx, 16
	jb	LBB0_7
## %bb.1:
	lea	r8, [rdx - 16]
	pxor	xmm1, xmm1
	xor	r12d, r12d
	movdqa	xmm12, xmmword ptr [rip + LCPI0_1] ## xmm12 = [244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244]
	movdqa	xmm13, xmmword ptr [rip + LCPI0_3] ## xmm13 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
	movdqa	xmm14, xmmword ptr [rip + LCPI0_8] ## xmm14 = [128,128,128,128,128,128,128,128,128,128,128,128,194,128,225,241]
	movdqa	xmm15, xmmword ptr [rip + LCPI0_9] ## xmm15 = [128,128,128,128,128,128,128,128,128,128,128,128,127,127,160,144]
	pxor	xmm3, xmm3
	pxor	xmm4, xmm4
	pxor	xmm6, xmm6
	.p2align	4, 0x90
LBB0_2:                                 ## =>This Inner Loop Header: Depth=1
	movdqu	xmm11, xmmword ptr [rsi + r12]
	movdqa	xmm8, xmm11
	psrlw	xmm8, 4
	pand	xmm8, xmmword ptr [rip + LCPI0_0]
	movdqa	xmm2, xmm11
	psubusb	xmm2, xmm12
	por	xmm2, xmm1
	movdqa	xmm10, xmmword ptr [rip + LCPI0_2] ## xmm10 = [1,1,1,1,1,1,1,1,0,0,0,0,2,2,3,4]
	pshufb	xmm10, xmm8
	movdqa	xmm1, xmm10
	palignr	xmm1, xmm3, 15          ## xmm1 = xmm3[15],xmm1[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
	psubusb	xmm1, xmm13
	paddb	xmm1, xmm10
	movdqa	xmm9, xmm1
	palignr	xmm9, xmm3, 14          ## xmm9 = xmm3[14,15],xmm9[0,1,2,3,4,5,6,7,8,9,10,11,12,13]
	psubusb	xmm9, xmmword ptr [rip + LCPI0_4]
	paddb	xmm9, xmm1
	movdqa	xmm1, xmm9
	pcmpgtb	xmm1, xmm10
	movdqa	xmm3, xmm13
	pcmpgtb	xmm3, xmm10
	pxor	xmm3, xmm1
	movdqa	xmm1, xmm11
	palignr	xmm1, xmm6, 15          ## xmm1 = xmm6[15],xmm1[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
	movdqa	xmm6, xmm1
	movdqa	xmm0, xmm8
	palignr	xmm0, xmm4, 15          ## xmm0 = xmm4[15],xmm0[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
	movdqa	xmm4, xmm14
	pshufb	xmm4, xmm0
	pcmpgtb	xmm4, xmm1
	pcmpeqb	xmm1, xmmword ptr [rip + LCPI0_5]
	pcmpeqb	xmm6, xmm12
	movdqa	xmm5, xmm11
	pcmpgtb	xmm5, xmmword ptr [rip + LCPI0_6]
	pand	xmm5, xmm1
	movdqa	xmm7, xmm11
	pcmpgtb	xmm7, xmmword ptr [rip + LCPI0_7]
	pand	xmm7, xmm6
	por	xmm7, xmm5
	por	xmm7, xmm2
	movdqa	xmm1, xmm15
	pshufb	xmm1, xmm0
	pcmpgtb	xmm1, xmm11
	pand	xmm1, xmm4
	por	xmm1, xmm7
	por	xmm1, xmm3
	add	r12, 16
	movdqa	xmm3, xmm9
	movdqa	xmm4, xmm8
	movdqa	xmm6, xmm11
	cmp	r12, r8
	jbe	LBB0_2
## %bb.3:
	cmp	r12, rdx
	jae	LBB0_8
LBB0_4:
	pxor	xmm0, xmm0
	movdqu	xmmword ptr [rdi], xmm0
	mov	r8, rdx
	sub	r8, r12
	je	LBB0_26
## %bb.5:
	lea	r9, [rsi + r12]
	cmp	r8, 32
	jb	LBB0_6
## %bb.9:
	lea	rbx, [rsi + rdx]
	cmp	rdi, rbx
	jae	LBB0_12
## %bb.10:
	lea	rbx, [rdi + r8]
	cmp	r9, rbx
	jae	LBB0_12
LBB0_6:
	xor	r10d, r10d
LBB0_20:
	mov	ebx, edx
	sub	ebx, r12d
	dec	rdx
	sub	rdx, r10
	sub	rdx, r12
	and	rbx, 3
	je	LBB0_23
## %bb.21:
	neg	rbx
	.p2align	4, 0x90
LBB0_22:                                ## =>This Inner Loop Header: Depth=1
	movzx	eax, byte ptr [r9 + r10]
	mov	byte ptr [rdi + r10], al
	inc	r10
	inc	rbx
	jne	LBB0_22
LBB0_23:
	cmp	rdx, 3
	jb	LBB0_26
## %bb.24:
	sub	r8, r10
	lea	rdx, [rdi + r10 + 3]
	add	r12, r10
	lea	rax, [rsi + r12 + 3]
	xor	esi, esi
	.p2align	4, 0x90
LBB0_25:                                ## =>This Inner Loop Header: Depth=1
	movzx	ebx, byte ptr [rax + rsi - 3]
	mov	byte ptr [rdx + rsi - 3], bl
	movzx	ebx, byte ptr [rax + rsi - 2]
	mov	byte ptr [rdx + rsi - 2], bl
	movzx	ebx, byte ptr [rax + rsi - 1]
	mov	byte ptr [rdx + rsi - 1], bl
	movzx	ebx, byte ptr [rax + rsi]
	mov	byte ptr [rdx + rsi], bl
	add	rsi, 4
	cmp	r8, rsi
	jne	LBB0_25
	jmp	LBB0_26
LBB0_7:
	pxor	xmm11, xmm11
	xor	r12d, r12d
	pxor	xmm8, xmm8
	pxor	xmm9, xmm9
	pxor	xmm1, xmm1
	cmp	r12, rdx
	jb	LBB0_4
LBB0_8:
	pcmpgtb	xmm9, xmmword ptr [rip + LCPI0_10]
	por	xmm1, xmm9
	jmp	LBB0_27
LBB0_12:
	mov	r10, r8
	and	r10, -32
	lea	r14, [r10 - 32]
	mov	rbx, r14
	shr	rbx, 5
	lea	r11d, [rbx + 1]
	and	r11d, 3
	cmp	r14, 96
	jae	LBB0_14
## %bb.13:
	xor	ebx, ebx
	test	r11, r11
	jne	LBB0_17
	jmp	LBB0_19
LBB0_14:
	lea	r14, [rsi + r12 + 112]
	lea	r15, [r11 - 1]
	sub	r15, rbx
	xor	ebx, ebx
	.p2align	4, 0x90
LBB0_15:                                ## =>This Inner Loop Header: Depth=1
	movups	xmm0, xmmword ptr [r14 + rbx - 112]
	movups	xmm2, xmmword ptr [r14 + rbx - 96]
	movups	xmmword ptr [rdi + rbx], xmm0
	movups	xmmword ptr [rdi + rbx + 16], xmm2
	movups	xmm0, xmmword ptr [r14 + rbx - 80]
	movups	xmm2, xmmword ptr [r14 + rbx - 64]
	movups	xmmword ptr [rdi + rbx + 32], xmm0
	movups	xmmword ptr [rdi + rbx + 48], xmm2
	movups	xmm0, xmmword ptr [r14 + rbx - 48]
	movups	xmm2, xmmword ptr [r14 + rbx - 32]
	movups	xmmword ptr [rdi + rbx + 64], xmm0
	movups	xmmword ptr [rdi + rbx + 80], xmm2
	movdqu	xmm0, xmmword ptr [r14 + rbx - 16]
	movdqu	xmm2, xmmword ptr [r14 + rbx]
	movdqu	xmmword ptr [rdi + rbx + 96], xmm0
	movdqu	xmmword ptr [rdi + rbx + 112], xmm2
	sub	rbx, -128
	add	r15, 4
	jne	LBB0_15
## %bb.16:
	test	r11, r11
	je	LBB0_19
LBB0_17:
	lea	r14, [rsi + r12 + 16]
	neg	r11
	.p2align	4, 0x90
LBB0_18:                                ## =>This Inner Loop Header: Depth=1
	movdqu	xmm0, xmmword ptr [r14 + rbx - 16]
	movdqu	xmm2, xmmword ptr [r14 + rbx]
	movdqu	xmmword ptr [rdi + rbx], xmm0
	movdqu	xmmword ptr [rdi + rbx + 16], xmm2
	add	rbx, 32
	inc	r11
	jne	LBB0_18
LBB0_19:
	cmp	r8, r10
	jne	LBB0_20
LBB0_26:
	movdqu	xmm4, xmmword ptr [rdi]
	movdqa	xmm5, xmm4
	psrlw	xmm5, 4
	movdqa	xmm6, xmmword ptr [rip + LCPI0_1] ## xmm6 = [244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244]
	movdqa	xmm0, xmm4
	psubusb	xmm0, xmm6
	pand	xmm5, xmmword ptr [rip + LCPI0_0]
	por	xmm1, xmm0
	movdqa	xmm0, xmmword ptr [rip + LCPI0_2] ## xmm0 = [1,1,1,1,1,1,1,1,0,0,0,0,2,2,3,4]
	pshufb	xmm0, xmm5
	movdqa	xmm3, xmm0
	palignr	xmm3, xmm9, 15          ## xmm3 = xmm9[15],xmm3[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
	movdqa	xmm2, xmmword ptr [rip + LCPI0_3] ## xmm2 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
	psubusb	xmm3, xmm2
	paddb	xmm3, xmm0
	movdqa	xmm7, xmm3
	palignr	xmm7, xmm9, 14          ## xmm7 = xmm9[14,15],xmm7[0,1,2,3,4,5,6,7,8,9,10,11,12,13]
	psubusb	xmm7, xmmword ptr [rip + LCPI0_4]
	paddb	xmm7, xmm3
	pcmpgtb	xmm7, xmm0
	pcmpgtb	xmm2, xmm0
	pxor	xmm2, xmm7
	movdqa	xmm0, xmm4
	palignr	xmm0, xmm11, 15         ## xmm0 = xmm11[15],xmm0[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
	movdqa	xmm3, xmmword ptr [rip + LCPI0_5] ## xmm3 = [237,237,237,237,237,237,237,237,237,237,237,237,237,237,237,237]
	pcmpeqb	xmm3, xmm0
	pcmpeqb	xmm6, xmm0
	movdqa	xmm7, xmm4
	pcmpgtb	xmm7, xmmword ptr [rip + LCPI0_6]
	pand	xmm7, xmm3
	movdqa	xmm3, xmm4
	pcmpgtb	xmm3, xmmword ptr [rip + LCPI0_7]
	pand	xmm3, xmm6
	por	xmm3, xmm7
	por	xmm3, xmm1
	palignr	xmm5, xmm8, 15          ## xmm5 = xmm8[15],xmm5[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
	movdqa	xmm6, xmmword ptr [rip + LCPI0_8] ## xmm6 = [128,128,128,128,128,128,128,128,128,128,128,128,194,128,225,241]
	pshufb	xmm6, xmm5
	pcmpgtb	xmm6, xmm0
	movdqa	xmm1, xmmword ptr [rip + LCPI0_9] ## xmm1 = [128,128,128,128,128,128,128,128,128,128,128,128,127,127,160,144]
	pshufb	xmm1, xmm5
	pcmpgtb	xmm1, xmm4
	pand	xmm1, xmm6
	por	xmm1, xmm3
	por	xmm1, xmm2
LBB0_27:
	xor	eax, eax
	ptest	xmm1, xmm1
	sete	al
	mov	qword ptr [rcx], rax
	lea	rsp, [rbp - 32]
	pop	rbx
	pop	r12
	pop	r14
	pop	r15
	pop	rbp
	ret
                                        ## -- End function

.subsections_via_symbols
