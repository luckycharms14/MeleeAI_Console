	.file	"GameInfo.c"
	.section	".text"
	.align 2
	.globl GetStageLimit
	.type	GetStageLimit, @function
GetStageLimit:
	stwu 1,-32(1)
	stw 31,28(1)
	mr 31,1
	lis 9,0x804d
	ori 9,9,27820
	lwz 9,0(9)
	srwi 9,9,8
	stw 9,8(31)
	lwz 9,8(31)
	cmpwi 7,9,6
	bne 7,.L2
	li 9,5792
	b .L3
.L2:
	lwz 9,8(31)
	cmpwi 7,9,8
	bne 7,.L4
	li 9,6523
	b .L3
.L4:
	lwz 9,8(31)
	cmpwi 7,9,18
	bne 7,.L5
	li 9,8967
	b .L3
.L5:
	lwz 9,8(31)
	cmpwi 7,9,24
	bne 7,.L6
	li 9,7032
	b .L3
.L6:
	lwz 9,8(31)
	cmpwi 7,9,25
	bne 7,.L7
	li 9,8802
	b .L3
.L7:
	lwz 9,8(31)
	cmpwi 7,9,26
	bne 7,.L8
	li 9,7972
	b .L3
.L8:
	li 9,0
.L3:
	mr 3,9
	addi 11,31,32
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	GetStageLimit, .-GetStageLimit
	.align 2
	.globl GetSidePlatform
	.type	GetSidePlatform, @function
GetSidePlatform:
	stwu 1,-40(1)
	stw 31,36(1)
	mr 31,1
	stw 3,24(31)
	lis 9,0x804d
	ori 9,9,27820
	lwz 9,0(9)
	srwi 9,9,8
	stw 9,8(31)
	lwz 9,8(31)
	cmpwi 7,9,6
	bne 7,.L10
	li 9,2800
	stw 9,12(31)
	li 9,5950
	stw 9,16(31)
	li 9,2345
	stw 9,20(31)
	b .L11
.L10:
	lwz 9,8(31)
	cmpwi 7,9,8
	bne 7,.L12
	li 9,0
	stw 9,12(31)
	li 9,6523
	stw 9,16(31)
	li 9,0
	stw 9,20(31)
	b .L11
.L12:
	lwz 9,8(31)
	cmpwi 7,9,18
	bne 7,.L13
	li 9,2500
	stw 9,12(31)
	li 9,5500
	stw 9,16(31)
	li 9,2500
	stw 9,20(31)
	b .L11
.L13:
	lwz 9,8(31)
	cmpwi 7,9,24
	bne 7,.L14
	li 9,2000
	stw 9,12(31)
	li 9,5760
	stw 9,16(31)
	li 9,2720
	stw 9,20(31)
	b .L11
.L14:
	lwz 9,8(31)
	cmpwi 7,9,25
	bne 7,.L15
	li 9,0
	stw 9,12(31)
	li 9,8802
	stw 9,16(31)
	li 9,0
	stw 9,20(31)
	b .L11
.L15:
	lwz 9,8(31)
	cmpwi 7,9,26
	bne 7,.L16
	li 9,3173
	stw 9,12(31)
	li 9,6139
	stw 9,16(31)
	li 9,3014
	stw 9,20(31)
	b .L11
.L16:
	li 9,0
	stw 9,16(31)
.L11:
	lwz 9,24(31)
	lwz 7,12(31)
	lwz 8,16(31)
	lwz 10,20(31)
	stw 7,0(9)
	stw 8,4(9)
	stw 10,8(9)
	lwz 3,24(31)
	addi 11,31,40
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	GetSidePlatform, .-GetSidePlatform
	.align 2
	.globl GetTopPlatform
	.type	GetTopPlatform, @function
GetTopPlatform:
	stwu 1,-40(1)
	stw 31,36(1)
	mr 31,1
	stw 3,24(31)
	lis 9,0x804d
	ori 9,9,27820
	lwz 9,0(9)
	srwi 9,9,8
	stw 9,8(31)
	lwz 9,8(31)
	cmpwi 7,9,6
	bne 7,.L19
	li 9,1575
	stw 9,16(31)
	li 9,4200
	stw 9,20(31)
	b .L20
.L19:
	lwz 9,8(31)
	cmpwi 7,9,8
	bne 7,.L21
	li 9,1425
	stw 9,16(31)
	li 9,4275
	stw 9,20(31)
	b .L20
.L21:
	lwz 9,8(31)
	cmpwi 7,9,18
	bne 7,.L22
	li 9,8967
	stw 9,16(31)
	li 9,0
	stw 9,20(31)
	b .L20
.L22:
	lwz 9,8(31)
	cmpwi 7,9,24
	bne 7,.L23
	li 9,1880
	stw 9,16(31)
	li 9,5440
	stw 9,20(31)
	b .L20
.L23:
	lwz 9,8(31)
	cmpwi 7,9,25
	bne 7,.L24
	li 9,8802
	stw 9,16(31)
	li 9,0
	stw 9,20(31)
	b .L20
.L24:
	lwz 9,8(31)
	cmpwi 7,9,26
	bne 7,.L25
	li 9,1902
	stw 9,16(31)
	li 9,5143
	stw 9,20(31)
	b .L20
.L25:
	li 9,0
	stw 9,16(31)
.L20:
	lwz 9,24(31)
	lwz 7,12(31)
	lwz 8,16(31)
	lwz 10,20(31)
	stw 7,0(9)
	stw 8,4(9)
	stw 10,8(9)
	lwz 3,24(31)
	addi 11,31,40
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	GetTopPlatform, .-GetTopPlatform
	.ident	"GCC: (devkitPPC release 27) 4.8.2"
