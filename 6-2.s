reverse:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, %r12		#*s
	movq	%rsi, %r13		#len
	movq	%r13, %rax
	subl	$1, %eax
	movq	%rax, %r14		#counter
	movq	$0, %r15
	jmp	.L7
.L8:
	movq	%r15, %rax
	movslq	%eax, %rdx
	movq	%r12, %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movq	%rax, %rbx
	movq	%r14, %rax
	movslq	%eax, %rdx
	movq	%r12, %rax
	addq	%rdx, %rax
	movq	%r15, %rdx
	movslq	%edx, %rcx
	movq	%r12, %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	movq	%r14, %rax
	movslq	%eax, %rdx
	movq	%r12, %rax
	addq	%rax, %rdx
	movzbl	%bl, %eax
	movb	%al, (%rdx)
	subq	$1, %r14
	addq	$1, %r15
.L7:
	movq	%r13, %rax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	cmpq	%rax, %r15
	jl	.L8
	nop
	movq	%rbp, %rsp
	popq	%rbx
	popq	%r15
	popq	%r14
	popq	%r13
	popq	%r12
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
