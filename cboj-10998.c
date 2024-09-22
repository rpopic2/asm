#include <unistd.h>
#include <stdio.h>

int main(void) {
    char rbuf[0x10];
    char wbuf[0x10];

    read(0, rbuf, 0x10);

    register int a = rbuf[0] - '0';
    register int b = rbuf[2] - '0';
    register int mul = a * b;
    register int len;

    if (mul >= 10) {
        wbuf[0] = mul / 100 + '0';
        wbuf[1] = mul % 10 + '0';
        len = 2;
    } else {
        wbuf[0] = mul + '0';
        len = 1;
    }

    write(1, wbuf, len);
    // printf("%d\n", wbuf[0]);
}
/*
 * sub    sp, sp, #0x40
stp    x29, x30, [sp, #0x30]
add    x29, sp, #0x30
adrp   x8, 1
ldr    x8, [x8, #0x8]
ldr    x8, [x8]
stur   x8, [x29, #-0x8]
add    x1, sp, #0x18
mov    w0, #0x0
mov    w2, #0x10
bl     0x100003f90               ; symbol stub for: r
                                                     
ldrsb  w8, [sp, #0x18]
sub    w8, w8, #0x30
ldrsb  w9, [sp, #0x1a]
sub    w9, w9, #0x30
mul    w8, w9, w8
cmp    w8, #0xa
b.lt   0x100003f40               ; <+120>
and    w9, w8, #0xffff
mov    w10, #0xcccd
mul    w9, w9, w10
lsr    w9, w9, #19
add    w10, w9, #0x30
strb   w10, [sp, #0x8]
mov    w10, #0xa
msub   w8, w9, w10, w8
orr    w8, w8, #0x30
strb   w8, [sp, #0x9]
mov    w2, #0x2
b      0x100003f4c               ; <+132>
add    w8, w8, #0x30
strb   w8, [sp, #0x8]
mov    w2, #0x1
add    x1, sp, #0x8
mov    w0, #0x1
bl     0x100003f9c               ; symbol stub for: w
                                                     
ldur   x8, [x29, #-0x8]
adrp   x9, 1
ldr    x9, [x9, #0x8]
ldr    x9, [x9]
cmp    x9, x8
b.ne   0x100003f80               ; <+184>
mov    w0, #0x0
ldp    x29, x30, [sp, #0x30]
add    sp, sp, #0x40
ret    
bl     0x100003f84               ; symbol stub for: _
*/
