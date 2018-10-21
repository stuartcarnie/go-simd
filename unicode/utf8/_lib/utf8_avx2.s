	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14
	.intel_syntax noprefix
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function validate_utf8_fast_avx2
LCPI0_0:
	.quad	-9187201950435737472    ## 0x8080808080808080
LCPI0_2:
	.quad	1085102592571150095     ## 0xf0f0f0f0f0f0f0f
	.section	__TEXT,__const
	.p2align	5
LCPI0_1:
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
	.byte	9                       ## 0x9
	.byte	1                       ## 0x1
LCPI0_3:
	.space	32,244
LCPI0_4:
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
LCPI0_5:
	.space	32,1
LCPI0_6:
	.space	32,2
LCPI0_7:
	.space	32,237
LCPI0_8:
	.space	32,159
LCPI0_9:
	.space	32,143
LCPI0_10:
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
LCPI0_11:
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
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_validate_utf8_fast_avx2
	.p2align	4, 0x90
_validate_utf8_fast_avx2:               ## @validate_utf8_fast_avx2
## %bb.0:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r12
	push	rbx
	and	rsp, -8
	cmp	rdx, 32
	jb	LBB0_9
## %bb.1:
	lea	r8, [rdx - 32]
	vpxor	xmm0, xmm0, xmm0
	xor	r12d, r12d
	vpbroadcastq	ymm4, qword ptr [rip + LCPI0_0] ## ymm4 = [9259542123273814144,9259542123273814144,9259542123273814144,9259542123273814144]
	vpbroadcastq	ymm5, qword ptr [rip + LCPI0_2] ## ymm5 = [1085102592571150095,1085102592571150095,1085102592571150095,1085102592571150095]
	vmovdqa	ymm6, ymmword ptr [rip + LCPI0_3] ## ymm6 = [244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244]
	vmovdqa	ymm8, ymmword ptr [rip + LCPI0_5] ## ymm8 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
	vmovdqa	ymm14, ymmword ptr [rip + LCPI0_11] ## ymm14 = [128,128,128,128,128,128,128,128,128,128,128,128,127,127,160,144,128,128,128,128,128,128,128,128,128,128,128,128,127,127,160,144]
	vmovdqa	ymm15, ymmword ptr [rip + LCPI0_1] ## ymm15 = [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,1]
	vpxor	xmm2, xmm2, xmm2
	vpxor	xmm9, xmm9, xmm9
	vpxor	xmm7, xmm7, xmm7
	.p2align	4, 0x90
LBB0_2:                                 ## =>This Inner Loop Header: Depth=1
	vmovdqu	ymm3, ymmword ptr [rsi + r12]
	vptest	ymm3, ymm4
	jne	LBB0_4
## %bb.3:                               ##   in Loop: Header=BB0_2 Depth=1
	vpcmpgtb	ymm1, ymm2, ymm15
	vpor	ymm0, ymm0, ymm1
	add	r12, 32
	cmp	r12, r8
	jbe	LBB0_2
	jmp	LBB0_5
	.p2align	4, 0x90
LBB0_4:                                 ##   in Loop: Header=BB0_2 Depth=1
	vpsrlw	ymm1, ymm3, 4
	vpand	ymm1, ymm1, ymm5
	vmovdqa	ymm10, ymmword ptr [rip + LCPI0_4] ## ymm10 = [1,1,1,1,1,1,1,1,0,0,0,0,2,2,3,4,1,1,1,1,1,1,1,1,0,0,0,0,2,2,3,4]
	vpshufb	ymm10, ymm10, ymm1
	vperm2i128	ymm11, ymm2, ymm10, 33 ## ymm11 = ymm2[2,3],ymm10[0,1]
	vpalignr	ymm11, ymm10, ymm11, 15 ## ymm11 = ymm11[15],ymm10[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14],ymm11[31],ymm10[16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
	vpsubusb	ymm11, ymm11, ymm8
	vpaddb	ymm11, ymm11, ymm10
	vperm2i128	ymm2, ymm2, ymm11, 33 ## ymm2 = ymm2[2,3],ymm11[0,1]
	vpalignr	ymm2, ymm11, ymm2, 14 ## ymm2 = ymm2[14,15],ymm11[0,1,2,3,4,5,6,7,8,9,10,11,12,13],ymm2[30,31],ymm11[16,17,18,19,20,21,22,23,24,25,26,27,28,29]
	vpsubusb	ymm2, ymm2, ymmword ptr [rip + LCPI0_6]
	vpaddb	ymm2, ymm2, ymm11
	vpcmpgtb	ymm11, ymm2, ymm10
	vpcmpgtb	ymm10, ymm8, ymm10
	vpxor	ymm10, ymm11, ymm10
	vperm2i128	ymm7, ymm7, ymm3, 33 ## ymm7 = ymm7[2,3],ymm3[0,1]
	vpalignr	ymm7, ymm3, ymm7, 15 ## ymm7 = ymm7[15],ymm3[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14],ymm7[31],ymm3[16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
	vpcmpeqb	ymm11, ymm7, ymmword ptr [rip + LCPI0_7]
	vpcmpeqb	ymm12, ymm7, ymm6
	vpcmpgtb	ymm13, ymm3, ymmword ptr [rip + LCPI0_8]
	vpand	ymm11, ymm11, ymm13
	vpcmpgtb	ymm13, ymm3, ymmword ptr [rip + LCPI0_9]
	vpand	ymm12, ymm12, ymm13
	vpor	ymm11, ymm12, ymm11
	vperm2i128	ymm9, ymm9, ymm1, 33 ## ymm9 = ymm9[2,3],ymm1[0,1]
	vpalignr	ymm9, ymm1, ymm9, 15 ## ymm9 = ymm9[15],ymm1[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14],ymm9[31],ymm1[16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
	vmovdqa	ymm12, ymmword ptr [rip + LCPI0_10] ## ymm12 = [128,128,128,128,128,128,128,128,128,128,128,128,194,128,225,241,128,128,128,128,128,128,128,128,128,128,128,128,194,128,225,241]
	vpshufb	ymm12, ymm12, ymm9
	vpcmpgtb	ymm7, ymm12, ymm7
	vpshufb	ymm9, ymm14, ymm9
	vpcmpgtb	ymm9, ymm9, ymm3
	vpand	ymm7, ymm9, ymm7
	vpor	ymm0, ymm0, ymm11
	vpsubusb	ymm9, ymm3, ymm6
	vpor	ymm0, ymm0, ymm9
	vpor	ymm0, ymm0, ymm7
	vpor	ymm0, ymm10, ymm0
	vmovdqa	ymm9, ymm1
	vmovdqa	ymm7, ymm3
	add	r12, 32
	cmp	r12, r8
	jbe	LBB0_2
LBB0_5:
	cmp	r12, rdx
	jae	LBB0_10
LBB0_6:
	vpxor	xmm1, xmm1, xmm1
	vmovdqu	xmmword ptr [rdi], xmm1
	vmovdqu	xmmword ptr [rdi + 16], xmm1
	mov	r8, rdx
	sub	r8, r12
	je	LBB0_28
## %bb.7:
	lea	r9, [rsi + r12]
	cmp	r8, 32
	jb	LBB0_8
## %bb.11:
	lea	rbx, [rsi + rdx]
	cmp	rdi, rbx
	jae	LBB0_14
## %bb.12:
	lea	rbx, [rdi + r8]
	cmp	r9, rbx
	jae	LBB0_14
LBB0_8:
	xor	r10d, r10d
LBB0_22:
	mov	ebx, edx
	sub	ebx, r12d
	dec	rdx
	sub	rdx, r10
	sub	rdx, r12
	and	rbx, 3
	je	LBB0_25
## %bb.23:
	neg	rbx
	.p2align	4, 0x90
LBB0_24:                                ## =>This Inner Loop Header: Depth=1
	movzx	eax, byte ptr [r9 + r10]
	mov	byte ptr [rdi + r10], al
	inc	r10
	inc	rbx
	jne	LBB0_24
LBB0_25:
	cmp	rdx, 3
	jb	LBB0_28
## %bb.26:
	sub	r8, r10
	lea	rdx, [rdi + r10 + 3]
	add	r12, r10
	lea	rax, [rsi + r12 + 3]
	xor	esi, esi
	.p2align	4, 0x90
LBB0_27:                                ## =>This Inner Loop Header: Depth=1
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
	jne	LBB0_27
	jmp	LBB0_28
LBB0_9:
	vpxor	xmm7, xmm7, xmm7
	xor	r12d, r12d
	vpxor	xmm9, xmm9, xmm9
	vpxor	xmm2, xmm2, xmm2
	vpxor	xmm0, xmm0, xmm0
	cmp	r12, rdx
	jb	LBB0_6
LBB0_10:
	vpcmpgtb	ymm1, ymm2, ymmword ptr [rip + LCPI0_1]
	vpor	ymm0, ymm0, ymm1
	jmp	LBB0_29
LBB0_14:
	mov	r10, r8
	and	r10, -32
	lea	r14, [r10 - 32]
	mov	rbx, r14
	shr	rbx, 5
	lea	r11d, [rbx + 1]
	and	r11d, 7
	cmp	r14, 224
	jae	LBB0_16
## %bb.15:
	xor	ebx, ebx
	test	r11, r11
	jne	LBB0_19
	jmp	LBB0_21
LBB0_16:
	lea	r14, [rsi + r12 + 224]
	lea	r15, [r11 - 1]
	sub	r15, rbx
	xor	ebx, ebx
	.p2align	4, 0x90
LBB0_17:                                ## =>This Inner Loop Header: Depth=1
	vmovups	ymm1, ymmword ptr [r14 + rbx - 224]
	vmovups	ymmword ptr [rdi + rbx], ymm1
	vmovups	ymm1, ymmword ptr [r14 + rbx - 192]
	vmovups	ymmword ptr [rdi + rbx + 32], ymm1
	vmovups	ymm1, ymmword ptr [r14 + rbx - 160]
	vmovups	ymmword ptr [rdi + rbx + 64], ymm1
	vmovups	ymm1, ymmword ptr [r14 + rbx - 128]
	vmovups	ymmword ptr [rdi + rbx + 96], ymm1
	vmovups	ymm1, ymmword ptr [r14 + rbx - 96]
	vmovups	ymmword ptr [rdi + rbx + 128], ymm1
	vmovups	ymm1, ymmword ptr [r14 + rbx - 64]
	vmovups	ymmword ptr [rdi + rbx + 160], ymm1
	vmovups	ymm1, ymmword ptr [r14 + rbx - 32]
	vmovups	ymmword ptr [rdi + rbx + 192], ymm1
	vmovdqu	ymm1, ymmword ptr [r14 + rbx]
	vmovdqu	ymmword ptr [rdi + rbx + 224], ymm1
	add	rbx, 256
	add	r15, 8
	jne	LBB0_17
## %bb.18:
	test	r11, r11
	je	LBB0_21
LBB0_19:
	neg	r11
	.p2align	4, 0x90
LBB0_20:                                ## =>This Inner Loop Header: Depth=1
	vmovdqu	ymm1, ymmword ptr [r9 + rbx]
	vmovdqu	ymmword ptr [rdi + rbx], ymm1
	add	rbx, 32
	inc	r11
	jne	LBB0_20
LBB0_21:
	cmp	r8, r10
	jne	LBB0_22
LBB0_28:
	vmovdqu	ymm3, ymmword ptr [rdi]
	vpsrlw	ymm1, ymm3, 4
	vpbroadcastq	ymm4, qword ptr [rip + LCPI0_2] ## ymm4 = [1085102592571150095,1085102592571150095,1085102592571150095,1085102592571150095]
	vpand	ymm1, ymm1, ymm4
	vmovdqa	ymm4, ymmword ptr [rip + LCPI0_3] ## ymm4 = [244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244]
	vpsubusb	ymm5, ymm3, ymm4
	vpor	ymm0, ymm0, ymm5
	vmovdqa	ymm5, ymmword ptr [rip + LCPI0_4] ## ymm5 = [1,1,1,1,1,1,1,1,0,0,0,0,2,2,3,4,1,1,1,1,1,1,1,1,0,0,0,0,2,2,3,4]
	vpshufb	ymm5, ymm5, ymm1
	vperm2i128	ymm6, ymm2, ymm5, 33 ## ymm6 = ymm2[2,3],ymm5[0,1]
	vpalignr	ymm6, ymm5, ymm6, 15 ## ymm6 = ymm6[15],ymm5[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14],ymm6[31],ymm5[16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
	vmovdqa	ymm8, ymmword ptr [rip + LCPI0_5] ## ymm8 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
	vpsubusb	ymm6, ymm6, ymm8
	vpaddb	ymm6, ymm6, ymm5
	vperm2i128	ymm2, ymm2, ymm6, 33 ## ymm2 = ymm2[2,3],ymm6[0,1]
	vpalignr	ymm2, ymm6, ymm2, 14 ## ymm2 = ymm2[14,15],ymm6[0,1,2,3,4,5,6,7,8,9,10,11,12,13],ymm2[30,31],ymm6[16,17,18,19,20,21,22,23,24,25,26,27,28,29]
	vpsubusb	ymm2, ymm2, ymmword ptr [rip + LCPI0_6]
	vpaddb	ymm2, ymm2, ymm6
	vpcmpgtb	ymm2, ymm2, ymm5
	vpcmpgtb	ymm5, ymm8, ymm5
	vpxor	ymm2, ymm2, ymm5
	vperm2i128	ymm5, ymm7, ymm3, 33 ## ymm5 = ymm7[2,3],ymm3[0,1]
	vpalignr	ymm5, ymm3, ymm5, 15 ## ymm5 = ymm5[15],ymm3[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14],ymm5[31],ymm3[16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
	vpcmpeqb	ymm6, ymm5, ymmword ptr [rip + LCPI0_7]
	vpcmpeqb	ymm4, ymm5, ymm4
	vpcmpgtb	ymm7, ymm3, ymmword ptr [rip + LCPI0_8]
	vpand	ymm6, ymm6, ymm7
	vpcmpgtb	ymm7, ymm3, ymmword ptr [rip + LCPI0_9]
	vpand	ymm4, ymm4, ymm7
	vpor	ymm4, ymm4, ymm6
	vpor	ymm0, ymm0, ymm4
	vperm2i128	ymm4, ymm9, ymm1, 33 ## ymm4 = ymm9[2,3],ymm1[0,1]
	vpalignr	ymm1, ymm1, ymm4, 15 ## ymm1 = ymm4[15],ymm1[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14],ymm4[31],ymm1[16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
	vmovdqa	ymm4, ymmword ptr [rip + LCPI0_10] ## ymm4 = [128,128,128,128,128,128,128,128,128,128,128,128,194,128,225,241,128,128,128,128,128,128,128,128,128,128,128,128,194,128,225,241]
	vpshufb	ymm4, ymm4, ymm1
	vpcmpgtb	ymm4, ymm4, ymm5
	vmovdqa	ymm5, ymmword ptr [rip + LCPI0_11] ## ymm5 = [128,128,128,128,128,128,128,128,128,128,128,128,127,127,160,144,128,128,128,128,128,128,128,128,128,128,128,128,127,127,160,144]
	vpshufb	ymm1, ymm5, ymm1
	vpcmpgtb	ymm1, ymm1, ymm3
	vpand	ymm1, ymm1, ymm4
	vpor	ymm0, ymm0, ymm1
	vpor	ymm0, ymm2, ymm0
LBB0_29:
	xor	eax, eax
	vptest	ymm0, ymm0
	sete	al
	mov	qword ptr [rcx], rax
	lea	rsp, [rbp - 32]
	pop	rbx
	pop	r12
	pop	r14
	pop	r15
	pop	rbp
	vzeroupper
	ret
                                        ## -- End function

.subsections_via_symbols
