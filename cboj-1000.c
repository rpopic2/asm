#include <unistd.h>
#include <stdio.h>

int main(void) {
    char wbuf[0x10];
    char rbuf[0x90];

    read(0, rbuf, 0x90);

    register int tmp = rbuf[0] + rbuf[2] - '0';

    if (tmp <= '9') {
        wbuf[0] = tmp;
        wbuf[1] = '\n';
    } else {
        tmp -= 10;
        wbuf[1] = tmp;
        wbuf[0] = '1';
    }

    write(1, wbuf, 0x2);
}

