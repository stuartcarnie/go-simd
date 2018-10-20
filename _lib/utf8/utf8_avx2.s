	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14
	.intel_syntax noprefix
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function validate_utf8_fast_avx2
LCPI0_0:
	.quad	1085102592571150095     ## 0xf0f0f0f0f0f0f0f
	.section	__TEXT,__const
	.p2align	5
LCPI0_1:
	.space	32,244
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
	.space	32,1
LCPI0_4:
	.space	32,2
LCPI0_5:
	.space	32,237
LCPI0_6:
	.space	32,159
LCPI0_7:
	.space	32,143
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
	jb	LBB0_5
## %bb.1:
	lea	r8, [rdx - 32]
	vpxor	xmm3, xmm3, xmm3
	xor	r12d, r12d
	vpbroadcastq	ymm4, qword ptr [rip + LCPI0_0] ## ymm4 = [1085102592571150095,1085102592571150095,1085102592571150095,1085102592571150095]
	vmovdqa	ymm5, ymmword ptr [rip + LCPI0_1] ## ymm5 = [244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244]
	vmovdqa	ymm7, ymmword ptr [rip + LCPI0_3] ## ymm7 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
	vmovdqa	ymm11, ymmword ptr [rip + LCPI0_7] ## ymm11 = [143,143,143,143,143,143,143,143,143,143,143,143,143,143,143,143,143,143,143,143,143,143,143,143,143,143,143,143,143,143,143,143]
	vmovdqa	ymm12, ymmword ptr [rip + LCPI0_8] ## ymm12 = [128,128,128,128,128,128,128,128,128,128,128,128,194,128,225,241,128,128,128,128,128,128,128,128,128,128,128,128,194,128,225,241]
	vmovdqa	ymm13, ymmword ptr [rip + LCPI0_9] ## ymm13 = [128,128,128,128,128,128,128,128,128,128,128,128,127,127,160,144,128,128,128,128,128,128,128,128,128,128,128,128,127,127,160,144]
	vpxor	xmm2, xmm2, xmm2
	vpxor	xmm0, xmm0, xmm0
	vpxor	xmm1, xmm1, xmm1
	.p2align	4, 0x90
LBB0_2:                                 ## =>This Inner Loop Header: Depth=1
	vmovdqa	ymm14, ymm1
	vmovdqa	ymm15, ymm0
	vmovdqu	ymm1, ymmword ptr [rsi + r12]
	vpsrlw	ymm0, ymm1, 4
	vpand	ymm0, ymm0, ymm4
	vpsubusb	ymm6, ymm1, ymm5
	vpor	ymm3, ymm3, ymm6
	vmovdqa	ymm6, ymmword ptr [rip + LCPI0_2] ## ymm6 = [1,1,1,1,1,1,1,1,0,0,0,0,2,2,3,4,1,1,1,1,1,1,1,1,0,0,0,0,2,2,3,4]
	vpshufb	ymm6, ymm6, ymm0
	vperm2i128	ymm8, ymm2, ymm6, 33 ## ymm8 = ymm2[2,3],ymm6[0,1]
	vpalignr	ymm8, ymm6, ymm8, 15 ## ymm8 = ymm8[15],ymm6[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14],ymm8[31],ymm6[16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
	vpsubusb	ymm8, ymm8, ymm7
	vpaddb	ymm8, ymm8, ymm6
	vperm2i128	ymm2, ymm2, ymm8, 33 ## ymm2 = ymm2[2,3],ymm8[0,1]
	vpalignr	ymm2, ymm8, ymm2, 14 ## ymm2 = ymm2[14,15],ymm8[0,1,2,3,4,5,6,7,8,9,10,11,12,13],ymm2[30,31],ymm8[16,17,18,19,20,21,22,23,24,25,26,27,28,29]
	vpsubusb	ymm2, ymm2, ymmword ptr [rip + LCPI0_4]
	vpaddb	ymm2, ymm2, ymm8
	vpcmpgtb	ymm8, ymm2, ymm6
	vpcmpgtb	ymm6, ymm7, ymm6
	vpxor	ymm6, ymm8, ymm6
	vperm2i128	ymm8, ymm14, ymm1, 33 ## ymm8 = ymm14[2,3],ymm1[0,1]
	vpalignr	ymm8, ymm1, ymm8, 15 ## ymm8 = ymm8[15],ymm1[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14],ymm8[31],ymm1[16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
	vpcmpeqb	ymm14, ymm8, ymmword ptr [rip + LCPI0_5]
	vpcmpeqb	ymm9, ymm8, ymm5
	vpcmpgtb	ymm10, ymm1, ymmword ptr [rip + LCPI0_6]
	vpand	ymm10, ymm14, ymm10
	vpcmpgtb	ymm14, ymm1, ymm11
	vpand	ymm9, ymm9, ymm14
	vpor	ymm9, ymm9, ymm10
	vpor	ymm3, ymm3, ymm9
	vperm2i128	ymm9, ymm15, ymm0, 33 ## ymm9 = ymm15[2,3],ymm0[0,1]
	vpalignr	ymm9, ymm0, ymm9, 15 ## ymm9 = ymm9[15],ymm0[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14],ymm9[31],ymm0[16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
	vpshufb	ymm10, ymm12, ymm9
	vpcmpgtb	ymm8, ymm10, ymm8
	vpshufb	ymm9, ymm13, ymm9
	vpcmpgtb	ymm9, ymm9, ymm1
	vpand	ymm8, ymm9, ymm8
	vpor	ymm3, ymm3, ymm8
	vpor	ymm3, ymm6, ymm3
	add	r12, 32
	cmp	r12, r8
	jbe	LBB0_2
## %bb.3:
	vmovdqa	ymm4, ymm2
	cmp	r12, rdx
	jb	LBB0_6
LBB0_4:
	vpcmpgtb	ymm0, ymm4, ymmword ptr [rip + LCPI0_10]
	vpor	ymm0, ymm3, ymm0
	jmp	LBB0_27
LBB0_5:
	vpxor	xmm1, xmm1, xmm1
	xor	r12d, r12d
	vpxor	xmm0, xmm0, xmm0
	vpxor	xmm4, xmm4, xmm4
	vpxor	xmm2, xmm2, xmm2
	vpxor	xmm3, xmm3, xmm3
	cmp	r12, rdx
	jae	LBB0_4
LBB0_6:
	vpxor	xmm4, xmm4, xmm4
	vmovdqu	xmmword ptr [rdi], xmm4
	vmovdqu	xmmword ptr [rdi + 16], xmm4
	mov	r8, rdx
	sub	r8, r12
	je	LBB0_26
## %bb.7:
	lea	r9, [rsi + r12]
	cmp	r8, 32
	jb	LBB0_8
## %bb.9:
	lea	rbx, [rsi + rdx]
	cmp	rdi, rbx
	jae	LBB0_12
## %bb.10:
	lea	rbx, [rdi + r8]
	cmp	r9, rbx
	jae	LBB0_12
LBB0_8:
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
LBB0_12:
	mov	r10, r8
	and	r10, -32
	lea	r14, [r10 - 32]
	mov	rbx, r14
	shr	rbx, 5
	lea	r11d, [rbx + 1]
	and	r11d, 7
	cmp	r14, 224
	jae	LBB0_14
## %bb.13:
	xor	ebx, ebx
	test	r11, r11
	jne	LBB0_17
	jmp	LBB0_19
LBB0_14:
	lea	r14, [rsi + r12 + 224]
	lea	r15, [r11 - 1]
	sub	r15, rbx
	xor	ebx, ebx
	.p2align	4, 0x90
LBB0_15:                                ## =>This Inner Loop Header: Depth=1
	vmovups	ymm4, ymmword ptr [r14 + rbx - 224]
	vmovups	ymmword ptr [rdi + rbx], ymm4
	vmovups	ymm4, ymmword ptr [r14 + rbx - 192]
	vmovups	ymmword ptr [rdi + rbx + 32], ymm4
	vmovups	ymm4, ymmword ptr [r14 + rbx - 160]
	vmovups	ymmword ptr [rdi + rbx + 64], ymm4
	vmovups	ymm4, ymmword ptr [r14 + rbx - 128]
	vmovups	ymmword ptr [rdi + rbx + 96], ymm4
	vmovups	ymm4, ymmword ptr [r14 + rbx - 96]
	vmovups	ymmword ptr [rdi + rbx + 128], ymm4
	vmovups	ymm4, ymmword ptr [r14 + rbx - 64]
	vmovups	ymmword ptr [rdi + rbx + 160], ymm4
	vmovups	ymm4, ymmword ptr [r14 + rbx - 32]
	vmovups	ymmword ptr [rdi + rbx + 192], ymm4
	vmovdqu	ymm4, ymmword ptr [r14 + rbx]
	vmovdqu	ymmword ptr [rdi + rbx + 224], ymm4
	add	rbx, 256
	add	r15, 8
	jne	LBB0_15
## %bb.16:
	test	r11, r11
	je	LBB0_19
LBB0_17:
	neg	r11
	.p2align	4, 0x90
LBB0_18:                                ## =>This Inner Loop Header: Depth=1
	vmovdqu	ymm4, ymmword ptr [r9 + rbx]
	vmovdqu	ymmword ptr [rdi + rbx], ymm4
	add	rbx, 32
	inc	r11
	jne	LBB0_18
LBB0_19:
	cmp	r8, r10
	jne	LBB0_20
LBB0_26:
	vmovdqu	ymm4, ymmword ptr [rdi]
	vpsrlw	ymm5, ymm4, 4
	vpbroadcastq	ymm6, qword ptr [rip + LCPI0_0] ## ymm6 = [1085102592571150095,1085102592571150095,1085102592571150095,1085102592571150095]
	vpand	ymm5, ymm5, ymm6
	vmovdqa	ymm6, ymmword ptr [rip + LCPI0_1] ## ymm6 = [244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244]
	vpsubusb	ymm7, ymm4, ymm6
	vpor	ymm3, ymm3, ymm7
	vmovdqa	ymm7, ymmword ptr [rip + LCPI0_2] ## ymm7 = [1,1,1,1,1,1,1,1,0,0,0,0,2,2,3,4,1,1,1,1,1,1,1,1,0,0,0,0,2,2,3,4]
	vpshufb	ymm7, ymm7, ymm5
	vperm2i128	ymm8, ymm2, ymm7, 33 ## ymm8 = ymm2[2,3],ymm7[0,1]
	vpalignr	ymm8, ymm7, ymm8, 15 ## ymm8 = ymm8[15],ymm7[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14],ymm8[31],ymm7[16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
	vmovdqa	ymm9, ymmword ptr [rip + LCPI0_3] ## ymm9 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
	vpsubusb	ymm8, ymm8, ymm9
	vpaddb	ymm8, ymm8, ymm7
	vperm2i128	ymm2, ymm2, ymm8, 33 ## ymm2 = ymm2[2,3],ymm8[0,1]
	vpalignr	ymm2, ymm8, ymm2, 14 ## ymm2 = ymm2[14,15],ymm8[0,1,2,3,4,5,6,7,8,9,10,11,12,13],ymm2[30,31],ymm8[16,17,18,19,20,21,22,23,24,25,26,27,28,29]
	vpsubusb	ymm2, ymm2, ymmword ptr [rip + LCPI0_4]
	vpaddb	ymm2, ymm2, ymm8
	vpcmpgtb	ymm2, ymm2, ymm7
	vpcmpgtb	ymm7, ymm9, ymm7
	vpxor	ymm2, ymm2, ymm7
	vperm2i128	ymm1, ymm1, ymm4, 33 ## ymm1 = ymm1[2,3],ymm4[0,1]
	vpalignr	ymm1, ymm4, ymm1, 15 ## ymm1 = ymm1[15],ymm4[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14],ymm1[31],ymm4[16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
	vpcmpeqb	ymm7, ymm1, ymmword ptr [rip + LCPI0_5]
	vpcmpeqb	ymm6, ymm1, ymm6
	vpcmpgtb	ymm8, ymm4, ymmword ptr [rip + LCPI0_6]
	vpand	ymm7, ymm7, ymm8
	vpcmpgtb	ymm8, ymm4, ymmword ptr [rip + LCPI0_7]
	vpand	ymm6, ymm6, ymm8
	vpor	ymm6, ymm6, ymm7
	vpor	ymm3, ymm3, ymm6
	vperm2i128	ymm0, ymm0, ymm5, 33 ## ymm0 = ymm0[2,3],ymm5[0,1]
	vpalignr	ymm0, ymm5, ymm0, 15 ## ymm0 = ymm0[15],ymm5[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14],ymm0[31],ymm5[16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
	vmovdqa	ymm5, ymmword ptr [rip + LCPI0_8] ## ymm5 = [128,128,128,128,128,128,128,128,128,128,128,128,194,128,225,241,128,128,128,128,128,128,128,128,128,128,128,128,194,128,225,241]
	vpshufb	ymm5, ymm5, ymm0
	vpcmpgtb	ymm1, ymm5, ymm1
	vmovdqa	ymm5, ymmword ptr [rip + LCPI0_9] ## ymm5 = [128,128,128,128,128,128,128,128,128,128,128,128,127,127,160,144,128,128,128,128,128,128,128,128,128,128,128,128,127,127,160,144]
	vpshufb	ymm0, ymm5, ymm0
	vpcmpgtb	ymm0, ymm0, ymm4
	vpand	ymm0, ymm0, ymm1
	vpor	ymm0, ymm3, ymm0
	vpor	ymm0, ymm2, ymm0
LBB0_27:
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
