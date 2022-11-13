	.file	"4.c"
	.text
	.globl	get_string
	.type	get_string, @function
get_string:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)		#go to func int *len
	movq	%rsi, -32(%rbp)		#go to func int *test
	movq	-24(%rbp), %rax
	movl	$0, (%rax)		#*len = 0
	movq	-32(%rbp), %rax
	movl	$0, (%rax)		#*test = 0
	movl	$1, -12(%rbp)
	movl	$1, %edi		#capacit = 1
	call	malloc@PLT		
	movq	%rax, -8(%rbp)		#char *s
	call	getchar@PLT
	movb	%al, -13(%rbp)		#char c 
	jmp	.L2
.L4:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %ecx
	movq	-24(%rbp), %rdx
	movl	%ecx, (%rdx)
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-13(%rbp), %eax
	movb	%al, (%rdx)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -12(%rbp)
	jg	.L3
	sall	-12(%rbp)
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, -8(%rbp)
.L3:
	call	getchar@PLT
	movb	%al, -13(%rbp)
.L2:
	cmpb	$10, -13(%rbp)
	jne	.L4
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	get_string, .-get_string
	.section	.rodata
.LC0:
	.string	"%s"
.LC1:
	.string	"incorrect input"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-28(%rbp), %rdx		#test
	leaq	-32(%rbp), %rax		#len
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_string
	movq	%rax, -16(%rbp)		#*s
	movl	-32(%rbp), %eax		#counter
	subl	$1, %eax
	movl	%eax, -24(%rbp)
	movl	-28(%rbp), %eax
	testl	%eax, %eax
	jne	.L7
	movl	$0, -20(%rbp)
	jmp	.L8
.L9:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -33(%rbp)
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rcx
	movq	-16(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-33(%rbp), %eax
	movb	%al, (%rdx)
	subl	$1, -24(%rbp)
	addl	$1, -20(%rbp)
.L8:
	movl	-32(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	cmpl	%eax, -20(%rbp)
	jl	.L9
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L11
.L7:
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
.L11:
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L12
	call	__stack_chk_fail@PLT
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
