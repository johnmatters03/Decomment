	.arch armv8-a
	.file	"decomment.c"
	.text
	.align	2
	.global	handleNormal
	.type	handleNormal, %function
handleNormal:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	str	wzr, [sp, 44]
	ldr	w0, [sp, 28]
	cmp	w0, 34
	bne	.L2
	mov	w0, 1
	str	w0, [sp, 44]
.L2:
	ldr	w0, [sp, 28]
	cmp	w0, 39
	bne	.L3
	mov	w0, 3
	str	w0, [sp, 44]
.L3:
	ldr	w0, [sp, 28]
	cmp	w0, 47
	bne	.L4
	mov	w0, 5
	str	w0, [sp, 44]
.L4:
	ldr	w0, [sp, 44]
	cmp	w0, 5
	beq	.L5
	ldr	w0, [sp, 28]
	bl	putchar
.L5:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	handleNormal, .-handleNormal
	.align	2
	.global	handleStrLit
	.type	handleStrLit, %function
handleStrLit:
.LFB1:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	mov	w0, 1
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	cmp	w0, 92
	bne	.L8
	mov	w0, 2
	str	w0, [sp, 44]
.L8:
	ldr	w0, [sp, 28]
	cmp	w0, 34
	bne	.L9
	str	wzr, [sp, 44]
.L9:
	ldr	w0, [sp, 28]
	bl	putchar
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1:
	.size	handleStrLit, .-handleStrLit
	.align	2
	.global	handleStrOChar
	.type	handleStrOChar, %function
handleStrOChar:
.LFB2:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	mov	w0, 1
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	bl	putchar
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2:
	.size	handleStrOChar, .-handleStrOChar
	.align	2
	.global	handleCharLit
	.type	handleCharLit, %function
handleCharLit:
.LFB3:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	mov	w0, 3
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	cmp	w0, 92
	bne	.L14
	mov	w0, 4
	str	w0, [sp, 44]
.L14:
	ldr	w0, [sp, 28]
	cmp	w0, 39
	bne	.L15
	str	wzr, [sp, 44]
.L15:
	ldr	w0, [sp, 28]
	bl	putchar
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3:
	.size	handleCharLit, .-handleCharLit
	.align	2
	.global	handleCharOChar
	.type	handleCharOChar, %function
handleCharOChar:
.LFB4:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	mov	w0, 3
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	bl	putchar
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4:
	.size	handleCharOChar, .-handleCharOChar
	.align	2
	.global	handleSW
	.type	handleSW, %function
handleSW:
.LFB5:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	mov	w0, 5
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	cmp	w0, 42
	bne	.L20
	mov	w0, 32
	bl	putchar
	mov	w0, 6
	str	w0, [sp, 44]
	ldr	w0, [sp, 44]
	b	.L21
.L20:
	ldr	w0, [sp, 28]
	cmp	w0, 34
	bne	.L22
	mov	w0, 1
	str	w0, [sp, 44]
	mov	w0, 47
	bl	putchar
	ldr	w0, [sp, 28]
	bl	putchar
	ldr	w0, [sp, 44]
	b	.L21
.L22:
	ldr	w0, [sp, 28]
	cmp	w0, 39
	bne	.L23
	mov	w0, 3
	str	w0, [sp, 44]
	mov	w0, 47
	bl	putchar
	ldr	w0, [sp, 28]
	bl	putchar
	ldr	w0, [sp, 44]
	b	.L21
.L23:
	ldr	w0, [sp, 28]
	cmp	w0, 47
	beq	.L24
	str	wzr, [sp, 44]
	mov	w0, 47
	bl	putchar
	ldr	w0, [sp, 28]
	bl	putchar
	ldr	w0, [sp, 44]
	b	.L21
.L24:
	mov	w0, 47
	bl	putchar
	ldr	w0, [sp, 44]
.L21:
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5:
	.size	handleSW, .-handleSW
	.align	2
	.global	handleInComment
	.type	handleInComment, %function
handleInComment:
.LFB6:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	mov	w0, 6
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	cmp	w0, 42
	bne	.L26
	mov	w0, 7
	str	w0, [sp, 44]
.L26:
	ldr	w0, [sp, 28]
	cmp	w0, 10
	bne	.L27
	ldr	w0, [sp, 28]
	bl	putchar
.L27:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE6:
	.size	handleInComment, .-handleInComment
	.align	2
	.global	handleFW
	.type	handleFW, %function
handleFW:
.LFB7:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	mov	w0, 7
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	cmp	w0, 47
	bne	.L30
	str	wzr, [sp, 44]
	ldr	w0, [sp, 44]
	b	.L31
.L30:
	ldr	w0, [sp, 28]
	cmp	w0, 10
	bne	.L32
	ldr	w0, [sp, 28]
	bl	putchar
.L32:
	ldr	w0, [sp, 28]
	cmp	w0, 42
	beq	.L33
	mov	w0, 6
	str	w0, [sp, 44]
	ldr	w0, [sp, 44]
	b	.L31
.L33:
	ldr	w0, [sp, 44]
.L31:
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE7:
	.size	handleFW, .-handleFW
	.section	.rodata
	.align	3
.LC0:
	.string	"Error: line %d: unterminated comment\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB8:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	mov	w0, 1
	str	w0, [sp, 28]
	str	wzr, [sp, 20]
	b	.L35
.L46:
	ldr	w0, [sp, 16]
	cmp	w0, 10
	bne	.L36
	ldr	w0, [sp, 28]
	add	w0, w0, 1
	str	w0, [sp, 28]
.L36:
	ldr	w0, [sp, 20]
	cmp	w0, 7
	beq	.L37
	ldr	w0, [sp, 20]
	cmp	w0, 7
	bhi	.L35
	ldr	w0, [sp, 20]
	cmp	w0, 6
	beq	.L38
	ldr	w0, [sp, 20]
	cmp	w0, 6
	bhi	.L35
	ldr	w0, [sp, 20]
	cmp	w0, 5
	beq	.L39
	ldr	w0, [sp, 20]
	cmp	w0, 5
	bhi	.L35
	ldr	w0, [sp, 20]
	cmp	w0, 4
	beq	.L40
	ldr	w0, [sp, 20]
	cmp	w0, 4
	bhi	.L35
	ldr	w0, [sp, 20]
	cmp	w0, 3
	beq	.L41
	ldr	w0, [sp, 20]
	cmp	w0, 3
	bhi	.L35
	ldr	w0, [sp, 20]
	cmp	w0, 2
	beq	.L42
	ldr	w0, [sp, 20]
	cmp	w0, 2
	bhi	.L35
	ldr	w0, [sp, 20]
	cmp	w0, 0
	beq	.L43
	ldr	w0, [sp, 20]
	cmp	w0, 1
	beq	.L44
	b	.L35
.L43:
	ldr	w0, [sp, 16]
	bl	handleNormal
	str	w0, [sp, 20]
	b	.L35
.L44:
	ldr	w0, [sp, 16]
	bl	handleStrLit
	str	w0, [sp, 20]
	b	.L35
.L42:
	ldr	w0, [sp, 16]
	bl	handleStrOChar
	str	w0, [sp, 20]
	b	.L35
.L41:
	ldr	w0, [sp, 16]
	bl	handleCharLit
	str	w0, [sp, 20]
	b	.L35
.L40:
	ldr	w0, [sp, 16]
	bl	handleCharOChar
	str	w0, [sp, 20]
	b	.L35
.L39:
	ldr	w0, [sp, 16]
	cmp	w0, 42
	bne	.L45
	ldr	w0, [sp, 28]
	str	w0, [sp, 24]
.L45:
	ldr	w0, [sp, 16]
	bl	handleSW
	str	w0, [sp, 20]
	b	.L35
.L38:
	ldr	w0, [sp, 16]
	bl	handleInComment
	str	w0, [sp, 20]
	b	.L35
.L37:
	ldr	w0, [sp, 16]
	bl	handleFW
	str	w0, [sp, 20]
	nop
.L35:
	bl	getchar
	str	w0, [sp, 16]
	ldr	w0, [sp, 16]
	cmn	w0, #1
	bne	.L46
	ldr	w0, [sp, 20]
	cmp	w0, 5
	bne	.L47
	mov	w0, 47
	bl	putchar
.L47:
	ldr	w0, [sp, 20]
	cmp	w0, 6
	beq	.L48
	ldr	w0, [sp, 20]
	cmp	w0, 7
	bne	.L49
.L48:
	adrp	x0, stderr
	add	x0, x0, :lo12:stderr
	ldr	x3, [x0]
	ldr	w2, [sp, 24]
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	mov	x0, x3
	bl	fprintf
	mov	w0, 1
	b	.L50
.L49:
	mov	w0, 0
.L50:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.3.1 20221121 (Red Hat 11.3.1-4)"
	.section	.note.GNU-stack,"",@progbits
