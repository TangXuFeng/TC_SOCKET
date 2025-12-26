    .global _start
_start:

    # a0 = 0x90000 作为写入起始地址
    lui   a0, 0x90000000 >> 12
    addi  a0, a0, 0

    # 写入每个字节
    li    t0, 0x68      # 'h'
    sb    t0, 0(a0)

    li    t0, 0x65      # 'e'
    sb    t0, 1(a0)

    li    t0, 0x6C      # 'l'
    sb    t0, 2(a0)

    li    t0, 0x6C      # 'l'
    sb    t0, 3(a0)

    li    t0, 0x6F      # 'o'
    sb    t0, 4(a0)

    li    t0, 0x2C      # ','
    sb    t0, 5(a0)

    li    t0, 0x77      # 'w'
    sb    t0, 6(a0)

    li    t0, 0x6F      # 'o'
    sb    t0, 7(a0)

    li    t0, 0x72      # 'r'
    sb    t0, 8(a0)

    li    t0, 0x6C      # 'l'
    sb    t0, 9(a0)

    li    t0, 0x64      # 'd'
    sb    t0, 10(a0)

    li    t0, 0x21      # '!'
    sb    t0, 11(a0)

    # 写入结束符 0x00
    li    t0, 0x00
    sb    t0, 12(a0)

hang:
    j hang
