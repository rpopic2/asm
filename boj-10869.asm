    .p2align 2
_getnum:
    ; x9 = acc
    ; x11 = scale
    mov w0, 0
    mov w11, 1
    mov w12, 10
loop:
    ldrb w8, [sp, x10]
    add x10, x10, 1
    cmp w8, 0x20
    beq break
    cmp w8, 0xa
    beq break

    sub w8, w8, 0x30

    mul w0, w0, w12
    ; mul w11, w11, w12
    add w0, w0, w8
    b loop
break:
    ret

_putnum:
    mov w9, 10000
    mov w11, 10

div_loop:
    cmp w9, 0
    beq break_putnum
    mov w8, w0
    udiv w8, w8, w9
    mul w12, w8, w9
    udiv w9, w9, w11
    sub w0, w0, w12
    cmp w8, 0
    beq div_loop

    add w8, w8, 0x30
    strb w8, [sp, x10]
    add x10, x10, 1
    b div_loop

break_putnum:
    mov w8, 0xa
    strb w8, [sp, x10]
    add x10, x10, 1
    ret

    .globl _main
    .p2align 2
_main:
    stp x29, x30, [sp, 0x10]
    sub sp, sp, 0x90
    mov x29, sp

    mov x0, 0
    mov x1, sp
    mov x2, 0x10
    mov x16, 3
    svc 0

    ; x10 = ptr
    mov x10, 0
    bl _getnum
    mov w14, w0
    bl _getnum
    mov w15, w0

    mov x10, 0x10
res:
    add w0, w14, w15
    bl _putnum

    sub w0, w14, w15 ; todo need to deal with minus
    bl _putnum

    mul w0, w14, w15
    bl _putnum

    udiv w0, w14, w15
    mov w1, w0
    bl _putnum

    msub w0, w1, w15, w14
    bl _putnum

    mov x0, 1
    add x1, sp, 0x10
    sub x2, x10, 0x10
    mov x16, 4
    svc 0

fin:
    mov w0, 0
    add sp, sp, 0x90
    ldp x29, x30, [sp, 0x10]
    ret
