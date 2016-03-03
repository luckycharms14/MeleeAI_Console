	.file	"Events.c"
	.section	".text"
	.align 2
	.globl int_to_float
	.type	int_to_float, @function
int_to_float:
	stwu 1,-40(1)
	mflr 0
	stw 0,44(1)
	stw 31,36(1)
	mr 31,1
	stw 3,24(31)
	lis 9,0x8019
	ori 9,9,5108
	stw 9,8(31)
	lwz 9,8(31)
	lwz 3,24(31)
	mtctr 9
	bctrl
	mr 9,3
	mr 3,9
	addi 11,31,40
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	int_to_float, .-int_to_float
	.align 2
	.globl Offstage
	.type	Offstage, @function
Offstage:
	stwu 1,-32(1)
	mflr 0
	stw 0,36(1)
	stw 30,24(1)
	stw 31,28(1)
	mr 31,1
	lis 9,0x8019
	ori 9,9,6632
	stw 9,8(31)
	lis 9,0x8045
	ori 9,9,16160
	lwz 9,0(9)
	mr 3,9
	bl int_to_float
	mr 9,3
	cmpwi 7,9,0
	bge 7,.L4
	lis 9,0x8045
	ori 9,9,16160
	lwz 9,0(9)
	mr 3,9
	bl int_to_float
	mr 9,3
	subfic 30,9,-1000
	b .L5
.L4:
	lis 9,0x8045
	ori 9,9,16160
	lwz 9,0(9)
	mr 3,9
	bl int_to_float
	mr 9,3
	addi 30,9,-1000
.L5:
	lwz 9,8(31)
	mtctr 9
	bctrl
	mr 9,3
	cmpw 7,30,9
	bgt 7,.L6
	lis 9,0x8045
	ori 9,9,16164
	lwz 9,0(9)
	mr 3,9
	bl int_to_float
	mr 10,3
	li 9,-1000
	cmpw 7,10,9
	bge 7,.L7
.L6:
	li 9,1
	b .L8
.L7:
	li 9,0
.L8:
	rlwinm 9,9,0,31,31
	rlwinm 9,9,0,0xff
	mr 3,9
	addi 11,31,32
	lwz 0,4(11)
	mtlr 0
	lwz 30,-8(11)
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	Offstage, .-Offstage
	.align 2
	.globl InHitstun
	.type	InHitstun, @function
InHitstun:
	stwu 1,-16(1)
	mflr 0
	stw 0,20(1)
	stw 31,12(1)
	mr 31,1
	lis 9,0x8045
	ori 9,9,16320
	lwz 9,0(9)
	addi 9,9,9120
	lwz 9,0(9)
	mr 3,9
	bl int_to_float
	mr 9,3
	srawi 10,9,31
	subf 9,9,10
	srwi 9,9,31
	rlwinm 9,9,0,0xff
	mr 3,9
	addi 11,31,16
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	InHitstun, .-InHitstun
	.align 2
	.globl InAir
	.type	InAir, @function
InAir:
	stwu 1,-16(1)
	stw 31,12(1)
	mr 31,1
	lis 9,0x8045
	ori 9,9,16320
	lwz 9,0(9)
	addi 9,9,320
	lwz 9,0(9)
	cmpwi 7,9,0
	mfcr 9
	rlwinm 9,9,31,1
	xori 9,9,1
	rlwinm 9,9,0,0xff
	mr 3,9
	addi 11,31,16
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	InAir, .-InAir
	.align 2
	.globl Falling
	.type	Falling, @function
Falling:
	stwu 1,-16(1)
	stw 31,12(1)
	mr 31,1
	lis 9,0x8045
	ori 9,9,16320
	lwz 9,0(9)
	addi 9,9,300
	lwz 10,0(9)
	lis 9,0xb000
	cmplw 7,10,9
	mfcr 9
	rlwinm 9,9,30,1
	rlwinm 9,9,0,0xff
	mr 3,9
	addi 11,31,16
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	Falling, .-Falling
	.align 2
	.globl OnLedge
	.type	OnLedge, @function
OnLedge:
	stwu 1,-16(1)
	stw 31,12(1)
	mr 31,1
	lis 9,0x8045
	ori 9,9,16320
	lwz 9,0(9)
	addi 9,9,112
	lwz 9,0(9)
	cmplwi 7,9,253
	mfcr 9
	rlwinm 9,9,31,1
	rlwinm 9,9,0,0xff
	mr 3,9
	addi 11,31,16
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	OnLedge, .-OnLedge
	.align 2
	.globl Respawn
	.type	Respawn, @function
Respawn:
	stwu 1,-16(1)
	stw 31,12(1)
	mr 31,1
	lis 9,0x8045
	ori 9,9,16320
	lwz 9,0(9)
	addi 9,9,112
	lwz 9,0(9)
	cmplwi 7,9,13
	mfcr 9
	rlwinm 9,9,31,1
	rlwinm 9,9,0,0xff
	mr 3,9
	addi 11,31,16
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	Respawn, .-Respawn
	.align 2
	.globl Wait
	.type	Wait, @function
Wait:
	stwu 1,-24(1)
	stw 31,20(1)
	mr 31,1
	stw 3,8(31)
	lis 9,0x8047
	ori 9,9,40288
	lwz 10,0(9)
	lwz 9,8(31)
	cmplw 7,10,9
	crnot 30,28
	mfcr 9
	rlwinm 9,9,31,1
	rlwinm 9,9,0,0xff
	mr 3,9
	addi 11,31,24
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	Wait, .-Wait
	.align 2
	.globl InHitlag
	.type	InHitlag, @function
InHitlag:
	stwu 1,-16(1)
	mflr 0
	stw 0,20(1)
	stw 31,12(1)
	mr 31,1
	lis 9,0x8045
	ori 9,9,16320
	lwz 9,0(9)
	addi 9,9,6588
	lwz 9,0(9)
	mr 3,9
	bl int_to_float
	mr 9,3
	srawi 10,9,31
	subf 9,9,10
	srwi 9,9,31
	rlwinm 9,9,0,0xff
	mr 3,9
	addi 11,31,16
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	InHitlag, .-InHitlag
	.align 2
	.globl OnGround
	.type	OnGround, @function
OnGround:
	stwu 1,-16(1)
	stw 31,12(1)
	mr 31,1
	lis 9,0x8045
	ori 9,9,16320
	lwz 9,0(9)
	addi 9,9,320
	lwz 9,0(9)
	cmpwi 7,9,0
	mfcr 9
	rlwinm 9,9,31,1
	rlwinm 9,9,0,0xff
	mr 3,9
	addi 11,31,16
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	OnGround, .-OnGround
	.align 2
	.globl HitstunEnd
	.type	HitstunEnd, @function
HitstunEnd:
	stwu 1,-16(1)
	mflr 0
	stw 0,20(1)
	stw 31,12(1)
	mr 31,1
	lis 9,0x8045
	ori 9,9,16320
	lwz 9,0(9)
	addi 9,9,9120
	lwz 9,0(9)
	mr 3,9
	bl int_to_float
	mr 9,3
	addi 9,9,-100
	cmplwi 7,9,99
	bgt 7,.L27
	bl InAir
	mr 9,3
	cmpwi 7,9,0
	beq 7,.L27
	bl Offstage
	mr 9,3
	xori 9,9,1
	rlwinm 9,9,0,0xff
	cmpwi 7,9,0
	beq 7,.L27
	li 9,1
	b .L28
.L27:
	li 9,0
.L28:
	rlwinm 9,9,0,31,31
	rlwinm 9,9,0,0xff
	mr 3,9
	addi 11,31,16
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	HitstunEnd, .-HitstunEnd
	.align 2
	.globl DISituation
	.type	DISituation, @function
DISituation:
	stwu 1,-16(1)
	mflr 0
	stw 0,20(1)
	stw 31,12(1)
	mr 31,1
	lis 9,0x8045
	ori 9,9,16320
	lwz 9,0(9)
	addi 9,9,6588
	lwz 9,0(9)
	mr 3,9
	bl int_to_float
	mr 9,3
	addi 9,9,-200
	cmplwi 7,9,99
	crnot 30,29
	mfcr 9
	rlwinm 9,9,31,1
	rlwinm 9,9,0,0xff
	mr 3,9
	addi 11,31,16
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	DISituation, .-DISituation
	.align 2
	.globl RecoverySituation
	.type	RecoverySituation, @function
RecoverySituation:
	stwu 1,-16(1)
	mflr 0
	stw 0,20(1)
	stw 31,12(1)
	mr 31,1
	bl Offstage
	mr 9,3
	cmpwi 7,9,0
	beq 7,.L33
	bl InHitstun
	mr 9,3
	xori 9,9,1
	rlwinm 9,9,0,0xff
	cmpwi 7,9,0
	beq 7,.L33
	bl OnLedge
	mr 9,3
	xori 9,9,1
	rlwinm 9,9,0,0xff
	cmpwi 7,9,0
	beq 7,.L33
	li 3,3500
	bl Height
	mr 9,3
	cmpwi 7,9,0
	beq 7,.L33
	li 9,1
	b .L34
.L33:
	li 9,0
.L34:
	rlwinm 9,9,0,31,31
	rlwinm 9,9,0,0xff
	mr 3,9
	addi 11,31,16
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	RecoverySituation, .-RecoverySituation
	.align 2
	.globl NearSurface
	.type	NearSurface, @function
NearSurface:
	stwu 1,-64(1)
	mflr 0
	stw 0,68(1)
	stw 31,60(1)
	mr 31,1
	lis 9,0x8045
	ori 9,9,16160
	lwz 9,0(9)
	mr 3,9
	bl int_to_float
	mr 9,3
	cmpwi 7,9,0
	bge 7,.L37
	lis 9,0x8045
	ori 9,9,16160
	lwz 9,0(9)
	mr 3,9
	bl int_to_float
	mr 9,3
	neg 9,9
	b .L38
.L37:
	lis 9,0x8045
	ori 9,9,16160
	lwz 9,0(9)
	mr 3,9
	bl int_to_float
	mr 9,3
.L38:
	stw 9,8(31)
	lis 9,0x8019
	ori 9,9,6808
	stw 9,12(31)
	lis 9,0x8019
	ori 9,9,7140
	stw 9,16(31)
	addi 10,31,24
	lwz 9,12(31)
	mr 3,10
	mtctr 9
	crxor 6,6,6
	bctrl
	addi 10,31,36
	lwz 9,16(31)
	mr 3,10
	mtctr 9
	crxor 6,6,6
	bctrl
	lis 9,0x8045
	ori 9,9,16160
	lwz 9,0(9)
	mr 3,9
	bl int_to_float
	mr 9,3
	cmpwi 7,9,0
	bge 7,.L39
	lis 9,0x8045
	ori 9,9,16160
	lwz 9,0(9)
	mr 3,9
	bl int_to_float
	mr 9,3
	neg 9,9
	b .L40
.L39:
	lis 9,0x8045
	ori 9,9,16160
	lwz 9,0(9)
	mr 3,9
	bl int_to_float
	mr 9,3
.L40:
	lwz 10,24(31)
	cmpw 7,9,10
	ble 7,.L41
	lis 9,0x8045
	ori 9,9,16160
	lwz 9,0(9)
	mr 3,9
	bl int_to_float
	mr 9,3
	cmpwi 7,9,0
	bge 7,.L42
	lis 9,0x8045
	ori 9,9,16160
	lwz 9,0(9)
	mr 3,9
	bl int_to_float
	mr 9,3
	neg 9,9
	b .L43
.L42:
	lis 9,0x8045
	ori 9,9,16160
	lwz 9,0(9)
	mr 3,9
	bl int_to_float
	mr 9,3
.L43:
	lwz 10,28(31)
	cmpw 7,9,10
	bge 7,.L41
	li 9,1
	b .L44
.L41:
	li 9,0
.L44:
	stb 9,20(31)
	lbz 9,20(31)
	rlwinm 9,9,0,31,31
	stb 9,20(31)
	lis 9,0x8045
	ori 9,9,16164
	lwz 9,0(9)
	mr 3,9
	bl int_to_float
	mr 10,3
	lwz 9,32(31)
	cmpw 7,10,9
	ble 7,.L45
	lis 9,0x8045
	ori 9,9,16164
	lwz 9,0(9)
	mr 3,9
	bl int_to_float
	mr 10,3
	lwz 9,32(31)
	addi 9,9,100
	cmpw 7,10,9
	bge 7,.L45
	li 9,1
	b .L46
.L45:
	li 9,0
.L46:
	stb 9,21(31)
	lbz 9,21(31)
	rlwinm 9,9,0,31,31
	stb 9,21(31)
	lis 9,0x8045
	ori 9,9,16160
	lwz 9,0(9)
	mr 3,9
	bl int_to_float
	mr 9,3
	cmpwi 7,9,0
	bge 7,.L47
	lis 9,0x8045
	ori 9,9,16160
	lwz 9,0(9)
	mr 3,9
	bl int_to_float
	mr 9,3
	neg 9,9
	b .L48
.L47:
	lis 9,0x8045
	ori 9,9,16160
	lwz 9,0(9)
	mr 3,9
	bl int_to_float
	mr 9,3
.L48:
	lwz 10,40(31)
	cmpw 7,9,10
	bge 7,.L49
	lis 9,0x8045
	ori 9,9,16164
	lwz 9,0(9)
	mr 3,9
	bl int_to_float
	mr 10,3
	lwz 9,44(31)
	cmpw 7,10,9
	ble 7,.L49
	lis 9,0x8045
	ori 9,9,16164
	lwz 9,0(9)
	mr 3,9
	bl int_to_float
	mr 10,3
	lwz 9,44(31)
	addi 9,9,100
	cmpw 7,10,9
	bge 7,.L49
	li 9,1
	b .L50
.L49:
	li 9,0
.L50:
	stb 9,22(31)
	lbz 9,22(31)
	rlwinm 9,9,0,31,31
	stb 9,22(31)
	bl Offstage
	mr 9,3
	xori 9,9,1
	rlwinm 9,9,0,0xff
	cmpwi 7,9,0
	beq 7,.L51
	lis 9,0x8045
	ori 9,9,16164
	lwz 9,0(9)
	mr 3,9
	bl int_to_float
	mr 9,3
	cmpwi 7,9,99
	bgt 7,.L51
	li 9,1
	b .L52
.L51:
	li 9,0
.L52:
	stb 9,23(31)
	lbz 9,23(31)
	rlwinm 9,9,0,31,31
	stb 9,23(31)
	lbz 9,20(31)
	rlwinm 9,9,0,0xff
	cmpwi 7,9,0
	beq 7,.L53
	lbz 9,21(31)
	rlwinm 9,9,0,0xff
	cmpwi 7,9,0
	bne 7,.L54
.L53:
	lbz 9,22(31)
	rlwinm 9,9,0,0xff
	cmpwi 7,9,0
	bne 7,.L54
	lbz 9,23(31)
	rlwinm 9,9,0,0xff
	cmpwi 7,9,0
	beq 7,.L55
.L54:
	li 9,1
	b .L56
.L55:
	li 9,0
.L56:
	rlwinm 9,9,0,31,31
	rlwinm 9,9,0,0xff
	mr 3,9
	addi 11,31,64
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	NearSurface, .-NearSurface
	.align 2
	.globl TechSituation
	.type	TechSituation, @function
TechSituation:
	stwu 1,-16(1)
	mflr 0
	stw 0,20(1)
	stw 31,12(1)
	mr 31,1
	bl Falling
	mr 9,3
	cmpwi 7,9,0
	beq 7,.L59
	bl NearSurface
	mr 9,3
	cmpwi 7,9,0
	beq 7,.L59
	bl InHitstun
	mr 9,3
	cmpwi 7,9,0
	bne 7,.L60
	lis 9,0x8045
	ori 9,9,16320
	lwz 9,0(9)
	addi 9,9,112
	lwz 9,0(9)
	cmplwi 7,9,38
	bne 7,.L59
.L60:
	li 9,1
	b .L61
.L59:
	li 9,0
.L61:
	rlwinm 9,9,0,31,31
	rlwinm 9,9,0,0xff
	mr 3,9
	addi 11,31,16
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	TechSituation, .-TechSituation
	.align 2
	.globl FallenDown
	.type	FallenDown, @function
FallenDown:
	stwu 1,-16(1)
	stw 31,12(1)
	mr 31,1
	lis 9,0x8045
	ori 9,9,16320
	lwz 9,0(9)
	addi 9,9,112
	lwz 9,0(9)
	cmplwi 7,9,184
	beq 7,.L64
	lis 9,0x8045
	ori 9,9,16320
	lwz 9,0(9)
	addi 9,9,112
	lwz 9,0(9)
	cmplwi 7,9,192
	bne 7,.L65
.L64:
	li 9,1
	b .L66
.L65:
	li 9,0
.L66:
	rlwinm 9,9,0,31,31
	rlwinm 9,9,0,0xff
	mr 3,9
	addi 11,31,16
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	FallenDown, .-FallenDown
	.align 2
	.globl FallSpecial
	.type	FallSpecial, @function
FallSpecial:
	stwu 1,-16(1)
	stw 31,12(1)
	mr 31,1
	lis 9,0x8045
	ori 9,9,16320
	lwz 9,0(9)
	addi 9,9,112
	lwz 9,0(9)
	cmplwi 7,9,34
	ble 7,.L69
	lis 9,0x8045
	ori 9,9,16320
	lwz 9,0(9)
	addi 9,9,112
	lwz 9,0(9)
	cmplwi 7,9,37
	bgt 7,.L69
	li 9,1
	b .L70
.L69:
	li 9,0
.L70:
	rlwinm 9,9,0,31,31
	rlwinm 9,9,0,0xff
	mr 3,9
	addi 11,31,16
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	FallSpecial, .-FallSpecial
	.align 2
	.globl Height
	.type	Height, @function
Height:
	stwu 1,-24(1)
	mflr 0
	stw 0,28(1)
	stw 31,20(1)
	mr 31,1
	stw 3,8(31)
	lis 9,0x8045
	ori 9,9,16164
	lwz 9,0(9)
	mr 3,9
	bl int_to_float
	mr 10,3
	lwz 9,8(31)
	cmpw 7,10,9
	mfcr 9
	rlwinm 9,9,29,1
	rlwinm 9,9,0,0xff
	mr 3,9
	addi 11,31,24
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	Height, .-Height
	.ident	"GCC: (devkitPPC release 27) 4.8.2"
