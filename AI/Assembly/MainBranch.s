	.file	"MainBranch.c"
	.section	".text"
	.align 2
	.globl _main
	.type	_main, @function
_main:
	stwu 1,-32(1)
	mflr 0
	stw 0,36(1)
	stw 31,28(1)
	mr 31,1
	lis 9,0x8019
	ori 9,9,8368
	stw 9,8(31)
	lwz 9,8(31)
	mtctr 9
	bctrl
	mr 3,9
	addi 11,31,32
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	_main, .-_main
	.ident	"GCC: (devkitPPC release 27) 4.8.2"
