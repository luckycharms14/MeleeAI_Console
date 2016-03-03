	.file	"MoveSet.c"
	.section	".text"
	.align 2
	.globl HitTech
	.type	HitTech, @function
HitTech:
	stwu 1,-40(1)
	mflr 0
	stw 0,44(1)
	stw 31,36(1)
	mr 31,1
	stw 3,24(31)
	lis 9,0x8019
	ori 9,9,7816
	stw 9,8(31)
	lis 9,0x8019
	ori 9,9,7424
	stw 9,12(31)
	lis 9,0x8047
	ori 9,9,40288
	lwz 9,0(9)
	stw 9,16(31)
	lis 9,0x8045
	ori 9,9,16320
	lwz 9,0(9)
	addi 9,9,1760
	li 10,0
	stb 10,0(9)
	lis 9,0x8045
	ori 9,9,16320
	lwz 9,0(9)
	addi 9,9,1761
	li 10,-1
	stb 10,0(9)
	lwz 9,12(31)
	lis 10,0x8030
	ori 3,10,1248
	lis 10,0x8030
	ori 4,10,6264
	mtctr 9
	bctrl
	lwz 9,12(31)
	lis 10,0x8030
	ori 3,10,1344
	lis 10,0x8030
	ori 4,10,6264
	mtctr 9
	bctrl
	lwz 9,16(31)
	addi 9,9,10
	mr 10,9
	lwz 9,8(31)
	lis 8,0x8030
	ori 3,8,1176
	mr 4,10
	lis 10,0x8030
	ori 5,10,6264
	li 6,0
	mtctr 9
	bctrl
	lwz 9,16(31)
	addi 9,9,10
	mr 10,9
	lwz 9,8(31)
	lis 8,0x8030
	ori 3,8,1176
	mr 4,10
	lis 10,0x8019
	ori 5,10,6264
	li 6,0
	mtctr 9
	bctrl
	lwz 8,16(31)
	lwz 10,24(31)
	lwz 9,8(31)
	lis 7,0x8030
	ori 3,7,1176
	mr 4,8
	lis 8,0x8019
	ori 5,8,5692
	mr 6,10
	mtctr 9
	bctrl
	addi 11,31,40
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	HitTech, .-HitTech
	.align 2
	.globl InputDI
	.type	InputDI, @function
InputDI:
	stwu 1,-40(1)
	mflr 0
	stw 0,44(1)
	stw 31,36(1)
	mr 31,1
	stw 3,24(31)
	lis 9,0x8019
	ori 9,9,7816
	stw 9,8(31)
	lis 9,0x8047
	ori 9,9,40288
	lwz 9,0(9)
	stw 9,12(31)
	lwz 9,12(31)
	addi 9,9,4
	mr 10,9
	lwz 9,8(31)
	lis 8,0x8030
	ori 3,8,1176
	mr 4,10
	lis 10,0x8019
	ori 5,10,6264
	li 6,0
	mtctr 9
	bctrl
	lwz 9,12(31)
	addi 9,9,1
	mr 10,9
	lwz 9,8(31)
	lis 8,0x8030
	ori 3,8,1176
	mr 4,10
	lis 10,0x8019
	ori 5,10,5692
	lwz 6,24(31)
	mtctr 9
	bctrl
	addi 11,31,40
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	InputDI, .-InputDI
	.align 2
	.globl UpB
	.type	UpB, @function
UpB:
	stwu 1,-40(1)
	mflr 0
	stw 0,44(1)
	stw 31,36(1)
	mr 31,1
	stw 3,24(31)
	lis 9,0x8019
	ori 9,9,7816
	stw 9,8(31)
	lis 9,0x8019
	ori 9,9,7424
	stw 9,12(31)
	lis 9,0x8047
	ori 9,9,40288
	lwz 9,0(9)
	stw 9,16(31)
	bl LoadRecoveryInterrupts
	lwz 9,12(31)
	lis 10,0x8030
	ori 3,10,2988
	lis 10,0x8030
	ori 4,10,6264
	mtctr 9
	bctrl
	lwz 9,16(31)
	addi 9,9,44
	mr 10,9
	lwz 9,8(31)
	lis 8,0x8030
	ori 3,8,1176
	mr 4,10
	lis 10,0x8019
	ori 5,10,6264
	li 6,0
	mtctr 9
	bctrl
	lwz 9,16(31)
	addi 9,9,3
	mr 10,9
	lwz 9,8(31)
	lis 8,0x8030
	ori 3,8,1176
	mr 4,10
	lis 10,0x8019
	ori 5,10,5648
	li 6,0
	mtctr 9
	bctrl
	lwz 9,16(31)
	addi 9,9,3
	mr 10,9
	lwz 9,8(31)
	lis 8,0x8030
	ori 3,8,1176
	mr 4,10
	lis 10,0x8019
	ori 5,10,5692
	lwz 6,24(31)
	mtctr 9
	bctrl
	lwz 10,16(31)
	lwz 9,8(31)
	lis 8,0x8030
	ori 3,8,1176
	mr 4,10
	lis 10,0x8019
	ori 5,10,5692
	li 6,90
	mtctr 9
	bctrl
	lwz 10,16(31)
	lwz 9,8(31)
	lis 8,0x8030
	ori 3,8,1176
	mr 4,10
	lis 10,0x8019
	ori 5,10,5452
	li 6,66
	mtctr 9
	bctrl
	addi 11,31,40
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	UpB, .-UpB
	.align 2
	.globl SideB
	.type	SideB, @function
SideB:
	stwu 1,-32(1)
	mflr 0
	stw 0,36(1)
	stw 31,28(1)
	mr 31,1
	lis 9,0x8019
	ori 9,9,7816
	stw 9,8(31)
	lis 9,0x8047
	ori 9,9,40288
	lwz 9,0(9)
	stw 9,12(31)
	lis 9,0x8045
	ori 9,9,16160
	lwz 10,0(9)
	lis 9,0xb000
	cmplw 7,10,9
	ble 7,.L5
	li 9,0
	b .L6
.L5:
	li 9,180
.L6:
	stw 9,16(31)
	bl LoadRecoveryInterrupts
	lwz 9,12(31)
	addi 9,9,3
	mr 10,9
	lwz 9,8(31)
	lis 8,0x8030
	ori 3,8,1176
	mr 4,10
	lis 10,0x8019
	ori 5,10,6264
	li 6,0
	mtctr 9
	bctrl
	lwz 9,12(31)
	addi 9,9,3
	mr 10,9
	lwz 9,8(31)
	lis 8,0x8030
	ori 3,8,1176
	mr 4,10
	lis 10,0x8019
	ori 5,10,5648
	li 6,0
	mtctr 9
	bctrl
	lwz 10,12(31)
	lwz 9,8(31)
	lis 8,0x8030
	ori 3,8,1176
	mr 4,10
	lis 10,0x8019
	ori 5,10,5692
	lwz 6,16(31)
	mtctr 9
	bctrl
	lwz 10,12(31)
	lwz 9,8(31)
	lis 8,0x8030
	ori 3,8,1176
	mr 4,10
	lis 10,0x8019
	ori 5,10,5452
	li 6,66
	mtctr 9
	bctrl
	addi 11,31,32
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	SideB, .-SideB
	.align 2
	.globl LedgeDash
	.type	LedgeDash, @function
LedgeDash:
	stwu 1,-32(1)
	mflr 0
	stw 0,36(1)
	stw 31,28(1)
	mr 31,1
	lis 9,0x8019
	ori 9,9,7816
	stw 9,12(31)
	lis 9,0x8047
	ori 9,9,40288
	lwz 9,0(9)
	stw 9,16(31)
	lis 9,0x8045
	ori 9,9,16160
	lwz 10,0(9)
	lis 9,0xb000
	cmplw 7,10,9
	ble 7,.L8
	li 9,-30
	stw 9,8(31)
	b .L9
.L8:
	li 9,-150
	stw 9,8(31)
.L9:
	lwz 9,16(31)
	addi 9,9,20
	mr 10,9
	lwz 9,12(31)
	lis 8,0x8030
	ori 3,8,1176
	mr 4,10
	lis 10,0x8019
	ori 5,10,6264
	li 6,0
	mtctr 9
	bctrl
	lwz 9,16(31)
	addi 9,9,20
	mr 10,9
	lwz 9,12(31)
	lis 8,0x8030
	ori 3,8,1176
	mr 4,10
	lis 10,0x8019
	ori 5,10,5648
	li 6,0
	mtctr 9
	bctrl
	lwz 9,16(31)
	addi 9,9,7
	mr 10,9
	lwz 9,12(31)
	lis 8,0x8030
	ori 3,8,1176
	mr 4,10
	lis 10,0x8019
	ori 5,10,5452
	li 6,76
	mtctr 9
	bctrl
	lwz 9,16(31)
	addi 9,9,5
	mr 10,9
	lwz 9,12(31)
	lis 8,0x8030
	ori 3,8,1176
	mr 4,10
	lis 10,0x8019
	ori 5,10,5692
	lwz 6,8(31)
	mtctr 9
	bctrl
	lwz 9,16(31)
	addi 9,9,5
	mr 10,9
	lwz 9,12(31)
	lis 8,0x8030
	ori 3,8,1176
	mr 4,10
	lis 10,0x8019
	ori 5,10,5648
	li 6,0
	mtctr 9
	bctrl
	lwz 9,16(31)
	addi 9,9,3
	mr 10,9
	lwz 9,12(31)
	lis 8,0x8030
	ori 3,8,1176
	mr 4,10
	lis 10,0x8019
	ori 5,10,5452
	li 6,88
	mtctr 9
	bctrl
	lwz 9,16(31)
	addi 9,9,1
	mr 10,9
	lwz 9,12(31)
	lis 8,0x8030
	ori 3,8,1176
	mr 4,10
	lis 10,0x8019
	ori 5,10,5692
	li 6,-90
	mtctr 9
	bctrl
	addi 11,31,32
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	LedgeDash, .-LedgeDash
	.align 2
	.globl DoubleJump
	.type	DoubleJump, @function
DoubleJump:
	stwu 1,-40(1)
	mflr 0
	stw 0,44(1)
	stw 31,36(1)
	mr 31,1
	stw 3,24(31)
	lis 9,0x8019
	ori 9,9,7816
	stw 9,8(31)
	lis 9,0x8047
	ori 9,9,40288
	lwz 9,0(9)
	stw 9,12(31)
	bl LoadRecoveryInterrupts
	lwz 9,12(31)
	addi 9,9,20
	mr 10,9
	lwz 9,8(31)
	lis 8,0x8030
	ori 3,8,1176
	mr 4,10
	lis 10,0x8030
	ori 5,10,6264
	li 6,0
	mtctr 9
	bctrl
	lwz 9,12(31)
	addi 9,9,20
	mr 10,9
	lwz 9,8(31)
	lis 8,0x8030
	ori 3,8,1176
	mr 4,10
	lis 10,0x8019
	ori 5,10,6264
	li 6,0
	mtctr 9
	bctrl
	lwz 9,12(31)
	addi 9,9,2
	mr 10,9
	lwz 9,8(31)
	lis 8,0x8030
	ori 3,8,1176
	mr 4,10
	lis 10,0x8019
	ori 5,10,5648
	li 6,0
	mtctr 9
	bctrl
	lwz 10,12(31)
	lwz 9,8(31)
	lis 8,0x8030
	ori 3,8,1176
	mr 4,10
	lis 10,0x8019
	ori 5,10,5452
	li 6,88
	mtctr 9
	bctrl
	lwz 10,12(31)
	lwz 9,8(31)
	lis 8,0x8030
	ori 3,8,1176
	mr 4,10
	lis 10,0x8019
	ori 5,10,5692
	lwz 6,24(31)
	mtctr 9
	bctrl
	addi 11,31,40
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	DoubleJump, .-DoubleJump
	.align 2
	.globl LoadRecoveryInterrupts
	.type	LoadRecoveryInterrupts, @function
LoadRecoveryInterrupts:
	stwu 1,-32(1)
	mflr 0
	stw 0,36(1)
	stw 31,28(1)
	mr 31,1
	lis 9,0x8019
	ori 9,9,7424
	stw 9,8(31)
	lwz 9,8(31)
	lis 10,0x8030
	ori 3,10,1248
	lis 10,0x8030
	ori 4,10,6264
	mtctr 9
	bctrl
	lwz 9,8(31)
	lis 10,0x8030
	ori 3,10,1040
	lis 10,0x8030
	ori 4,10,6264
	mtctr 9
	bctrl
	lwz 9,8(31)
	lis 10,0x8030
	ori 3,10,1108
	lis 10,0x8030
	ori 4,10,6264
	mtctr 9
	bctrl
	lwz 9,8(31)
	lis 10,0x8030
	ori 3,10,1344
	lis 10,0x8030
	ori 4,10,6264
	mtctr 9
	bctrl
	addi 11,31,32
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	LoadRecoveryInterrupts, .-LoadRecoveryInterrupts
	.align 2
	.globl Fade
	.type	Fade, @function
Fade:
	stwu 1,-40(1)
	mflr 0
	stw 0,44(1)
	stw 31,36(1)
	mr 31,1
	stw 3,24(31)
	stw 4,28(31)
	lis 9,0x8019
	ori 9,9,7816
	stw 9,8(31)
	lis 9,0x8047
	ori 9,9,40288
	lwz 9,0(9)
	stw 9,12(31)
	bl LoadRecoveryInterrupts
	lwz 9,8(31)
	lis 10,0x8030
	ori 3,10,3096
	lwz 4,24(31)
	lis 10,0x8019
	ori 5,10,5692
	lwz 6,28(31)
	mtctr 9
	bctrl
	addi 11,31,40
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	Fade, .-Fade
	.ident	"GCC: (devkitPPC release 27) 4.8.2"
