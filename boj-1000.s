    ; feedback: use x8~ for scratch register

    .globl _main
    .p2align 2
_main:
    sub sp, sp, #0x100

    mov x16, #3 ; read
    mov w0, #0
    add x1, sp, #0x10
    mov x2, #0x100
    svc #0

    ldrb w0, [sp, #0x10] ; calculate
    ldrb w1, [sp, #0x12]
    add w0, w0, w1
    sub w0, w0, #0x30

    cmp w0, #0x3a
    blt single_digit

; branch
    sub w0, w0, #10 ; write to stack
    mov w1, #0x31
    sturb w0, [sp, #1]
    sturb w1, [sp, #0]
    b write

single_digit:
    str w0, [sp] ; write to stack

write:
    mov w0, #1 ; write
    mov x1, sp
    mov x2, #0x2
    mov x16, #4
    svc #0

    mov w0, #0
    add sp, sp, #0x100
    ret
