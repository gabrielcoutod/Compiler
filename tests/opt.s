## FIXED INIT
.section	.rodata
.printintstr:
.string	"%d"
.scanintstr:
.string    "%d"
.printstringstr:
.string	"%s"
.text


## TAC_BEGFUN
.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp

## TAC_COPY
	movl	_INT__24(%rip), %eax
	movl	%eax, _VAR_1_a(%rip)

## TAC_PRINT
	movl	_VAR_1_a(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_2__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_INT_0(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_2__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_INT_1(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_2__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_INT_0(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_2__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_INT_1(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_2__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_INT_0(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_2__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_INT_1(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_2__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_ENDFUN
	popq	%rbp
	ret




## DATA
.section .data
_INT__24:
	.long	-24
_INT_0:
	.long	0
_INT_1:
	.long	1
_INT_3:
	.long	3
_INT_4:
	.long	4
_INT_5:
	.long	5
_INT_8:
	.long	8
_VAR_1_a:
	.long	0
_INT__5:
	.long	-5
_INT__7:
	.long	-7
_INT__8:
	.long	-8
_INT__35:
	.long	-35
_STRING_2__n_:
	.string	"\n"
_INT_19:
	.long	19
