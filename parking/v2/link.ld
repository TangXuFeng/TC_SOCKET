/* 文件名: link.ld */
OUTPUT_ARCH( "riscv" )
ENTRY( _start )

MEMORY
{
  /* 根据你的描述定义 1MB 主存 */
  /* rwx 表示可读、可写、可执行 */
  RAM (rwx) : ORIGIN = 0x80000000, LENGTH = 1M
}

SECTIONS
{
  /* 代码段：放在 RAM 开头 */
  .text : {
    *(.text.startup) /* start.S 会被放在最前面 */
    *(.text)
  } > RAM

  /* 只读数据段 (字符串常量等) */
  .rodata : {
    *(.rodata)
  } > RAM

  /* 数据段 (全局变量) */
  .data : {
    *(.data)
  } > RAM

  /* BSS段 (未初始化变量) */
  .bss : {
    *(.bss)
  } > RAM
}