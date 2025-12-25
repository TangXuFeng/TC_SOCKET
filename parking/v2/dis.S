
parking.elf：     文件格式 elf32-littleriscv


Disassembly of section .text:

80000000 <_start>:
80000000:	80100137          	lui	sp,0x80100
80000004:	228000ef          	jal	8000022c <main>

80000008 <loop>:
80000008:	0000006f          	j	80000008 <loop>

8000000c <uart_putc>:
8000000c:	fe010113          	addi	sp,sp,-32 # 800fffe0 <_GLOBAL_OFFSET_TABLE_+0xff9e4>
80000010:	00112e23          	sw	ra,28(sp)
80000014:	00812c23          	sw	s0,24(sp)
80000018:	02010413          	addi	s0,sp,32
8000001c:	00050793          	mv	a5,a0
80000020:	fef407a3          	sb	a5,-17(s0)
80000024:	900007b7          	lui	a5,0x90000
80000028:	fef44703          	lbu	a4,-17(s0)
8000002c:	00e78023          	sb	a4,0(a5) # 90000000 <_GLOBAL_OFFSET_TABLE_+0xffffa04>
80000030:	00000013          	nop
80000034:	01c12083          	lw	ra,28(sp)
80000038:	01812403          	lw	s0,24(sp)
8000003c:	02010113          	addi	sp,sp,32
80000040:	00008067          	ret

80000044 <uart_print>:
80000044:	fe010113          	addi	sp,sp,-32
80000048:	00112e23          	sw	ra,28(sp)
8000004c:	00812c23          	sw	s0,24(sp)
80000050:	02010413          	addi	s0,sp,32
80000054:	fea42623          	sw	a0,-20(s0)
80000058:	01c0006f          	j	80000074 <uart_print+0x30>
8000005c:	fec42783          	lw	a5,-20(s0)
80000060:	00178713          	addi	a4,a5,1
80000064:	fee42623          	sw	a4,-20(s0)
80000068:	0007c783          	lbu	a5,0(a5)
8000006c:	00078513          	mv	a0,a5
80000070:	f9dff0ef          	jal	8000000c <uart_putc>
80000074:	fec42783          	lw	a5,-20(s0)
80000078:	0007c783          	lbu	a5,0(a5)
8000007c:	fe0790e3          	bnez	a5,8000005c <uart_print+0x18>
80000080:	00000013          	nop
80000084:	00000013          	nop
80000088:	01c12083          	lw	ra,28(sp)
8000008c:	01812403          	lw	s0,24(sp)
80000090:	02010113          	addi	sp,sp,32
80000094:	00008067          	ret

80000098 <soft_mul>:
80000098:	fd010113          	addi	sp,sp,-48
8000009c:	02112623          	sw	ra,44(sp)
800000a0:	02812423          	sw	s0,40(sp)
800000a4:	03010413          	addi	s0,sp,48
800000a8:	fca42e23          	sw	a0,-36(s0)
800000ac:	fcb42c23          	sw	a1,-40(s0)
800000b0:	fe042623          	sw	zero,-20(s0)
800000b4:	fe042423          	sw	zero,-24(s0)
800000b8:	0200006f          	j	800000d8 <soft_mul+0x40>
800000bc:	fec42703          	lw	a4,-20(s0)
800000c0:	fdc42783          	lw	a5,-36(s0)
800000c4:	00f707b3          	add	a5,a4,a5
800000c8:	fef42623          	sw	a5,-20(s0)
800000cc:	fe842783          	lw	a5,-24(s0)
800000d0:	00178793          	addi	a5,a5,1
800000d4:	fef42423          	sw	a5,-24(s0)
800000d8:	fe842703          	lw	a4,-24(s0)
800000dc:	fd842783          	lw	a5,-40(s0)
800000e0:	fcf74ee3          	blt	a4,a5,800000bc <soft_mul+0x24>
800000e4:	fec42783          	lw	a5,-20(s0)
800000e8:	00078513          	mv	a0,a5
800000ec:	02c12083          	lw	ra,44(sp)
800000f0:	02812403          	lw	s0,40(sp)
800000f4:	03010113          	addi	sp,sp,48
800000f8:	00008067          	ret

800000fc <soft_div_mod>:
800000fc:	fd010113          	addi	sp,sp,-48
80000100:	02112623          	sw	ra,44(sp)
80000104:	02812423          	sw	s0,40(sp)
80000108:	03010413          	addi	s0,sp,48
8000010c:	fca42e23          	sw	a0,-36(s0)
80000110:	fcb42c23          	sw	a1,-40(s0)
80000114:	fcc42a23          	sw	a2,-44(s0)
80000118:	fe042623          	sw	zero,-20(s0)
8000011c:	0200006f          	j	8000013c <soft_div_mod+0x40>
80000120:	fdc42703          	lw	a4,-36(s0)
80000124:	fd842783          	lw	a5,-40(s0)
80000128:	40f707b3          	sub	a5,a4,a5
8000012c:	fcf42e23          	sw	a5,-36(s0)
80000130:	fec42783          	lw	a5,-20(s0)
80000134:	00178793          	addi	a5,a5,1
80000138:	fef42623          	sw	a5,-20(s0)
8000013c:	fdc42703          	lw	a4,-36(s0)
80000140:	fd842783          	lw	a5,-40(s0)
80000144:	fcf75ee3          	bge	a4,a5,80000120 <soft_div_mod+0x24>
80000148:	fd442783          	lw	a5,-44(s0)
8000014c:	00078863          	beqz	a5,8000015c <soft_div_mod+0x60>
80000150:	fd442783          	lw	a5,-44(s0)
80000154:	fdc42703          	lw	a4,-36(s0)
80000158:	00e7a023          	sw	a4,0(a5)
8000015c:	fec42783          	lw	a5,-20(s0)
80000160:	00078513          	mv	a0,a5
80000164:	02c12083          	lw	ra,44(sp)
80000168:	02812403          	lw	s0,40(sp)
8000016c:	03010113          	addi	sp,sp,48
80000170:	00008067          	ret

80000174 <print_int>:
80000174:	fc010113          	addi	sp,sp,-64
80000178:	02112e23          	sw	ra,60(sp)
8000017c:	02812c23          	sw	s0,56(sp)
80000180:	04010413          	addi	s0,sp,64
80000184:	fca42623          	sw	a0,-52(s0)
80000188:	fcc42783          	lw	a5,-52(s0)
8000018c:	00079863          	bnez	a5,8000019c <print_int+0x28>
80000190:	03000513          	li	a0,48
80000194:	e79ff0ef          	jal	8000000c <uart_putc>
80000198:	0840006f          	j	8000021c <print_int+0xa8>
8000019c:	fe042623          	sw	zero,-20(s0)
800001a0:	0440006f          	j	800001e4 <print_int+0x70>
800001a4:	fdc40793          	addi	a5,s0,-36
800001a8:	00078613          	mv	a2,a5
800001ac:	00a00593          	li	a1,10
800001b0:	fcc42503          	lw	a0,-52(s0)
800001b4:	f49ff0ef          	jal	800000fc <soft_div_mod>
800001b8:	fca42623          	sw	a0,-52(s0)
800001bc:	fdc42783          	lw	a5,-36(s0)
800001c0:	0ff7f713          	zext.b	a4,a5
800001c4:	fec42783          	lw	a5,-20(s0)
800001c8:	00178693          	addi	a3,a5,1
800001cc:	fed42623          	sw	a3,-20(s0)
800001d0:	03070713          	addi	a4,a4,48
800001d4:	0ff77713          	zext.b	a4,a4
800001d8:	ff078793          	addi	a5,a5,-16
800001dc:	008787b3          	add	a5,a5,s0
800001e0:	fee78823          	sb	a4,-16(a5)
800001e4:	fcc42783          	lw	a5,-52(s0)
800001e8:	faf04ee3          	bgtz	a5,800001a4 <print_int+0x30>
800001ec:	0280006f          	j	80000214 <print_int+0xa0>
800001f0:	fec42783          	lw	a5,-20(s0)
800001f4:	fff78793          	addi	a5,a5,-1
800001f8:	fef42623          	sw	a5,-20(s0)
800001fc:	fec42783          	lw	a5,-20(s0)
80000200:	ff078793          	addi	a5,a5,-16
80000204:	008787b3          	add	a5,a5,s0
80000208:	ff07c783          	lbu	a5,-16(a5)
8000020c:	00078513          	mv	a0,a5
80000210:	dfdff0ef          	jal	8000000c <uart_putc>
80000214:	fec42783          	lw	a5,-20(s0)
80000218:	fcf04ce3          	bgtz	a5,800001f0 <print_int+0x7c>
8000021c:	03c12083          	lw	ra,60(sp)
80000220:	03812403          	lw	s0,56(sp)
80000224:	04010113          	addi	sp,sp,64
80000228:	00008067          	ret

8000022c <main>:
8000022c:	fc010113          	addi	sp,sp,-64
80000230:	02112e23          	sw	ra,60(sp)
80000234:	02812c23          	sw	s0,56(sp)
80000238:	04010413          	addi	s0,sp,64
8000023c:	00000517          	auipc	a0,0x0
80000240:	14050513          	addi	a0,a0,320 # 8000037c <main+0x150>
80000244:	e01ff0ef          	jal	80000044 <uart_print>
80000248:	00000517          	auipc	a0,0x0
8000024c:	14850513          	addi	a0,a0,328 # 80000390 <_PROCEDURE_LINKAGE_TABLE_+0x10>
80000250:	df5ff0ef          	jal	80000044 <uart_print>
80000254:	00000517          	auipc	a0,0x0
80000258:	15050513          	addi	a0,a0,336 # 800003a4 <_PROCEDURE_LINKAGE_TABLE_+0x24>
8000025c:	de9ff0ef          	jal	80000044 <uart_print>
80000260:	00800793          	li	a5,8
80000264:	fef42423          	sw	a5,-24(s0)
80000268:	01e00793          	li	a5,30
8000026c:	fef42223          	sw	a5,-28(s0)
80000270:	00a00793          	li	a5,10
80000274:	fef42023          	sw	a5,-32(s0)
80000278:	02d00793          	li	a5,45
8000027c:	fcf42e23          	sw	a5,-36(s0)
80000280:	03c00593          	li	a1,60
80000284:	fe042503          	lw	a0,-32(s0)
80000288:	e11ff0ef          	jal	80000098 <soft_mul>
8000028c:	fca42c23          	sw	a0,-40(s0)
80000290:	fd842703          	lw	a4,-40(s0)
80000294:	fdc42783          	lw	a5,-36(s0)
80000298:	00f707b3          	add	a5,a4,a5
8000029c:	fcf42c23          	sw	a5,-40(s0)
800002a0:	03c00593          	li	a1,60
800002a4:	fe842503          	lw	a0,-24(s0)
800002a8:	df1ff0ef          	jal	80000098 <soft_mul>
800002ac:	fca42a23          	sw	a0,-44(s0)
800002b0:	fd442703          	lw	a4,-44(s0)
800002b4:	fe442783          	lw	a5,-28(s0)
800002b8:	00f707b3          	add	a5,a4,a5
800002bc:	fcf42a23          	sw	a5,-44(s0)
800002c0:	fd842703          	lw	a4,-40(s0)
800002c4:	fd442783          	lw	a5,-44(s0)
800002c8:	40f707b3          	sub	a5,a4,a5
800002cc:	fcf42823          	sw	a5,-48(s0)
800002d0:	00000517          	auipc	a0,0x0
800002d4:	0e850513          	addi	a0,a0,232 # 800003b8 <_PROCEDURE_LINKAGE_TABLE_+0x38>
800002d8:	d6dff0ef          	jal	80000044 <uart_print>
800002dc:	fd042503          	lw	a0,-48(s0)
800002e0:	e95ff0ef          	jal	80000174 <print_int>
800002e4:	00000517          	auipc	a0,0x0
800002e8:	0e050513          	addi	a0,a0,224 # 800003c4 <_PROCEDURE_LINKAGE_TABLE_+0x44>
800002ec:	d59ff0ef          	jal	80000044 <uart_print>
800002f0:	fd042783          	lw	a5,-48(s0)
800002f4:	03b78793          	addi	a5,a5,59
800002f8:	00000613          	li	a2,0
800002fc:	03c00593          	li	a1,60
80000300:	00078513          	mv	a0,a5
80000304:	df9ff0ef          	jal	800000fc <soft_div_mod>
80000308:	fca42623          	sw	a0,-52(s0)
8000030c:	00500593          	li	a1,5
80000310:	fcc42503          	lw	a0,-52(s0)
80000314:	d85ff0ef          	jal	80000098 <soft_mul>
80000318:	fca42423          	sw	a0,-56(s0)
8000031c:	00000517          	auipc	a0,0x0
80000320:	0b050513          	addi	a0,a0,176 # 800003cc <_PROCEDURE_LINKAGE_TABLE_+0x4c>
80000324:	d21ff0ef          	jal	80000044 <uart_print>
80000328:	fc842503          	lw	a0,-56(s0)
8000032c:	e49ff0ef          	jal	80000174 <print_int>
80000330:	00000517          	auipc	a0,0x0
80000334:	0a450513          	addi	a0,a0,164 # 800003d4 <_PROCEDURE_LINKAGE_TABLE_+0x54>
80000338:	d0dff0ef          	jal	80000044 <uart_print>
8000033c:	00000517          	auipc	a0,0x0
80000340:	0a050513          	addi	a0,a0,160 # 800003dc <_PROCEDURE_LINKAGE_TABLE_+0x5c>
80000344:	d01ff0ef          	jal	80000044 <uart_print>
80000348:	fe042623          	sw	zero,-20(s0)
8000034c:	0140006f          	j	80000360 <main+0x134>
80000350:	00000013          	nop
80000354:	fec42783          	lw	a5,-20(s0)
80000358:	00178793          	addi	a5,a5,1
8000035c:	fef42623          	sw	a5,-20(s0)
80000360:	fec42703          	lw	a4,-20(s0)
80000364:	0000c7b7          	lui	a5,0xc
80000368:	34f78793          	addi	a5,a5,847 # c34f <_start-0x7fff3cb1>
8000036c:	fee7d2e3          	bge	a5,a4,80000350 <main+0x124>
80000370:	02e00513          	li	a0,46
80000374:	c99ff0ef          	jal	8000000c <uart_putc>
80000378:	fd1ff06f          	j	80000348 <main+0x11c>

Disassembly of section .rodata:

8000037c <.rodata>:
8000037c:	530a                	.insn	2, 0x530a
8000037e:	7379                	.insn	2, 0x7379
80000380:	6574                	.insn	2, 0x6574
80000382:	206d                	.insn	2, 0x206d
80000384:	6f42                	.insn	2, 0x6f42
80000386:	203a746f          	jal	s0,800a7d88 <_GLOBAL_OFFSET_TABLE_+0xa778c>
8000038a:	000a4b4f          	.insn	4, 0x000a4b4f
8000038e:	0000                	.insn	2, 0x0000
80000390:	654d                	.insn	2, 0x654d
80000392:	6f6d                	.insn	2, 0x6f6d
80000394:	7972                	.insn	2, 0x7972
80000396:	203a                	.insn	2, 0x203a
80000398:	7830                	.insn	2, 0x7830
8000039a:	3038                	.insn	2, 0x3038
8000039c:	3030                	.insn	2, 0x3030
8000039e:	3030                	.insn	2, 0x3030
800003a0:	3030                	.insn	2, 0x3030
800003a2:	000a                	.insn	2, 0x000a
800003a4:	6554                	.insn	2, 0x6554
800003a6:	6d72                	.insn	2, 0x6d72
800003a8:	2020                	.insn	2, 0x2020
800003aa:	203a                	.insn	2, 0x203a
800003ac:	7830                	.insn	2, 0x7830
800003ae:	3039                	.insn	2, 0x3039
800003b0:	3030                	.insn	2, 0x3030
800003b2:	3030                	.insn	2, 0x3030
800003b4:	3030                	.insn	2, 0x3030
800003b6:	000a                	.insn	2, 0x000a
800003b8:	7544                	.insn	2, 0x7544
800003ba:	6172                	.insn	2, 0x6172
800003bc:	6974                	.insn	2, 0x6974
800003be:	203a6e6f          	jal	t3,800a6dc0 <_GLOBAL_OFFSET_TABLE_+0xa67c4>
800003c2:	0000                	.insn	2, 0x0000
800003c4:	6d20                	.insn	2, 0x6d20
800003c6:	6e69                	.insn	2, 0x6e69
800003c8:	000a                	.insn	2, 0x000a
800003ca:	0000                	.insn	2, 0x0000
800003cc:	6546                	.insn	2, 0x6546
800003ce:	3a65                	.insn	2, 0x3a65
800003d0:	0020                	.insn	2, 0x0020
800003d2:	0000                	.insn	2, 0x0000
800003d4:	5920                	.insn	2, 0x5920
800003d6:	6175                	.insn	2, 0x6175
800003d8:	0a6e                	.insn	2, 0x0a6e
800003da:	0000                	.insn	2, 0x0000
800003dc:	7552                	.insn	2, 0x7552
800003de:	6e6e                	.insn	2, 0x6e6e
800003e0:	6e69                	.insn	2, 0x6e69
800003e2:	0067                	.short	0x0067

Disassembly of section .interp:

800003e4 <.interp>:
800003e4:	62696c2f          	.insn	4, 0x62696c2f
800003e8:	2d646c2f          	.insn	4, 0x2d646c2f
800003ec:	696c                	.insn	2, 0x696c
800003ee:	756e                	.insn	2, 0x756e
800003f0:	2d78                	.insn	2, 0x2d78
800003f2:	6972                	.insn	2, 0x6972
800003f4:	33766373          	.insn	4, 0x33766373
800003f8:	2d32                	.insn	2, 0x2d32
800003fa:	6c69                	.insn	2, 0x6c69
800003fc:	3370                	.insn	2, 0x3370
800003fe:	2e32                	.insn	2, 0x2e32
80000400:	312e6f73          	.insn	4, 0x312e6f73
	...

Disassembly of section .dynsym:

80000408 <.dynsym>:
	...
8000041c:	0000                	.insn	2, 0x0000
8000041e:	8000                	.insn	2, 0x8000
80000420:	0000                	.insn	2, 0x0000
80000422:	0000                	.insn	2, 0x0000
80000424:	00010003          	lb	zero,0(sp)

Disassembly of section .dynstr:

80000428 <.dynstr>:
	...

Disassembly of section .gnu.hash:

8000042c <.gnu.hash>:
8000042c:	0001                	.insn	2, 0x0001
8000042e:	0000                	.insn	2, 0x0000
80000430:	0001                	.insn	2, 0x0001
80000432:	0000                	.insn	2, 0x0000
80000434:	0001                	.insn	2, 0x0001
	...

Disassembly of section .eh_frame:

80000444 <.eh_frame>:
80000444:	0010                	.insn	2, 0x0010
80000446:	0000                	.insn	2, 0x0000
80000448:	0000                	.insn	2, 0x0000
8000044a:	0000                	.insn	2, 0x0000
8000044c:	00527a03          	.insn	4, 0x00527a03
80000450:	7c01                	.insn	2, 0x7c01
80000452:	0101                	.insn	2, 0x0101
80000454:	00020c1b          	.insn	4, 0x00020c1b
80000458:	0024                	.insn	2, 0x0024
8000045a:	0000                	.insn	2, 0x0000
8000045c:	0018                	.insn	2, 0x0018
8000045e:	0000                	.insn	2, 0x0000
80000460:	fbac                	.insn	2, 0xfbac
80000462:	ffff                	.insn	2, 0xffff
80000464:	0038                	.insn	2, 0x0038
80000466:	0000                	.insn	2, 0x0000
80000468:	4400                	.insn	2, 0x4400
8000046a:	200e                	.insn	2, 0x200e
8000046c:	8148                	.insn	2, 0x8148
8000046e:	8801                	.insn	2, 0x8801
80000470:	4402                	.insn	2, 0x4402
80000472:	080c                	.insn	2, 0x080c
80000474:	5c00                	.insn	2, 0x5c00
80000476:	44c1                	.insn	2, 0x44c1
80000478:	0cc8                	.insn	2, 0x0cc8
8000047a:	2002                	.insn	2, 0x2002
8000047c:	0e44                	.insn	2, 0x0e44
8000047e:	0000                	.insn	2, 0x0000
80000480:	0024                	.insn	2, 0x0024
80000482:	0000                	.insn	2, 0x0000
80000484:	0040                	.insn	2, 0x0040
80000486:	0000                	.insn	2, 0x0000
80000488:	fbbc                	.insn	2, 0xfbbc
8000048a:	ffff                	.insn	2, 0xffff
8000048c:	0054                	.insn	2, 0x0054
8000048e:	0000                	.insn	2, 0x0000
80000490:	4400                	.insn	2, 0x4400
80000492:	200e                	.insn	2, 0x200e
80000494:	8148                	.insn	2, 0x8148
80000496:	8801                	.insn	2, 0x8801
80000498:	4402                	.insn	2, 0x4402
8000049a:	080c                	.insn	2, 0x080c
8000049c:	7800                	.insn	2, 0x7800
8000049e:	44c1                	.insn	2, 0x44c1
800004a0:	0cc8                	.insn	2, 0x0cc8
800004a2:	2002                	.insn	2, 0x2002
800004a4:	0e44                	.insn	2, 0x0e44
800004a6:	0000                	.insn	2, 0x0000
800004a8:	0024                	.insn	2, 0x0024
800004aa:	0000                	.insn	2, 0x0000
800004ac:	0068                	.insn	2, 0x0068
800004ae:	0000                	.insn	2, 0x0000
800004b0:	fbe8                	.insn	2, 0xfbe8
800004b2:	ffff                	.insn	2, 0xffff
800004b4:	0064                	.insn	2, 0x0064
800004b6:	0000                	.insn	2, 0x0000
800004b8:	4400                	.insn	2, 0x4400
800004ba:	300e                	.insn	2, 0x300e
800004bc:	8148                	.insn	2, 0x8148
800004be:	8801                	.insn	2, 0x8801
800004c0:	4402                	.insn	2, 0x4402
800004c2:	080c                	.insn	2, 0x080c
800004c4:	0200                	.insn	2, 0x0200
800004c6:	c148                	.insn	2, 0xc148
800004c8:	c844                	.insn	2, 0xc844
800004ca:	020c                	.insn	2, 0x020c
800004cc:	4430                	.insn	2, 0x4430
800004ce:	000e                	.insn	2, 0x000e
800004d0:	0024                	.insn	2, 0x0024
800004d2:	0000                	.insn	2, 0x0000
800004d4:	0090                	.insn	2, 0x0090
800004d6:	0000                	.insn	2, 0x0000
800004d8:	fc24                	.insn	2, 0xfc24
800004da:	ffff                	.insn	2, 0xffff
800004dc:	0078                	.insn	2, 0x0078
800004de:	0000                	.insn	2, 0x0000
800004e0:	4400                	.insn	2, 0x4400
800004e2:	300e                	.insn	2, 0x300e
800004e4:	8148                	.insn	2, 0x8148
800004e6:	8801                	.insn	2, 0x8801
800004e8:	4402                	.insn	2, 0x4402
800004ea:	080c                	.insn	2, 0x080c
800004ec:	0200                	.insn	2, 0x0200
800004ee:	c15c                	.insn	2, 0xc15c
800004f0:	c844                	.insn	2, 0xc844
800004f2:	020c                	.insn	2, 0x020c
800004f4:	4430                	.insn	2, 0x4430
800004f6:	000e                	.insn	2, 0x000e
800004f8:	0024                	.insn	2, 0x0024
800004fa:	0000                	.insn	2, 0x0000
800004fc:	00b8                	.insn	2, 0x00b8
800004fe:	0000                	.insn	2, 0x0000
80000500:	fc74                	.insn	2, 0xfc74
80000502:	ffff                	.insn	2, 0xffff
80000504:	00b8                	.insn	2, 0x00b8
80000506:	0000                	.insn	2, 0x0000
80000508:	4400                	.insn	2, 0x4400
8000050a:	400e                	.insn	2, 0x400e
8000050c:	8148                	.insn	2, 0x8148
8000050e:	8801                	.insn	2, 0x8801
80000510:	4402                	.insn	2, 0x4402
80000512:	080c                	.insn	2, 0x080c
80000514:	0200                	.insn	2, 0x0200
80000516:	c19c                	.insn	2, 0xc19c
80000518:	c844                	.insn	2, 0xc844
8000051a:	020c                	.insn	2, 0x020c
8000051c:	4440                	.insn	2, 0x4440
8000051e:	000e                	.insn	2, 0x000e
80000520:	001c                	.insn	2, 0x001c
80000522:	0000                	.insn	2, 0x0000
80000524:	00e0                	.insn	2, 0x00e0
80000526:	0000                	.insn	2, 0x0000
80000528:	fd04                	.insn	2, 0xfd04
8000052a:	ffff                	.insn	2, 0xffff
8000052c:	0150                	.insn	2, 0x0150
8000052e:	0000                	.insn	2, 0x0000
80000530:	4400                	.insn	2, 0x4400
80000532:	400e                	.insn	2, 0x400e
80000534:	8148                	.insn	2, 0x8148
80000536:	8801                	.insn	2, 0x8801
80000538:	4402                	.insn	2, 0x4402
8000053a:	080c                	.insn	2, 0x080c
8000053c:	0000                	.insn	2, 0x0000
	...

Disassembly of section .eh_frame_hdr:

80000540 <__GNU_EH_FRAME_HDR>:
80000540:	1b01                	.insn	2, 0x1b01
80000542:	ff003b03          	.insn	4, 0xff003b03
80000546:	ffff                	.insn	2, 0xffff
80000548:	0006                	.insn	2, 0x0006
8000054a:	0000                	.insn	2, 0x0000
8000054c:	facc                	.insn	2, 0xfacc
8000054e:	ffff                	.insn	2, 0xffff
80000550:	ff18                	.insn	2, 0xff18
80000552:	ffff                	.insn	2, 0xffff
80000554:	fb04                	.insn	2, 0xfb04
80000556:	ffff                	.insn	2, 0xffff
80000558:	ff40                	.insn	2, 0xff40
8000055a:	ffff                	.insn	2, 0xffff
8000055c:	fb58                	.insn	2, 0xfb58
8000055e:	ffff                	.insn	2, 0xffff
80000560:	ff68                	.insn	2, 0xff68
80000562:	ffff                	.insn	2, 0xffff
80000564:	fbbc                	.insn	2, 0xfbbc
80000566:	ffff                	.insn	2, 0xffff
80000568:	ff90                	.insn	2, 0xff90
8000056a:	ffff                	.insn	2, 0xffff
8000056c:	fc34                	.insn	2, 0xfc34
8000056e:	ffff                	.insn	2, 0xffff
80000570:	ffb8                	.insn	2, 0xffb8
80000572:	ffff                	.insn	2, 0xffff
80000574:	fcec                	.insn	2, 0xfcec
80000576:	ffff                	.insn	2, 0xffff
80000578:	ffe0                	.insn	2, 0xffe0
8000057a:	ffff                	.insn	2, 0xffff

Disassembly of section .dynamic:

8000057c <.dynamic>:
8000057c:	fef5                	.insn	2, 0xfef5
8000057e:	6fff 042c 8000 0005 	.insn	22, 0x800004080000000680000428000000058000042c6fff
80000586:	0000 0428 8000 0006 
8000058e:	0000 0408 8000 
80000594:	000a                	.insn	2, 0x000a
80000596:	0000                	.insn	2, 0x0000
80000598:	0001                	.insn	2, 0x0001
8000059a:	0000                	.insn	2, 0x0000
8000059c:	0000000b          	.insn	4, 0x000b
800005a0:	0010                	.insn	2, 0x0010
800005a2:	0000                	.insn	2, 0x0000
800005a4:	0015                	.insn	2, 0x0015
800005a6:	0000                	.insn	2, 0x0000
800005a8:	0000                	.insn	2, 0x0000
800005aa:	0000                	.insn	2, 0x0000
800005ac:	00000007          	.insn	4, 0x0007
800005b0:	0000                	.insn	2, 0x0000
800005b2:	0000                	.insn	2, 0x0000
800005b4:	0008                	.insn	2, 0x0008
800005b6:	0000                	.insn	2, 0x0000
800005b8:	0000                	.insn	2, 0x0000
800005ba:	0000                	.insn	2, 0x0000
800005bc:	0009                	.insn	2, 0x0009
800005be:	0000                	.insn	2, 0x0000
800005c0:	000c                	.insn	2, 0x000c
800005c2:	0000                	.insn	2, 0x0000
800005c4:	6ffffffb          	.insn	4, 0x6ffffffb
800005c8:	0000                	.insn	2, 0x0000
800005ca:	0800                	.insn	2, 0x0800
	...

Disassembly of section .got:

800005fc <.got>:
800005fc:	057c                	.insn	2, 0x057c
800005fe:	8000                	.insn	2, 0x8000

Disassembly of section .riscv.attributes:

00000000 <.riscv.attributes>:
   0:	2941                	.insn	2, 0x2941
   2:	0000                	.insn	2, 0x0000
   4:	7200                	.insn	2, 0x7200
   6:	7369                	.insn	2, 0x7369
   8:	01007663          	bgeu	zero,a6,14 <_start-0x7fffffec>
   c:	001f 0000 1004      	.insn	6, 0x10040000001f
  12:	7205                	.insn	2, 0x7205
  14:	3376                	.insn	2, 0x3376
  16:	6932                	.insn	2, 0x6932
  18:	7032                	.insn	2, 0x7032
  1a:	5f31                	.insn	2, 0x5f31
  1c:	326d                	.insn	2, 0x326d
  1e:	3070                	.insn	2, 0x3070
  20:	7a5f 6d6d 6c75      	.insn	6, 0x6c756d6d7a5f
  26:	7031                	.insn	2, 0x7031
  28:	0030                	.insn	2, 0x0030

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	.insn	4, 0x3a434347
   4:	2820                	.insn	2, 0x2820
   6:	746e6547          	.insn	4, 0x746e6547
   a:	31206f6f          	jal	t5,631c <_start-0x7fff9ce4>
   e:	2e35                	.insn	2, 0x2e35
  10:	2e32                	.insn	2, 0x2e32
  12:	5f31                	.insn	2, 0x5f31
  14:	3270                	.insn	2, 0x3270
  16:	3230                	.insn	2, 0x3230
  18:	3135                	.insn	2, 0x3135
  1a:	3231                	.insn	2, 0x3231
  1c:	2032                	.insn	2, 0x2032
  1e:	3470                	.insn	2, 0x3470
  20:	2029                	.insn	2, 0x2029
  22:	3531                	.insn	2, 0x3531
  24:	322e                	.insn	2, 0x322e
  26:	312e                	.insn	2, 0x312e
  28:	3220                	.insn	2, 0x3220
  2a:	3230                	.insn	2, 0x3230
  2c:	3135                	.insn	2, 0x3135
  2e:	3231                	.insn	2, 0x3231
  30:	0032                	.insn	2, 0x0032
