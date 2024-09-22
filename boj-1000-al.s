    .globl _main
    .p2align 2
_main:
    sub sp, sp, 0xa0

    mov x0, #0
    add x1, sp, #0x10
    mov x2, #0x90
    mov x16, #3
    svc #0 ;read

    ldrsb w8, [sp, #0x10]
    ldrsb w9, [sp, #0x12]
    add w8, w8, w9
    sub w10, w8, #0x30 ; digit

    cmp w10, #0x39
    mov w11, #0x31
    csel w8, w10, w11, le
    mov w11, #0xa
    sub w10, w10, #10
    csel w9, w11, w10, le

    sturb w8, [sp]
    sturb w9, [sp, #1]

    mov x0, #1
    mov x1, sp
    mov x2, #2
    mov x16, #4
    svc #0

    mov w0, #0
    add sp, sp, 0xa0
    ret

