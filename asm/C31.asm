	.file	"C31.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%c"
.LC1:
	.string	"%s"
	.text
	.p2align 4
	.globl	test
	.type	test, @function
test:
.LFB23:
	.cfi_startproc
	endbr64
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	mov	r13, rdi
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	lea	r12, 10[rdi]
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	lea	rbp, .LC0[rip]
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	mov	rbx, rdi
	sub	rsp, 8
	.cfi_def_cfa_offset 48
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
	add	rsp, 8
	.cfi_def_cfa_offset 40
	mov	rdx, r13
	lea	rsi, .LC1[rip]
	xor	eax, eax
	pop	rbx
	.cfi_def_cfa_offset 32
	mov	edi, 2
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	jmp	__printf_chk@PLT
	.cfi_endproc
.LFE23:
	.size	test, .-test
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	endbr64
	sub	rsp, 40
	.cfi_def_cfa_offset 48
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 24[rsp], rax
	xor	eax, eax
	lea	rdi, 14[rsp]
	call	test
	mov	rax, QWORD PTR 24[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L9
	xor	eax, eax
	add	rsp, 40
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L9:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
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
