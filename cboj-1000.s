	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 14, 0	sdk_version 14, 5
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #208
	.cfi_def_cfa_offset 208
	stp	x29, x30, [sp, #192]            ; 16-byte Folded Spill
	add	x29, sp, #192
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-8]
	mov	w0, #0
	str	wzr, [sp, #20]
	add	x1, sp, #24
	mov	x2, #144
	bl	_read
	ldrsb	w8, [sp, #24]
	ldrsb	w9, [sp, #26]
	add	w8, w8, w9
	subs	w8, w8, #48
	str	w8, [sp, #16]
	ldr	w8, [sp, #16]
	subs	w8, w8, #57
	cset	w8, gt
	tbnz	w8, #0, LBB0_2
	b	LBB0_1
LBB0_1:
	ldr	w8, [sp, #16]
	sturb	w8, [x29, #-24]
	mov	w8, #10
	sturb	w8, [x29, #-23]
	b	LBB0_3
LBB0_2:
	ldr	w8, [sp, #16]
	subs	w8, w8, #10
	str	w8, [sp, #16]
	ldr	w8, [sp, #16]
	sturb	w8, [x29, #-23]
	mov	w8, #49
	sturb	w8, [x29, #-24]
	b	LBB0_3
LBB0_3:
	mov	w0, #1
	sub	x1, x29, #24
	mov	x2, #2
	bl	_write
	ldr	w8, [sp, #20]
	str	w8, [sp, #12]                   ; 4-byte Folded Spill
	ldur	x9, [x29, #-8]
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	subs	x8, x8, x9
	cset	w8, eq
	tbnz	w8, #0, LBB0_5
	b	LBB0_4
LBB0_4:
	bl	___stack_chk_fail
LBB0_5:
	ldr	w0, [sp, #12]                   ; 4-byte Folded Reload
	ldp	x29, x30, [sp, #192]            ; 16-byte Folded Reload
	add	sp, sp, #208
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
