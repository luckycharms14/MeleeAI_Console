	.file	"FoxRecovery.c"
	.section	".text"
	.align 2
	.globl FadeAfterFirefox
	.type	FadeAfterFirefox, @function
FadeAfterFirefox:
	stwu 1,-32(1)
	mflr 0
	stw 0,36(1)
	stw 30,24(1)
	stw 31,28(1)
	mr 31,1
	lis 9,0x8019
	ori 9,9,5108
	stw 9,8(31)
	lis 9,0x8019
	ori 9,9,6632
	stw 9,12(31)
	lis 9,0x8045
	ori 9,9,16160
	lwz 10,0(9)
	lwz 9,8(31)
	mr 3,10
	mtctr 9
	bctrl
	mr 9,3
	cmpwi 7,9,0
	bge 7,.L2
	lis 9,0x8045
	ori 9,9,16160
	lwz 10,0(9)
	lwz 9,8(31)
	mr 3,10
	mtctr 9
	bctrl
	mr 9,3
	neg 30,9
	b .L3
.L2:
	lis 9,0x8045
	ori 9,9,16160
	lwz 10,0(9)
	lwz 9,8(31)
	mr 3,10
	mtctr 9
	bctrl
	mr 30,3
.L3:
	lwz 9,12(31)
	mtctr 9
	bctrl
	mr 9,3
	subf 9,9,30
	mulli 9,9,567
	lis 10,0x51eb
	ori 10,10,34079
	mulhw 10,9,10
	srawi 10,10,5
	srawi 9,9,31
	subf 9,9,10
	stw 9,16(31)
	lis 9,0x8030
	ori 9,9,5340
	stw 9,20(31)
	bl GetFadeDirection
	mr 10,3
	lwz 9,20(31)
	lwz 3,16(31)
	mr 4,10
	mtctr 9
	bctrl
	addi 11,31,32
	lwz 0,4(11)
	mtlr 0
	lwz 30,-8(11)
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	FadeAfterFirefox, .-FadeAfterFirefox
	.align 2
	.globl Recover
	.type	Recover, @function
Recover:
	stwu 1,-32(1)
	mflr 0
	stw 0,36(1)
	stw 31,28(1)
	mr 31,1
	lis 9,0x8019
	ori 9,9,5108
	stw 9,8(31)
	lis 9,0x8045
	ori 9,9,16160
	lwz 10,0(9)
	lwz 9,8(31)
	mr 3,10
	mtctr 9
	bctrl
	stw 3,12(31)
	lis 9,0x8045
	ori 9,9,16164
	lwz 10,0(9)
	lwz 9,8(31)
	mr 3,10
	mtctr 9
	bctrl
	stw 3,16(31)
	lis 9,0x8030
	ori 9,9,5460
	stw 9,20(31)
	lwz 9,20(31)
	mtctr 9
	bctrl
	mr 9,3
	cmplwi 7,9,64
	bgt 7,.L5
	lwz 3,12(31)
	lwz 4,16(31)
	bl Firefox
	b .L4
.L5:
	lwz 3,12(31)
	lwz 4,16(31)
	bl Illusion
.L4:
	addi 11,31,32
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	Recover, .-Recover
	.align 2
	.globl GetFadeDirection
	.type	GetFadeDirection, @function
GetFadeDirection:
	stwu 1,-32(1)
	mflr 0
	stw 0,36(1)
	stw 31,28(1)
	mr 31,1
	lis 9,0x8019
	ori 9,9,5108
	stw 9,8(31)
	lis 9,0x8019
	ori 9,9,6632
	stw 9,12(31)
	lis 9,0x8045
	ori 9,9,16160
	lwz 10,0(9)
	lwz 9,8(31)
	mr 3,10
	mtctr 9
	bctrl
	stw 3,16(31)
	lwz 9,12(31)
	mtctr 9
	bctrl
	stw 3,20(31)
	lwz 9,16(31)
	cmpwi 7,9,0
	bge 7,.L8
	lwz 9,16(31)
	neg 10,9
	lwz 9,20(31)
	cmpw 7,10,9
	ble 7,.L9
	li 9,0
	b .L10
.L8:
	lwz 10,16(31)
	lwz 9,20(31)
	cmpw 7,10,9
	bge 7,.L9
	li 9,0
	b .L10
.L9:
	li 9,180
.L10:
	mr 3,9
	addi 11,31,32
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	GetFadeDirection, .-GetFadeDirection
	.align 2
	.globl ReflectAngle
	.type	ReflectAngle, @function
ReflectAngle:
	stwu 1,-24(1)
	stw 31,20(1)
	mr 31,1
	stw 3,8(31)
	lis 9,0x8045
	ori 9,9,16160
	lwz 10,0(9)
	lis 9,0xafff
	ori 9,9,65535
	cmplw 7,10,9
	bgt 7,.L12
	lwz 9,8(31)
	nor 9,9,9
	srwi 9,9,31
	rlwinm 9,9,0,0xff
	mr 10,9
	lwz 9,8(31)
	srwi 9,9,31
	rlwinm 9,9,0,0xff
	subf 8,9,10
	lwz 9,8(31)
	srawi 10,9,31
	lwz 9,8(31)
	xor 9,10,9
	subf 9,10,9
	subfic 9,9,180
	mullw 9,8,9
	b .L13
.L12:
	lwz 9,8(31)
.L13:
	mr 3,9
	addi 11,31,24
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	ReflectAngle, .-ReflectAngle
	.align 2
	.globl LedgeAngle
	.type	LedgeAngle, @function
LedgeAngle:
	stwu 1,-56(1)
	mflr 0
	stw 0,60(1)
	stw 30,48(1)
	stw 31,52(1)
	mr 31,1
	stw 3,40(31)
	stw 4,44(31)
	lis 9,0x8019
	ori 9,9,6632
	stw 9,12(31)
	lwz 9,40(31)
	srawi 9,9,31
	lwz 10,40(31)
	xor 30,9,10
	subf 30,9,30
	lwz 9,12(31)
	mtctr 9
	bctrl
	mr 9,3
	subf 9,9,30
	stw 9,16(31)
	lwz 9,44(31)
	srawi 9,9,31
	lwz 10,44(31)
	xor 10,9,10
	subf 9,9,10
	stw 9,20(31)
	lwz 10,16(31)
	lwz 9,16(31)
	mullw 9,10,9
	lis 10,0x51eb
	ori 10,10,34079
	mulhw 10,9,10
	srawi 10,10,5
	srawi 9,9,31
	subf 9,9,10
	stw 9,24(31)
	lwz 10,20(31)
	lwz 9,20(31)
	mullw 9,10,9
	lis 10,0x51eb
	ori 10,10,34079
	mulhw 10,9,10
	srawi 10,10,5
	srawi 9,9,31
	subf 9,9,10
	stw 9,28(31)
	lwz 10,16(31)
	lwz 9,20(31)
	mullw 9,10,9
	lis 10,0x51eb
	ori 10,10,34079
	mulhw 10,9,10
	srawi 10,10,5
	srawi 9,9,31
	subf 9,9,10
	stw 9,32(31)
	lwz 10,20(31)
	lwz 9,16(31)
	cmpw 7,10,9
	ble 7,.L15
	lwz 9,32(31)
	mulli 10,9,100
	lwz 9,24(31)
	mulli 9,9,9
	srawi 8,9,5
	addze 8,8
	lwz 9,28(31)
	add 9,8,9
	divw 9,10,9
	stw 9,8(31)
	lwz 9,8(31)
	subfic 9,9,157
	stw 9,8(31)
	b .L16
.L15:
	lwz 9,32(31)
	mulli 10,9,100
	lwz 9,28(31)
	mulli 9,9,9
	srawi 8,9,5
	addze 8,8
	lwz 9,24(31)
	add 9,8,9
	divw 9,10,9
	stw 9,8(31)
.L16:
	lwz 9,8(31)
	mulli 9,9,5730
	stw 9,8(31)
	lwz 10,8(31)
	lis 9,0xd1b7
	ori 9,9,5977
	mulhwu 9,10,9
	srwi 9,9,13
	stw 9,8(31)
	lwz 9,44(31)
	cmpwi 7,9,0
	ble 7,.L17
	lwz 9,8(31)
	neg 9,9
	stw 9,8(31)
	lwz 9,8(31)
	b .L18
.L17:
	lwz 10,8(31)
	li 9,-73
	cmplw 7,10,9
	ble 7,.L19
	li 9,-73
	stw 9,8(31)
	b .L20
.L19:
	lwz 9,8(31)
	cmpwi 7,9,0
	beq 7,.L20
	lwz 9,8(31)
	cmplwi 7,9,16
	bgt 7,.L20
	li 9,17
	stw 9,8(31)
.L20:
	lwz 9,8(31)
.L18:
	mr 3,9
	addi 11,31,56
	lwz 0,4(11)
	mtlr 0
	lwz 30,-8(11)
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	LedgeAngle, .-LedgeAngle
	.align 2
	.globl m_sqrt
	.type	m_sqrt, @function
m_sqrt:
	stwu 1,-40(1)
	stw 31,36(1)
	mr 31,1
	stw 3,24(31)
	li 9,50
	stw 9,8(31)
	li 9,0
	stw 9,12(31)
	b .L22
.L23:
	lwz 9,24(31)
	mulli 10,9,100
	lwz 9,8(31)
	divw 10,10,9
	lwz 9,8(31)
	add 9,10,9
	mulli 9,9,50
	lis 10,0x51eb
	ori 10,10,34079
	mulhw 10,9,10
	srawi 10,10,5
	srawi 9,9,31
	subf 9,9,10
	stw 9,8(31)
	lwz 9,12(31)
	addi 9,9,1
	stw 9,12(31)
.L22:
	lwz 9,12(31)
	cmpwi 7,9,2
	ble 7,.L23
	lwz 9,8(31)
	mr 3,9
	addi 11,31,40
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	m_sqrt, .-m_sqrt
	.align 2
	.globl arc_cos
	.type	arc_cos, @function
arc_cos:
	stwu 1,-24(1)
	mflr 0
	stw 0,28(1)
	stw 31,20(1)
	mr 31,1
	stw 3,8(31)
	lwz 9,8(31)
	cmpwi 7,9,70
	ble 7,.L26
	lwz 9,8(31)
	subfic 9,9,100
	mr 3,9
	bl m_sqrt
	mr 10,3
	lis 9,0xc
	ori 9,9,21498
	mullw 9,10,9
	lis 10,0x431b
	ori 10,10,56963
	mulhw 10,9,10
	srawi 10,10,18
	srawi 9,9,31
	subf 9,9,10
	b .L27
.L26:
	lwz 10,8(31)
	lwz 9,8(31)
	mullw 10,10,9
	lwz 9,8(31)
	mullw 9,10,9
	lis 10,0x45e7
	ori 10,10,45683
	mulhw 10,9,10
	srawi 10,10,14
	srawi 9,9,31
	subf 10,9,10
	lwz 9,8(31)
	add 9,10,9
	mulli 9,9,5730
	lis 10,0x68db
	ori 10,10,35757
	mulhw 10,9,10
	srawi 10,10,12
	srawi 9,9,31
	subf 9,9,10
	subfic 9,9,90
.L27:
	mr 3,9
	addi 11,31,24
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	arc_cos, .-arc_cos
	.align 2
	.globl HighestAngle
	.type	HighestAngle, @function
HighestAngle:
	stwu 1,-40(1)
	mflr 0
	stw 0,44(1)
	stw 31,36(1)
	mr 31,1
	stw 3,24(31)
	stw 4,28(31)
	lis 9,0x8019
	ori 9,9,6632
	stw 9,12(31)
	lwz 9,12(31)
	mtctr 9
	bctrl
	mr 8,3
	lwz 9,24(31)
	srawi 10,9,31
	lwz 9,24(31)
	xor 9,10,9
	subf 9,10,9
	subf 9,9,8
	stw 9,16(31)
	lwz 9,16(31)
	mulli 9,9,567
	lis 10,0x51eb
	ori 10,10,34079
	mulhw 10,9,10
	srawi 10,10,5
	srawi 9,9,31
	subf 10,9,10
	lwz 9,28(31)
	add 9,10,9
	srawi 10,9,31
	xor 9,10,9
	subf 9,10,9
	mulli 9,9,100
	lis 10,0x38e3
	ori 10,10,36409
	mulhw 10,9,10
	srawi 10,10,7
	srawi 9,9,31
	subf 9,9,10
	stw 9,20(31)
	lwz 9,20(31)
	mulli 9,9,100
	lis 10,0x7728
	ori 10,10,1907
	mulhw 10,9,10
	srawi 10,10,12
	srawi 9,9,31
	subf 9,9,10
	mr 3,9
	bl arc_cos
	stw 3,8(31)
	lwz 9,8(31)
	addi 9,9,10
	stw 9,8(31)
	lwz 9,8(31)
	cmpwi 7,9,90
	ble 7,.L29
	li 9,90
	stw 9,8(31)
	b .L30
.L29:
	lwz 9,8(31)
	cmpwi 7,9,73
	ble 7,.L30
	li 9,73
	stw 9,8(31)
.L30:
	lwz 9,8(31)
	mr 3,9
	addi 11,31,40
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	HighestAngle, .-HighestAngle
	.align 2
	.globl LedgeDistance2
	.type	LedgeDistance2, @function
LedgeDistance2:
	stwu 1,-40(1)
	mflr 0
	stw 0,44(1)
	stw 30,32(1)
	stw 31,36(1)
	mr 31,1
	stw 3,24(31)
	stw 4,28(31)
	lis 9,0x8019
	ori 9,9,6632
	stw 9,8(31)
	lwz 9,24(31)
	srawi 9,9,31
	lwz 10,24(31)
	xor 30,9,10
	subf 30,9,30
	lwz 9,8(31)
	mtctr 9
	bctrl
	mr 9,3
	subf 9,9,30
	stw 9,12(31)
	lwz 10,12(31)
	lwz 9,12(31)
	mullw 9,10,9
	lis 10,0x51eb
	ori 10,10,34079
	mulhw 10,9,10
	srawi 10,10,5
	srawi 9,9,31
	subf 10,9,10
	lwz 8,28(31)
	lwz 9,28(31)
	mullw 9,8,9
	lis 8,0x51eb
	ori 8,8,34079
	mulhw 8,9,8
	srawi 8,8,5
	srawi 9,9,31
	subf 9,9,8
	add 9,10,9
	mr 3,9
	addi 11,31,40
	lwz 0,4(11)
	mtlr 0
	lwz 30,-8(11)
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	LedgeDistance2, .-LedgeDistance2
	.align 2
	.globl Firefox
	.type	Firefox, @function
Firefox:
	stwu 1,-56(1)
	mflr 0
	stw 0,60(1)
	stw 31,52(1)
	mr 31,1
	stw 3,40(31)
	stw 4,44(31)
	lis 9,0x8030
	ori 9,9,5460
	stw 9,12(31)
	lwz 9,12(31)
	mtctr 9
	bctrl
	mr 9,3
	lis 10,0xcccc
	ori 10,10,52429
	mulhwu 10,9,10
	srwi 10,10,3
	mulli 10,10,10
	subf 9,10,9
	stw 9,16(31)
	lis 9,0x8045
	ori 9,9,16320
	lwz 9,0(9)
	addi 9,9,6600
	lwz 9,0(9)
	srwi 9,9,24
	stw 9,20(31)
	lwz 3,40(31)
	lwz 4,44(31)
	bl LedgeAngle
	stw 3,24(31)
	lwz 3,40(31)
	lwz 4,44(31)
	bl HighestAngle
	stw 3,28(31)
	lwz 9,20(31)
	cmplwi 7,9,1
	bgt 7,.L35
	lis 9,0x8030
	ori 9,9,4868
	stw 9,32(31)
	lwz 9,40(31)
	cmpwi 7,9,0
	bge 7,.L36
	li 9,0
	b .L37
.L36:
	li 9,180
.L37:
	lwz 10,32(31)
	mr 3,9
	mtctr 10
	crxor 6,6,6
	bctrl
	b .L34
.L35:
	lwz 3,40(31)
	lwz 4,44(31)
	bl LedgeDistance2
	mr 10,3
	lis 9,0xb
	ori 9,9,53504
	cmpw 7,10,9
	ble 7,.L39
	li 9,45
	stw 9,8(31)
	b .L40
.L39:
	lwz 9,24(31)
	cmpwi 7,9,0
	bge 7,.L41
	lwz 9,16(31)
	cmplwi 7,9,5
	bgt 7,.L42
	lwz 9,24(31)
	stw 9,8(31)
	b .L40
.L42:
	lwz 9,16(31)
	mulli 10,9,9
	lwz 9,24(31)
	add 9,10,9
	addi 9,9,-45
	stw 9,8(31)
	b .L40
.L41:
	lwz 10,44(31)
	li 9,-5000
	cmpw 7,10,9
	bge 7,.L44
	lwz 9,28(31)
	stw 9,8(31)
	b .L40
.L44:
	lwz 10,28(31)
	lwz 9,24(31)
	subf 9,9,10
	mr 10,9
	lwz 9,16(31)
	divwu 10,10,9
	lwz 9,24(31)
	add 9,10,9
	stw 9,8(31)
.L40:
	lis 9,0x8030
	ori 9,9,3780
	stw 9,36(31)
	lwz 3,8(31)
	bl ReflectAngle
	mr 10,3
	lwz 9,36(31)
	mr 3,10
	mtctr 9
	bctrl
.L34:
	addi 11,31,56
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	Firefox, .-Firefox
	.align 2
	.globl Illusion
	.type	Illusion, @function
Illusion:
	stwu 1,-80(1)
	mflr 0
	stw 0,84(1)
	stw 29,68(1)
	stw 30,72(1)
	stw 31,76(1)
	mr 31,1
	stw 3,56(31)
	stw 4,60(31)
	lis 9,0x8045
	ori 9,9,16320
	lwz 9,0(9)
	addi 9,9,6600
	lwz 9,0(9)
	srwi 9,9,24
	stw 9,12(31)
	lis 9,0x8030
	ori 9,9,5460
	stw 9,16(31)
	lwz 9,16(31)
	mtctr 9
	bctrl
	mr 9,3
	lis 10,0xcccc
	ori 10,10,52429
	mulhwu 10,9,10
	srwi 10,10,3
	mulli 10,10,10
	subf 9,10,9
	stw 9,20(31)
	lis 9,0x8030
	ori 9,9,4868
	stw 9,24(31)
	lis 9,0x8019
	ori 9,9,6632
	stw 9,28(31)
	lwz 10,60(31)
	li 9,-5500
	cmpw 7,10,9
	blt 7,.L46
	lwz 10,60(31)
	li 9,-1200
	cmpw 7,10,9
	bge 7,.L47
	lwz 9,12(31)
	cmplwi 7,9,1
	ble 7,.L47
.L46:
	lwz 3,56(31)
	lwz 4,60(31)
	bl Firefox
	b .L45
.L47:
	lwz 10,60(31)
	li 9,-1200
	cmpw 7,10,9
	blt 7,.L49
	lwz 9,56(31)
	srawi 9,9,31
	lwz 10,56(31)
	xor 30,9,10
	subf 30,9,30
	lwz 9,28(31)
	mtctr 9
	bctrl
	mr 9,3
	subf 9,9,30
	cmpwi 7,9,8800
	ble 7,.L50
.L49:
	lwz 9,12(31)
	cmplwi 7,9,1
	bgt 7,.L50
	lwz 9,56(31)
	cmpwi 7,9,0
	bge 7,.L51
	li 9,0
	b .L52
.L51:
	li 9,180
.L52:
	stw 9,32(31)
	lwz 9,32(31)
	addi 29,9,-90
	lwz 9,56(31)
	srawi 9,9,31
	lwz 10,56(31)
	xor 30,9,10
	subf 30,9,30
	lwz 9,28(31)
	mtctr 9
	bctrl
	mr 9,3
	subf 9,9,30
	cmpwi 7,9,7500
	mfcr 9
	rlwinm 9,9,30,1
	rlwinm 9,9,0,0xff
	mullw 9,29,9
	addi 10,9,90
	lwz 9,24(31)
	mr 3,10
	mtctr 9
	crxor 6,6,6
	bctrl
	b .L45
.L50:
	lwz 9,12(31)
	cmplwi 7,9,1
	bgt 7,.L53
	lwz 9,20(31)
	cmplwi 7,9,7
	ble 7,.L53
	lwz 9,24(31)
	li 3,90
	mtctr 9
	crxor 6,6,6
	bctrl
	b .L45
.L53:
	li 9,-500
	stw 9,8(31)
	lwz 9,20(31)
	cmplwi 7,9,2
	bgt 7,.L54
	lis 9,0x8019
	ori 9,9,6808
	stw 9,36(31)
	addi 10,31,44
	lwz 9,36(31)
	mr 3,10
	mtctr 9
	crxor 6,6,6
	bctrl
	lwz 9,52(31)
	stw 9,8(31)
.L54:
	lis 9,0x8019
	ori 9,9,7816
	stw 9,40(31)
	lwz 9,40(31)
	lis 10,0x8030
	ori 3,10,3096
	lwz 4,8(31)
	lis 10,0x8030
	ori 5,10,4124
	li 6,0
	mtctr 9
	bctrl
.L45:
	addi 11,31,80
	lwz 0,4(11)
	mtlr 0
	lwz 29,-12(11)
	lwz 30,-8(11)
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	Illusion, .-Illusion
	.ident	"GCC: (devkitPPC release 27) 4.8.2"
