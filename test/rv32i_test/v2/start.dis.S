
start.elf：     文件格式 elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	90000537          	lui	a0,0x90000
   4:	00050513          	mv	a0,a0
   8:	06800293          	li	t0,104
   c:	00550023          	sb	t0,0(a0) # 90000000 <_GLOBAL_OFFSET_TABLE_+0x8ffffe28>
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
  70:	90000537          	lui	a0,0x90000
  74:	00050513          	mv	a0,a0
  78:	900005b7          	lui	a1,0x90000
  7c:	01458593          	addi	a1,a1,20 # 90000014 <_GLOBAL_OFFSET_TABLE_+0x8ffffe3c>
  80:	00d00313          	li	t1,13

00000084 <byte_loop>:
  84:	00054283          	lbu	t0,0(a0) # 90000000 <_GLOBAL_OFFSET_TABLE_+0x8ffffe28>
  88:	00558023          	sb	t0,0(a1)
  8c:	00150513          	addi	a0,a0,1
  90:	00158593          	addi	a1,a1,1
  94:	fff30313          	addi	t1,t1,-1
  98:	fe0316e3          	bnez	t1,84 <byte_loop>
  9c:	90000537          	lui	a0,0x90000
  a0:	00050513          	mv	a0,a0
  a4:	900005b7          	lui	a1,0x90000
  a8:	02858593          	addi	a1,a1,40 # 90000028 <_GLOBAL_OFFSET_TABLE_+0x8ffffe50>
  ac:	00c00313          	li	t1,12

000000b0 <half_loop>:
  b0:	00051283          	lh	t0,0(a0) # 90000000 <_GLOBAL_OFFSET_TABLE_+0x8ffffe28>
  b4:	00559023          	sh	t0,0(a1)
  b8:	00250513          	addi	a0,a0,2
  bc:	00258593          	addi	a1,a1,2
  c0:	ffe30313          	addi	t1,t1,-2
  c4:	fe0316e3          	bnez	t1,b0 <half_loop>
  c8:	90000537          	lui	a0,0x90000
  cc:	00050513          	mv	a0,a0
  d0:	900005b7          	lui	a1,0x90000
  d4:	03c58593          	addi	a1,a1,60 # 9000003c <_GLOBAL_OFFSET_TABLE_+0x8ffffe64>
  d8:	00c00313          	li	t1,12

000000dc <word_loop>:
  dc:	00052283          	lw	t0,0(a0) # 90000000 <_GLOBAL_OFFSET_TABLE_+0x8ffffe28>
  e0:	0055a023          	sw	t0,0(a1)
  e4:	00450513          	addi	a0,a0,4
  e8:	00458593          	addi	a1,a1,4
  ec:	ffc30313          	addi	t1,t1,-4
  f0:	fe0316e3          	bnez	t1,dc <word_loop>

000000f4 <done>:
  f4:	0000006f          	j	f4 <done>

Disassembly of section .interp:

000000f8 <.interp>:
  f8:	62696c2f          	.insn	4, 0x62696c2f
  fc:	2d646c2f          	.insn	4, 0x2d646c2f
 100:	696c                	.insn	2, 0x696c
 102:	756e                	.insn	2, 0x756e
 104:	2d78                	.insn	2, 0x2d78
 106:	6972                	.insn	2, 0x6972
 108:	33766373          	.insn	4, 0x33766373
 10c:	2d32                	.insn	2, 0x2d32
 10e:	6c69                	.insn	2, 0x6c69
 110:	3370                	.insn	2, 0x3370
 112:	2e32                	.insn	2, 0x2e32
 114:	312e6f73          	.insn	4, 0x312e6f73
	...

Disassembly of section .dynsym:

0000011c <.dynsym>:
	...
 138:	00010003          	lb	zero,0(sp)

Disassembly of section .dynstr:

0000013c <.dynstr>:
	...

Disassembly of section .gnu.hash:

00000140 <.gnu.hash>:
 140:	0001                	.insn	2, 0x0001
 142:	0000                	.insn	2, 0x0000
 144:	0001                	.insn	2, 0x0001
 146:	0000                	.insn	2, 0x0000
 148:	0001                	.insn	2, 0x0001
	...

Disassembly of section .dynamic:

00000158 <.dynamic>:
 158:	fef5                	.insn	2, 0xfef5
 15a:	6fff 0140 0000 0005 	.insn	22, 0x011c000000060000013c00000005000001406fff
 162:	0000 013c 0000 0006 
 16a:	0000 011c 0000 
 170:	000a                	.insn	2, 0x000a
 172:	0000                	.insn	2, 0x0000
 174:	0001                	.insn	2, 0x0001
 176:	0000                	.insn	2, 0x0000
 178:	0000000b          	.insn	4, 0x000b
 17c:	0010                	.insn	2, 0x0010
 17e:	0000                	.insn	2, 0x0000
 180:	0015                	.insn	2, 0x0015
 182:	0000                	.insn	2, 0x0000
 184:	0000                	.insn	2, 0x0000
 186:	0000                	.insn	2, 0x0000
 188:	00000007          	.insn	4, 0x0007
 18c:	0000                	.insn	2, 0x0000
 18e:	0000                	.insn	2, 0x0000
 190:	0008                	.insn	2, 0x0008
 192:	0000                	.insn	2, 0x0000
 194:	0000                	.insn	2, 0x0000
 196:	0000                	.insn	2, 0x0000
 198:	0009                	.insn	2, 0x0009
 19a:	0000                	.insn	2, 0x0000
 19c:	000c                	.insn	2, 0x000c
 19e:	0000                	.insn	2, 0x0000
 1a0:	6ffffffb          	.insn	4, 0x6ffffffb
 1a4:	0000                	.insn	2, 0x0000
 1a6:	0800                	.insn	2, 0x0800
	...

Disassembly of section .got:

000001d8 <.got>:
 1d8:	0158                	.insn	2, 0x0158
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
