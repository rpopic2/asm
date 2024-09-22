global main:
    wbuf: 0x10 u8
    rbuf: 0x90 u8

    0, rbuf, rbuf.size ->read

    digit: [rbuf] + [rbuf, 2] - '0'
    cmp digit, '9'
    :: le
        digit, '\n'
    ::
        '1', digit - 10
    =>[wbuf, 0], =>[wbuf, 1]

    1, wbuf, 2 ->write
    0 ret
