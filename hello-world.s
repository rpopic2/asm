.global _main
.p2align 2
_main:
mov x0, #1
ldr x1, =message
ldr x2, =len
mov x16, #4
svc #0
ret

.data
message:
.ascii "Hello World!\n"
len = . - message

