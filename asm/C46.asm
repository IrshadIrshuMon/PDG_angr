	.file	"C46.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	test
	.type	test, @function
test:
.LFB23:
	.cfi_startproc
	endbr64
	mov	QWORD PTR [rdi], 25
	xor	eax, eax
	mov	QWORD PTR 24[rdi], 65
	mov	QWORD PTR 48[rdi], 95
	ret
	.cfi_endproc
.LFE23:
	.size	test, .-test
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	endbr64
	sub	rsp, 8
	.cfi_def_cfa_offset 16
	xor	edx, edx
	lea	rsi, .LC0[rip]
	xor	eax, eax
	mov	edi, 2
	call	__printf_chk@PLT
	xor	eax, eax
	add	rsp, 8
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
