	.file	"AI.c"
	.section	".text"
	.align 2
	.globl RNG
	.type	RNG, @function
RNG:
	stwu 1,-16(1)
	stw 31,12(1)
	mr 31,1
	lis 9,0x804d
	ori 9,9,24464
	lwz 10,0(9)
	lis 9,0x51eb
	ori 9,9,34079
	mulhwu 9,10,9
	srwi 9,9,5
	mulli 9,9,100
	subf 9,9,10
	mr 3,9
	addi 11,31,16
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	RNG, .-RNG
	.align 2
	.globl Tech
	.type	Tech, @function
Tech:
	stwu 1,-32(1)
	mflr 0
	stw 0,36(1)
	stw 31,28(1)
	mr 31,1
	bl RNG
	stw 3,12(31)
	lwz 9,12(31)
	cmplwi 7,9,32
	bgt 7,.L4
	li 9,90
	stw 9,8(31)
	b .L5
.L4:
	lwz 9,12(31)
	cmplwi 7,9,65
	bgt 7,.L6
	li 9,0
	stw 9,8(31)
	b .L5
.L6:
	li 9,180
	stw 9,8(31)
.L5:
	lis 9,0x8030
	ori 9,9,3276
	stw 9,16(31)
	lwz 9,16(31)
	lwz 3,8(31)
	mtctr 9
	bctrl
	addi 11,31,32
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	Tech, .-Tech
	.align 2
	.globl DI
	.type	DI, @function
DI:
	stwu 1,-48(1)
	mflr 0
	stw 0,52(1)
	stw 31,44(1)
	mr 31,1
	lis 9,0x8045
	ori 9,9,16240
	lwz 9,0(9)
	srwi 10,9,16
	lis 9,0x8045
	ori 9,9,16240
	lwz 9,0(9)
	srwi 9,9,16
	mullw 10,10,9
	lis 9,0x51eb
	ori 9,9,34079
	mulhwu 9,10,9
	srwi 9,9,7
	mulli 9,9,7
	subfic 9,9,120
	stw 9,8(31)
	lwz 9,8(31)
	cmpwi 7,9,100
	ble 7,.L8
	li 9,100
	stw 9,8(31)
	b .L9
.L8:
	lwz 9,8(31)
	cmpwi 7,9,4
	bgt 7,.L9
	li 9,5
	stw 9,8(31)
.L9:
	lis 9,0x8019
	ori 9,9,5108
	stw 9,16(31)
	lis 9,0x8045
	ori 9,9,12432
	lwz 10,0(9)
	lwz 9,16(31)
	mr 3,10
	mtctr 9
	bctrl
	stw 3,20(31)
	lis 9,0x8045
	ori 9,9,16160
	lwz 10,0(9)
	lwz 9,16(31)
	mr 3,10
	mtctr 9
	bctrl
	stw 3,24(31)
	bl RNG
	mr 10,3
	lwz 9,8(31)
	cmplw 7,10,9
	ble 7,.L10
	lwz 10,20(31)
	lwz 9,24(31)
	cmpw 7,10,9
	bge 7,.L11
	li 9,135
	stw 9,12(31)
	b .L13
.L11:
	li 9,45
	stw 9,12(31)
	b .L13
.L10:
	lwz 10,20(31)
	lwz 9,24(31)
	cmpw 7,10,9
	bge 7,.L14
	li 9,0
	stw 9,12(31)
	b .L13
.L14:
	li 9,180
	stw 9,12(31)
.L13:
	lis 9,0x8030
	ori 9,9,3608
	stw 9,28(31)
	lwz 9,28(31)
	lwz 3,12(31)
	mtctr 9
	bctrl
	addi 11,31,48
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	DI, .-DI
	.align 2
	.globl ExitHitstun
	.type	ExitHitstun, @function
ExitHitstun:
	stwu 1,-32(1)
	mflr 0
	stw 0,36(1)
	stw 31,28(1)
	mr 31,1
	lis 9,0x8030
	ori 9,9,4868
	stw 9,8(31)
	lis 9,0x8045
	ori 9,9,16160
	lwz 10,0(9)
	lis 9,0xb000
	cmplw 7,10,9
	ble 7,.L16
	li 9,0
	b .L17
.L16:
	li 9,180
.L17:
	lwz 10,8(31)
	mr 3,9
	mtctr 10
	crxor 6,6,6
	bctrl
	addi 11,31,32
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	ExitHitstun, .-ExitHitstun
	.align 2
	.globl GetOffLedge
	.type	GetOffLedge, @function
GetOffLedge:
	stwu 1,-32(1)
	mflr 0
	stw 0,36(1)
	stw 31,28(1)
	mr 31,1
	lis 9,0x8030
	ori 9,9,4416
	stw 9,8(31)
	lwz 9,8(31)
	mtctr 9
	bctrl
	addi 11,31,32
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	GetOffLedge, .-GetOffLedge
	.align 2
	.globl Recover
	.type	Recover, @function
Recover:
	stwu 1,-32(1)
	mflr 0
	stw 0,36(1)
	stw 31,28(1)
	mr 31,1
	lis 9,0x803f
	ori 9,9,50488
	stw 9,8(31)
	lwz 9,8(31)
	mtctr 9
	bctrl
	addi 11,31,32
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	Recover, .-Recover
	.align 2
	.globl LoadQueue
	.type	LoadQueue, @function
LoadQueue:
	stwu 1,-32(1)
	mflr 0
	stw 0,36(1)
	stw 31,28(1)
	mr 31,1
	lis 9,0x8019
	ori 9,9,7424
	stw 9,8(31)
	lis 9,0x8000
	ori 9,9,6144
	li 10,0
	stw 10,0(9)
	lwz 9,8(31)
	lis 10,0x8030
	ori 3,10,2736
	lis 10,0x8030
	ori 4,10,5528
	mtctr 9
	bctrl
	lwz 9,8(31)
	lis 10,0x8030
	ori 3,10,1412
	lis 10,0x8030
	ori 4,10,6016
	mtctr 9
	bctrl
	lwz 9,8(31)
	lis 10,0x8030
	ori 3,10,1040
	lis 10,0x8030
	ori 4,10,6128
	mtctr 9
	bctrl
	lwz 9,8(31)
	lis 10,0x8030
	ori 3,10,1564
	lis 10,0x8030
	ori 4,10,5664
	mtctr 9
	bctrl
	lwz 9,8(31)
	lis 10,0x8030
	ori 3,10,1108
	lis 10,0x8030
	ori 4,10,4868
	mtctr 9
	bctrl
	lwz 9,8(31)
	lis 10,0x8030
	ori 3,10,2880
	lis 10,0x8030
	ori 4,10,5528
	mtctr 9
	bctrl
	lwz 9,8(31)
	lis 10,0x8030
	ori 3,10,2988
	lis 10,0x803f
	ori 4,10,50208
	mtctr 9
	bctrl
	lwz 9,8(31)
	lis 10,0x8030
	ori 3,10,1668
	lis 10,0x8030
	ori 4,10,6196
	mtctr 9
	bctrl
	addi 11,31,32
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	LoadQueue, .-LoadQueue
	.ident	"GCC: (devkitPPC release 27) 4.8.2"
