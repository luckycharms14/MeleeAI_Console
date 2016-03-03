	.file	"Controller.c"
	.section	".text"
	.align 2
	.globl Press
	.type	Press, @function
Press:
	stwu 1,-24(1)
	stw 31,20(1)
	mr 31,1
	mr 9,3
	stb 9,8(31)
	lbz 9,8(31)
	rlwinm 9,9,0,0xff
	cmpwi 7,9,65
	bne 7,.L2
	lis 9,0x8000
	ori 9,9,16368
	li 10,256
	stw 10,0(9)
	b .L1
.L2:
	lbz 9,8(31)
	rlwinm 9,9,0,0xff
	cmpwi 7,9,66
	bne 7,.L4
	lis 9,0x8000
	ori 9,9,16368
	li 10,512
	stw 10,0(9)
	b .L1
.L4:
	lbz 9,8(31)
	rlwinm 9,9,0,0xff
	cmpwi 7,9,88
	bne 7,.L5
	lis 9,0x8000
	ori 9,9,16368
	li 10,1024
	stw 10,0(9)
	b .L1
.L5:
	lbz 9,8(31)
	rlwinm 9,9,0,0xff
	cmpwi 7,9,90
	bne 7,.L6
	lis 9,0x8000
	ori 9,9,16368
	li 10,16
	stw 10,0(9)
	b .L1
.L6:
	lis 9,0x8000
	ori 9,9,16368
	li 10,64
	stw 10,0(9)
.L1:
	addi 11,31,24
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	Press, .-Press
	.align 2
	.globl Release
	.type	Release, @function
Release:
	stwu 1,-16(1)
	stw 31,12(1)
	mr 31,1
	lis 9,0x8000
	ori 9,9,16368
	li 10,0
	stw 10,0(9)
	addi 11,31,16
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	Release, .-Release
	.align 2
	.globl SetStick
	.type	SetStick, @function
SetStick:
	stwu 1,-40(1)
	mflr 0
	stw 0,44(1)
	stw 30,32(1)
	stw 31,36(1)
	mr 31,1
	stw 3,24(31)
	lwz 9,24(31)
	nor 9,9,9
	srwi 9,9,31
	rlwinm 9,9,0,0xff
	mr 10,9
	lwz 9,24(31)
	srwi 9,9,31
	rlwinm 9,9,0,0xff
	subf 7,9,10
	lwz 9,24(31)
	srawi 10,9,31
	lwz 9,24(31)
	xor 9,10,9
	subf 9,10,9
	mulli 8,9,400
	lwz 9,24(31)
	srawi 10,9,31
	lwz 9,24(31)
	xor 9,10,9
	subf 9,10,9
	subfic 9,9,180
	mullw 6,8,9
	lwz 9,24(31)
	srawi 10,9,31
	lwz 9,24(31)
	xor 9,10,9
	subf 9,10,9
	lwz 10,24(31)
	srawi 8,10,31
	lwz 10,24(31)
	xor 10,8,10
	subf 10,8,10
	addi 10,10,-180
	mullw 9,9,10
	addis 9,9,0x1
	addi 9,9,-25036
	divw 9,6,9
	mullw 9,7,9
	stw 9,12(31)
	lwz 10,24(31)
	li 9,-90
	cmpw 7,10,9
	blt 7,.L9
	lwz 9,24(31)
	cmpwi 7,9,90
	bgt 7,.L9
	lwz 9,24(31)
	srawi 10,9,31
	lwz 9,24(31)
	xor 9,10,9
	subf 9,10,9
	addi 9,9,90
	mulli 8,9,400
	lwz 9,24(31)
	srawi 10,9,31
	lwz 9,24(31)
	xor 9,10,9
	subf 9,10,9
	subfic 9,9,90
	mullw 8,8,9
	lwz 9,24(31)
	srawi 10,9,31
	lwz 9,24(31)
	xor 9,10,9
	subf 9,10,9
	addi 7,9,90
	lwz 9,24(31)
	srawi 10,9,31
	lwz 9,24(31)
	xor 9,10,9
	subf 9,10,9
	addi 9,9,-90
	mullw 9,7,9
	addis 9,9,0x1
	addi 9,9,-25036
	divw 9,8,9
	stw 9,8(31)
	b .L10
.L9:
	lwz 9,24(31)
	srawi 10,9,31
	lwz 9,24(31)
	xor 9,10,9
	subf 9,10,9
	addi 9,9,-90
	mulli 8,9,400
	lwz 9,24(31)
	srawi 10,9,31
	lwz 9,24(31)
	xor 9,10,9
	subf 9,10,9
	subfic 9,9,270
	mullw 8,8,9
	lwz 9,24(31)
	srawi 10,9,31
	lwz 9,24(31)
	xor 9,10,9
	subf 9,10,9
	addi 7,9,-90
	lwz 9,24(31)
	srawi 10,9,31
	lwz 9,24(31)
	xor 9,10,9
	subf 9,10,9
	addi 9,9,-270
	mullw 9,7,9
	addis 9,9,0x1
	addi 9,9,-25036
	divw 9,8,9
	neg 9,9
	stw 9,8(31)
.L10:
	lis 9,0x8019
	ori 9,9,4632
	stw 9,16(31)
	lis 9,0x8000
	ori 30,9,16372
	lwz 9,16(31)
	lwz 3,8(31)
	mtctr 9
	bctrl
	mr 9,3
	stw 9,0(30)
	lis 9,0x8000
	ori 30,9,16376
	lwz 9,16(31)
	lwz 3,12(31)
	mtctr 9
	bctrl
	mr 9,3
	stw 9,0(30)
	addi 11,31,40
	lwz 0,4(11)
	mtlr 0
	lwz 30,-8(11)
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	SetStick, .-SetStick
	.align 2
	.globl ResetStick
	.type	ResetStick, @function
ResetStick:
	stwu 1,-16(1)
	stw 31,12(1)
	mr 31,1
	lis 9,0x8000
	ori 9,9,16372
	li 10,0
	stw 10,0(9)
	lis 9,0x8000
	ori 9,9,16376
	li 10,0
	stw 10,0(9)
	addi 11,31,16
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	ResetStick, .-ResetStick
	.align 2
	.globl WriteControllerState
	.type	WriteControllerState, @function
WriteControllerState:
	stwu 1,-32(1)
	stw 31,28(1)
	mr 31,1
	lis 9,0x804c
	ori 9,9,8176
	stw 9,8(31)
	lis 9,0x8000
	ori 9,9,16368
	lwz 10,0(9)
	lwz 9,8(31)
	stw 10,0(9)
	lwz 9,8(31)
	addi 9,9,32
	lis 10,0x8000
	ori 10,10,16372
	lwz 10,0(10)
	stw 10,0(9)
	lwz 9,8(31)
	addi 9,9,36
	lis 10,0x8000
	ori 10,10,16376
	lwz 10,0(10)
	stw 10,0(9)
	lis 9,0x8045
	ori 9,9,16320
	lwz 9,0(9)
	addi 9,9,1664
	stw 9,12(31)
	lis 9,0x8000
	ori 9,9,16372
	lwz 10,0(9)
	lwz 9,12(31)
	stw 10,0(9)
	lwz 9,12(31)
	addi 9,9,4
	lis 10,0x8000
	ori 10,10,16376
	lwz 10,0(10)
	stw 10,0(9)
	addi 11,31,32
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	WriteControllerState, .-WriteControllerState
	.ident	"GCC: (devkitPPC release 27) 4.8.2"
