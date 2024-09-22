    .globl _main
    .p2align 2
_main:
    sub sp, sp, #0x20

    mov x0, #0x0
    mov x1, sp
    mov x2, #0x10
    mov x16, #0x3
    svc #0 ; read

    ldrsb x8, [sp] ; calc
    ldrsb x9, [sp, #2]
    subs x8, x8, x9

    mov x10, #0x2d
    mvn x11, x8
    add x11, x11, #1
    add x11, x11, #0x30
    csel x9, x11, xzr, cc
    add x8, x8, #0x30
    csel x8, x10, x8, cc

    sturb w8, [sp, #0x10] ; str
    sturb w9, [sp, #0x11]

    mov x0, #0x1
    add x1, sp, #0x10
    mov x2, #0x2
    mov x16, #0x4
    svc #0 ; write

    add sp, sp, #0x20
    mov w0, #0
    ret

