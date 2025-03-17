	.file	"C25.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	lea	r12, .LC0[rip]
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	sub	rsp, 56
	.cfi_def_cfa_offset 96
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 40[rsp], rax
	xor	eax, eax
	mov	rbx, rsp
	lea	r13, 40[rsp]
	mov	rbp, rbx
	.p2align 4,,10
	.p2align 3
.L2:
	mov	rsi, rbp
	mov	rdi, r12
	xor	eax, eax
	add	rbp, 4
	call	__isoc99_scanf@PLT
	cmp	rbp, r13
	jne	.L2
	.p2align 4,,10
	.p2align 3
.L3:
	mov	edx, DWORD PTR [rbx]
	mov	rsi, r12
	mov	edi, 2
	xor	eax, eax
	add	rbx, 4
	call	__printf_chk@PLT
	cmp	rbx, r13
	jne	.L3
	mov	rax, QWORD PTR 40[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L9
	add	rsp, 56
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xor	eax, eax
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	ret
.L9:
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
