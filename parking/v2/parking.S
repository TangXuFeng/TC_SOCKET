	.file	"parking.c"
	.option pic
	.attribute arch, "rv32i2p1_m2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	uart_putc
	.type	uart_putc, @function
uart_putc:
.LFB0:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sb	a5,-17(s0)
	li	a5,-1879048192
	lbu	a4,-17(s0)
	sb	a4,0(a5)
	nop
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	uart_putc, .-uart_putc
	.align	2
	.globl	uart_print
	.type	uart_print, @function
uart_print:
.LFB1:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sw	a0,-20(s0)
	j	.L3
.L4:
	lw	a5,-20(s0)
	addi	a4,a5,1
	sw	a4,-20(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	call	uart_putc
.L3:
	lw	a5,-20(s0)
	lbu	a5,0(a5)
	bne	a5,zero,.L4
	nop
	nop
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	uart_print, .-uart_print
	.align	2
	.globl	soft_mul
	.type	soft_mul, @function
soft_mul:
.LFB2:
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	ra,44(sp)
	sw	s0,40(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	zero,-20(s0)
	sw	zero,-24(s0)
	j	.L6
.L7:
	lw	a4,-20(s0)
	lw	a5,-36(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L6:
	lw	a4,-24(s0)
	lw	a5,-40(s0)
	blt	a4,a5,.L7
	lw	a5,-20(s0)
	mv	a0,a5
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	soft_mul, .-soft_mul
	.align	2
	.globl	soft_div_mod
	.type	soft_div_mod, @function
soft_div_mod:
.LFB3:
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	ra,44(sp)
	sw	s0,40(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-44(s0)
	sw	zero,-20(s0)
	j	.L10
.L11:
	lw	a4,-36(s0)
	lw	a5,-40(s0)
	sub	a5,a4,a5
	sw	a5,-36(s0)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L10:
	lw	a4,-36(s0)
	lw	a5,-40(s0)
	bge	a4,a5,.L11
	lw	a5,-44(s0)
	beq	a5,zero,.L12
	lw	a5,-44(s0)
	lw	a4,-36(s0)
	sw	a4,0(a5)
.L12:
	lw	a5,-20(s0)
	mv	a0,a5
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE3:
	.size	soft_div_mod, .-soft_div_mod
	.align	2
	.globl	print_int
	.type	print_int, @function
print_int:
.LFB4:
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sw	ra,60(sp)
	sw	s0,56(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	sw	a0,-52(s0)
	lw	a5,-52(s0)
	bne	a5,zero,.L15
	li	a0,48
	call	uart_putc
	j	.L14
.L15:
	sw	zero,-20(s0)
	j	.L17
.L18:
	addi	a5,s0,-36
	mv	a2,a5
	li	a1,10
	lw	a0,-52(s0)
	call	soft_div_mod
	sw	a0,-52(s0)
	lw	a5,-36(s0)
	andi	a4,a5,0xff
	lw	a5,-20(s0)
	addi	a3,a5,1
	sw	a3,-20(s0)
	addi	a4,a4,48
	andi	a4,a4,0xff
	addi	a5,a5,-16
	add	a5,a5,s0
	sb	a4,-16(a5)
.L17:
	lw	a5,-52(s0)
	bgt	a5,zero,.L18
	j	.L19
.L20:
	lw	a5,-20(s0)
	addi	a5,a5,-1
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	lbu	a5,-16(a5)
	mv	a0,a5
	call	uart_putc
.L19:
	lw	a5,-20(s0)
	bgt	a5,zero,.L20
.L14:
	lw	ra,60(sp)
	.cfi_restore 1
	lw	s0,56(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 64
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE4:
	.size	print_int, .-print_int
	.section	.rodata
	.align	2
.LC0:
	.string	"\nSystem Boot: OK\n"
	.align	2
.LC1:
	.string	"Memory: 0x80000000\n"
	.align	2
.LC2:
	.string	"Term  : 0x90000000\n"
	.align	2
.LC3:
	.string	"Duration: "
	.align	2
.LC4:
	.string	" min\n"
	.align	2
.LC5:
	.string	"Fee: "
	.align	2
.LC6:
	.string	" Yuan\n"
	.align	2
.LC7:
	.string	"Running"
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB5:
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sw	ra,60(sp)
	sw	s0,56(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	lla	a0,.LC0
	call	uart_print
	lla	a0,.LC1
	call	uart_print
	lla	a0,.LC2
	call	uart_print
	li	a5,8
	sw	a5,-24(s0)
	li	a5,30
	sw	a5,-28(s0)
	li	a5,10
	sw	a5,-32(s0)
	li	a5,45
	sw	a5,-36(s0)
	li	a1,60
	lw	a0,-32(s0)
	call	soft_mul
	sw	a0,-40(s0)
	lw	a4,-40(s0)
	lw	a5,-36(s0)
	add	a5,a4,a5
	sw	a5,-40(s0)
	li	a1,60
	lw	a0,-24(s0)
	call	soft_mul
	sw	a0,-44(s0)
	lw	a4,-44(s0)
	lw	a5,-28(s0)
	add	a5,a4,a5
	sw	a5,-44(s0)
	lw	a4,-40(s0)
	lw	a5,-44(s0)
	sub	a5,a4,a5
	sw	a5,-48(s0)
	lla	a0,.LC3
	call	uart_print
	lw	a0,-48(s0)
	call	print_int
	lla	a0,.LC4
	call	uart_print
	lw	a5,-48(s0)
	addi	a5,a5,59
	li	a2,0
	li	a1,60
	mv	a0,a5
	call	soft_div_mod
	sw	a0,-52(s0)
	li	a1,5
	lw	a0,-52(s0)
	call	soft_mul
	sw	a0,-56(s0)
	lla	a0,.LC5
	call	uart_print
	lw	a0,-56(s0)
	call	print_int
	lla	a0,.LC6
	call	uart_print
	lla	a0,.LC7
	call	uart_print
.L25:
	sw	zero,-20(s0)
	j	.L23
.L24:
#APP
# 110 "parking.c" 1
	nop
# 0 "" 2
#NO_APP
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L23:
	lw	a4,-20(s0)
	li	a5,49152
	addi	a5,a5,847
	ble	a4,a5,.L24
	li	a0,46
	call	uart_putc
	j	.L25
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.ident	"GCC: (Gentoo 15.2.1_p20251122 p4) 15.2.1 20251122"
	.section	.note.GNU-stack,"",@progbits
