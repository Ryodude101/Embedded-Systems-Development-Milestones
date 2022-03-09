	.cpu cortex-m4
	.arch armv7e-m
	.fpu fpv4-sp-d16
	.eabi_attribute 27, 1
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 1
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"Racolon42_c.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.ttu_set_main_pll,"ax",%progbits
	.align	1
	.global	ttu_set_main_pll
	.syntax unified
	.thumb
	.thumb_func
	.type	ttu_set_main_pll, %function
ttu_set_main_pll:
.LVL0:
.LFB0:
	.file 1 "Source/Racolon42_c.c"
	.loc 1 20 45 view -0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 20 45 is_stmt 0 view .LVU1
	push	{r4, lr}
.LCFI0:
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
.LCFI1:
	.cfi_def_cfa_offset 16
	.loc 1 32 5 is_stmt 1 view .LVU2
.LVL1:
	.loc 1 33 5 view .LVU3
	.loc 1 34 5 view .LVU4
	.loc 1 36 5 view .LVU5
	.loc 1 36 27 is_stmt 0 view .LVU6
	sub	r1, r0, #8000
	.loc 1 36 7 view .LVU7
	ldr	r3, .L13
	cmp	r1, r3
	bls	.L2
	.loc 1 37 7 is_stmt 1 view .LVU8
	.syntax unified
@ 37 "Source/Racolon42_c.c" 1
	nop
@ 0 "" 2
	.loc 1 34 14 is_stmt 0 view .LVU9
	.thumb
	.syntax unified
	movs	r2, #16
	.loc 1 33 14 view .LVU10
	movs	r1, #4
	.loc 1 32 14 view .LVU11
	mov	r0, r1
.LVL2:
.L3:
	.loc 1 66 5 is_stmt 1 view .LVU12
	str	r0, [sp, #4]
	movs	r0, #2
.LVL3:
	.loc 1 66 5 is_stmt 0 view .LVU13
	str	r0, [sp]
	movs	r3, #7
	bl	rcc_set_main_pll
.LVL4:
	.loc 1 67 5 is_stmt 1 view .LVU14
	.loc 1 68 1 is_stmt 0 view .LVU15
	add	sp, sp, #8
.LCFI2:
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	@ sp needed
	pop	{r4, pc}
.LVL5:
.L2:
.LCFI3:
	.cfi_restore_state
	.loc 1 68 1 view .LVU16
	mov	r2, r0
.LBB2:
	.loc 1 40 7 is_stmt 1 view .LVU17
.LVL6:
	.loc 1 41 7 view .LVU18
	.loc 1 44 7 view .LVU19
	.loc 1 44 16 is_stmt 0 view .LVU20
	lsl	ip, r0, #3
.LVL7:
	.loc 1 45 7 is_stmt 1 view .LVU21
	.loc 1 40 13 is_stmt 0 view .LVU22
	movs	r0, #8
.LVL8:
	.loc 1 45 12 view .LVU23
	b	.L4
.LVL9:
.L5:
	.loc 1 46 9 is_stmt 1 view .LVU24
	.loc 1 46 22 is_stmt 0 view .LVU25
	subs	r0, r0, #1
.LVL10:
	.loc 1 46 22 view .LVU26
	mul	ip, r0, r2
.LVL11:
.L4:
	.loc 1 45 12 is_stmt 1 view .LVU27
	ldr	r3, .L13+4
	cmp	ip, r3
	bhi	.L5
	.loc 1 49 11 is_stmt 0 view .LVU28
	movs	r4, #1
.LBE2:
	.loc 1 34 14 view .LVU29
	movs	r2, #16
.LVL12:
.LBB3:
	.loc 1 41 13 view .LVU30
	movs	r1, #8
.LVL13:
	.loc 1 41 13 view .LVU31
	b	.L6
.LVL14:
.L7:
	.loc 1 54 11 is_stmt 1 view .LVU32
	adds	r2, r2, #1
.LVL15:
.L9:
	.loc 1 53 14 view .LVU33
	.loc 1 53 30 is_stmt 0 view .LVU34
	mov	r3, #16000
	udiv	r3, r3, r1
	.loc 1 53 22 view .LVU35
	mul	r3, r2, r3
	.loc 1 53 14 view .LVU36
	cmp	r3, ip
	bcc	.L7
	.loc 1 56 9 is_stmt 1 view .LVU37
	.loc 1 56 11 is_stmt 0 view .LVU38
	cmp	r2, #86
	bls	.L10
	.loc 1 57 11 is_stmt 1 view .LVU39
.LVL16:
	.loc 1 58 11 view .LVU40
	subs	r1, r1, #1
.LVL17:
.L6:
	.loc 1 50 12 view .LVU41
	cmp	r4, #0
	beq	.L3
	.loc 1 51 15 is_stmt 0 view .LVU42
	movs	r2, #8
.LVL18:
	.loc 1 51 15 view .LVU43
	b	.L9
.LVL19:
.L10:
	.loc 1 61 23 view .LVU44
	movs	r4, #0
.LVL20:
	.loc 1 61 23 view .LVU45
	b	.L6
.L14:
	.align	2
.L13:
	.word	72000
	.word	344000
.LBE3:
	.cfi_endproc
.LFE0:
	.size	ttu_set_main_pll, .-ttu_set_main_pll
	.section	.text.main,"ax",%progbits
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
.LFB1:
	.loc 1 71 16 is_stmt 1 view -0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
.LCFI4:
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 72 3 view .LVU47
	movw	r0, #10000
	bl	ttu_set_main_pll
.LVL21:
	.loc 1 74 3 view .LVU48
	mov	r0, #2432
	bl	rcc_periph_clock_enable
.LVL22:
	.loc 1 76 3 view .LVU49
	movs	r3, #32
	movs	r2, #1
	mov	r1, r2
	mov	r0, #1207959552
	bl	gpio_mode_setup
.LVL23:
	b	.L18
.LVL24:
.L17:
.LBB4:
	.loc 1 80 7 discriminator 3 view .LVU50
	.syntax unified
@ 80 "Source/Racolon42_c.c" 1
	nop
@ 0 "" 2
	.loc 1 79 45 discriminator 3 view .LVU51
	.loc 1 79 50 is_stmt 0 discriminator 3 view .LVU52
	.thumb
	.syntax unified
	adds	r3, r3, #1
.LVL25:
.L16:
	.loc 1 79 29 is_stmt 1 discriminator 1 view .LVU53
	.loc 1 79 5 is_stmt 0 discriminator 1 view .LVU54
	ldr	r2, .L20
	cmp	r3, r2
	bls	.L17
.LBE4:
	.loc 1 82 5 is_stmt 1 view .LVU55
	movs	r1, #32
	mov	r0, #1207959552
	bl	gpio_toggle
.LVL26:
	.loc 1 78 8 view .LVU56
.L18:
	.loc 1 78 3 view .LVU57
	.loc 1 79 5 view .LVU58
.LBB5:
	.loc 1 79 9 view .LVU59
	.loc 1 79 18 is_stmt 0 view .LVU60
	movs	r3, #0
	.loc 1 79 5 view .LVU61
	b	.L16
.L21:
	.align	2
.L20:
	.word	499999
.LBE5:
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.text
.Letext0:
	.file 2 "/home/ryan/Documents/Gitlab/embedded-systems-development-milestones/ARM/gcc-arm-none-eabi-10.3-2021.10/arm-none-eabi/include/machine/_default_types.h"
	.file 3 "/home/ryan/Documents/Gitlab/embedded-systems-development-milestones/ARM/gcc-arm-none-eabi-10.3-2021.10/arm-none-eabi/include/sys/_stdint.h"
	.file 4 "/home/ryan/Documents/Gitlab/embedded-systems-development-milestones/libopencm3/include/libopencm3/stm32/common/rcc_common_all.h"
	.file 5 "/home/ryan/Documents/Gitlab/embedded-systems-development-milestones/libopencm3/include/libopencm3/stm32/common/gpio_common_f234.h"
	.file 6 "/home/ryan/Documents/Gitlab/embedded-systems-development-milestones/libopencm3/include/libopencm3/stm32/common/gpio_common_all.h"
	.file 7 "/home/ryan/Documents/Gitlab/embedded-systems-development-milestones/libopencm3/include/libopencm3/stm32/l4/rcc.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x599
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF146
	.byte	0xc
	.4byte	.LASF147
	.4byte	.LASF148
	.4byte	.Ldebug_ranges0+0x30
	.4byte	0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF1
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF2
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x4
	.4byte	.LASF13
	.byte	0x2
	.byte	0x4f
	.byte	0x1b
	.4byte	0x74
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.4byte	.LASF11
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF12
	.uleb128 0x4
	.4byte	.LASF14
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x68
	.uleb128 0x5
	.4byte	.LASF149
	.byte	0x7
	.byte	0x2
	.4byte	0x5a
	.byte	0x7
	.2byte	0x2ee
	.byte	0x6
	.4byte	0x3ff
	.uleb128 0x6
	.4byte	.LASF15
	.2byte	0x910
	.uleb128 0x6
	.4byte	.LASF16
	.2byte	0x90c
	.uleb128 0x6
	.4byte	.LASF17
	.2byte	0x908
	.uleb128 0x6
	.4byte	.LASF18
	.2byte	0x901
	.uleb128 0x6
	.4byte	.LASF19
	.2byte	0x900
	.uleb128 0x6
	.4byte	.LASF20
	.2byte	0x992
	.uleb128 0x6
	.4byte	.LASF21
	.2byte	0x990
	.uleb128 0x6
	.4byte	.LASF22
	.2byte	0x98d
	.uleb128 0x6
	.4byte	.LASF23
	.2byte	0x98d
	.uleb128 0x6
	.4byte	.LASF24
	.2byte	0x98c
	.uleb128 0x6
	.4byte	.LASF25
	.2byte	0x987
	.uleb128 0x6
	.4byte	.LASF26
	.2byte	0x986
	.uleb128 0x6
	.4byte	.LASF27
	.2byte	0x985
	.uleb128 0x6
	.4byte	.LASF28
	.2byte	0x984
	.uleb128 0x6
	.4byte	.LASF29
	.2byte	0x983
	.uleb128 0x6
	.4byte	.LASF30
	.2byte	0x982
	.uleb128 0x6
	.4byte	.LASF31
	.2byte	0x981
	.uleb128 0x6
	.4byte	.LASF32
	.2byte	0x980
	.uleb128 0x6
	.4byte	.LASF33
	.2byte	0xa08
	.uleb128 0x6
	.4byte	.LASF34
	.2byte	0xa00
	.uleb128 0x6
	.4byte	.LASF35
	.2byte	0xb1f
	.uleb128 0x6
	.4byte	.LASF36
	.2byte	0xb1e
	.uleb128 0x6
	.4byte	.LASF37
	.2byte	0xb1d
	.uleb128 0x6
	.4byte	.LASF38
	.2byte	0xb1c
	.uleb128 0x6
	.4byte	.LASF39
	.2byte	0xb1a
	.uleb128 0x6
	.4byte	.LASF40
	.2byte	0xb1a
	.uleb128 0x6
	.4byte	.LASF41
	.2byte	0xb19
	.uleb128 0x6
	.4byte	.LASF42
	.2byte	0xb18
	.uleb128 0x6
	.4byte	.LASF43
	.2byte	0xb17
	.uleb128 0x6
	.4byte	.LASF44
	.2byte	0xb16
	.uleb128 0x6
	.4byte	.LASF45
	.2byte	0xb15
	.uleb128 0x6
	.4byte	.LASF46
	.2byte	0xb14
	.uleb128 0x6
	.4byte	.LASF47
	.2byte	0xb13
	.uleb128 0x6
	.4byte	.LASF48
	.2byte	0xb12
	.uleb128 0x6
	.4byte	.LASF49
	.2byte	0xb11
	.uleb128 0x6
	.4byte	.LASF50
	.2byte	0xb0f
	.uleb128 0x6
	.4byte	.LASF51
	.2byte	0xb0e
	.uleb128 0x6
	.4byte	.LASF52
	.2byte	0xb09
	.uleb128 0x6
	.4byte	.LASF53
	.2byte	0xb05
	.uleb128 0x6
	.4byte	.LASF54
	.2byte	0xb04
	.uleb128 0x6
	.4byte	.LASF55
	.2byte	0xb03
	.uleb128 0x6
	.4byte	.LASF56
	.2byte	0xb02
	.uleb128 0x6
	.4byte	.LASF57
	.2byte	0xb01
	.uleb128 0x6
	.4byte	.LASF58
	.2byte	0xb00
	.uleb128 0x6
	.4byte	.LASF59
	.2byte	0xb85
	.uleb128 0x6
	.4byte	.LASF60
	.2byte	0xb82
	.uleb128 0x6
	.4byte	.LASF61
	.2byte	0xb80
	.uleb128 0x6
	.4byte	.LASF62
	.2byte	0xc18
	.uleb128 0x6
	.4byte	.LASF63
	.2byte	0xc16
	.uleb128 0x6
	.4byte	.LASF64
	.2byte	0xc15
	.uleb128 0x6
	.4byte	.LASF65
	.2byte	0xc12
	.uleb128 0x6
	.4byte	.LASF66
	.2byte	0xc11
	.uleb128 0x6
	.4byte	.LASF67
	.2byte	0xc10
	.uleb128 0x6
	.4byte	.LASF68
	.2byte	0xc0e
	.uleb128 0x6
	.4byte	.LASF69
	.2byte	0xc0d
	.uleb128 0x6
	.4byte	.LASF70
	.2byte	0xc0c
	.uleb128 0x6
	.4byte	.LASF71
	.2byte	0xc0b
	.uleb128 0x6
	.4byte	.LASF72
	.2byte	0xc0a
	.uleb128 0x6
	.4byte	.LASF73
	.2byte	0xc07
	.uleb128 0x6
	.4byte	.LASF74
	.2byte	0xc00
	.uleb128 0x6
	.4byte	.LASF75
	.2byte	0xd10
	.uleb128 0x6
	.4byte	.LASF76
	.2byte	0xd0c
	.uleb128 0x6
	.4byte	.LASF77
	.2byte	0xd09
	.uleb128 0x6
	.4byte	.LASF78
	.2byte	0xd08
	.uleb128 0x6
	.4byte	.LASF79
	.2byte	0xd01
	.uleb128 0x6
	.4byte	.LASF80
	.2byte	0xd00
	.uleb128 0x6
	.4byte	.LASF81
	.2byte	0xd92
	.uleb128 0x6
	.4byte	.LASF82
	.2byte	0xd90
	.uleb128 0x6
	.4byte	.LASF83
	.2byte	0xd8d
	.uleb128 0x6
	.4byte	.LASF84
	.2byte	0xd8d
	.uleb128 0x6
	.4byte	.LASF85
	.2byte	0xd8c
	.uleb128 0x6
	.4byte	.LASF86
	.2byte	0xd89
	.uleb128 0x6
	.4byte	.LASF87
	.2byte	0xd87
	.uleb128 0x6
	.4byte	.LASF88
	.2byte	0xd86
	.uleb128 0x6
	.4byte	.LASF89
	.2byte	0xd85
	.uleb128 0x6
	.4byte	.LASF90
	.2byte	0xd84
	.uleb128 0x6
	.4byte	.LASF91
	.2byte	0xd83
	.uleb128 0x6
	.4byte	.LASF92
	.2byte	0xd82
	.uleb128 0x6
	.4byte	.LASF93
	.2byte	0xd81
	.uleb128 0x6
	.4byte	.LASF94
	.2byte	0xd80
	.uleb128 0x6
	.4byte	.LASF95
	.2byte	0xe08
	.uleb128 0x6
	.4byte	.LASF96
	.2byte	0xe00
	.uleb128 0x6
	.4byte	.LASF97
	.2byte	0xb1f
	.uleb128 0x6
	.4byte	.LASF98
	.2byte	0xb1e
	.uleb128 0x6
	.4byte	.LASF99
	.2byte	0xb1d
	.uleb128 0x6
	.4byte	.LASF100
	.2byte	0xb1c
	.uleb128 0x6
	.4byte	.LASF101
	.2byte	0xb1a
	.uleb128 0x6
	.4byte	.LASF102
	.2byte	0xb19
	.uleb128 0x6
	.4byte	.LASF103
	.2byte	0xb17
	.uleb128 0x6
	.4byte	.LASF104
	.2byte	0xb16
	.uleb128 0x6
	.4byte	.LASF105
	.2byte	0xb15
	.uleb128 0x6
	.4byte	.LASF106
	.2byte	0xb14
	.uleb128 0x6
	.4byte	.LASF107
	.2byte	0xb13
	.uleb128 0x6
	.4byte	.LASF108
	.2byte	0xb12
	.uleb128 0x6
	.4byte	.LASF109
	.2byte	0xb11
	.uleb128 0x6
	.4byte	.LASF110
	.2byte	0xb0f
	.uleb128 0x6
	.4byte	.LASF111
	.2byte	0xb0e
	.uleb128 0x6
	.4byte	.LASF112
	.2byte	0xb0b
	.uleb128 0x6
	.4byte	.LASF113
	.2byte	0xb09
	.uleb128 0x6
	.4byte	.LASF114
	.2byte	0xb05
	.uleb128 0x6
	.4byte	.LASF115
	.2byte	0xb04
	.uleb128 0x6
	.4byte	.LASF116
	.2byte	0xb03
	.uleb128 0x6
	.4byte	.LASF117
	.2byte	0xb02
	.uleb128 0x6
	.4byte	.LASF118
	.2byte	0xb01
	.uleb128 0x6
	.4byte	.LASF119
	.2byte	0xb00
	.uleb128 0x6
	.4byte	.LASF120
	.2byte	0xb85
	.uleb128 0x6
	.4byte	.LASF121
	.2byte	0xb82
	.uleb128 0x6
	.4byte	.LASF122
	.2byte	0xb80
	.uleb128 0x6
	.4byte	.LASF123
	.2byte	0xc18
	.uleb128 0x6
	.4byte	.LASF124
	.2byte	0xc16
	.uleb128 0x6
	.4byte	.LASF125
	.2byte	0xc15
	.uleb128 0x6
	.4byte	.LASF126
	.2byte	0xc12
	.uleb128 0x6
	.4byte	.LASF127
	.2byte	0xc11
	.uleb128 0x6
	.4byte	.LASF128
	.2byte	0xc10
	.uleb128 0x6
	.4byte	.LASF129
	.2byte	0xc0e
	.uleb128 0x6
	.4byte	.LASF130
	.2byte	0xc0d
	.uleb128 0x6
	.4byte	.LASF131
	.2byte	0xc0c
	.uleb128 0x6
	.4byte	.LASF132
	.2byte	0xc0b
	.uleb128 0x6
	.4byte	.LASF133
	.2byte	0xc0a
	.uleb128 0x6
	.4byte	.LASF134
	.2byte	0xc00
	.byte	0
	.uleb128 0x7
	.byte	0x1
	.4byte	.LASF150
	.byte	0x1
	.byte	0x47
	.byte	0x5
	.byte	0x1
	.4byte	0x29
	.4byte	.LFB1
	.4byte	.LFE1
	.4byte	.LLST7
	.byte	0x1
	.4byte	0x4a3
	.uleb128 0x8
	.4byte	.Ldebug_ranges0+0x18
	.4byte	0x43c
	.uleb128 0x9
	.4byte	.LASF135
	.byte	0x1
	.byte	0x4f
	.byte	0x12
	.4byte	0x97
	.4byte	.LLST8
	.4byte	.LVUS8
	.byte	0
	.uleb128 0xa
	.4byte	.LVL21
	.4byte	0x4a3
	.4byte	0x451
	.uleb128 0xb
	.byte	0x1
	.byte	0x50
	.byte	0x3
	.byte	0xa
	.2byte	0x2710
	.byte	0
	.uleb128 0xa
	.4byte	.LVL22
	.4byte	0x562
	.4byte	0x466
	.uleb128 0xb
	.byte	0x1
	.byte	0x50
	.byte	0x3
	.byte	0xa
	.2byte	0x980
	.byte	0
	.uleb128 0xa
	.4byte	.LVL23
	.4byte	0x570
	.4byte	0x48b
	.uleb128 0xb
	.byte	0x1
	.byte	0x50
	.byte	0x3
	.byte	0x42
	.byte	0x4a
	.byte	0x24
	.uleb128 0xb
	.byte	0x1
	.byte	0x51
	.byte	0x1
	.byte	0x31
	.uleb128 0xb
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x31
	.uleb128 0xb
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.uleb128 0xc
	.4byte	.LVL26
	.4byte	0x57f
	.uleb128 0xb
	.byte	0x1
	.byte	0x50
	.byte	0x3
	.byte	0x42
	.byte	0x4a
	.byte	0x24
	.uleb128 0xb
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.byte	0
	.uleb128 0xd
	.byte	0x1
	.4byte	.LASF151
	.byte	0x1
	.byte	0x14
	.byte	0x6
	.byte	0x1
	.4byte	.LFB0
	.4byte	.LFE0
	.4byte	.LLST0
	.byte	0x1
	.4byte	0x55b
	.uleb128 0xe
	.4byte	.LASF152
	.byte	0x1
	.byte	0x14
	.byte	0x21
	.4byte	0x97
	.4byte	.LLST1
	.4byte	.LVUS1
	.uleb128 0x9
	.4byte	.LASF136
	.byte	0x1
	.byte	0x20
	.byte	0xe
	.4byte	0x97
	.4byte	.LLST2
	.4byte	.LVUS2
	.uleb128 0x9
	.4byte	.LASF137
	.byte	0x1
	.byte	0x21
	.byte	0xe
	.4byte	0x97
	.4byte	.LLST3
	.4byte	.LVUS3
	.uleb128 0x9
	.4byte	.LASF138
	.byte	0x1
	.byte	0x22
	.byte	0xe
	.4byte	0x97
	.4byte	.LLST4
	.4byte	.LVUS4
	.uleb128 0x8
	.4byte	.Ldebug_ranges0+0
	.4byte	0x540
	.uleb128 0x9
	.4byte	.LASF139
	.byte	0x1
	.byte	0x2c
	.byte	0x10
	.4byte	0x97
	.4byte	.LLST5
	.4byte	.LVUS5
	.uleb128 0x9
	.4byte	.LASF140
	.byte	0x1
	.byte	0x31
	.byte	0xb
	.4byte	0x55b
	.4byte	.LLST6
	.4byte	.LVUS6
	.byte	0
	.uleb128 0xc
	.4byte	.LVL4
	.4byte	0x58d
	.uleb128 0xb
	.byte	0x1
	.byte	0x50
	.byte	0x1
	.byte	0x32
	.uleb128 0xb
	.byte	0x1
	.byte	0x53
	.byte	0x1
	.byte	0x37
	.uleb128 0xb
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x1
	.byte	0x32
	.byte	0
	.byte	0
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.4byte	.LASF141
	.uleb128 0xf
	.byte	0x1
	.byte	0x1
	.4byte	.LASF142
	.4byte	.LASF142
	.byte	0x4
	.byte	0x2e
	.byte	0x6
	.uleb128 0x10
	.byte	0x1
	.byte	0x1
	.4byte	.LASF143
	.4byte	.LASF143
	.byte	0x5
	.2byte	0x118
	.byte	0x6
	.uleb128 0xf
	.byte	0x1
	.byte	0x1
	.4byte	.LASF144
	.4byte	.LASF144
	.byte	0x6
	.byte	0x4d
	.byte	0x6
	.uleb128 0x10
	.byte	0x1
	.byte	0x1
	.4byte	.LASF145
	.4byte	.LASF145
	.byte	0x7
	.2byte	0x3db
	.byte	0x6
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.uleb128 0x2137
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.uleb128 0x2137
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST7:
	.4byte	.LFB1
	.4byte	.LCFI4
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LCFI4
	.4byte	.LFE1
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	0
	.4byte	0
.LVUS8:
	.uleb128 .LVU50
	.uleb128 .LVU56
	.uleb128 .LVU60
	.uleb128 0
.LLST8:
	.4byte	.LVL24
	.4byte	.LVL26-1
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL26
	.4byte	.LFE1
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LFB0
	.4byte	.LCFI0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LCFI0
	.4byte	.LCFI1
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI1
	.4byte	.LCFI2
	.2byte	0x2
	.byte	0x7d
	.sleb128 16
	.4byte	.LCFI2
	.4byte	.LCFI3
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI3
	.4byte	.LFE0
	.2byte	0x2
	.byte	0x7d
	.sleb128 16
	.4byte	0
	.4byte	0
.LVUS1:
	.uleb128 0
	.uleb128 .LVU12
	.uleb128 .LVU12
	.uleb128 .LVU16
	.uleb128 .LVU16
	.uleb128 .LVU23
	.uleb128 .LVU23
	.uleb128 .LVU30
	.uleb128 .LVU30
	.uleb128 .LVU31
	.uleb128 .LVU31
	.uleb128 0
.LLST1:
	.4byte	.LVL0
	.4byte	.LVL2
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL2
	.4byte	.LVL5
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL5
	.4byte	.LVL8
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL8
	.4byte	.LVL12
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL12
	.4byte	.LVL13
	.2byte	0x4
	.byte	0x71
	.sleb128 8000
	.byte	0x9f
	.4byte	.LVL13
	.4byte	.LFE0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS2:
	.uleb128 .LVU3
	.uleb128 .LVU12
	.uleb128 .LVU12
	.uleb128 .LVU13
	.uleb128 .LVU13
	.uleb128 .LVU14
	.uleb128 .LVU16
	.uleb128 .LVU18
	.uleb128 .LVU18
	.uleb128 .LVU24
	.uleb128 .LVU24
	.uleb128 0
.LLST2:
	.4byte	.LVL1
	.4byte	.LVL2
	.2byte	0x2
	.byte	0x34
	.byte	0x9f
	.4byte	.LVL2
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL3
	.4byte	.LVL4-1
	.2byte	0x2
	.byte	0x91
	.sleb128 -12
	.4byte	.LVL5
	.4byte	.LVL6
	.2byte	0x2
	.byte	0x34
	.byte	0x9f
	.4byte	.LVL6
	.4byte	.LVL9
	.2byte	0x2
	.byte	0x38
	.byte	0x9f
	.4byte	.LVL9
	.4byte	.LFE0
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LVUS3:
	.uleb128 .LVU4
	.uleb128 .LVU12
	.uleb128 .LVU12
	.uleb128 .LVU14
	.uleb128 .LVU16
	.uleb128 .LVU19
	.uleb128 .LVU19
	.uleb128 .LVU32
	.uleb128 .LVU32
	.uleb128 0
.LLST3:
	.4byte	.LVL1
	.4byte	.LVL2
	.2byte	0x2
	.byte	0x34
	.byte	0x9f
	.4byte	.LVL2
	.4byte	.LVL4-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL5
	.4byte	.LVL6
	.2byte	0x2
	.byte	0x34
	.byte	0x9f
	.4byte	.LVL6
	.4byte	.LVL14
	.2byte	0x2
	.byte	0x38
	.byte	0x9f
	.4byte	.LVL14
	.4byte	.LFE0
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LVUS4:
	.uleb128 .LVU5
	.uleb128 .LVU12
	.uleb128 .LVU12
	.uleb128 .LVU14
	.uleb128 .LVU16
	.uleb128 .LVU32
	.uleb128 .LVU32
	.uleb128 .LVU43
	.uleb128 .LVU44
	.uleb128 0
.LLST4:
	.4byte	.LVL1
	.4byte	.LVL2
	.2byte	0x2
	.byte	0x40
	.byte	0x9f
	.4byte	.LVL2
	.4byte	.LVL4-1
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL5
	.4byte	.LVL14
	.2byte	0x2
	.byte	0x40
	.byte	0x9f
	.4byte	.LVL14
	.4byte	.LVL18
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL19
	.4byte	.LFE0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LVUS5:
	.uleb128 .LVU21
	.uleb128 0
.LLST5:
	.4byte	.LVL7
	.4byte	.LFE0
	.2byte	0x1
	.byte	0x5c
	.4byte	0
	.4byte	0
.LVUS6:
	.uleb128 .LVU32
	.uleb128 .LVU40
	.uleb128 .LVU40
	.uleb128 .LVU41
	.uleb128 .LVU41
	.uleb128 .LVU45
.LLST6:
	.4byte	.LVL14
	.4byte	.LVL16
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL16
	.4byte	.LVL17
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL17
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x24
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LBB2
	.4byte	.LBE2
	.4byte	.LBB3
	.4byte	.LBE3
	.4byte	0
	.4byte	0
	.4byte	.LBB4
	.4byte	.LBE4
	.4byte	.LBB5
	.4byte	.LBE5
	.4byte	0
	.4byte	0
	.4byte	.LFB0
	.4byte	.LFE0
	.4byte	.LFB1
	.4byte	.LFE1
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF137:
	.ascii	"u32_M\000"
.LASF136:
	.ascii	"u32_R\000"
.LASF23:
	.ascii	"RCC_ADC1\000"
.LASF22:
	.ascii	"RCC_ADC\000"
.LASF61:
	.ascii	"RCC_LPUART1\000"
.LASF152:
	.ascii	"u32_freqKhz\000"
.LASF15:
	.ascii	"RCC_TSC\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF122:
	.ascii	"SCC_LPUART1\000"
.LASF33:
	.ascii	"RCC_QSPI\000"
.LASF107:
	.ascii	"SCC_UART4\000"
.LASF106:
	.ascii	"SCC_UART5\000"
.LASF135:
	.ascii	"u32_i\000"
.LASF111:
	.ascii	"SCC_SPI2\000"
.LASF83:
	.ascii	"SCC_ADC\000"
.LASF97:
	.ascii	"SCC_LPTIM1\000"
.LASF120:
	.ascii	"SCC_LPTIM2\000"
.LASF34:
	.ascii	"RCC_FMC\000"
.LASF143:
	.ascii	"gpio_mode_setup\000"
.LASF144:
	.ascii	"gpio_toggle\000"
.LASF14:
	.ascii	"uint32_t\000"
.LASF18:
	.ascii	"RCC_DMA2\000"
.LASF11:
	.ascii	"float\000"
.LASF72:
	.ascii	"RCC_SDMMC1\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF16:
	.ascii	"RCC_CRC\000"
.LASF123:
	.ascii	"SCC_DFSDM\000"
.LASF42:
	.ascii	"RCC_CRS\000"
.LASF84:
	.ascii	"SCC_ADC1\000"
.LASF94:
	.ascii	"SCC_GPIOA\000"
.LASF100:
	.ascii	"SCC_PWR\000"
.LASF142:
	.ascii	"rcc_periph_clock_enable\000"
.LASF141:
	.ascii	"_Bool\000"
.LASF68:
	.ascii	"RCC_USART1\000"
.LASF49:
	.ascii	"RCC_USART2\000"
.LASF48:
	.ascii	"RCC_USART3\000"
.LASF95:
	.ascii	"SCC_QSPI\000"
.LASF36:
	.ascii	"RCC_OPAMP\000"
.LASF77:
	.ascii	"SCC_SRAM1\000"
.LASF86:
	.ascii	"SCC_SRAM2\000"
.LASF10:
	.ascii	"char\000"
.LASF113:
	.ascii	"SCC_LCD\000"
.LASF32:
	.ascii	"RCC_GPIOA\000"
.LASF31:
	.ascii	"RCC_GPIOB\000"
.LASF30:
	.ascii	"RCC_GPIOC\000"
.LASF29:
	.ascii	"RCC_GPIOD\000"
.LASF28:
	.ascii	"RCC_GPIOE\000"
.LASF27:
	.ascii	"RCC_GPIOF\000"
.LASF26:
	.ascii	"RCC_GPIOG\000"
.LASF25:
	.ascii	"RCC_GPIOH\000"
.LASF80:
	.ascii	"SCC_DMA1\000"
.LASF79:
	.ascii	"SCC_DMA2\000"
.LASF39:
	.ascii	"RCC_USB\000"
.LASF67:
	.ascii	"RCC_TIM15\000"
.LASF66:
	.ascii	"RCC_TIM16\000"
.LASF65:
	.ascii	"RCC_TIM17\000"
.LASF146:
	.ascii	"GNU C17 10.3.1 20210824 (release) -mcpu=cortex-m4 -"
	.ascii	"mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard -march=ar"
	.ascii	"mv7e-m+fp -g -gdwarf-2 -Og -fdata-sections -ffuncti"
	.ascii	"on-sections\000"
.LASF1:
	.ascii	"long long int\000"
.LASF45:
	.ascii	"RCC_I2C1\000"
.LASF44:
	.ascii	"RCC_I2C2\000"
.LASF43:
	.ascii	"RCC_I2C3\000"
.LASF81:
	.ascii	"SCC_RNG\000"
.LASF145:
	.ascii	"rcc_set_main_pll\000"
.LASF147:
	.ascii	"Source/Racolon42_c.c\000"
.LASF70:
	.ascii	"RCC_SPI1\000"
.LASF51:
	.ascii	"RCC_SPI2\000"
.LASF50:
	.ascii	"RCC_SPI3\000"
.LASF37:
	.ascii	"RCC_DAC1\000"
.LASF129:
	.ascii	"SCC_USART1\000"
.LASF109:
	.ascii	"SCC_USART2\000"
.LASF108:
	.ascii	"SCC_USART3\000"
.LASF133:
	.ascii	"SCC_SDMMC1\000"
.LASF17:
	.ascii	"RCC_FLASH\000"
.LASF24:
	.ascii	"RCC_OTGFS\000"
.LASF112:
	.ascii	"SCC_WWDG\000"
.LASF64:
	.ascii	"RCC_SAI1\000"
.LASF63:
	.ascii	"RCC_SAI2\000"
.LASF74:
	.ascii	"RCC_SYSCFG\000"
.LASF2:
	.ascii	"long double\000"
.LASF71:
	.ascii	"RCC_TIM1\000"
.LASF58:
	.ascii	"RCC_TIM2\000"
.LASF57:
	.ascii	"RCC_TIM3\000"
.LASF56:
	.ascii	"RCC_TIM4\000"
.LASF55:
	.ascii	"RCC_TIM5\000"
.LASF54:
	.ascii	"RCC_TIM6\000"
.LASF21:
	.ascii	"RCC_AES\000"
.LASF69:
	.ascii	"RCC_TIM8\000"
.LASF149:
	.ascii	"rcc_periph_clken\000"
.LASF148:
	.ascii	"/home/ryan/Documents/Gitlab/embedded-systems-develo"
	.ascii	"pment-milestones/Exam 1 Redux/Part C\000"
.LASF98:
	.ascii	"SCC_OPAMP\000"
.LASF5:
	.ascii	"short int\000"
.LASF7:
	.ascii	"long int\000"
.LASF151:
	.ascii	"ttu_set_main_pll\000"
.LASF96:
	.ascii	"SCC_FMC\000"
.LASF41:
	.ascii	"RCC_CAN1\000"
.LASF40:
	.ascii	"RCC_CAN2\000"
.LASF60:
	.ascii	"RCC_SWPMI1\000"
.LASF93:
	.ascii	"SCC_GPIOB\000"
.LASF92:
	.ascii	"SCC_GPIOC\000"
.LASF91:
	.ascii	"SCC_GPIOD\000"
.LASF90:
	.ascii	"SCC_GPIOE\000"
.LASF89:
	.ascii	"SCC_GPIOF\000"
.LASF88:
	.ascii	"SCC_GPIOG\000"
.LASF87:
	.ascii	"SCC_GPIOH\000"
.LASF38:
	.ascii	"RCC_PWR\000"
.LASF105:
	.ascii	"SCC_I2C1\000"
.LASF104:
	.ascii	"SCC_I2C2\000"
.LASF103:
	.ascii	"SCC_I2C3\000"
.LASF128:
	.ascii	"SCC_TIM15\000"
.LASF127:
	.ascii	"SCC_TIM16\000"
.LASF126:
	.ascii	"SCC_TIM17\000"
.LASF73:
	.ascii	"RCC_FW\000"
.LASF8:
	.ascii	"long unsigned int\000"
.LASF47:
	.ascii	"RCC_UART4\000"
.LASF46:
	.ascii	"RCC_UART5\000"
.LASF19:
	.ascii	"RCC_DMA1\000"
.LASF138:
	.ascii	"u32_N\000"
.LASF76:
	.ascii	"SCC_CRC\000"
.LASF4:
	.ascii	"unsigned char\000"
.LASF131:
	.ascii	"SCC_SPI1\000"
.LASF13:
	.ascii	"__uint32_t\000"
.LASF110:
	.ascii	"SCC_SPI3\000"
.LASF99:
	.ascii	"SCC_DAC1\000"
.LASF134:
	.ascii	"SCC_SYSCFG\000"
.LASF52:
	.ascii	"RCC_LCD\000"
.LASF78:
	.ascii	"SCC_FLASH\000"
.LASF125:
	.ascii	"SCC_SAI1\000"
.LASF124:
	.ascii	"SCC_SAI2\000"
.LASF85:
	.ascii	"SCC_OTGFS\000"
.LASF35:
	.ascii	"RCC_LPTIM1\000"
.LASF59:
	.ascii	"RCC_LPTIM2\000"
.LASF132:
	.ascii	"SCC_TIM1\000"
.LASF119:
	.ascii	"SCC_TIM2\000"
.LASF118:
	.ascii	"SCC_TIM3\000"
.LASF117:
	.ascii	"SCC_TIM4\000"
.LASF116:
	.ascii	"SCC_TIM5\000"
.LASF115:
	.ascii	"SCC_TIM6\000"
.LASF114:
	.ascii	"SCC_TIM7\000"
.LASF130:
	.ascii	"SCC_TIM8\000"
.LASF3:
	.ascii	"signed char\000"
.LASF53:
	.ascii	"RCC_TIM7\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF150:
	.ascii	"main\000"
.LASF12:
	.ascii	"double\000"
.LASF140:
	.ascii	"b_NTooLarge\000"
.LASF82:
	.ascii	"SCC_AES\000"
.LASF20:
	.ascii	"RCC_RNG\000"
.LASF121:
	.ascii	"SCC_SWPMI1\000"
.LASF139:
	.ascii	"u32_vcoUpper\000"
.LASF102:
	.ascii	"SCC_CAN1\000"
.LASF101:
	.ascii	"SCC_CAN2\000"
.LASF62:
	.ascii	"RCC_DFSDM\000"
.LASF75:
	.ascii	"SCC_TSC\000"
	.ident	"GCC: (GNU Arm Embedded Toolchain 10.3-2021.10) 10.3.1 20210824 (release)"
