	.file	"test_mpi_ghost_matrix.c"
	.text
.Ltext0:
	.section	.rodata
.LC0:
	.string	"Testing: newGhostMatrix"
.LC1:
	.string	"test_mpi_ghost_matrix.c"
.LC2:
	.string	"gmat==((void *)0)"
.LC3:
	.string	"gmat!=((void *)0)"
.LC4:
	.string	"Testing: printGhostMatrix"
.LC5:
	.string	"rv==-1"
.LC6:
	.string	"rv==0"
.LC7:
	.string	"Testing: deleteGhostMatrix"
	.align 8
.LC8:
	.string	"Testing: newGhostMatrixRowPanel"
.LC9:
	.string	"Only Core gmatrix 1,1"
.LC10:
	.string	"rv == 0"
	.align 8
.LC11:
	.string	"Ghost row on the top of a 2,2 gmatrix"
	.align 8
.LC12:
	.string	"Ghost row on the bottom of a 3,3 gmatrix"
	.align 8
.LC13:
	.string	"Ghost row above and below a 2,2 gmatrix"
	.align 8
.LC14:
	.string	"Testing newGhostMatrixCheckerboard"
.LC15:
	.string	"checker==((void *)0)"
.LC16:
	.string	"checker!=((void *)0)"
.LC17:
	.string	"Testing: printCompGhostMatrix"
.LC18:
	.string	"Testing: setElemGhostMatrix"
.LC20:
	.string	"Testing: setAllGhostMatrix"
	.align 8
.LC23:
	.string	"Testing: setElemCoreGhostMatrix"
	.align 8
.LC24:
	.string	"Testing: getRowStartGhostMatrix"
.LC25:
	.string	"rv==1"
.LC26:
	.string	"Testing: getRowEndGhostMatrix"
.LC27:
	.string	"rv==4"
.LC28:
	.string	"Testing: getRowsGhostMatrix"
.LC29:
	.string	"rv==5"
	.align 8
.LC30:
	.string	"Testing: getColStartGhostMatrix"
.LC31:
	.string	"Testing: getColEndGhostMatrix"
.LC32:
	.string	"Testing: getColsGhostMatrix"
.LC33:
	.string	"rv==6"
.LC34:
	.string	"Testing: getTotalGhostMatrix"
.LC35:
	.string	"rv==30"
	.align 8
.LC36:
	.string	"Testing: getRowsCoreGhostMatrix"
.LC37:
	.string	"rv==3"
	.align 8
.LC38:
	.string	"Testing: getColsCoreGhostMatrix"
	.align 8
.LC39:
	.string	"Testing: getTotalCoreGhostMatrix"
.LC40:
	.string	"rv==12"
	.align 8
.LC41:
	.string	"Testing: getColsWestGhostMatrix"
	.align 8
.LC42:
	.string	"Testing: getColsEastGhostMatrix"
	.align 8
.LC43:
	.string	"Testing: getRowsSouthGhostMatrix"
.LC44:
	.string	"rv==2"
	.align 8
.LC45:
	.string	"Testing: getRowsNorthGhostMatrix"
.LC46:
	.string	"Testing: getElemGhostMatrix"
.LC48:
	.string	"rvf==-1.0"
.LC50:
	.string	"rvf==0.0"
.LC51:
	.string	"Testing: copyGhostMatrix"
.LC53:
	.string	"rvf==temp"
	.align 8
.LC54:
	.string	"Testing: getElemCoreGhostMatrix"
.LC55:
	.string	"Testing: sumAllCoreMatrix"
.LC57:
	.string	"rvf %f\n"
.LC58:
	.string	"(int)rvf==25"
	.align 8
.LC59:
	.string	"Testing: setElemNorthGhostMatrix"
	.align 8
.LC67:
	.string	"Testing: getElemNorthGhostMatrix"
.LC68:
	.string	"rvf==-1"
.LC69:
	.string	"rvf==7"
.LC70:
	.string	"rvf==84"
	.align 8
.LC71:
	.string	"Testing: setElemSouthGhostMatrix"
	.align 8
.LC72:
	.string	"Testing: getElemSouthGhostMatrix"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.file 1 "test_mpi_ghost_matrix.c"
	.loc 1 33 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$208, %rsp
	.loc 1 35 0
	movl	$.LC0, %edi
	call	puts
.LBB2:
	.loc 1 37 0
	movl	$1, %esi
	movl	$0, %edi
	call	newGhostMatrix
	movq	%rax, -8(%rbp)
	.loc 1 38 0
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L2
	.loc 1 38 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$38, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L2:
	.loc 1 39 0 is_stmt 1
	movl	$0, %esi
	movl	$1, %edi
	call	newGhostMatrix
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L3
	.loc 1 39 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$39, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L3:
	.loc 1 40 0 is_stmt 1
	movl	$1, %esi
	movl	$1, %edi
	call	newGhostMatrix
	movq	%rax, -8(%rbp)
	.loc 1 41 0
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	jne	.L4
	.loc 1 41 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$41, %edx
	movl	$.LC1, %esi
	movl	$.LC3, %edi
	call	__assert_fail
.L4:
	.loc 1 43 0 is_stmt 1
	movl	$.LC4, %edi
	call	puts
	.loc 1 44 0
	movl	$0, %edi
	call	printGhostMatrix
	movl	%eax, -172(%rbp)
	.loc 1 45 0
	cmpl	$-1, -172(%rbp)
	je	.L5
	.loc 1 45 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$45, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L5:
	.loc 1 46 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	printGhostMatrix
	movl	%eax, -172(%rbp)
	.loc 1 47 0
	cmpl	$0, -172(%rbp)
	je	.L6
	.loc 1 47 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$47, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L6:
	.loc 1 49 0 is_stmt 1
	movl	$.LC7, %edi
	call	puts
	.loc 1 50 0
	movl	$0, %edi
	call	deleteGhostMatrix
	movl	%eax, -172(%rbp)
	.loc 1 51 0
	cmpl	$-1, -172(%rbp)
	je	.L7
	.loc 1 51 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$51, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L7:
	.loc 1 52 0 is_stmt 1
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -172(%rbp)
	.loc 1 53 0
	cmpl	$0, -172(%rbp)
	je	.L8
	.loc 1 53 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$53, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L8:
.LBE2:
	.loc 1 56 0 is_stmt 1
	movl	$.LC8, %edi
	call	puts
.LBB3:
	.loc 1 58 0
	movl	$0, %ecx
	movl	$0, %edx
	movl	$1, %esi
	movl	$0, %edi
	call	newGhostMatrixRowPanel
	movq	%rax, -8(%rbp)
	.loc 1 59 0
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L9
	.loc 1 59 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$59, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L9:
	.loc 1 60 0 is_stmt 1
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$1, %edi
	call	newGhostMatrixRowPanel
	movq	%rax, -8(%rbp)
	.loc 1 61 0
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L10
	.loc 1 61 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$61, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L10:
	.loc 1 62 0 is_stmt 1
	movl	$0, %ecx
	movl	$-1, %edx
	movl	$1, %esi
	movl	$1, %edi
	call	newGhostMatrixRowPanel
	movq	%rax, -8(%rbp)
	.loc 1 63 0
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L11
	.loc 1 63 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$63, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L11:
	.loc 1 64 0 is_stmt 1
	movl	$-1, %ecx
	movl	$0, %edx
	movl	$1, %esi
	movl	$1, %edi
	call	newGhostMatrixRowPanel
	movq	%rax, -8(%rbp)
	.loc 1 65 0
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L12
	.loc 1 65 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$65, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L12:
	.loc 1 66 0 is_stmt 1
	movl	$0, %ecx
	movl	$0, %edx
	movl	$1, %esi
	movl	$1, %edi
	call	newGhostMatrixRowPanel
	movq	%rax, -8(%rbp)
	.loc 1 67 0
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	jne	.L13
	.loc 1 67 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$67, %edx
	movl	$.LC1, %esi
	movl	$.LC3, %edi
	call	__assert_fail
.L13:
	.loc 1 68 0 is_stmt 1
	movl	$.LC9, %edi
	call	puts
	.loc 1 69 0
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	printGhostMatrix
	.loc 1 70 0
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -168(%rbp)
	.loc 1 71 0
	cmpl	$0, -168(%rbp)
	je	.L14
	.loc 1 71 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$71, %edx
	movl	$.LC1, %esi
	movl	$.LC10, %edi
	call	__assert_fail
.L14:
	.loc 1 72 0 is_stmt 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L15
	.loc 1 72 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$72, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L15:
	.loc 1 73 0 is_stmt 1
	movl	$.LC11, %edi
	call	puts
	.loc 1 74 0
	movl	$0, %ecx
	movl	$1, %edx
	movl	$2, %esi
	movl	$2, %edi
	call	newGhostMatrixRowPanel
	movq	%rax, -8(%rbp)
	.loc 1 75 0
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	jne	.L16
	.loc 1 75 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$75, %edx
	movl	$.LC1, %esi
	movl	$.LC3, %edi
	call	__assert_fail
.L16:
	.loc 1 76 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	printGhostMatrix
	movl	%eax, -168(%rbp)
	.loc 1 77 0
	cmpl	$0, -168(%rbp)
	je	.L17
	.loc 1 77 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$77, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L17:
	.loc 1 78 0 is_stmt 1
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -168(%rbp)
	.loc 1 79 0
	cmpl	$0, -168(%rbp)
	je	.L18
	.loc 1 79 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$79, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L18:
	.loc 1 80 0 is_stmt 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L19
	.loc 1 80 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$80, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L19:
	.loc 1 81 0 is_stmt 1
	movl	$.LC12, %edi
	call	puts
	.loc 1 82 0
	movl	$1, %ecx
	movl	$0, %edx
	movl	$3, %esi
	movl	$3, %edi
	call	newGhostMatrixRowPanel
	movq	%rax, -8(%rbp)
	.loc 1 83 0
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	jne	.L20
	.loc 1 83 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$83, %edx
	movl	$.LC1, %esi
	movl	$.LC3, %edi
	call	__assert_fail
.L20:
	.loc 1 84 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	printGhostMatrix
	movl	%eax, -168(%rbp)
	.loc 1 85 0
	cmpl	$0, -168(%rbp)
	je	.L21
	.loc 1 85 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$85, %edx
	movl	$.LC1, %esi
	movl	$.LC10, %edi
	call	__assert_fail
.L21:
	.loc 1 86 0 is_stmt 1
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -168(%rbp)
	.loc 1 87 0
	cmpl	$0, -168(%rbp)
	je	.L22
	.loc 1 87 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$87, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L22:
	.loc 1 88 0 is_stmt 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L23
	.loc 1 88 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$88, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L23:
	.loc 1 89 0 is_stmt 1
	movl	$.LC13, %edi
	call	puts
	.loc 1 90 0
	movl	$1, %ecx
	movl	$1, %edx
	movl	$2, %esi
	movl	$2, %edi
	call	newGhostMatrixRowPanel
	movq	%rax, -8(%rbp)
	.loc 1 91 0
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	jne	.L24
	.loc 1 91 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$91, %edx
	movl	$.LC1, %esi
	movl	$.LC3, %edi
	call	__assert_fail
.L24:
	.loc 1 92 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	printGhostMatrix
	movl	%eax, -168(%rbp)
	.loc 1 93 0
	cmpl	$0, -168(%rbp)
	je	.L25
	.loc 1 93 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$93, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L25:
	.loc 1 94 0 is_stmt 1
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -168(%rbp)
	.loc 1 95 0
	cmpl	$0, -168(%rbp)
	je	.L26
	.loc 1 95 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$95, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L26:
	.loc 1 96 0 is_stmt 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L27
	.loc 1 96 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$96, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L27:
.LBE3:
	.loc 1 99 0 is_stmt 1
	movl	$.LC14, %edi
	call	puts
.LBB4:
	.loc 1 101 0
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$4, %esi
	movl	$0, %edi
	call	newGhostMatrixCheckerboard
	movq	%rax, -8(%rbp)
	.loc 1 102 0
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L28
	.loc 1 102 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$102, %edx
	movl	$.LC1, %esi
	movl	$.LC15, %edi
	call	__assert_fail
.L28:
	.loc 1 103 0 is_stmt 1
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$3, %edi
	call	newGhostMatrixCheckerboard
	movq	%rax, -8(%rbp)
	.loc 1 104 0
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L29
	.loc 1 104 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$104, %edx
	movl	$.LC1, %esi
	movl	$.LC15, %edi
	call	__assert_fail
.L29:
	.loc 1 105 0 is_stmt 1
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$-1, %edx
	movl	$4, %esi
	movl	$3, %edi
	call	newGhostMatrixCheckerboard
	movq	%rax, -8(%rbp)
	.loc 1 106 0
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L30
	.loc 1 106 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$106, %edx
	movl	$.LC1, %esi
	movl	$.LC15, %edi
	call	__assert_fail
.L30:
	.loc 1 107 0 is_stmt 1
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$-1, %ecx
	movl	$0, %edx
	movl	$4, %esi
	movl	$3, %edi
	call	newGhostMatrixCheckerboard
	movq	%rax, -8(%rbp)
	.loc 1 108 0
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L31
	.loc 1 108 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$108, %edx
	movl	$.LC1, %esi
	movl	$.LC15, %edi
	call	__assert_fail
.L31:
	.loc 1 109 0 is_stmt 1
	movl	$0, %r9d
	movl	$-1, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$4, %esi
	movl	$3, %edi
	call	newGhostMatrixCheckerboard
	movq	%rax, -8(%rbp)
	.loc 1 110 0
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L32
	.loc 1 110 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$110, %edx
	movl	$.LC1, %esi
	movl	$.LC15, %edi
	call	__assert_fail
.L32:
	.loc 1 111 0 is_stmt 1
	movl	$-1, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$4, %esi
	movl	$3, %edi
	call	newGhostMatrixCheckerboard
	movq	%rax, -8(%rbp)
	.loc 1 112 0
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L33
	.loc 1 112 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$112, %edx
	movl	$.LC1, %esi
	movl	$.LC15, %edi
	call	__assert_fail
.L33:
	.loc 1 113 0 is_stmt 1
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$4, %esi
	movl	$3, %edi
	call	newGhostMatrixCheckerboard
	movq	%rax, -8(%rbp)
	.loc 1 114 0
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	jne	.L34
	.loc 1 114 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$114, %edx
	movl	$.LC1, %esi
	movl	$.LC16, %edi
	call	__assert_fail
.L34:
	.loc 1 115 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	printGhostMatrix
	movl	%eax, -164(%rbp)
	.loc 1 116 0
	cmpl	$0, -164(%rbp)
	je	.L35
	.loc 1 116 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$116, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L35:
	.loc 1 117 0 is_stmt 1
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -164(%rbp)
	.loc 1 118 0
	cmpl	$0, -164(%rbp)
	je	.L36
	.loc 1 118 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$118, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L36:
	.loc 1 119 0 is_stmt 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L37
	.loc 1 119 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$119, %edx
	movl	$.LC1, %esi
	movl	$.LC15, %edi
	call	__assert_fail
.L37:
.LBE4:
	.loc 1 122 0 is_stmt 1
	movl	$.LC17, %edi
	call	puts
.LBB5:
	.loc 1 124 0
	movl	$3, %esi
	movl	$3, %edi
	call	newGhostMatrix
	movq	%rax, -8(%rbp)
	.loc 1 125 0
	movl	$0, %edi
	call	printCompGhostMatrix
	movl	%eax, -160(%rbp)
	.loc 1 126 0
	cmpl	$-1, -160(%rbp)
	je	.L38
	.loc 1 126 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$126, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L38:
	.loc 1 127 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	printCompGhostMatrix
	movl	%eax, -160(%rbp)
	.loc 1 128 0
	cmpl	$0, -160(%rbp)
	je	.L39
	.loc 1 128 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$128, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L39:
	.loc 1 129 0 is_stmt 1
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -160(%rbp)
	.loc 1 130 0
	cmpl	$0, -160(%rbp)
	je	.L40
	.loc 1 130 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$130, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L40:
	.loc 1 131 0 is_stmt 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L41
	.loc 1 131 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$131, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L41:
.LBE5:
	.loc 1 135 0 is_stmt 1
	movl	$.LC18, %edi
	call	puts
.LBB6:
	.loc 1 137 0
	movl	$1, %ecx
	movl	$1, %edx
	movl	$2, %esi
	movl	$3, %edi
	call	newGhostMatrixRowPanel
	movq	%rax, -8(%rbp)
	.loc 1 138 0
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	jne	.L42
	.loc 1 138 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$138, %edx
	movl	$.LC1, %esi
	movl	$.LC3, %edi
	call	__assert_fail
.L42:
	.loc 1 139 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	printCompGhostMatrix
	.loc 1 140 0
	movss	.LC19(%rip), %xmm0
	movl	$0, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	setElemGhostMatrix
	movl	%eax, -156(%rbp)
	.loc 1 141 0
	cmpl	$-1, -156(%rbp)
	je	.L43
	.loc 1 141 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$141, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L43:
	.loc 1 142 0 is_stmt 1
	movq	-8(%rbp), %rax
	movss	.LC19(%rip), %xmm0
	movl	$0, %edx
	movl	$-1, %esi
	movq	%rax, %rdi
	call	setElemGhostMatrix
	movl	%eax, -156(%rbp)
	.loc 1 143 0
	cmpl	$-1, -156(%rbp)
	je	.L44
	.loc 1 143 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$143, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L44:
	.loc 1 144 0 is_stmt 1
	movq	-8(%rbp), %rax
	movss	.LC19(%rip), %xmm0
	movl	$-1, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	setElemGhostMatrix
	movl	%eax, -156(%rbp)
	.loc 1 145 0
	cmpl	$-1, -156(%rbp)
	je	.L45
	.loc 1 145 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$145, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L45:
	.loc 1 146 0 is_stmt 1
	movq	-8(%rbp), %rax
	movss	.LC19(%rip), %xmm0
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	setElemGhostMatrix
	movl	%eax, -156(%rbp)
	.loc 1 147 0
	cmpl	$0, -156(%rbp)
	je	.L46
	.loc 1 147 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$147, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L46:
	.loc 1 148 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	printCompGhostMatrix
	.loc 1 149 0
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -156(%rbp)
	.loc 1 150 0
	cmpl	$0, -156(%rbp)
	je	.L47
	.loc 1 150 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$150, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L47:
	.loc 1 151 0 is_stmt 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L48
	.loc 1 151 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$151, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L48:
.LBE6:
	.loc 1 154 0 is_stmt 1
	movl	$.LC20, %edi
	movl	$0, %eax
	call	printf
.LBB7:
	.loc 1 156 0
	movl	$1, %r9d
	movl	$1, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movl	$4, %esi
	movl	$3, %edi
	call	newGhostMatrixCheckerboard
	movq	%rax, -8(%rbp)
	.loc 1 157 0
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	jne	.L49
	.loc 1 157 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$157, %edx
	movl	$.LC1, %esi
	movl	$.LC3, %edi
	call	__assert_fail
.L49:
	.loc 1 158 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	printGhostMatrix
	.loc 1 159 0
	movss	.LC21(%rip), %xmm0
	movl	$0, %edi
	call	setAllGhostMatrix
	movl	%eax, -152(%rbp)
	.loc 1 160 0
	cmpl	$-1, -152(%rbp)
	je	.L50
	.loc 1 160 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$160, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L50:
	.loc 1 161 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	printGhostMatrix
	.loc 1 162 0
	movq	-8(%rbp), %rax
	movss	.LC22(%rip), %xmm0
	movq	%rax, %rdi
	call	setAllGhostMatrix
	movl	%eax, -152(%rbp)
	.loc 1 163 0
	cmpl	$0, -152(%rbp)
	je	.L51
	.loc 1 163 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$163, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L51:
	.loc 1 164 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	printCompGhostMatrix
	.loc 1 165 0
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -152(%rbp)
	.loc 1 166 0
	cmpl	$0, -152(%rbp)
	je	.L52
	.loc 1 166 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$166, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L52:
	.loc 1 167 0 is_stmt 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L53
	.loc 1 167 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$167, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L53:
.LBE7:
	.loc 1 170 0 is_stmt 1
	movl	$.LC23, %edi
	call	puts
.LBB8:
	.loc 1 172 0
	movl	$1, %ecx
	movl	$1, %edx
	movl	$2, %esi
	movl	$3, %edi
	call	newGhostMatrixRowPanel
	movq	%rax, -8(%rbp)
	.loc 1 173 0
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	jne	.L54
	.loc 1 173 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$173, %edx
	movl	$.LC1, %esi
	movl	$.LC3, %edi
	call	__assert_fail
.L54:
	.loc 1 174 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	printCompGhostMatrix
	.loc 1 175 0
	movss	.LC19(%rip), %xmm0
	movl	$0, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	setElemCoreGhostMatrix
	movl	%eax, -148(%rbp)
	.loc 1 176 0
	cmpl	$-1, -148(%rbp)
	je	.L55
	.loc 1 176 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$176, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L55:
	.loc 1 177 0 is_stmt 1
	movq	-8(%rbp), %rax
	movss	.LC19(%rip), %xmm0
	movl	$0, %edx
	movl	$-1, %esi
	movq	%rax, %rdi
	call	setElemCoreGhostMatrix
	movl	%eax, -148(%rbp)
	.loc 1 178 0
	cmpl	$-1, -148(%rbp)
	je	.L56
	.loc 1 178 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$178, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L56:
	.loc 1 179 0 is_stmt 1
	movq	-8(%rbp), %rax
	movss	.LC19(%rip), %xmm0
	movl	$-1, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	setElemCoreGhostMatrix
	movl	%eax, -148(%rbp)
	.loc 1 180 0
	cmpl	$-1, -148(%rbp)
	je	.L57
	.loc 1 180 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$180, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L57:
	.loc 1 181 0 is_stmt 1
	movq	-8(%rbp), %rax
	movss	.LC19(%rip), %xmm0
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	setElemCoreGhostMatrix
	movl	%eax, -148(%rbp)
	.loc 1 182 0
	cmpl	$0, -148(%rbp)
	je	.L58
	.loc 1 182 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$182, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L58:
	.loc 1 183 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	printCompGhostMatrix
	.loc 1 184 0
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -148(%rbp)
	.loc 1 185 0
	cmpl	$0, -148(%rbp)
	je	.L59
	.loc 1 185 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$185, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L59:
	.loc 1 186 0 is_stmt 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L60
	.loc 1 186 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$186, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L60:
.LBE8:
	.loc 1 189 0 is_stmt 1
	movl	$.LC24, %edi
	call	puts
.LBB9:
	.loc 1 191 0
	movl	$1, %r9d
	movl	$1, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movl	$4, %esi
	movl	$3, %edi
	call	newGhostMatrixCheckerboard
	movq	%rax, -8(%rbp)
	.loc 1 192 0
	movl	$0, %edi
	call	getRowStartGhostMatrix
	movl	%eax, -144(%rbp)
	.loc 1 193 0
	cmpl	$-1, -144(%rbp)
	je	.L61
	.loc 1 193 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$193, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L61:
	.loc 1 194 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	getRowStartGhostMatrix
	movl	%eax, -144(%rbp)
	.loc 1 195 0
	cmpl	$1, -144(%rbp)
	je	.L62
	.loc 1 195 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$195, %edx
	movl	$.LC1, %esi
	movl	$.LC25, %edi
	call	__assert_fail
.L62:
	.loc 1 196 0 is_stmt 1
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -144(%rbp)
	.loc 1 197 0
	cmpl	$0, -144(%rbp)
	je	.L63
	.loc 1 197 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$197, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L63:
	.loc 1 198 0 is_stmt 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L64
	.loc 1 198 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$198, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L64:
.LBE9:
	.loc 1 201 0 is_stmt 1
	movl	$.LC26, %edi
	call	puts
.LBB10:
	.loc 1 203 0
	movl	$1, %r9d
	movl	$1, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movl	$4, %esi
	movl	$3, %edi
	call	newGhostMatrixCheckerboard
	movq	%rax, -8(%rbp)
	.loc 1 204 0
	movl	$0, %edi
	call	getRowEndGhostMatrix
	movl	%eax, -140(%rbp)
	.loc 1 205 0
	cmpl	$-1, -140(%rbp)
	je	.L65
	.loc 1 205 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$205, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L65:
	.loc 1 206 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	getRowEndGhostMatrix
	movl	%eax, -140(%rbp)
	.loc 1 207 0
	cmpl	$4, -140(%rbp)
	je	.L66
	.loc 1 207 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$207, %edx
	movl	$.LC1, %esi
	movl	$.LC27, %edi
	call	__assert_fail
.L66:
	.loc 1 208 0 is_stmt 1
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -140(%rbp)
	.loc 1 209 0
	cmpl	$0, -140(%rbp)
	je	.L67
	.loc 1 209 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$209, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L67:
	.loc 1 210 0 is_stmt 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L68
	.loc 1 210 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$210, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L68:
.LBE10:
	.loc 1 213 0 is_stmt 1
	movl	$.LC28, %edi
	call	puts
.LBB11:
	.loc 1 215 0
	movl	$1, %r9d
	movl	$1, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movl	$4, %esi
	movl	$3, %edi
	call	newGhostMatrixCheckerboard
	movq	%rax, -8(%rbp)
	.loc 1 216 0
	movl	$0, %edi
	call	getRowsGhostMatrix
	movl	%eax, -136(%rbp)
	.loc 1 217 0
	cmpl	$-1, -136(%rbp)
	je	.L69
	.loc 1 217 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$217, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L69:
	.loc 1 218 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	getRowsGhostMatrix
	movl	%eax, -136(%rbp)
	.loc 1 219 0
	cmpl	$5, -136(%rbp)
	je	.L70
	.loc 1 219 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$219, %edx
	movl	$.LC1, %esi
	movl	$.LC29, %edi
	call	__assert_fail
.L70:
	.loc 1 220 0 is_stmt 1
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -136(%rbp)
	.loc 1 221 0
	cmpl	$0, -136(%rbp)
	je	.L71
	.loc 1 221 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$221, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L71:
	.loc 1 222 0 is_stmt 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L72
	.loc 1 222 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$222, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L72:
.LBE11:
	.loc 1 225 0 is_stmt 1
	movl	$.LC30, %edi
	call	puts
.LBB12:
	.loc 1 227 0
	movl	$1, %r9d
	movl	$1, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movl	$4, %esi
	movl	$3, %edi
	call	newGhostMatrixCheckerboard
	movq	%rax, -8(%rbp)
	.loc 1 228 0
	movl	$0, %edi
	call	getColStartGhostMatrix
	movl	%eax, -132(%rbp)
	.loc 1 229 0
	cmpl	$-1, -132(%rbp)
	je	.L73
	.loc 1 229 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$229, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L73:
	.loc 1 230 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	getColStartGhostMatrix
	movl	%eax, -132(%rbp)
	.loc 1 231 0
	cmpl	$1, -132(%rbp)
	je	.L74
	.loc 1 231 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$231, %edx
	movl	$.LC1, %esi
	movl	$.LC25, %edi
	call	__assert_fail
.L74:
	.loc 1 232 0 is_stmt 1
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -132(%rbp)
	.loc 1 233 0
	cmpl	$0, -132(%rbp)
	je	.L75
	.loc 1 233 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$233, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L75:
	.loc 1 234 0 is_stmt 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L76
	.loc 1 234 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$234, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L76:
.LBE12:
	.loc 1 237 0 is_stmt 1
	movl	$.LC31, %edi
	call	puts
.LBB13:
	.loc 1 239 0
	movl	$1, %r9d
	movl	$1, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movl	$4, %esi
	movl	$3, %edi
	call	newGhostMatrixCheckerboard
	movq	%rax, -8(%rbp)
	.loc 1 240 0
	movl	$0, %edi
	call	getColEndGhostMatrix
	movl	%eax, -128(%rbp)
	.loc 1 241 0
	cmpl	$-1, -128(%rbp)
	je	.L77
	.loc 1 241 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$241, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L77:
	.loc 1 242 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	getColEndGhostMatrix
	movl	%eax, -128(%rbp)
	.loc 1 243 0
	cmpl	$5, -128(%rbp)
	je	.L78
	.loc 1 243 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$243, %edx
	movl	$.LC1, %esi
	movl	$.LC29, %edi
	call	__assert_fail
.L78:
	.loc 1 244 0 is_stmt 1
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -128(%rbp)
	.loc 1 245 0
	cmpl	$0, -128(%rbp)
	je	.L79
	.loc 1 245 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$245, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L79:
	.loc 1 246 0 is_stmt 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L80
	.loc 1 246 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$246, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L80:
.LBE13:
	.loc 1 249 0 is_stmt 1
	movl	$.LC32, %edi
	call	puts
.LBB14:
	.loc 1 251 0
	movl	$1, %r9d
	movl	$1, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movl	$4, %esi
	movl	$3, %edi
	call	newGhostMatrixCheckerboard
	movq	%rax, -8(%rbp)
	.loc 1 252 0
	movl	$0, %edi
	call	getColsGhostMatrix
	movl	%eax, -124(%rbp)
	.loc 1 253 0
	cmpl	$-1, -124(%rbp)
	je	.L81
	.loc 1 253 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$253, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L81:
	.loc 1 254 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	getColsGhostMatrix
	movl	%eax, -124(%rbp)
	.loc 1 255 0
	cmpl	$6, -124(%rbp)
	je	.L82
	.loc 1 255 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$255, %edx
	movl	$.LC1, %esi
	movl	$.LC33, %edi
	call	__assert_fail
.L82:
	.loc 1 256 0 is_stmt 1
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -124(%rbp)
	.loc 1 257 0
	cmpl	$0, -124(%rbp)
	je	.L83
	.loc 1 257 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$257, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L83:
	.loc 1 258 0 is_stmt 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L84
	.loc 1 258 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$258, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L84:
.LBE14:
	.loc 1 261 0 is_stmt 1
	movl	$.LC34, %edi
	call	puts
.LBB15:
	.loc 1 263 0
	movl	$1, %r9d
	movl	$1, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movl	$4, %esi
	movl	$3, %edi
	call	newGhostMatrixCheckerboard
	movq	%rax, -8(%rbp)
	.loc 1 264 0
	movl	$0, %edi
	call	getTotalGhostMatrix
	movl	%eax, -120(%rbp)
	.loc 1 265 0
	cmpl	$-1, -120(%rbp)
	je	.L85
	.loc 1 265 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$265, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L85:
	.loc 1 266 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	getTotalGhostMatrix
	movl	%eax, -120(%rbp)
	.loc 1 267 0
	cmpl	$30, -120(%rbp)
	je	.L86
	.loc 1 267 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$267, %edx
	movl	$.LC1, %esi
	movl	$.LC35, %edi
	call	__assert_fail
.L86:
	.loc 1 268 0 is_stmt 1
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -120(%rbp)
	.loc 1 269 0
	cmpl	$0, -120(%rbp)
	je	.L87
	.loc 1 269 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$269, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L87:
	.loc 1 270 0 is_stmt 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L88
	.loc 1 270 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$270, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L88:
.LBE15:
	.loc 1 273 0 is_stmt 1
	movl	$.LC36, %edi
	call	puts
.LBB16:
	.loc 1 275 0
	movl	$1, %r9d
	movl	$1, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movl	$4, %esi
	movl	$3, %edi
	call	newGhostMatrixCheckerboard
	movq	%rax, -8(%rbp)
	.loc 1 276 0
	movl	$0, %edi
	call	getRowsCoreGhostMatrix
	movl	%eax, -116(%rbp)
	.loc 1 277 0
	cmpl	$-1, -116(%rbp)
	je	.L89
	.loc 1 277 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$277, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L89:
	.loc 1 278 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	getRowsCoreGhostMatrix
	movl	%eax, -116(%rbp)
	.loc 1 279 0
	cmpl	$3, -116(%rbp)
	je	.L90
	.loc 1 279 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$279, %edx
	movl	$.LC1, %esi
	movl	$.LC37, %edi
	call	__assert_fail
.L90:
	.loc 1 280 0 is_stmt 1
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -116(%rbp)
	.loc 1 281 0
	cmpl	$0, -116(%rbp)
	je	.L91
	.loc 1 281 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$281, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L91:
	.loc 1 282 0 is_stmt 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L92
	.loc 1 282 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$282, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L92:
.LBE16:
	.loc 1 285 0 is_stmt 1
	movl	$.LC38, %edi
	call	puts
.LBB17:
	.loc 1 287 0
	movl	$1, %r9d
	movl	$1, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movl	$4, %esi
	movl	$3, %edi
	call	newGhostMatrixCheckerboard
	movq	%rax, -8(%rbp)
	.loc 1 288 0
	movl	$0, %edi
	call	getColsCoreGhostMatrix
	movl	%eax, -112(%rbp)
	.loc 1 289 0
	cmpl	$-1, -112(%rbp)
	je	.L93
	.loc 1 289 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$289, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L93:
	.loc 1 290 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	getColsCoreGhostMatrix
	movl	%eax, -112(%rbp)
	.loc 1 291 0
	cmpl	$4, -112(%rbp)
	je	.L94
	.loc 1 291 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$291, %edx
	movl	$.LC1, %esi
	movl	$.LC27, %edi
	call	__assert_fail
.L94:
	.loc 1 292 0 is_stmt 1
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -112(%rbp)
	.loc 1 293 0
	cmpl	$0, -112(%rbp)
	je	.L95
	.loc 1 293 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$293, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L95:
	.loc 1 294 0 is_stmt 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L96
	.loc 1 294 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$294, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L96:
.LBE17:
	.loc 1 297 0 is_stmt 1
	movl	$.LC39, %edi
	call	puts
.LBB18:
	.loc 1 299 0
	movl	$1, %r9d
	movl	$1, %r8d
	movl	$1, %ecx
	movl	$1, %edx
	movl	$4, %esi
	movl	$3, %edi
	call	newGhostMatrixCheckerboard
	movq	%rax, -8(%rbp)
	.loc 1 300 0
	movl	$0, %edi
	call	getTotalCoreGhostMatrix
	movl	%eax, -108(%rbp)
	.loc 1 301 0
	cmpl	$-1, -108(%rbp)
	je	.L97
	.loc 1 301 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$301, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L97:
	.loc 1 302 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	getTotalCoreGhostMatrix
	movl	%eax, -108(%rbp)
	.loc 1 303 0
	cmpl	$12, -108(%rbp)
	je	.L98
	.loc 1 303 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$303, %edx
	movl	$.LC1, %esi
	movl	$.LC40, %edi
	call	__assert_fail
.L98:
	.loc 1 304 0 is_stmt 1
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -108(%rbp)
	.loc 1 305 0
	cmpl	$0, -108(%rbp)
	je	.L99
	.loc 1 305 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$305, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L99:
	.loc 1 306 0 is_stmt 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L100
	.loc 1 306 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$306, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L100:
.LBE18:
	.loc 1 309 0 is_stmt 1
	movl	$.LC41, %edi
	call	puts
.LBB19:
	.loc 1 311 0
	movl	$4, %r9d
	movl	$3, %r8d
	movl	$2, %ecx
	movl	$1, %edx
	movl	$5, %esi
	movl	$5, %edi
	call	newGhostMatrixCheckerboard
	movq	%rax, -8(%rbp)
	.loc 1 312 0
	movl	$0, %edi
	call	getColsWestGhostMatrix
	movl	%eax, -104(%rbp)
	.loc 1 313 0
	cmpl	$-1, -104(%rbp)
	je	.L101
	.loc 1 313 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$313, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L101:
	.loc 1 314 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	getColsWestGhostMatrix
	movl	%eax, -104(%rbp)
	.loc 1 315 0
	cmpl	$4, -104(%rbp)
	je	.L102
	.loc 1 315 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$315, %edx
	movl	$.LC1, %esi
	movl	$.LC27, %edi
	call	__assert_fail
.L102:
	.loc 1 316 0 is_stmt 1
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -104(%rbp)
	.loc 1 317 0
	cmpl	$0, -104(%rbp)
	je	.L103
	.loc 1 317 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$317, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L103:
	.loc 1 318 0 is_stmt 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L104
	.loc 1 318 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$318, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L104:
.LBE19:
	.loc 1 321 0 is_stmt 1
	movl	$.LC42, %edi
	call	puts
.LBB20:
	.loc 1 323 0
	movl	$4, %r9d
	movl	$3, %r8d
	movl	$2, %ecx
	movl	$1, %edx
	movl	$5, %esi
	movl	$5, %edi
	call	newGhostMatrixCheckerboard
	movq	%rax, -8(%rbp)
	.loc 1 324 0
	movl	$0, %edi
	call	getColsEastGhostMatrix
	movl	%eax, -100(%rbp)
	.loc 1 325 0
	cmpl	$-1, -100(%rbp)
	je	.L105
	.loc 1 325 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$325, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L105:
	.loc 1 326 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	getColsEastGhostMatrix
	movl	%eax, -100(%rbp)
	.loc 1 327 0
	cmpl	$3, -100(%rbp)
	je	.L106
	.loc 1 327 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$327, %edx
	movl	$.LC1, %esi
	movl	$.LC37, %edi
	call	__assert_fail
.L106:
	.loc 1 328 0 is_stmt 1
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -100(%rbp)
	.loc 1 329 0
	cmpl	$0, -100(%rbp)
	je	.L107
	.loc 1 329 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$329, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L107:
	.loc 1 330 0 is_stmt 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L108
	.loc 1 330 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$330, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L108:
.LBE20:
	.loc 1 333 0 is_stmt 1
	movl	$.LC43, %edi
	call	puts
.LBB21:
	.loc 1 335 0
	movl	$4, %r9d
	movl	$3, %r8d
	movl	$2, %ecx
	movl	$1, %edx
	movl	$5, %esi
	movl	$5, %edi
	call	newGhostMatrixCheckerboard
	movq	%rax, -8(%rbp)
	.loc 1 336 0
	movl	$0, %edi
	call	getRowsSouthGhostMatrix
	movl	%eax, -96(%rbp)
	.loc 1 337 0
	cmpl	$-1, -96(%rbp)
	je	.L109
	.loc 1 337 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$337, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L109:
	.loc 1 338 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	getRowsSouthGhostMatrix
	movl	%eax, -96(%rbp)
	.loc 1 339 0
	cmpl	$2, -96(%rbp)
	je	.L110
	.loc 1 339 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$339, %edx
	movl	$.LC1, %esi
	movl	$.LC44, %edi
	call	__assert_fail
.L110:
	.loc 1 340 0 is_stmt 1
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -96(%rbp)
	.loc 1 341 0
	cmpl	$0, -96(%rbp)
	je	.L111
	.loc 1 341 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$341, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L111:
	.loc 1 342 0 is_stmt 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L112
	.loc 1 342 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$342, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L112:
.LBE21:
	.loc 1 345 0 is_stmt 1
	movl	$.LC45, %edi
	call	puts
.LBB22:
	.loc 1 347 0
	movl	$4, %r9d
	movl	$3, %r8d
	movl	$2, %ecx
	movl	$1, %edx
	movl	$5, %esi
	movl	$5, %edi
	call	newGhostMatrixCheckerboard
	movq	%rax, -8(%rbp)
	.loc 1 348 0
	movl	$0, %edi
	call	getRowsNorthGhostMatrix
	movl	%eax, -92(%rbp)
	.loc 1 349 0
	cmpl	$-1, -92(%rbp)
	je	.L113
	.loc 1 349 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$349, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L113:
	.loc 1 350 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	getRowsNorthGhostMatrix
	movl	%eax, -92(%rbp)
	.loc 1 351 0
	cmpl	$1, -92(%rbp)
	je	.L114
	.loc 1 351 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$351, %edx
	movl	$.LC1, %esi
	movl	$.LC25, %edi
	call	__assert_fail
.L114:
	.loc 1 352 0 is_stmt 1
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -92(%rbp)
	.loc 1 353 0
	cmpl	$0, -92(%rbp)
	je	.L115
	.loc 1 353 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$353, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L115:
	.loc 1 354 0 is_stmt 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L116
	.loc 1 354 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$354, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L116:
.LBE22:
	.loc 1 357 0 is_stmt 1
	movl	$.LC46, %edi
	call	puts
.LBB23:
	.loc 1 359 0
	movl	$2, %esi
	movl	$3, %edi
	call	newGhostMatrix
	movq	%rax, -8(%rbp)
	.loc 1 360 0
	movl	$1, %edx
	movl	$1, %esi
	movl	$0, %edi
	call	getElemGhostMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -88(%rbp)
	.loc 1 361 0
	movss	.LC47(%rip), %xmm0
	ucomiss	-88(%rbp), %xmm0
	jp	.L236
	movss	.LC47(%rip), %xmm0
	ucomiss	-88(%rbp), %xmm0
	je	.L267
.L236:
	.loc 1 361 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$361, %edx
	movl	$.LC1, %esi
	movl	$.LC48, %edi
	call	__assert_fail
.L267:
	.loc 1 362 0 is_stmt 1
	movq	-8(%rbp), %rax
	movl	$0, %edx
	movl	$-1, %esi
	movq	%rax, %rdi
	call	getElemGhostMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -88(%rbp)
	.loc 1 363 0
	movss	.LC47(%rip), %xmm0
	ucomiss	-88(%rbp), %xmm0
	jp	.L237
	movss	.LC47(%rip), %xmm0
	ucomiss	-88(%rbp), %xmm0
	je	.L268
.L237:
	.loc 1 363 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$363, %edx
	movl	$.LC1, %esi
	movl	$.LC48, %edi
	call	__assert_fail
.L268:
	.loc 1 364 0 is_stmt 1
	movq	-8(%rbp), %rax
	movl	$-1, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	getElemGhostMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -88(%rbp)
	.loc 1 365 0
	movss	.LC47(%rip), %xmm0
	ucomiss	-88(%rbp), %xmm0
	jp	.L238
	movss	.LC47(%rip), %xmm0
	ucomiss	-88(%rbp), %xmm0
	je	.L269
.L238:
	.loc 1 365 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$365, %edx
	movl	$.LC1, %esi
	movl	$.LC48, %edi
	call	__assert_fail
.L269:
	.loc 1 366 0 is_stmt 1
	movq	-8(%rbp), %rax
	movl	$0, %edx
	movl	$3, %esi
	movq	%rax, %rdi
	call	getElemGhostMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -88(%rbp)
	.loc 1 367 0
	movss	.LC47(%rip), %xmm0
	ucomiss	-88(%rbp), %xmm0
	jp	.L239
	movss	.LC47(%rip), %xmm0
	ucomiss	-88(%rbp), %xmm0
	je	.L270
.L239:
	.loc 1 367 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$367, %edx
	movl	$.LC1, %esi
	movl	$.LC48, %edi
	call	__assert_fail
.L270:
	.loc 1 368 0 is_stmt 1
	movq	-8(%rbp), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	getElemGhostMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -88(%rbp)
	.loc 1 369 0
	movss	.LC47(%rip), %xmm0
	ucomiss	-88(%rbp), %xmm0
	jp	.L240
	movss	.LC47(%rip), %xmm0
	ucomiss	-88(%rbp), %xmm0
	je	.L271
.L240:
	.loc 1 369 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$369, %edx
	movl	$.LC1, %esi
	movl	$.LC48, %edi
	call	__assert_fail
.L271:
	.loc 1 370 0 is_stmt 1
	movq	-8(%rbp), %rax
	movl	$1, %edx
	movl	$2, %esi
	movq	%rax, %rdi
	call	getElemGhostMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -88(%rbp)
	.loc 1 371 0
	xorps	%xmm0, %xmm0
	ucomiss	-88(%rbp), %xmm0
	jp	.L241
	xorps	%xmm0, %xmm0
	ucomiss	-88(%rbp), %xmm0
	je	.L272
.L241:
	.loc 1 371 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$371, %edx
	movl	$.LC1, %esi
	movl	$.LC50, %edi
	call	__assert_fail
.L272:
	.loc 1 372 0 is_stmt 1
	movq	-8(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	getElemGhostMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -88(%rbp)
	.loc 1 373 0
	xorps	%xmm0, %xmm0
	ucomiss	-88(%rbp), %xmm0
	jp	.L242
	xorps	%xmm0, %xmm0
	ucomiss	-88(%rbp), %xmm0
	je	.L273
.L242:
	.loc 1 373 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$373, %edx
	movl	$.LC1, %esi
	movl	$.LC50, %edi
	call	__assert_fail
.L273:
	.loc 1 374 0 is_stmt 1
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -84(%rbp)
	.loc 1 375 0
	cmpl	$0, -84(%rbp)
	je	.L131
	.loc 1 375 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$375, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L131:
	.loc 1 376 0 is_stmt 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L132
	.loc 1 376 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$376, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L132:
.LBE23:
	.loc 1 379 0 is_stmt 1
	movl	$.LC51, %edi
	call	puts
.LBB24:
	.loc 1 381 0
	movl	$4, %esi
	movl	$3, %edi
	call	newGhostMatrix
	movq	%rax, -16(%rbp)
	.loc 1 382 0
	movq	-16(%rbp), %rax
	movss	.LC52(%rip), %xmm0
	movq	%rax, %rdi
	call	setAllGhostMatrix
	movl	%eax, -80(%rbp)
	.loc 1 383 0
	cmpl	$0, -80(%rbp)
	je	.L133
	.loc 1 383 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$383, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L133:
.LBB25:
	.loc 1 384 0 is_stmt 1
	movl	$0, -188(%rbp)
	jmp	.L134
.L139:
.LBB26:
	.loc 1 385 0
	movl	$0, -184(%rbp)
	jmp	.L135
.L138:
.LBB27:
	.loc 1 386 0
	movq	-16(%rbp), %rax
	movl	-184(%rbp), %edx
	movl	-188(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	getElemGhostMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -76(%rbp)
	.loc 1 387 0
	movl	.LC52(%rip), %eax
	movl	%eax, -72(%rbp)
	.loc 1 388 0
	movss	-76(%rbp), %xmm0
	ucomiss	-72(%rbp), %xmm0
	jp	.L243
	movss	-76(%rbp), %xmm0
	ucomiss	-72(%rbp), %xmm0
	je	.L274
.L243:
	.loc 1 388 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$388, %edx
	movl	$.LC1, %esi
	movl	$.LC53, %edi
	call	__assert_fail
.L274:
.LBE27:
	.loc 1 385 0 is_stmt 1
	addl	$1, -184(%rbp)
.L135:
	.loc 1 385 0 is_stmt 0 discriminator 1
	cmpl	$3, -184(%rbp)
	jle	.L138
.LBE26:
	.loc 1 384 0 is_stmt 1
	addl	$1, -188(%rbp)
.L134:
	.loc 1 384 0 is_stmt 0 discriminator 1
	cmpl	$2, -188(%rbp)
	jle	.L139
.LBE25:
	.loc 1 391 0 is_stmt 1
	movl	$4, %esi
	movl	$3, %edi
	call	newGhostMatrix
	movq	%rax, -8(%rbp)
	.loc 1 392 0
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %r9
	movq	%rax, %r8
	movl	$3, %ecx
	movl	$0, %edx
	movl	$2, %esi
	movl	$0, %edi
	call	copyGhostMatrix
	movl	%eax, -80(%rbp)
	.loc 1 393 0
	cmpl	$0, -80(%rbp)
	je	.L140
	.loc 1 393 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$393, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L140:
.LBB28:
	.loc 1 394 0 is_stmt 1
	movl	$0, -180(%rbp)
	jmp	.L141
.L146:
.LBB29:
	.loc 1 395 0
	movl	$0, -176(%rbp)
	jmp	.L142
.L145:
.LBB30:
	.loc 1 396 0
	movq	-8(%rbp), %rax
	movl	-176(%rbp), %edx
	movl	-180(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	getElemGhostMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -68(%rbp)
	.loc 1 397 0
	movl	.LC52(%rip), %eax
	movl	%eax, -64(%rbp)
	.loc 1 398 0
	movss	-68(%rbp), %xmm0
	ucomiss	-64(%rbp), %xmm0
	jp	.L244
	movss	-68(%rbp), %xmm0
	ucomiss	-64(%rbp), %xmm0
	je	.L275
.L244:
	.loc 1 398 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$398, %edx
	movl	$.LC1, %esi
	movl	$.LC53, %edi
	call	__assert_fail
.L275:
.LBE30:
	.loc 1 395 0 is_stmt 1
	addl	$1, -176(%rbp)
.L142:
	.loc 1 395 0 is_stmt 0 discriminator 1
	cmpl	$3, -176(%rbp)
	jle	.L145
.LBE29:
	.loc 1 394 0 is_stmt 1
	addl	$1, -180(%rbp)
.L141:
	.loc 1 394 0 is_stmt 0 discriminator 1
	cmpl	$2, -180(%rbp)
	jle	.L146
.LBE28:
	.loc 1 401 0 is_stmt 1
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %r9
	movq	%rax, %r8
	movl	$3, %ecx
	movl	$0, %edx
	movl	$2, %esi
	movl	$-1, %edi
	call	copyGhostMatrix
	movl	%eax, -80(%rbp)
	.loc 1 402 0
	cmpl	$-1, -80(%rbp)
	je	.L147
	.loc 1 402 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$402, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L147:
	.loc 1 403 0 is_stmt 1
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %r9
	movq	%rax, %r8
	movl	$3, %ecx
	movl	$0, %edx
	movl	$1, %esi
	movl	$2, %edi
	call	copyGhostMatrix
	movl	%eax, -80(%rbp)
	.loc 1 404 0
	cmpl	$-1, -80(%rbp)
	je	.L148
	.loc 1 404 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$404, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L148:
	.loc 1 405 0 is_stmt 1
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %r9
	movq	%rax, %r8
	movl	$3, %ecx
	movl	$0, %edx
	movl	$3, %esi
	movl	$0, %edi
	call	copyGhostMatrix
	movl	%eax, -80(%rbp)
	.loc 1 406 0
	cmpl	$-1, -80(%rbp)
	je	.L149
	.loc 1 406 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$406, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L149:
	.loc 1 407 0 is_stmt 1
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %r9
	movq	%rax, %r8
	movl	$3, %ecx
	movl	$-1, %edx
	movl	$2, %esi
	movl	$0, %edi
	call	copyGhostMatrix
	movl	%eax, -80(%rbp)
	.loc 1 408 0
	cmpl	$-1, -80(%rbp)
	je	.L150
	.loc 1 408 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$408, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L150:
	.loc 1 409 0 is_stmt 1
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %r9
	movq	%rax, %r8
	movl	$4, %ecx
	movl	$0, %edx
	movl	$2, %esi
	movl	$0, %edi
	call	copyGhostMatrix
	movl	%eax, -80(%rbp)
	.loc 1 410 0
	cmpl	$-1, -80(%rbp)
	je	.L151
	.loc 1 410 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$410, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L151:
	.loc 1 411 0 is_stmt 1
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %r9
	movq	%rax, %r8
	movl	$1, %ecx
	movl	$2, %edx
	movl	$2, %esi
	movl	$0, %edi
	call	copyGhostMatrix
	movl	%eax, -80(%rbp)
	.loc 1 412 0
	cmpl	$-1, -80(%rbp)
	je	.L152
	.loc 1 412 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$412, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L152:
	.loc 1 413 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %r9
	movl	$0, %r8d
	movl	$3, %ecx
	movl	$0, %edx
	movl	$2, %esi
	movl	$0, %edi
	call	copyGhostMatrix
	movl	%eax, -80(%rbp)
	.loc 1 414 0
	cmpl	$-1, -80(%rbp)
	je	.L153
	.loc 1 414 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$414, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L153:
	.loc 1 415 0 is_stmt 1
	movq	-16(%rbp), %rax
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$3, %ecx
	movl	$0, %edx
	movl	$2, %esi
	movl	$0, %edi
	call	copyGhostMatrix
	movl	%eax, -80(%rbp)
	.loc 1 416 0
	cmpl	$-1, -80(%rbp)
	je	.L154
	.loc 1 416 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$416, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L154:
	.loc 1 417 0 is_stmt 1
	leaq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -80(%rbp)
	.loc 1 418 0
	cmpl	$0, -80(%rbp)
	je	.L155
	.loc 1 418 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$418, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L155:
	.loc 1 419 0 is_stmt 1
	movq	-16(%rbp), %rax
	testq	%rax, %rax
	je	.L156
	.loc 1 419 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$419, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L156:
	.loc 1 420 0 is_stmt 1
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -80(%rbp)
	.loc 1 421 0
	cmpl	$0, -80(%rbp)
	je	.L157
	.loc 1 421 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$421, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L157:
	.loc 1 422 0 is_stmt 1
	movq	-16(%rbp), %rax
	testq	%rax, %rax
	je	.L158
	.loc 1 422 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$422, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L158:
.LBE24:
	.loc 1 425 0 is_stmt 1
	movl	$.LC54, %edi
	call	puts
.LBB31:
	.loc 1 427 0
	movl	$4, %r9d
	movl	$3, %r8d
	movl	$2, %ecx
	movl	$1, %edx
	movl	$5, %esi
	movl	$5, %edi
	call	newGhostMatrixCheckerboard
	movq	%rax, -8(%rbp)
	.loc 1 428 0
	movq	-8(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	getElemCoreGhostMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -60(%rbp)
	.loc 1 429 0
	movl	.LC49(%rip), %eax
	movl	%eax, -56(%rbp)
	.loc 1 430 0
	movss	-60(%rbp), %xmm0
	ucomiss	-56(%rbp), %xmm0
	jp	.L245
	movss	-60(%rbp), %xmm0
	ucomiss	-56(%rbp), %xmm0
	je	.L276
.L245:
	.loc 1 430 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$430, %edx
	movl	$.LC1, %esi
	movl	$.LC53, %edi
	call	__assert_fail
.L276:
	.loc 1 431 0 is_stmt 1
	movq	-8(%rbp), %rax
	movl	$4, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	getElemCoreGhostMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -60(%rbp)
	.loc 1 432 0
	movss	-60(%rbp), %xmm0
	ucomiss	-56(%rbp), %xmm0
	jp	.L246
	movss	-60(%rbp), %xmm0
	ucomiss	-56(%rbp), %xmm0
	je	.L277
.L246:
	.loc 1 432 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$432, %edx
	movl	$.LC1, %esi
	movl	$.LC53, %edi
	call	__assert_fail
.L277:
	.loc 1 433 0 is_stmt 1
	movl	.LC47(%rip), %eax
	movl	%eax, -56(%rbp)
	.loc 1 434 0
	movl	$0, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	getElemCoreGhostMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -60(%rbp)
	.loc 1 435 0
	movss	-60(%rbp), %xmm0
	ucomiss	-56(%rbp), %xmm0
	jp	.L247
	movss	-60(%rbp), %xmm0
	ucomiss	-56(%rbp), %xmm0
	je	.L278
.L247:
	.loc 1 435 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$435, %edx
	movl	$.LC1, %esi
	movl	$.LC53, %edi
	call	__assert_fail
.L278:
	.loc 1 436 0 is_stmt 1
	movq	-8(%rbp), %rax
	movl	$0, %edx
	movl	$-1, %esi
	movq	%rax, %rdi
	call	getElemCoreGhostMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -60(%rbp)
	.loc 1 437 0
	movss	-60(%rbp), %xmm0
	ucomiss	-56(%rbp), %xmm0
	jp	.L248
	movss	-60(%rbp), %xmm0
	ucomiss	-56(%rbp), %xmm0
	je	.L279
.L248:
	.loc 1 437 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$437, %edx
	movl	$.LC1, %esi
	movl	$.LC53, %edi
	call	__assert_fail
.L279:
	.loc 1 438 0 is_stmt 1
	movq	-8(%rbp), %rax
	movl	$0, %edx
	movl	$5, %esi
	movq	%rax, %rdi
	call	getElemCoreGhostMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -60(%rbp)
	.loc 1 439 0
	movss	-60(%rbp), %xmm0
	ucomiss	-56(%rbp), %xmm0
	jp	.L249
	movss	-60(%rbp), %xmm0
	ucomiss	-56(%rbp), %xmm0
	je	.L280
.L249:
	.loc 1 439 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$439, %edx
	movl	$.LC1, %esi
	movl	$.LC53, %edi
	call	__assert_fail
.L280:
	.loc 1 440 0 is_stmt 1
	movq	-8(%rbp), %rax
	movl	$-1, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	getElemCoreGhostMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -60(%rbp)
	.loc 1 441 0
	movss	-60(%rbp), %xmm0
	ucomiss	-56(%rbp), %xmm0
	jp	.L250
	movss	-60(%rbp), %xmm0
	ucomiss	-56(%rbp), %xmm0
	je	.L281
.L250:
	.loc 1 441 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$441, %edx
	movl	$.LC1, %esi
	movl	$.LC53, %edi
	call	__assert_fail
.L281:
	.loc 1 442 0 is_stmt 1
	movq	-8(%rbp), %rax
	movl	$5, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	getElemCoreGhostMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -60(%rbp)
	.loc 1 443 0
	movss	-60(%rbp), %xmm0
	ucomiss	-56(%rbp), %xmm0
	jp	.L251
	movss	-60(%rbp), %xmm0
	ucomiss	-56(%rbp), %xmm0
	je	.L282
.L251:
	.loc 1 443 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$443, %edx
	movl	$.LC1, %esi
	movl	$.LC53, %edi
	call	__assert_fail
.L282:
	.loc 1 444 0 is_stmt 1
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -52(%rbp)
	.loc 1 445 0
	cmpl	$0, -52(%rbp)
	je	.L173
	.loc 1 445 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$445, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L173:
	.loc 1 446 0 is_stmt 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L174
	.loc 1 446 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$446, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L174:
.LBE31:
	.loc 1 449 0 is_stmt 1
	movl	$.LC55, %edi
	call	puts
.LBB32:
	.loc 1 451 0
	movl	$4, %r9d
	movl	$3, %r8d
	movl	$2, %ecx
	movl	$1, %edx
	movl	$5, %esi
	movl	$5, %edi
	call	newGhostMatrixCheckerboard
	movq	%rax, -8(%rbp)
	.loc 1 452 0
	movq	-8(%rbp), %rax
	movss	.LC56(%rip), %xmm0
	movq	%rax, %rdi
	call	setAllGhostMatrix
	movl	%eax, -48(%rbp)
	.loc 1 453 0
	cmpl	$0, -48(%rbp)
	je	.L175
	.loc 1 453 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$453, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L175:
	.loc 1 454 0 is_stmt 1
	movl	$0, %edi
	call	sumAllCoreMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -44(%rbp)
	.loc 1 455 0
	movss	.LC47(%rip), %xmm0
	ucomiss	-44(%rbp), %xmm0
	jp	.L252
	movss	.LC47(%rip), %xmm0
	ucomiss	-44(%rbp), %xmm0
	je	.L283
.L252:
	.loc 1 455 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$455, %edx
	movl	$.LC1, %esi
	movl	$.LC48, %edi
	call	__assert_fail
.L283:
	.loc 1 456 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	sumAllCoreMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -44(%rbp)
	.loc 1 457 0
	movss	-44(%rbp), %xmm0
	cvtps2pd	%xmm0, %xmm0
	movl	$.LC57, %edi
	movl	$1, %eax
	call	printf
	.loc 1 458 0
	movss	-44(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cmpl	$25, %eax
	je	.L178
	.loc 1 458 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$458, %edx
	movl	$.LC1, %esi
	movl	$.LC58, %edi
	call	__assert_fail
.L178:
	.loc 1 459 0 is_stmt 1
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -48(%rbp)
	.loc 1 460 0
	cmpl	$0, -48(%rbp)
	je	.L179
	.loc 1 460 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$460, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L179:
	.loc 1 461 0 is_stmt 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L180
	.loc 1 461 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$461, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L180:
.LBE32:
	.loc 1 464 0 is_stmt 1
	movl	$.LC59, %edi
	call	puts
.LBB33:
	.loc 1 466 0
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$1, %edx
	movl	$2, %esi
	movl	$2, %edi
	call	newGhostMatrixCheckerboard
	movq	%rax, -8(%rbp)
	.loc 1 467 0
	movss	.LC60(%rip), %xmm0
	movl	$0, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	setElemNorthGhostMatrix
	movl	%eax, -40(%rbp)
	.loc 1 468 0
	cmpl	$-1, -40(%rbp)
	je	.L181
	.loc 1 468 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$468, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L181:
	.loc 1 469 0 is_stmt 1
	movq	-8(%rbp), %rax
	movss	.LC61(%rip), %xmm0
	movl	$0, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	setElemNorthGhostMatrix
	movl	%eax, -40(%rbp)
	.loc 1 470 0
	cmpl	$-1, -40(%rbp)
	je	.L182
	.loc 1 470 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$470, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L182:
	.loc 1 471 0 is_stmt 1
	movq	-8(%rbp), %rax
	movss	.LC62(%rip), %xmm0
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	setElemNorthGhostMatrix
	movl	%eax, -40(%rbp)
	.loc 1 472 0
	cmpl	$-1, -40(%rbp)
	je	.L183
	.loc 1 472 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$472, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L183:
	.loc 1 473 0 is_stmt 1
	movq	-8(%rbp), %rax
	movss	.LC63(%rip), %xmm0
	movl	$1, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	setElemNorthGhostMatrix
	movl	%eax, -40(%rbp)
	.loc 1 474 0
	cmpl	$0, -40(%rbp)
	je	.L184
	.loc 1 474 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$474, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L184:
	.loc 1 475 0 is_stmt 1
	movq	-8(%rbp), %rax
	movss	.LC64(%rip), %xmm0
	movl	$0, %edx
	movl	$-1, %esi
	movq	%rax, %rdi
	call	setElemNorthGhostMatrix
	movl	%eax, -40(%rbp)
	.loc 1 476 0
	cmpl	$-1, -40(%rbp)
	je	.L185
	.loc 1 476 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$476, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L185:
	.loc 1 477 0 is_stmt 1
	movq	-8(%rbp), %rax
	movss	.LC65(%rip), %xmm0
	movl	$-1, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	setElemNorthGhostMatrix
	movl	%eax, -40(%rbp)
	.loc 1 478 0
	cmpl	$-1, -40(%rbp)
	je	.L186
	.loc 1 478 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$478, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L186:
	.loc 1 479 0 is_stmt 1
	movq	-8(%rbp), %rax
	movss	.LC66(%rip), %xmm0
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	setElemNorthGhostMatrix
	movl	%eax, -40(%rbp)
	.loc 1 480 0
	cmpl	$0, -40(%rbp)
	je	.L187
	.loc 1 480 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$480, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L187:
	.loc 1 481 0 is_stmt 1
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -40(%rbp)
	.loc 1 482 0
	cmpl	$0, -40(%rbp)
	je	.L188
	.loc 1 482 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$482, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L188:
	.loc 1 483 0 is_stmt 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L189
	.loc 1 483 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$483, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L189:
.LBE33:
	.loc 1 486 0 is_stmt 1
	movl	$.LC67, %edi
	call	puts
.LBB34:
	.loc 1 488 0
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$1, %edx
	movl	$2, %esi
	movl	$2, %edi
	call	newGhostMatrixCheckerboard
	movq	%rax, -8(%rbp)
	.loc 1 489 0
	movl	$0, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	getElemNorthGhostMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -36(%rbp)
	.loc 1 490 0
	movss	.LC47(%rip), %xmm0
	ucomiss	-36(%rbp), %xmm0
	jp	.L253
	movss	.LC47(%rip), %xmm0
	ucomiss	-36(%rbp), %xmm0
	je	.L284
.L253:
	.loc 1 490 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$490, %edx
	movl	$.LC1, %esi
	movl	$.LC48, %edi
	call	__assert_fail
.L284:
	.loc 1 491 0 is_stmt 1
	movq	-8(%rbp), %rax
	movl	$0, %edx
	movl	$-1, %esi
	movq	%rax, %rdi
	call	getElemNorthGhostMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -36(%rbp)
	.loc 1 492 0
	movss	.LC47(%rip), %xmm0
	ucomiss	-36(%rbp), %xmm0
	jp	.L254
	movss	.LC47(%rip), %xmm0
	ucomiss	-36(%rbp), %xmm0
	je	.L285
.L254:
	.loc 1 492 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$492, %edx
	movl	$.LC1, %esi
	movl	$.LC48, %edi
	call	__assert_fail
.L285:
	.loc 1 493 0 is_stmt 1
	movq	-8(%rbp), %rax
	movl	$-1, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	getElemNorthGhostMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -36(%rbp)
	.loc 1 494 0
	movss	.LC47(%rip), %xmm0
	ucomiss	-36(%rbp), %xmm0
	jp	.L255
	movss	.LC47(%rip), %xmm0
	ucomiss	-36(%rbp), %xmm0
	je	.L286
.L255:
	.loc 1 494 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$494, %edx
	movl	$.LC1, %esi
	movl	$.LC48, %edi
	call	__assert_fail
.L286:
	.loc 1 495 0 is_stmt 1
	movq	-8(%rbp), %rax
	movl	$0, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	getElemNorthGhostMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -36(%rbp)
	.loc 1 496 0
	movss	.LC47(%rip), %xmm0
	ucomiss	-36(%rbp), %xmm0
	jp	.L256
	movss	.LC47(%rip), %xmm0
	ucomiss	-36(%rbp), %xmm0
	je	.L287
.L256:
	.loc 1 496 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$496, %edx
	movl	$.LC1, %esi
	movl	$.LC68, %edi
	call	__assert_fail
.L287:
	.loc 1 497 0 is_stmt 1
	movq	-8(%rbp), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	getElemNorthGhostMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -36(%rbp)
	.loc 1 498 0
	movss	.LC47(%rip), %xmm0
	ucomiss	-36(%rbp), %xmm0
	jp	.L257
	movss	.LC47(%rip), %xmm0
	ucomiss	-36(%rbp), %xmm0
	je	.L288
.L257:
	.loc 1 498 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$498, %edx
	movl	$.LC1, %esi
	movl	$.LC48, %edi
	call	__assert_fail
.L288:
	.loc 1 499 0 is_stmt 1
	movq	-8(%rbp), %rax
	movss	.LC63(%rip), %xmm0
	movl	$1, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	setElemNorthGhostMatrix
	movl	%eax, -32(%rbp)
	.loc 1 500 0
	cmpl	$0, -32(%rbp)
	je	.L200
	.loc 1 500 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$500, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L200:
	.loc 1 501 0 is_stmt 1
	movq	-8(%rbp), %rax
	movl	$1, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	getElemNorthGhostMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -36(%rbp)
	.loc 1 502 0
	movss	-36(%rbp), %xmm0
	ucomiss	.LC63(%rip), %xmm0
	jp	.L258
	movss	-36(%rbp), %xmm0
	ucomiss	.LC63(%rip), %xmm0
	je	.L289
.L258:
	.loc 1 502 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$502, %edx
	movl	$.LC1, %esi
	movl	$.LC69, %edi
	call	__assert_fail
.L289:
	.loc 1 503 0 is_stmt 1
	movq	-8(%rbp), %rax
	movss	.LC66(%rip), %xmm0
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	setElemNorthGhostMatrix
	movl	%eax, -32(%rbp)
	.loc 1 504 0
	cmpl	$0, -32(%rbp)
	je	.L203
	.loc 1 504 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$504, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L203:
	.loc 1 505 0 is_stmt 1
	movq	-8(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	getElemNorthGhostMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -36(%rbp)
	.loc 1 506 0
	movss	-36(%rbp), %xmm0
	ucomiss	.LC66(%rip), %xmm0
	jp	.L259
	movss	-36(%rbp), %xmm0
	ucomiss	.LC66(%rip), %xmm0
	je	.L290
.L259:
	.loc 1 506 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$506, %edx
	movl	$.LC1, %esi
	movl	$.LC70, %edi
	call	__assert_fail
.L290:
	.loc 1 507 0 is_stmt 1
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -32(%rbp)
	.loc 1 508 0
	cmpl	$0, -32(%rbp)
	je	.L206
	.loc 1 508 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$508, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L206:
	.loc 1 509 0 is_stmt 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L207
	.loc 1 509 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$509, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L207:
.LBE34:
	.loc 1 512 0 is_stmt 1
	movl	$.LC71, %edi
	call	puts
.LBB35:
	.loc 1 514 0
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$0, %edx
	movl	$2, %esi
	movl	$2, %edi
	call	newGhostMatrixCheckerboard
	movq	%rax, -8(%rbp)
	.loc 1 515 0
	movss	.LC60(%rip), %xmm0
	movl	$0, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	setElemSouthGhostMatrix
	movl	%eax, -28(%rbp)
	.loc 1 516 0
	cmpl	$-1, -28(%rbp)
	je	.L208
	.loc 1 516 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$516, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L208:
	.loc 1 517 0 is_stmt 1
	movq	-8(%rbp), %rax
	movss	.LC61(%rip), %xmm0
	movl	$0, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	setElemSouthGhostMatrix
	movl	%eax, -28(%rbp)
	.loc 1 518 0
	cmpl	$-1, -28(%rbp)
	je	.L209
	.loc 1 518 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$518, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L209:
	.loc 1 519 0 is_stmt 1
	movq	-8(%rbp), %rax
	movss	.LC62(%rip), %xmm0
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	setElemSouthGhostMatrix
	movl	%eax, -28(%rbp)
	.loc 1 520 0
	cmpl	$-1, -28(%rbp)
	je	.L210
	.loc 1 520 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$520, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L210:
	.loc 1 521 0 is_stmt 1
	movq	-8(%rbp), %rax
	movss	.LC63(%rip), %xmm0
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	setElemSouthGhostMatrix
	movl	%eax, -28(%rbp)
	.loc 1 522 0
	cmpl	$0, -28(%rbp)
	je	.L211
	.loc 1 522 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$522, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L211:
	.loc 1 523 0 is_stmt 1
	movq	-8(%rbp), %rax
	movss	.LC64(%rip), %xmm0
	movl	$0, %edx
	movl	$-1, %esi
	movq	%rax, %rdi
	call	setElemSouthGhostMatrix
	movl	%eax, -28(%rbp)
	.loc 1 524 0
	cmpl	$-1, -28(%rbp)
	je	.L212
	.loc 1 524 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$524, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L212:
	.loc 1 525 0 is_stmt 1
	movq	-8(%rbp), %rax
	movss	.LC65(%rip), %xmm0
	movl	$-1, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	setElemSouthGhostMatrix
	movl	%eax, -28(%rbp)
	.loc 1 526 0
	cmpl	$-1, -28(%rbp)
	je	.L213
	.loc 1 526 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$526, %edx
	movl	$.LC1, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L213:
	.loc 1 527 0 is_stmt 1
	movq	-8(%rbp), %rax
	movss	.LC66(%rip), %xmm0
	movl	$1, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	setElemSouthGhostMatrix
	movl	%eax, -28(%rbp)
	.loc 1 528 0
	cmpl	$0, -28(%rbp)
	je	.L214
	.loc 1 528 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$528, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L214:
	.loc 1 529 0 is_stmt 1
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -28(%rbp)
	.loc 1 530 0
	cmpl	$0, -28(%rbp)
	je	.L215
	.loc 1 530 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$530, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L215:
	.loc 1 531 0 is_stmt 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L216
	.loc 1 531 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$531, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L216:
.LBE35:
	.loc 1 534 0 is_stmt 1
	movl	$.LC72, %edi
	call	puts
.LBB36:
	.loc 1 536 0
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$1, %ecx
	movl	$0, %edx
	movl	$2, %esi
	movl	$2, %edi
	call	newGhostMatrixCheckerboard
	movq	%rax, -8(%rbp)
	.loc 1 537 0
	movl	$0, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	getElemSouthGhostMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -24(%rbp)
	.loc 1 538 0
	movss	.LC47(%rip), %xmm0
	ucomiss	-24(%rbp), %xmm0
	jp	.L260
	movss	.LC47(%rip), %xmm0
	ucomiss	-24(%rbp), %xmm0
	je	.L291
.L260:
	.loc 1 538 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$538, %edx
	movl	$.LC1, %esi
	movl	$.LC48, %edi
	call	__assert_fail
.L291:
	.loc 1 539 0 is_stmt 1
	movq	-8(%rbp), %rax
	movl	$0, %edx
	movl	$-1, %esi
	movq	%rax, %rdi
	call	getElemSouthGhostMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -24(%rbp)
	.loc 1 540 0
	movss	.LC47(%rip), %xmm0
	ucomiss	-24(%rbp), %xmm0
	jp	.L261
	movss	.LC47(%rip), %xmm0
	ucomiss	-24(%rbp), %xmm0
	je	.L292
.L261:
	.loc 1 540 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$540, %edx
	movl	$.LC1, %esi
	movl	$.LC48, %edi
	call	__assert_fail
.L292:
	.loc 1 541 0 is_stmt 1
	movq	-8(%rbp), %rax
	movl	$-1, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	getElemSouthGhostMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -24(%rbp)
	.loc 1 542 0
	movss	.LC47(%rip), %xmm0
	ucomiss	-24(%rbp), %xmm0
	jp	.L262
	movss	.LC47(%rip), %xmm0
	ucomiss	-24(%rbp), %xmm0
	je	.L293
.L262:
	.loc 1 542 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$542, %edx
	movl	$.LC1, %esi
	movl	$.LC48, %edi
	call	__assert_fail
.L293:
	.loc 1 543 0 is_stmt 1
	movq	-8(%rbp), %rax
	movl	$0, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	getElemSouthGhostMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -24(%rbp)
	.loc 1 544 0
	movss	.LC47(%rip), %xmm0
	ucomiss	-24(%rbp), %xmm0
	jp	.L263
	movss	.LC47(%rip), %xmm0
	ucomiss	-24(%rbp), %xmm0
	je	.L294
.L263:
	.loc 1 544 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$544, %edx
	movl	$.LC1, %esi
	movl	$.LC68, %edi
	call	__assert_fail
.L294:
	.loc 1 545 0 is_stmt 1
	movq	-8(%rbp), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	getElemSouthGhostMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -24(%rbp)
	.loc 1 546 0
	movss	.LC47(%rip), %xmm0
	ucomiss	-24(%rbp), %xmm0
	jp	.L264
	movss	.LC47(%rip), %xmm0
	ucomiss	-24(%rbp), %xmm0
	je	.L295
.L264:
	.loc 1 546 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$546, %edx
	movl	$.LC1, %esi
	movl	$.LC48, %edi
	call	__assert_fail
.L295:
	.loc 1 547 0 is_stmt 1
	movq	-8(%rbp), %rax
	movss	.LC63(%rip), %xmm0
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	setElemSouthGhostMatrix
	movl	%eax, -20(%rbp)
	.loc 1 548 0
	cmpl	$0, -20(%rbp)
	je	.L227
	.loc 1 548 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$548, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L227:
	.loc 1 549 0 is_stmt 1
	movq	-8(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	getElemSouthGhostMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -24(%rbp)
	.loc 1 550 0
	movss	-24(%rbp), %xmm0
	ucomiss	.LC63(%rip), %xmm0
	jp	.L265
	movss	-24(%rbp), %xmm0
	ucomiss	.LC63(%rip), %xmm0
	je	.L296
.L265:
	.loc 1 550 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$550, %edx
	movl	$.LC1, %esi
	movl	$.LC69, %edi
	call	__assert_fail
.L296:
	.loc 1 551 0 is_stmt 1
	movq	-8(%rbp), %rax
	movss	.LC66(%rip), %xmm0
	movl	$1, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	setElemSouthGhostMatrix
	movl	%eax, -20(%rbp)
	.loc 1 552 0
	cmpl	$0, -20(%rbp)
	je	.L230
	.loc 1 552 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$552, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L230:
	.loc 1 553 0 is_stmt 1
	movq	-8(%rbp), %rax
	movl	$1, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	getElemSouthGhostMatrix
	movss	%xmm0, -196(%rbp)
	movl	-196(%rbp), %eax
	movl	%eax, -24(%rbp)
	.loc 1 554 0
	movss	-24(%rbp), %xmm0
	ucomiss	.LC66(%rip), %xmm0
	jp	.L266
	movss	-24(%rbp), %xmm0
	ucomiss	.LC66(%rip), %xmm0
	je	.L297
.L266:
	.loc 1 554 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$554, %edx
	movl	$.LC1, %esi
	movl	$.LC70, %edi
	call	__assert_fail
.L297:
	.loc 1 555 0 is_stmt 1
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteGhostMatrix
	movl	%eax, -20(%rbp)
	.loc 1 556 0
	cmpl	$0, -20(%rbp)
	je	.L233
	.loc 1 556 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$556, %edx
	movl	$.LC1, %esi
	movl	$.LC6, %edi
	call	__assert_fail
.L233:
	.loc 1 557 0 is_stmt 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L234
	.loc 1 557 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2175, %ecx
	movl	$557, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L234:
.LBE36:
	.loc 1 642 0 is_stmt 1
	movl	$0, %eax
	.loc 1 643 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.type	__PRETTY_FUNCTION__.2175, @object
	.size	__PRETTY_FUNCTION__.2175, 5
__PRETTY_FUNCTION__.2175:
	.string	"main"
	.align 4
.LC19:
	.long	1073741824
	.align 4
.LC21:
	.long	1077936128
	.align 4
.LC22:
	.long	1080033280
	.align 4
.LC47:
	.long	3212836864
	.align 4
.LC49:
	.long	0
	.align 4
.LC52:
	.long	1066192077
	.align 4
.LC56:
	.long	1065353216
	.align 4
.LC60:
	.long	1101686374
	.align 4
.LC61:
	.long	1102997094
	.align 4
.LC62:
	.long	1120141312
	.align 4
.LC63:
	.long	1088421888
	.align 4
.LC64:
	.long	1113063424
	.align 4
.LC65:
	.long	1109917696
	.align 4
.LC66:
	.long	1118306304
	.text
.Letext0:
	.file 2 "mpi_ghost_matrix.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x7f3
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF15
	.byte	0x1
	.long	.LASF16
	.long	.LASF17
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF1
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF2
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF3
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF5
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF8
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF9
	.uleb128 0x4
	.long	.LASF18
	.byte	0x2
	.byte	0x28
	.long	0x85
	.uleb128 0x5
	.long	.LASF19
	.uleb128 0x6
	.long	.LASF20
	.byte	0x1
	.byte	0x21
	.long	0x34
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.long	0x7d4
	.uleb128 0x7
	.long	.LASF21
	.long	0x7e4
	.uleb128 0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.2175
	.uleb128 0x8
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.long	0xf0
	.uleb128 0x9
	.long	.LASF10
	.byte	0x1
	.byte	0x25
	.long	0x7e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.string	"rv"
	.byte	0x1
	.byte	0x2c
	.long	0x34
	.uleb128 0x3
	.byte	0x91
	.sleb128 -188
	.byte	0
	.uleb128 0x8
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.long	0x122
	.uleb128 0x9
	.long	.LASF10
	.byte	0x1
	.byte	0x3a
	.long	0x7e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.string	"rv"
	.byte	0x1
	.byte	0x46
	.long	0x34
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
	.byte	0
	.uleb128 0x8
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.long	0x154
	.uleb128 0x9
	.long	.LASF11
	.byte	0x1
	.byte	0x65
	.long	0x7e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.string	"rv"
	.byte	0x1
	.byte	0x73
	.long	0x34
	.uleb128 0x3
	.byte	0x91
	.sleb128 -180
	.byte	0
	.uleb128 0x8
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.long	0x186
	.uleb128 0x9
	.long	.LASF10
	.byte	0x1
	.byte	0x7c
	.long	0x7e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.string	"rv"
	.byte	0x1
	.byte	0x7d
	.long	0x34
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.byte	0
	.uleb128 0x8
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.long	0x1b8
	.uleb128 0x9
	.long	.LASF10
	.byte	0x1
	.byte	0x89
	.long	0x7e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.string	"rv"
	.byte	0x1
	.byte	0x8c
	.long	0x34
	.uleb128 0x3
	.byte	0x91
	.sleb128 -172
	.byte	0
	.uleb128 0x8
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.long	0x1ea
	.uleb128 0x9
	.long	.LASF10
	.byte	0x1
	.byte	0x9c
	.long	0x7e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.string	"rv"
	.byte	0x1
	.byte	0x9f
	.long	0x34
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.byte	0
	.uleb128 0x8
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.long	0x21c
	.uleb128 0x9
	.long	.LASF10
	.byte	0x1
	.byte	0xac
	.long	0x7e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.string	"rv"
	.byte	0x1
	.byte	0xaf
	.long	0x34
	.uleb128 0x3
	.byte	0x91
	.sleb128 -164
	.byte	0
	.uleb128 0x8
	.quad	.LBB9
	.quad	.LBE9-.LBB9
	.long	0x24e
	.uleb128 0x9
	.long	.LASF10
	.byte	0x1
	.byte	0xbf
	.long	0x7e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.string	"rv"
	.byte	0x1
	.byte	0xc0
	.long	0x34
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.byte	0
	.uleb128 0x8
	.quad	.LBB10
	.quad	.LBE10-.LBB10
	.long	0x280
	.uleb128 0x9
	.long	.LASF10
	.byte	0x1
	.byte	0xcb
	.long	0x7e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.string	"rv"
	.byte	0x1
	.byte	0xcc
	.long	0x34
	.uleb128 0x3
	.byte	0x91
	.sleb128 -156
	.byte	0
	.uleb128 0x8
	.quad	.LBB11
	.quad	.LBE11-.LBB11
	.long	0x2b2
	.uleb128 0x9
	.long	.LASF10
	.byte	0x1
	.byte	0xd7
	.long	0x7e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.string	"rv"
	.byte	0x1
	.byte	0xd8
	.long	0x34
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.byte	0
	.uleb128 0x8
	.quad	.LBB12
	.quad	.LBE12-.LBB12
	.long	0x2e4
	.uleb128 0x9
	.long	.LASF10
	.byte	0x1
	.byte	0xe3
	.long	0x7e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.string	"rv"
	.byte	0x1
	.byte	0xe4
	.long	0x34
	.uleb128 0x3
	.byte	0x91
	.sleb128 -148
	.byte	0
	.uleb128 0x8
	.quad	.LBB13
	.quad	.LBE13-.LBB13
	.long	0x316
	.uleb128 0x9
	.long	.LASF10
	.byte	0x1
	.byte	0xef
	.long	0x7e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.string	"rv"
	.byte	0x1
	.byte	0xf0
	.long	0x34
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.byte	0
	.uleb128 0x8
	.quad	.LBB14
	.quad	.LBE14-.LBB14
	.long	0x348
	.uleb128 0x9
	.long	.LASF10
	.byte	0x1
	.byte	0xfb
	.long	0x7e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.string	"rv"
	.byte	0x1
	.byte	0xfc
	.long	0x34
	.uleb128 0x3
	.byte	0x91
	.sleb128 -140
	.byte	0
	.uleb128 0x8
	.quad	.LBB15
	.quad	.LBE15-.LBB15
	.long	0x37c
	.uleb128 0xb
	.long	.LASF10
	.byte	0x1
	.value	0x107
	.long	0x7e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.string	"rv"
	.byte	0x1
	.value	0x108
	.long	0x34
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.byte	0
	.uleb128 0x8
	.quad	.LBB16
	.quad	.LBE16-.LBB16
	.long	0x3b0
	.uleb128 0xb
	.long	.LASF10
	.byte	0x1
	.value	0x113
	.long	0x7e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.string	"rv"
	.byte	0x1
	.value	0x114
	.long	0x34
	.uleb128 0x3
	.byte	0x91
	.sleb128 -132
	.byte	0
	.uleb128 0x8
	.quad	.LBB17
	.quad	.LBE17-.LBB17
	.long	0x3e4
	.uleb128 0xb
	.long	.LASF10
	.byte	0x1
	.value	0x11f
	.long	0x7e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.string	"rv"
	.byte	0x1
	.value	0x120
	.long	0x34
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.byte	0
	.uleb128 0x8
	.quad	.LBB18
	.quad	.LBE18-.LBB18
	.long	0x418
	.uleb128 0xb
	.long	.LASF10
	.byte	0x1
	.value	0x12b
	.long	0x7e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.string	"rv"
	.byte	0x1
	.value	0x12c
	.long	0x34
	.uleb128 0x3
	.byte	0x91
	.sleb128 -124
	.byte	0
	.uleb128 0x8
	.quad	.LBB19
	.quad	.LBE19-.LBB19
	.long	0x44c
	.uleb128 0xb
	.long	.LASF10
	.byte	0x1
	.value	0x137
	.long	0x7e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.string	"rv"
	.byte	0x1
	.value	0x138
	.long	0x34
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.byte	0
	.uleb128 0x8
	.quad	.LBB20
	.quad	.LBE20-.LBB20
	.long	0x480
	.uleb128 0xb
	.long	.LASF10
	.byte	0x1
	.value	0x143
	.long	0x7e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.string	"rv"
	.byte	0x1
	.value	0x144
	.long	0x34
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.byte	0
	.uleb128 0x8
	.quad	.LBB21
	.quad	.LBE21-.LBB21
	.long	0x4b4
	.uleb128 0xb
	.long	.LASF10
	.byte	0x1
	.value	0x14f
	.long	0x7e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.string	"rv"
	.byte	0x1
	.value	0x150
	.long	0x34
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.byte	0
	.uleb128 0x8
	.quad	.LBB22
	.quad	.LBE22-.LBB22
	.long	0x4e8
	.uleb128 0xb
	.long	.LASF10
	.byte	0x1
	.value	0x15b
	.long	0x7e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.string	"rv"
	.byte	0x1
	.value	0x15c
	.long	0x34
	.uleb128 0x3
	.byte	0x91
	.sleb128 -108
	.byte	0
	.uleb128 0x8
	.quad	.LBB23
	.quad	.LBE23-.LBB23
	.long	0x52c
	.uleb128 0xb
	.long	.LASF10
	.byte	0x1
	.value	0x167
	.long	0x7e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.string	"rvf"
	.byte	0x1
	.value	0x168
	.long	0x7ef
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0xc
	.string	"rv"
	.byte	0x1
	.value	0x176
	.long	0x34
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.byte	0
	.uleb128 0x8
	.quad	.LBB24
	.quad	.LBE24-.LBB24
	.long	0x657
	.uleb128 0xb
	.long	.LASF10
	.byte	0x1
	.value	0x17d
	.long	0x7e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xc
	.string	"rv"
	.byte	0x1
	.value	0x17e
	.long	0x34
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0xb
	.long	.LASF12
	.byte	0x1
	.value	0x187
	.long	0x7e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x8
	.quad	.LBB25
	.quad	.LBE25-.LBB25
	.long	0x5e4
	.uleb128 0xc
	.string	"r"
	.byte	0x1
	.value	0x180
	.long	0x34
	.uleb128 0x3
	.byte	0x91
	.sleb128 -204
	.uleb128 0xd
	.quad	.LBB26
	.quad	.LBE26-.LBB26
	.uleb128 0xc
	.string	"c"
	.byte	0x1
	.value	0x181
	.long	0x34
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0xd
	.quad	.LBB27
	.quad	.LBE27-.LBB27
	.uleb128 0xc
	.string	"rvf"
	.byte	0x1
	.value	0x182
	.long	0x7ef
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0xb
	.long	.LASF13
	.byte	0x1
	.value	0x183
	.long	0x7ef
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xd
	.quad	.LBB28
	.quad	.LBE28-.LBB28
	.uleb128 0xc
	.string	"r"
	.byte	0x1
	.value	0x18a
	.long	0x34
	.uleb128 0x3
	.byte	0x91
	.sleb128 -196
	.uleb128 0xd
	.quad	.LBB29
	.quad	.LBE29-.LBB29
	.uleb128 0xc
	.string	"c"
	.byte	0x1
	.value	0x18b
	.long	0x34
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.uleb128 0xd
	.quad	.LBB30
	.quad	.LBE30-.LBB30
	.uleb128 0xc
	.string	"rvf"
	.byte	0x1
	.value	0x18c
	.long	0x7ef
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0xb
	.long	.LASF13
	.byte	0x1
	.value	0x18d
	.long	0x7ef
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x8
	.quad	.LBB31
	.quad	.LBE31-.LBB31
	.long	0x6ab
	.uleb128 0xb
	.long	.LASF10
	.byte	0x1
	.value	0x1ab
	.long	0x7e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.string	"rvf"
	.byte	0x1
	.value	0x1ac
	.long	0x7ef
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0xb
	.long	.LASF13
	.byte	0x1
	.value	0x1ad
	.long	0x7ef
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0xc
	.string	"rv"
	.byte	0x1
	.value	0x1bc
	.long	0x34
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.byte	0
	.uleb128 0x8
	.quad	.LBB32
	.quad	.LBE32-.LBB32
	.long	0x6ed
	.uleb128 0xb
	.long	.LASF10
	.byte	0x1
	.value	0x1c3
	.long	0x7e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.string	"rv"
	.byte	0x1
	.value	0x1c4
	.long	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0xc
	.string	"rvf"
	.byte	0x1
	.value	0x1c6
	.long	0x7ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.byte	0
	.uleb128 0x8
	.quad	.LBB33
	.quad	.LBE33-.LBB33
	.long	0x720
	.uleb128 0xb
	.long	.LASF10
	.byte	0x1
	.value	0x1d2
	.long	0x7e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.string	"rv"
	.byte	0x1
	.value	0x1d3
	.long	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x8
	.quad	.LBB34
	.quad	.LBE34-.LBB34
	.long	0x762
	.uleb128 0xb
	.long	.LASF10
	.byte	0x1
	.value	0x1e8
	.long	0x7e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.string	"rvf"
	.byte	0x1
	.value	0x1e9
	.long	0x7ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0xc
	.string	"rv"
	.byte	0x1
	.value	0x1f3
	.long	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x8
	.quad	.LBB35
	.quad	.LBE35-.LBB35
	.long	0x795
	.uleb128 0xb
	.long	.LASF10
	.byte	0x1
	.value	0x202
	.long	0x7e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.string	"rv"
	.byte	0x1
	.value	0x203
	.long	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.uleb128 0xd
	.quad	.LBB36
	.quad	.LBE36-.LBB36
	.uleb128 0xb
	.long	.LASF10
	.byte	0x1
	.value	0x218
	.long	0x7e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.string	"rvf"
	.byte	0x1
	.value	0x219
	.long	0x7ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xc
	.string	"rv"
	.byte	0x1
	.value	0x223
	.long	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.byte	0
	.uleb128 0xe
	.long	0x73
	.long	0x7e4
	.uleb128 0xf
	.long	0x6c
	.byte	0x4
	.byte	0
	.uleb128 0x10
	.long	0x7d4
	.uleb128 0x11
	.byte	0x8
	.long	0x7a
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF14
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF2:
	.string	"long long int"
.LASF21:
	.string	"__PRETTY_FUNCTION__"
.LASF19:
	.string	"_ghost_matrix"
.LASF13:
	.string	"temp"
.LASF18:
	.string	"ghost_matrix"
.LASF15:
	.string	"GNU C 4.8.4 -mtune=generic -march=x86-64 -g -std=c99 -fstack-protector"
.LASF0:
	.string	"long unsigned int"
.LASF17:
	.string	"/mnt/d/jbrown/Documents/Code/C_Code/C_MPI_Ghost_Matrix/C_MPI_Ghost_Matrix"
.LASF4:
	.string	"short unsigned int"
.LASF9:
	.string	"char"
.LASF3:
	.string	"unsigned char"
.LASF20:
	.string	"main"
.LASF1:
	.string	"long int"
.LASF5:
	.string	"unsigned int"
.LASF10:
	.string	"gmat"
.LASF6:
	.string	"signed char"
.LASF11:
	.string	"checker"
.LASF16:
	.string	"test_mpi_ghost_matrix.c"
.LASF12:
	.string	"gmat2"
.LASF14:
	.string	"float"
.LASF7:
	.string	"short int"
.LASF8:
	.string	"sizetype"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
