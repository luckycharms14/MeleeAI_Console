	.file	"InputQueue.c"
	.section	".text"
	.align 2
	.globl IQ_AddInput
	.type	IQ_AddInput, @function
IQ_AddInput:
	stwu 1,-48(1)
	stw 31,44(1)
	mr 31,1
	stw 3,24(31)
	stw 4,28(31)
	stw 5,32(31)
	stw 6,36(31)
	lis 9,0x8000
	ori 9,9,6916
	stw 9,8(31)
	lis 9,0x8000
	ori 9,9,6912
	lwz 9,0(9)
	slwi 9,9,4
	lwz 10,8(31)
	add 9,10,9
	lwz 10,24(31)
	stw 10,0(9)
	lis 9,0x8000
	ori 9,9,6912
	lwz 9,0(9)
	slwi 9,9,4
	lwz 10,8(31)
	add 9,10,9
	lwz 10,28(31)
	stw 10,4(9)
	lis 9,0x8000
	ori 9,9,6912
	lwz 9,0(9)
	slwi 9,9,4
	lwz 10,8(31)
	add 9,10,9
	lwz 10,32(31)
	stw 10,8(9)
	lis 9,0x8000
	ori 10,9,6912
	lwz 9,0(10)
	addi 8,9,1
	stw 8,0(10)
	slwi 9,9,4
	lwz 10,8(31)
	add 9,10,9
	lwz 10,36(31)
	stw 10,12(9)
	addi 11,31,48
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	IQ_AddInput, .-IQ_AddInput
	.align 2
	.globl CheckCondition
	.type	CheckCondition, @function
CheckCondition:
	stwu 1,-32(1)
	mflr 0
	stw 0,36(1)
	stw 31,28(1)
	mr 31,1
	lis 9,0x8000
	ori 9,9,6916
	stw 9,8(31)
	lis 9,0x8000
	ori 9,9,6912
	lwz 9,0(9)
	addis 9,9,0x1000
	addi 9,9,-1
	slwi 9,9,4
	lwz 10,8(31)
	add 9,10,9
	lwz 9,0(9)
	stw 9,12(31)
	lis 9,0x8000
	ori 9,9,6912
	lwz 9,0(9)
	addis 9,9,0x1000
	addi 9,9,-1
	slwi 9,9,4
	lwz 10,8(31)
	add 9,10,9
	lwz 10,4(9)
	lwz 9,12(31)
	mr 3,10
	mtctr 9
	bctrl
	mr 9,3
	mr 3,9
	addi 11,31,32
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	CheckCondition, .-CheckCondition
	.align 2
	.globl IQ_CheckQueue
	.type	IQ_CheckQueue, @function
IQ_CheckQueue:
	stwu 1,-32(1)
	mflr 0
	stw 0,36(1)
	stw 31,28(1)
	mr 31,1
	lis 9,0x8000
	ori 9,9,6912
	lwz 9,0(9)
	cmpwi 7,9,0
	beq 7,.L4
	lis 9,0x8000
	ori 9,9,6916
	stw 9,8(31)
	b .L6
.L7:
	lis 9,0x8000
	ori 9,9,6912
	lwz 10,0(9)
	addi 10,10,-1
	stw 10,0(9)
	lwz 9,0(9)
	slwi 9,9,4
	lwz 10,8(31)
	add 9,10,9
	lwz 9,8(9)
	stw 9,12(31)
	lis 9,0x8000
	ori 9,9,6912
	lwz 9,0(9)
	slwi 9,9,4
	lwz 10,8(31)
	add 9,10,9
	lwz 10,12(9)
	lwz 9,12(31)
	mr 3,10
	mtctr 9
	bctrl
.L6:
	lis 9,0x8000
	ori 9,9,6912
	lwz 9,0(9)
	cmpwi 7,9,0
	beq 7,.L4
	bl CheckCondition
	mr 9,3
	cmpwi 7,9,0
	bne 7,.L7
.L4:
	addi 11,31,32
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	IQ_CheckQueue, .-IQ_CheckQueue
	.ident	"GCC: (devkitPPC release 27) 4.8.2"
