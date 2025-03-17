	.file	"C4.c"
	.intel_syntax noprefix
	.text
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	sub	rsp, 40
	.cfi_def_cfa_offset 48
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 24[rsp], rax
	movabs	rax, 478560413000
	lea	rdi, 14[rsp]
	mov	QWORD PTR 14[rsp], rax
	xor	eax, eax
	mov	WORD PTR 22[rsp], ax
	call	puts@PLT
	mov	rax, QWORD PTR 24[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L5
	xor	eax, eax
	add	rsp, 40
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
