
start.elf：     文件格式 elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00010137          	lui	sp,0x10
   4:	00100513          	li	a0,1
   8:	01400593          	li	a1,20
   c:	008000ef          	jal	14 <main>
  10:	0000006f          	j	10 <_start+0x10>

00000014 <main>:
  14:	00150513          	addi	a0,a0,1
  18:	00b50463          	beq	a0,a1,20 <end>
  1c:	ff9ff06f          	j	14 <main>

00000020 <end>:
  20:	0000006f          	j	20 <end>

Disassembly of section .interp:

00000024 <.interp>:
  24:	62696c2f          	.insn	4, 0x62696c2f
  28:	2d646c2f          	.insn	4, 0x2d646c2f
  2c:	696c                	.insn	2, 0x696c
  2e:	756e                	.insn	2, 0x756e
  30:	2d78                	.insn	2, 0x2d78
  32:	6972                	.insn	2, 0x6972
  34:	33766373          	.insn	4, 0x33766373
  38:	2d32                	.insn	2, 0x2d32
  3a:	6c69                	.insn	2, 0x6c69
  3c:	3370                	.insn	2, 0x3370
  3e:	2e32                	.insn	2, 0x2e32
  40:	312e6f73          	.insn	4, 0x312e6f73
	...

Disassembly of section .dynsym:

00000048 <.dynsym>:
	...
  64:	00010003          	lb	zero,0(sp) # 10000 <_GLOBAL_OFFSET_TABLE_+0xfefc>

Disassembly of section .dynstr:

00000068 <.dynstr>:
	...

Disassembly of section .gnu.hash:

0000006c <.gnu.hash>:
  6c:	0001                	.insn	2, 0x0001
  6e:	0000                	.insn	2, 0x0000
  70:	0001                	.insn	2, 0x0001
  72:	0000                	.insn	2, 0x0000
  74:	0001                	.insn	2, 0x0001
	...

Disassembly of section .dynamic:

00000084 <.dynamic>:
  84:	fef5                	.insn	2, 0xfef5
  86:	6fff 006c 0000 0005 	.insn	22, 0x00480000000600000068000000050000006c6fff
  8e:	0000 0068 0000 0006 
  96:	0000 0048 0000 
  9c:	000a                	.insn	2, 0x000a
  9e:	0000                	.insn	2, 0x0000
  a0:	0001                	.insn	2, 0x0001
  a2:	0000                	.insn	2, 0x0000
  a4:	0000000b          	.insn	4, 0x000b
  a8:	0010                	.insn	2, 0x0010
  aa:	0000                	.insn	2, 0x0000
  ac:	0015                	.insn	2, 0x0015
  ae:	0000                	.insn	2, 0x0000
  b0:	0000                	.insn	2, 0x0000
  b2:	0000                	.insn	2, 0x0000
  b4:	00000007          	.insn	4, 0x0007
  b8:	0000                	.insn	2, 0x0000
  ba:	0000                	.insn	2, 0x0000
  bc:	0008                	.insn	2, 0x0008
  be:	0000                	.insn	2, 0x0000
  c0:	0000                	.insn	2, 0x0000
  c2:	0000                	.insn	2, 0x0000
  c4:	0009                	.insn	2, 0x0009
  c6:	0000                	.insn	2, 0x0000
  c8:	000c                	.insn	2, 0x000c
  ca:	0000                	.insn	2, 0x0000
  cc:	6ffffffb          	.insn	4, 0x6ffffffb
  d0:	0000                	.insn	2, 0x0000
  d2:	0800                	.insn	2, 0x0800
	...

Disassembly of section .got:

00000104 <.got>:
 104:	0084                	.insn	2, 0x0084
	...

Disassembly of section .riscv.attributes:

00000000 <.riscv.attributes>:
   0:	2741                	.insn	2, 0x2741
   2:	0000                	.insn	2, 0x0000
   4:	7200                	.insn	2, 0x7200
   6:	7369                	.insn	2, 0x7369
   8:	01007663          	bgeu	zero,a6,14 <main>
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
