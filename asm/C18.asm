	.file	"C18.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	sub	rsp, 1016
	.cfi_def_cfa_offset 1024
	xor	edx, edx
	mov	ecx, 123
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 1000[rsp], rax
	movabs	rax, 478560413000
	lea	rdi, 16[rsp]
	mov	QWORD PTR 8[rsp], rdx
	lea	rsi, .LC0[rip]
	mov	rdx, rsp
	mov	QWORD PTR [rsp], rax
	xor	eax, eax
	rep stosq
	mov	edi, 2
	call	__printf_chk@PLT
	mov	rax, QWORD PTR 1000[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L5
	xor	eax, eax
	add	rsp, 1016
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L5:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
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
