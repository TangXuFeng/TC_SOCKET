.global _start
_start:
    la sp,0x10000 #初始化堆栈,避免进入main崩溃
    call main
1:  j 1b

