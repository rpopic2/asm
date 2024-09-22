.globl _main
.p2align 2

_main:
    stp x29, x30, [sp, #-0x10]!
    mov x29, sp

    mov x0, #1
    adrp x1, hello@PAGE
    add x1, x1, hello@PAGEOFF
    mov x2, #0xd

    mov x16, #4
    svc #0


    mov w0, #0
    ldp x29, x30, [sp], #16
    ret

    .data
hello:
    .asciz "Hello World!\n";
    len = . - hello
