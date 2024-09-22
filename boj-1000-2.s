	.globl	_main
	.p2align	2
_main:
    sub    sp, sp, #0xc0
    stp    x29, x30, [sp, #0xb0]
    add    x29, sp, #0xb0
	adrp   x8, ___stack_chk_guard@GOTPAGE
    ldr    x8, [x8, #0x8]
    ldr    x8, [x8]
    stur   x8, [x29, #-0x8]
    add    x1, sp, #0x8
    mov    w0, #0x0
    mov    w2, #0x90
    bl     _read

    ldrsb  w8, [sp, #0x8]
    ldrsb  w9, [sp, #0xa]
    add    w8, w9, w8
    sub    w9, w8, #0x3a
    sub    w10, w8, #0x30
    mov    w11, #0x31

    cmp    w10, #0x3a
    csel   w8, w10, w11, lt
    mov    w10, #0xa
    csel   w9, w10, w9, lt
    sturb  w8, [x29, #-0x18]
    sturb  w9, [x29, #-0x17]
    sub    x1, x29, #0x18
    mov    w0, #0x1
    mov    w2, #0x2
    bl     _write

    ldur   x8, [x29, #-0x8]
	adrp	x9, ___stack_chk_guard@GOTPAGE
    ldr    x9, [x9, #0x8]
    ldr    x9, [x9]
    cmp    x9, x8
    b.ne   LBB0_2
    mov    w0, #0x0
    ldp    x29, x30, [sp, #0xb0]
    add    sp, sp, #0xc0
    ret
LBB0_2:
    bl     ___stack_chk_fail
