	.file	"EventQueue.c"
	.section	".text"
	.align 2
	.globl EQ_AddEvent
	.type	EQ_AddEvent, @function
EQ_AddEvent:
	stwu 1,-40(1)
	stw 31,36(1)
	mr 31,1
	stw 3,24(31)
	stw 4,28(31)
	lis 9,0x8000
	ori 9,9,6148
	stw 9,8(31)
	lis 9,0x8000
	ori 9,9,6144
	lwz 9,0(9)
	slwi 9,9,3
	lwz 10,8(31)
	add 9,10,9
	lwz 10,24(31)
	stw 10,0(9)
	lis 9,0x8000
	ori 10,9,6144
	lwz 9,0(10)
	addi 8,9,1
	stw 8,0(10)
	slwi 9,9,3
	lwz 10,8(31)
	add 9,10,9
	lwz 10,28(31)
	stw 10,4(9)
	addi 11,31,40
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	EQ_AddEvent, .-EQ_AddEvent
	.align 2
	.globl EQ_CheckQueue
	.type	EQ_CheckQueue, @function
EQ_CheckQueue:
	stwu 1,-48(1)
	mflr 0
	stw 0,52(1)
	stw 31,44(1)
	mr 31,1
	lis 9,0x8000
	ori 9,9,6148
	stw 9,12(31)
	li 9,0
	stw 9,8(31)
	b .L3
.L6:
	lwz 9,8(31)
	slwi 9,9,3
	lwz 10,12(31)
	add 9,10,9
	lwz 9,0(9)
	stw 9,16(31)
	lwz 9,16(31)
	mtctr 9
	bctrl
	mr 9,3
	cmpwi 7,9,0
	beq 7,.L4
	lis 9,0x8019
	ori 9,9,6264
	stw 9,20(31)
	lis 9,0x8019
	ori 9,9,5648
	stw 9,24(31)
	lwz 9,20(31)
	mtctr 9
	bctrl
	lwz 9,24(31)
	mtctr 9
	bctrl
	lis 9,0x8000
	ori 9,9,6912
	li 10,0
	stw 10,0(9)
	lis 9,0x8000
	ori 9,9,6144
	li 10,0
	stw 10,0(9)
	lwz 9,8(31)
	slwi 9,9,3
	lwz 10,12(31)
	add 9,10,9
	lwz 9,4(9)
	stw 9,28(31)
	lwz 9,28(31)
	mtctr 9
	bctrl
	b .L2
.L4:
	lwz 9,8(31)
	addi 9,9,1
	stw 9,8(31)
.L3:
	lis 9,0x8000
	ori 9,9,6144
	lwz 10,0(9)
	lwz 9,8(31)
	cmplw 7,10,9
	bgt 7,.L6
.L2:
	addi 11,31,48
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	EQ_CheckQueue, .-EQ_CheckQueue
	.ident	"GCC: (devkitPPC release 27) 4.8.2"
