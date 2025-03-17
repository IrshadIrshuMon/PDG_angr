	.file	"C33.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
	.text
	.p2align 4
	.globl	test
	.type	test, @function
test:
.LFB23:
	.cfi_startproc
	endbr64
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	lea	r12, 40[rdi]
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	lea	rbp, .LC0[rip]
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	mov	rbx, rdi
	.p2align 4,,10
	.p2align 3
.L2:
	mov	rsi, rbx
	mov	rdi, rbp
	xor	eax, eax
	add	rbx, 4
	call	__isoc99_scanf@PLT
	cmp	rbx, r12
	jne	.L2
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
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
	sub	rsp, 56
	.cfi_def_cfa_offset 64
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 40[rsp], rax
	xor	eax, eax
	mov	rdi, rsp
	call	test
	mov	rax, QWORD PTR 40[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L9
	xor	eax, eax
	add	rsp, 56
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
