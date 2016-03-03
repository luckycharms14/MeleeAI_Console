	.file	"FloatHandler.c"
	.section	".text"
	.align 2
	.globl bit_mask
	.type	bit_mask, @function
bit_mask:
	stwu 1,-40(1)
	stw 31,36(1)
	mr 31,1
	stw 3,24(31)
	stw 4,28(31)
	li 9,0
	stw 9,8(31)
	lwz 9,24(31)
	stw 9,12(31)
	b .L2
.L3:
	lwz 9,12(31)
	li 10,1
	slw 9,10,9
	lwz 10,8(31)
	or 9,10,9
	stw 9,8(31)
	lwz 9,12(31)
	addi 9,9,1
	stw 9,12(31)
.L2:
	lwz 10,12(31)
	lwz 9,28(31)
	cmplw 7,10,9
	ble 7,.L3
	lwz 9,8(31)
	mr 3,9
	addi 11,31,40
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	bit_mask, .-bit_mask
	.align 2
	.globl fl_pow
	.type	fl_pow, @function
fl_pow:
	stwu 1,-48(1)
	stw 31,44(1)
	mr 31,1
	stw 3,24(31)
	stw 4,28(31)
	stw 5,32(31)
	lwz 9,32(31)
	stw 9,8(31)
	lwz 10,24(31)
	lwz 9,32(31)
	mullw 9,10,9
	stw 9,16(31)
	li 9,0
	stw 9,12(31)
	b .L6
.L9:
	lwz 9,28(31)
	cmpwi 7,9,0
	ble 7,.L7
	lwz 10,8(31)
	lwz 9,16(31)
	mullw 9,10,9
	mr 10,9
	lwz 9,32(31)
	divwu 9,10,9
	stw 9,8(31)
	b .L8
.L7:
	lwz 10,8(31)
	lwz 9,32(31)
	mullw 10,10,9
	lwz 9,16(31)
	divwu 9,10,9
	stw 9,8(31)
.L8:
	lwz 9,12(31)
	addi 9,9,1
	stw 9,12(31)
.L6:
	lwz 9,28(31)
	srawi 10,9,31
	lwz 9,28(31)
	xor 9,10,9
	subf 9,10,9
	lwz 10,12(31)
	cmpw 7,9,10
	bgt 7,.L9
	lwz 9,8(31)
	mr 3,9
	addi 11,31,48
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	fl_pow, .-fl_pow
	.align 2
	.globl float_to_int
	.type	float_to_int, @function
float_to_int:
	stwu 1,-40(1)
	mflr 0
	stw 0,44(1)
	stw 30,32(1)
	stw 31,36(1)
	mr 31,1
	stw 3,24(31)
	li 9,0
	stw 9,8(31)
	lwz 9,24(31)
	srawi 9,9,31
	lwz 10,24(31)
	xor 30,9,10
	subf 30,9,30
	li 3,2
	li 4,-6
	li 5,100
	bl fl_pow
	mr 9,3
	cmpw 7,30,9
	bgt 7,.L12
	li 9,0
	b .L13
.L12:
	lwz 9,24(31)
	cmpwi 7,9,0
	bge 7,.L14
	lwz 9,8(31)
	oris 9,9,0x8000
	stw 9,8(31)
.L14:
	lwz 9,24(31)
	srawi 9,9,31
	lwz 10,24(31)
	xor 10,10,9
	subf 9,9,10
	stw 9,24(31)
	li 9,-6
	stw 9,12(31)
	b .L15
.L16:
	lwz 9,12(31)
	addi 9,9,1
	stw 9,12(31)
.L15:
	li 3,2
	lwz 4,12(31)
	li 5,100
	bl fl_pow
	mr 10,3
	lwz 9,24(31)
	cmpw 7,10,9
	blt 7,.L16
	lwz 9,12(31)
	addi 9,9,-1
	stw 9,12(31)
	li 3,23
	li 4,30
	bl bit_mask
	mr 10,3
	lwz 9,12(31)
	addi 9,9,127
	slwi 9,9,23
	and 9,10,9
	lwz 10,8(31)
	or 9,10,9
	stw 9,8(31)
	lwz 9,24(31)
	mulli 30,9,10000
	li 3,2
	lwz 4,12(31)
	li 5,100
	bl fl_pow
	mr 9,3
	divw 9,30,9
	addi 9,9,-10000
	stw 9,16(31)
	li 9,1
	stw 9,20(31)
	b .L17
.L19:
	lwz 9,20(31)
	neg 9,9
	li 3,2
	mr 4,9
	li 5,10000
	bl fl_pow
	mr 9,3
	mr 10,9
	lwz 9,16(31)
	cmplw 7,10,9
	bge 7,.L18
	lwz 9,20(31)
	neg 9,9
	li 3,2
	mr 4,9
	li 5,10000
	bl fl_pow
	mr 9,3
	lwz 10,16(31)
	subf 9,9,10
	stw 9,16(31)
	lwz 9,20(31)
	subfic 9,9,23
	li 10,1
	slw 9,10,9
	lwz 10,8(31)
	or 9,10,9
	stw 9,8(31)
.L18:
	lwz 9,20(31)
	addi 9,9,1
	stw 9,20(31)
.L17:
	lwz 9,20(31)
	cmpwi 7,9,13
	ble 7,.L19
	lwz 9,8(31)
.L13:
	mr 3,9
	addi 11,31,40
	lwz 0,4(11)
	mtlr 0
	lwz 30,-8(11)
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	float_to_int, .-float_to_int
	.align 2
	.globl int_to_float
	.type	int_to_float, @function
int_to_float:
	stwu 1,-48(1)
	mflr 0
	stw 0,52(1)
	stw 29,36(1)
	stw 30,40(1)
	stw 31,44(1)
	mr 31,1
	stw 3,24(31)
	lwz 9,24(31)
	srwi 9,9,31
	stw 9,16(31)
	li 3,23
	li 4,30
	bl bit_mask
	mr 10,3
	lwz 9,24(31)
	and 9,10,9
	srwi 9,9,23
	addi 9,9,-127
	stw 9,20(31)
	li 9,10000
	stw 9,8(31)
	li 9,1
	stw 9,12(31)
	b .L21
.L22:
	lwz 9,12(31)
	subfic 9,9,23
	li 10,1
	slw 9,10,9
	mr 10,9
	lwz 9,24(31)
	and 10,10,9
	lwz 9,12(31)
	subfic 9,9,23
	srw 30,10,9
	lwz 9,12(31)
	neg 9,9
	li 3,2
	mr 4,9
	li 5,10000
	bl fl_pow
	mr 9,3
	mullw 9,30,9
	mulli 10,9,10000
	lis 9,0xd1b7
	ori 9,9,5977
	mulhwu 9,10,9
	srwi 9,9,13
	lwz 10,8(31)
	add 9,10,9
	stw 9,8(31)
	lwz 9,12(31)
	addi 9,9,1
	stw 9,12(31)
.L21:
	lwz 9,12(31)
	cmpwi 7,9,13
	ble 7,.L22
	lwz 9,16(31)
	mulli 9,9,-2
	addi 9,9,1
	mr 30,9
	lwz 10,8(31)
	lis 9,0x51eb
	ori 9,9,34079
	mulhwu 9,10,9
	srwi 29,9,5
	li 3,2
	lwz 4,20(31)
	li 5,100
	bl fl_pow
	mr 9,3
	mullw 10,29,9
	lis 9,0x51eb
	ori 9,9,34079
	mulhwu 9,10,9
	srwi 9,9,5
	mullw 9,30,9
	mr 3,9
	addi 11,31,48
	lwz 0,4(11)
	mtlr 0
	lwz 29,-12(11)
	lwz 30,-8(11)
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	int_to_float, .-int_to_float
	.ident	"GCC: (devkitPPC release 27) 4.8.2"
