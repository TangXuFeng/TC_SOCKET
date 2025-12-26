
start.elf：     文件格式 elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	90000537          	lui	a0,0x90000
   4:	00050513          	mv	a0,a0
   8:	06800293          	li	t0,104
   c:	00550023          	sb	t0,0(a0) # 90000000 <_GLOBAL_OFFSET_TABLE_+0x8ffffeac>
  10:	06500293          	li	t0,101
  14:	005500a3          	sb	t0,1(a0)
  18:	06c00293          	li	t0,108
  1c:	00550123          	sb	t0,2(a0)
  20:	06c00293          	li	t0,108
  24:	005501a3          	sb	t0,3(a0)
  28:	06f00293          	li	t0,111
  2c:	00550223          	sb	t0,4(a0)
  30:	02c00293          	li	t0,44
  34:	005502a3          	sb	t0,5(a0)
  38:	07700293          	li	t0,119
  3c:	00550323          	sb	t0,6(a0)
  40:	06f00293          	li	t0,111
  44:	005503a3          	sb	t0,7(a0)
  48:	07200293          	li	t0,114
  4c:	00550423          	sb	t0,8(a0)
  50:	06c00293          	li	t0,108
  54:	005504a3          	sb	t0,9(a0)
  58:	06400293          	li	t0,100
  5c:	00550523          	sb	t0,10(a0)
  60:	02100293          	li	t0,33
  64:	005505a3          	sb	t0,11(a0)
  68:	00000293          	li	t0,0
  6c:	00550623          	sb	t0,12(a0)

00000070 <hang>:
  70:	0000006f          	j	70 <hang>

Disassembly of section .interp:

00000074 <.interp>:
  74:	62696c2f          	.insn	4, 0x62696c2f
  78:	2d646c2f          	.insn	4, 0x2d646c2f
  7c:	696c                	.insn	2, 0x696c
  7e:	756e                	.insn	2, 0x756e
  80:	2d78                	.insn	2, 0x2d78
  82:	6972                	.insn	2, 0x6972
  84:	33766373          	.insn	4, 0x33766373
  88:	2d32                	.insn	2, 0x2d32
  8a:	6c69                	.insn	2, 0x6c69
  8c:	3370                	.insn	2, 0x3370
  8e:	2e32                	.insn	2, 0x2e32
  90:	312e6f73          	.insn	4, 0x312e6f73
	...

Disassembly of section .dynsym:

00000098 <.dynsym>:
	...
  b4:	00010003          	lb	zero,0(sp)

Disassembly of section .dynstr:

000000b8 <.dynstr>:
	...

Disassembly of section .gnu.hash:

000000bc <.gnu.hash>:
  bc:	0001                	.insn	2, 0x0001
  be:	0000                	.insn	2, 0x0000
  c0:	0001                	.insn	2, 0x0001
  c2:	0000                	.insn	2, 0x0000
  c4:	0001                	.insn	2, 0x0001
	...

Disassembly of section .dynamic:

000000d4 <.dynamic>:
  d4:	fef5                	.insn	2, 0xfef5
  d6:	6fff 00bc 0000 0005 	.insn	22, 0x009800000006000000b800000005000000bc6fff
  de:	0000 00b8 0000 0006 
  e6:	0000 0098 0000 
  ec:	000a                	.insn	2, 0x000a
  ee:	0000                	.insn	2, 0x0000
  f0:	0001                	.insn	2, 0x0001
  f2:	0000                	.insn	2, 0x0000
  f4:	0000000b          	.insn	4, 0x000b
  f8:	0010                	.insn	2, 0x0010
  fa:	0000                	.insn	2, 0x0000
  fc:	0015                	.insn	2, 0x0015
  fe:	0000                	.insn	2, 0x0000
 100:	0000                	.insn	2, 0x0000
 102:	0000                	.insn	2, 0x0000
 104:	00000007          	.insn	4, 0x0007
 108:	0000                	.insn	2, 0x0000
 10a:	0000                	.insn	2, 0x0000
 10c:	0008                	.insn	2, 0x0008
 10e:	0000                	.insn	2, 0x0000
 110:	0000                	.insn	2, 0x0000
 112:	0000                	.insn	2, 0x0000
 114:	0009                	.insn	2, 0x0009
 116:	0000                	.insn	2, 0x0000
 118:	000c                	.insn	2, 0x000c
 11a:	0000                	.insn	2, 0x0000
 11c:	6ffffffb          	.insn	4, 0x6ffffffb
 120:	0000                	.insn	2, 0x0000
 122:	0800                	.insn	2, 0x0800
	...

Disassembly of section .got:

00000154 <.got>:
 154:	00d4                	.insn	2, 0x00d4
	...

Disassembly of section .riscv.attributes:

00000000 <.riscv.attributes>:
   0:	2741                	.insn	2, 0x2741
   2:	0000                	.insn	2, 0x0000
   4:	7200                	.insn	2, 0x7200
   6:	7369                	.insn	2, 0x7369
   8:	01007663          	bgeu	zero,a6,14 <_start+0x14>
   c:	001d                	.insn	2, 0x001d
   e:	0000                	.insn	2, 0x0000
  10:	7205                	.insn	2, 0x7205
  12:	3376                	.insn	2, 0x3376
  14:	6932                	.insn	2, 0x6932
  16:	7032                	.insn	2, 0x7032
  18:	5f31                	.insn	2, 0x5f31
  1a:	326d                	.insn	2, 0x326d
  1c:	3070                	.insn	2, 0x3070
  1e:	7a5f 6d6d 6c75      	.insn	6, 0x6c756d6d7a5f
  24:	7031                	.insn	2, 0x7031
  26:	0030                	.insn	2, 0x0030
