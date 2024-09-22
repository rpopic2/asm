global main:
    rbuf: 0x10 char
    wbuf: 0x10 char

    0, wbuf, wbuf.size ~>read

    [wbuf], [wbuf, 2]
    - 0x30, - 0x30
    mult. *, 10
    len &2
    cmp
    :: ge
        mult / 10, mult % 10
        + '0'    , +'0'
        =>[wbuf] , =>[wbuf, 1]
        len 2
    ::
        mult + '0'
        =>[wbuf]
        len 1

    1, rbuf, len ~>write
    0 ret

