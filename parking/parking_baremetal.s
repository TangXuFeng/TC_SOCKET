	.file	"parking_baremetal.c"
	.option pic
	.attribute arch, "rv32i2p1_m2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.globl	kbd_buffer
	.bss
	.align	2
	.type	kbd_buffer, @object
	.size	kbd_buffer, 64
kbd_buffer:
	.zero	64
	.globl	head
	.align	2
	.type	head, @object
	.size	head, 4
head:
	.zero	4
	.globl	tail
	.align	2
	.type	tail, @object
	.size	tail, 4
tail:
	.zero	4
	.local	cursor
	.comm	cursor,4,4
	.text
	.align	2
	.globl	my_putc
	.type	my_putc, @function
my_putc:
.LFB0:
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	ra,44(sp)
	sw	s0,40(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sb	a5,-33(s0)
	li	a5,1342177280
	sw	a5,-20(s0)
	lbu	a4,-33(s0)
	li	a5,10
	bne	a4,a5,.L2
	lla	a5,cursor
	lw	a5,0(a5)
	li	a4,1717985280
	addi	a4,a4,1639
	mulh	a4,a5,a4
	srai	a4,a4,5
	srai	a5,a5,31
	sub	a5,a4,a5
	addi	a4,a5,1
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,4
	mv	a4,a5
	lla	a5,cursor
	sw	a4,0(a5)
	j	.L3
.L2:
	lla	a5,cursor
	lw	a5,0(a5)
	addi	a3,a5,1
	lla	a4,cursor
	sw	a3,0(a4)
	mv	a4,a5
	lw	a5,-20(s0)
	add	a5,a5,a4
	lbu	a4,-33(s0)
	sb	a4,0(a5)
.L3:
	lla	a5,cursor
	lw	a4,0(a5)
	li	a5,1999
	ble	a4,a5,.L5
	lla	a5,cursor
	sw	zero,0(a5)
.L5:
	nop
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	my_putc, .-my_putc
	.align	2
	.globl	my_console_print
	.type	my_console_print, @function
my_console_print:
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
	j	.L7
.L8:
	lw	a5,-20(s0)
	addi	a4,a5,1
	sw	a4,-20(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	call	my_putc
.L7:
	lw	a5,-20(s0)
	lbu	a5,0(a5)
	bne	a5,zero,.L8
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
	.size	my_console_print, .-my_console_print
	.align	2
	.globl	handle_keyboard_interrupt
	.type	handle_keyboard_interrupt, @function
handle_keyboard_interrupt:
.LFB2:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	a4,20(sp)
	sw	a5,16(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 14, -12
	.cfi_offset 15, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	li	a5,1073741824
	lw	a5,0(a5)
	sb	a5,-17(s0)
	lla	a5,head
	lw	a5,0(a5)
	addi	a4,a5,1
	srai	a5,a4,31
	srli	a5,a5,26
	add	a4,a4,a5
	andi	a4,a4,63
	sub	a5,a4,a5
	sw	a5,-24(s0)
	lla	a5,tail
	lw	a5,0(a5)
	lw	a4,-24(s0)
	beq	a4,a5,.L11
	lla	a5,head
	lw	a5,0(a5)
	lla	a4,kbd_buffer
	add	a5,a4,a5
	lbu	a4,-17(s0)
	sb	a4,0(a5)
	lla	a5,head
	lw	a4,-24(s0)
	sw	a4,0(a5)
.L11:
	nop
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	lw	a4,20(sp)
	.cfi_restore 14
	lw	a5,16(sp)
	.cfi_restore 15
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	mret
	.cfi_endproc
.LFE2:
	.size	handle_keyboard_interrupt, .-handle_keyboard_interrupt
	.align	2
	.globl	my_get_char
	.type	my_get_char, @function
my_get_char:
.LFB3:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	nop
.L13:
	lla	a5,head
	lw	a4,0(a5)
	lla	a5,tail
	lw	a5,0(a5)
	beq	a4,a5,.L13
	lla	a5,tail
	lw	a5,0(a5)
	lla	a4,kbd_buffer
	add	a5,a4,a5
	lbu	a5,0(a5)
	sb	a5,-17(s0)
	lla	a5,tail
	lw	a5,0(a5)
	addi	a4,a5,1
	srai	a5,a4,31
	srli	a5,a5,26
	add	a4,a4,a5
	andi	a4,a4,63
	sub	a5,a4,a5
	mv	a4,a5
	lla	a5,tail
	sw	a4,0(a5)
	lbu	a5,-17(s0)
	mv	a0,a5
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE3:
	.size	my_get_char, .-my_get_char
	.align	2
	.globl	my_print_int
	.type	my_print_int, @function
my_print_int:
.LFB4:
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
	lw	a5,-36(s0)
	bne	a5,zero,.L16
	li	a0,48
	call	my_putc
	j	.L15
.L16:
	sw	zero,-20(s0)
	j	.L18
.L19:
	lw	a4,-36(s0)
	li	a5,1717985280
	addi	a5,a5,1639
	mulh	a5,a4,a5
	srai	a3,a5,2
	srai	a5,a4,31
	sub	a3,a3,a5
	mv	a5,a3
	slli	a5,a5,2
	add	a5,a5,a3
	slli	a5,a5,1
	sub	a3,a4,a5
	andi	a4,a3,0xff
	lw	a5,-20(s0)
	addi	a3,a5,1
	sw	a3,-20(s0)
	addi	a4,a4,48
	andi	a4,a4,0xff
	addi	a5,a5,-16
	add	a5,a5,s0
	sb	a4,-16(a5)
	lw	a5,-36(s0)
	li	a4,1717985280
	addi	a4,a4,1639
	mulh	a4,a5,a4
	srai	a4,a4,2
	srai	a5,a5,31
	sub	a5,a4,a5
	sw	a5,-36(s0)
.L18:
	lw	a5,-36(s0)
	bgt	a5,zero,.L19
	j	.L20
.L21:
	lw	a5,-20(s0)
	addi	a5,a5,-1
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	lbu	a5,-16(a5)
	mv	a0,a5
	call	my_putc
.L20:
	lw	a5,-20(s0)
	bgt	a5,zero,.L21
.L15:
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE4:
	.size	my_print_int, .-my_print_int
	.section	.rodata
	.align	2
.LC0:
	.string	"System Ready. Waiting for input...\n"
	.align	2
.LC1:
	.string	"Duration: "
	.align	2
.LC2:
	.string	" mins\nFee: "
	.align	2
.LC3:
	.string	" Yuan\n"
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB5:
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	ra,44(sp)
	sw	s0,40(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	lla	a0,.LC0
	call	my_console_print
	li	a5,8
	sw	a5,-32(s0)
	li	a5,30
	sw	a5,-36(s0)
	li	a5,10
	sw	a5,-40(s0)
	li	a5,45
	sw	a5,-44(s0)
	lw	a4,-40(s0)
	mv	a5,a4
	slli	a5,a5,4
	sub	a5,a5,a4
	slli	a5,a5,2
	mv	a4,a5
	lw	a5,-44(s0)
	add	a3,a4,a5
	lw	a4,-32(s0)
	mv	a5,a4
	slli	a5,a5,4
	sub	a5,a5,a4
	slli	a5,a5,2
	mv	a4,a5
	lw	a5,-36(s0)
	add	a5,a4,a5
	sub	a5,a3,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	bge	a5,zero,.L24
	lw	a5,-20(s0)
	addi	a5,a5,1440
	sw	a5,-20(s0)
.L24:
	sw	zero,-24(s0)
	lw	a5,-20(s0)
	addi	a5,a5,59
	sw	a5,-28(s0)
	j	.L25
.L26:
	lw	a5,-28(s0)
	addi	a5,a5,-60
	sw	a5,-28(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L25:
	lw	a4,-28(s0)
	li	a5,59
	bgt	a4,a5,.L26
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	sw	a5,-48(s0)
	lla	a0,.LC1
	call	my_console_print
	lw	a0,-20(s0)
	call	my_print_int
	lla	a0,.LC2
	call	my_console_print
	lw	a0,-48(s0)
	call	my_print_int
	lla	a0,.LC3
	call	my_console_print
.L27:
	j	.L27
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.ident	"GCC: (Gentoo 15.2.1_p20251122 p4) 15.2.1 20251122"
	.section	.note.GNU-stack,"",@progbits
