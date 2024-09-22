    .globl _main
    .p2align 2
_main:
    sub sp, sp, 0x20

    mov x0, 0
    mov x1, sp
    mov x2, 0x10
    mov x16, 3
    svc 0

    ldrsb w8, [sp]
    ldrsb w9, [sp, 2]
    sub w8, w8, 0x30
    sub w9, w9, 0x30

    mul w8, w8, w9
    mov w9, 10
    cmp w8, w9
    bge twodigit

    add w8, w8, 0x30
    strb w8, [sp, 0x10]
    mov x2, 1
    b print

twodigit:
    sdiv w10, w8, w9
    msub w11, w10, w9, w8

    add w10, w10, 0x30
    add w11, w11, 0x30
    strb w10, [sp, 0x10]
    strb w11, [sp, 0x11]
    mov x2, 0x2

print:
    mov x0, 1
    add x1, sp, 0x10
    mov x16, 0x4
    svc 0

    mov w0, 0
    add sp, sp, 0x20
    ret

