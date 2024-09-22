#include <unistd.h>

int main(void) {
    char rbuf[0x10];
    char wbuf[0x10];

    read(0, rbuf, 0x10);
    register int tmp = rbuf[0] - rbuf[2];

    if (tmp < 0) {
        wbuf[0] = '-';
        wbuf[1] = -tmp + '0';
    } else {
        wbuf[0] = tmp + '0';
        wbuf[1] = '\0';
    }

    write(1, wbuf, 0x2);
}

