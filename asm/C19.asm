	.file	"C19.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"%c"
.LC2:
	.string	"%s"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	push	r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	push	r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	lea	r13, .LC0[rip]
	push	r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	lea	r12, .LC1[rip]
	push	rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	push	rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	xor	ebx, ebx
	sub	rsp, 32
	.cfi_def_cfa_offset 80
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 24[rsp], rax
	xor	eax, eax
	lea	r14, 14[rsp]
	mov	rbp, r14
	.p2align 4,,10
	.p2align 3
.L2:
	mov	edx, ebx
	mov	rsi, r13
	mov	edi, 2
	xor	eax, eax
	call	__printf_chk@PLT
	add	ebx, 1
	mov	rsi, rbp
	mov	rdi, r12
	xor	eax, eax
	add	rbp, 1
	call	__isoc99_scanf@PLT
	cmp	ebx, 10
	jne	.L2
	xor	eax, eax
	mov	rdx, r14
	mov	edi, 2
	lea	rsi, .LC2[rip]
	call	__printf_chk@PLT
	mov	rax, QWORD PTR 24[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L7
	add	rsp, 32
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	xor	eax, eax
	pop	rbx
	.cfi_def_cfa_offset 40
	pop	rbp
	.cfi_def_cfa_offset 32
	pop	r12
	.cfi_def_cfa_offset 24
	pop	r13
	.cfi_def_cfa_offset 16
	pop	r14
	.cfi_def_cfa_offset 8
	ret
.L7:
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
