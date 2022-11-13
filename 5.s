	.file	"5.c"
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
	movq	%rdi, -24(%rbp)			#go to func int *len
	movq	%rsi, -32(%rbp)			#go to func int *test
	movq	-24(%rbp), %rax
	movl	$0, (%rax)			#*len = 0
	movq	-32(%rbp), %rax
	movl	$0, (%rax)			#*test = 0
	movl	$1, -12(%rbp)
	movl	$1, %edi			#capacit = 1
	call	malloc@PLT
	movq	%rax, -8(%rbp)			#char *s
	call	getchar@PLT
	movb	%al, -13(%rbp)			#char c 
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
	movq	-8(%rbp), %rax		#return *s
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	get_string, .-get_string
	.globl	reverse
	.type	reverse, @function
reverse:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)		#*s
	movl	%esi, -28(%rbp)		#len
	movl	-28(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -8(%rbp)		#counter
	movl	$0, -4(%rbp)
	jmp	.L7
.L8:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -9(%rbp)
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-9(%rbp), %eax
	movb	%al, (%rdx)
	subl	$1, -8(%rbp)
	addl	$1, -4(%rbp)
.L7:
	movl	-28(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	cmpl	%eax, -4(%rbp)
	jl	.L8
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	reverse, .-reverse
	.section	.rodata
.LC0:
	.string	"%s"
.LC1:
	.string	"incorrect input"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-20(%rbp), %rdx		#len to get_string
	leaq	-24(%rbp), %rax		#test to get_string
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_string
	movq	%rax, -16(%rbp)		#return *s from get_string
	movl	-20(%rbp), %eax
	testl	%eax, %eax
	jne	.L10
	movl	-24(%rbp), %edx		#s to reverse
	movq	-16(%rbp), %rax		#len to reverse
	movl	%edx, %esi		
	movq	%rax, %rdi
	call	reverse
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi	#string to printf
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	jmp	.L12
.L10:
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
.L12:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
