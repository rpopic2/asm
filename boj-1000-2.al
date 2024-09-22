global main:
    rbuf: 0x10 char
    wbuf: 0x10 char

    0, rbuf, rbuf.size ~>read

    [rbuf], [rbuf, 2]
    tmp: -?
# if you want csel
    :: mi
        '-', 0x30 - tmp
    ::
        tmp + 0x30, 0
    =>[wbuf], =>[wbuf, 1]
# if you want branching
    :: mi
        '-' =>[wbuf]
        0x30 - tmp =>[wbuf, 1]
    ::
        tmp + 0x30 =>[wbuf]
        0 =>[wbuf, 1]

    1, wbuf, wbuf.size ~>write

    0 ret
