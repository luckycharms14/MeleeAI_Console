	.file	"MeleeAI.c"
	.section	".text"
	.align 2
	.globl do_main
	.type	do_main, @function
do_main:
	stwu 1,-32(1)
	mflr 0
	stw 0,36(1)
	stw 31,28(1)
	mr 31,1
	lis 9,0x8000
	ori 9,9,7076
	lwz 10,0(9)
	lis 9,0xc5
	ori 9,9,35311
	cmpw 7,10,9
	beq 7,.L2
	lis 9,0x8000
	ori 9,9,7076
	lis 10,0xc5
	ori 10,10,35311
	stw 10,0(9)
	lis 9,0x8000
	ori 9,9,7080
	li 10,0
	stw 10,0(9)
.L2:
	lis 9,0x8000
	ori 9,9,7080
	lwz 9,0(9)
	cmpwi 7,9,0
	beq 7,.L3
	lis 9,0x8065
	ori 9,9,52244
	lwz 9,0(9)
	srwi 9,9,20
	rlwinm 9,9,0,28,31
	cmplwi 7,9,13
	beq 7,.L3
	lis 9,0x8000
	ori 9,9,7080
	li 10,0
	stw 10,0(9)
	lis 9,0x8045
	ori 9,9,16152
	li 10,1
	stw 10,0(9)
	b .L4
.L3:
	lis 9,0x8000
	ori 9,9,7080
	lwz 9,0(9)
	cmpwi 7,9,0
	bne 7,.L4
	lis 9,0x8065
	ori 9,9,52244
	lwz 9,0(9)
	srwi 9,9,20
	rlwinm 9,9,0,28,31
	cmplwi 7,9,13
	bne 7,.L4
	lis 9,0x8045
	ori 9,9,16152
	lwz 9,0(9)
	cmplwi 7,9,1
	bne 7,.L4
	lis 9,0x8000
	ori 9,9,7080
	li 10,1
	stw 10,0(9)
	lis 9,0x8000
	ori 9,9,6912
	li 10,0
	stw 10,0(9)
	lis 9,0x8000
	ori 9,9,6144
	li 10,0
	stw 10,0(9)
	lis 9,0x8045
	ori 9,9,16152
	li 10,0
	stw 10,0(9)
.L4:
	lis 9,0x8065
	ori 9,9,52244
	lwz 9,0(9)
	srwi 9,9,20
	rlwinm 9,9,0,28,31
	cmplwi 7,9,13
	bne 7,.L1
	lis 9,0x8000
	ori 9,9,7080
	lwz 9,0(9)
	cmpwi 7,9,0
	beq 7,.L1
	lis 9,0x8000
	ori 9,9,6144
	lwz 9,0(9)
	cmpwi 7,9,0
	beq 7,.L6
	lis 9,0x8019
	ori 9,9,7544
	stw 9,8(31)
	lwz 9,8(31)
	mtctr 9
	bctrl
.L6:
	lis 9,0x8000
	ori 9,9,6912
	lwz 9,0(9)
	cmpwi 7,9,0
	beq 7,.L7
	lis 9,0x8019
	ori 9,9,8164
	stw 9,12(31)
	lwz 9,12(31)
	mtctr 9
	bctrl
.L7:
	lis 9,0x8000
	ori 9,9,6144
	lwz 9,0(9)
	cmpwi 7,9,0
	bne 7,.L8
	lis 9,0x8000
	ori 9,9,6912
	lwz 9,0(9)
	cmpwi 7,9,0
	bne 7,.L8
	lis 9,0x8030
	ori 9,9,6264
	stw 9,16(31)
	lwz 9,16(31)
	mtctr 9
	bctrl
.L8:
	lis 9,0x8019
	ori 9,9,6324
	stw 9,20(31)
	lwz 9,20(31)
	mtctr 9
	bctrl
.L1:
	addi 11,31,32
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	do_main, .-do_main
	.ident	"GCC: (devkitPPC release 27) 4.8.2"
