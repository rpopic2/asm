	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 14, 0	sdk_version 14, 5
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh0:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh1:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh2:
	ldr	x8, [x8]
	stur	x8, [x29, #-8]
	add	x1, sp, #24
	mov	w0, #0
	mov	w2, #16
	bl	_read
	ldrsb	w8, [sp, #24]
	ldrsb	w9, [sp, #26]
	subs	w9, w8, w9
	b.mi	LBB0_2
; %bb.1:
	mov	w8, #0
	add	w9, w9, #48
	strb	w9, [sp, #8]
	b	LBB0_3
LBB0_2:
	mov	w8, #45
	strb	w8, [sp, #8]
	mov	w8, #48
	sub	w8, w8, w9
LBB0_3:
	strb	w8, [sp, #9]
	add	x1, sp, #8
	mov	w0, #1
	mov	w2, #2
	bl	_write
	ldur	x8, [x29, #-8]
Lloh3:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh4:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh5:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB0_5
; %bb.4:
	mov	w0, #0
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB0_5:
	bl	___stack_chk_fail
	.loh AdrpLdrGotLdr	Lloh0, Lloh1, Lloh2
	.loh AdrpLdrGotLdr	Lloh3, Lloh4, Lloh5
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
