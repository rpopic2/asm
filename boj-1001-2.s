    .globl _main
    .p2align 2
_main:
    sub sp, sp, 0x20
    mov x0, 0
    mov x1, sp
    mov x2, 0x10
    mov x16, 0x3
    svc 0 ; read

    ldrsb w8, [sp]
    ldrsb w9, [sp, 2]
    subs w8, w8, w9
    bmi minus

; not minus
    add w8, w8, 0x30
    strb w8, [sp, #0x10]
    strb wzr, [sp, #0x11]
    b print

minus:
    mov w9, 0x2d
    strb w9, [sp, #0x10]
    mov w10, 0x30
    sub w8, w10, w8
    strb w8, [sp, 0x11]

print:
    mov x0, 1
    add x1, sp, 0x10
    mov x2, 2
    mov x16, 4
    svc 0

    mov w0, 0
    add sp, sp, 0x20
    ret

