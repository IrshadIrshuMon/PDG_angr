	.file	"C22.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%c"
.LC1:
	.string	"%s"
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
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	lea	rbp, .LC0[rip]
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	sub	rsp, 120
	.cfi_def_cfa_offset 160
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 104[rsp], rax
	xor	eax, eax
	mov	r13, rsp
	lea	r12, 10[rsp]
	mov	rbx, r13
	.p2align 4,,10
	.p2align 3
.L2:
	mov	rsi, rbx
	mov	rdi, rbp
	xor	eax, eax
	add	rbx, 1
	call	__isoc99_scanf@PLT
	cmp	rbx, r12
	jne	.L2
	xor	eax, eax
	mov	rdx, r13
	mov	edi, 2
	lea	rsi, .LC1[rip]
	call	__printf_chk@PLT
	mov	rax, QWORD PTR 104[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L7
	add	rsp, 120
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
