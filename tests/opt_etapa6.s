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

## TAC_SUB
	movl	_INT_1(%rip), %edx
	movl	_INT_8(%rip), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, _TEMP_0(%rip)

## TAC_MUL
	movl	_INT_5(%rip), %edx
	movl	_TEMP_0(%rip), %eax
	imull	%edx, %eax
	movl	%eax, _TEMP_1(%rip)

## TAC_DIV
	movl	_TEMP_1(%rip), %eax
	movl   _INT_4(%rip), %ecx
	cltd
	idivl  %ecx
	movl	%eax, _TEMP_2(%rip)

## TAC_ADD
	movl	_TEMP_2(%rip), %edx
	movl	_INT_3(%rip), %eax
	addl	%edx, %eax
	movl	%eax, _TEMP_3(%rip)

## TAC_SUB
	movl	_TEMP_3(%rip), %edx
	movl	_INT_19(%rip), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, _TEMP_4(%rip)

## TAC_COPY
	movl	_TEMP_4(%rip), %eax
	movl	%eax, _VAR_6_a(%rip)

## TAC_PRINT
	movl	_VAR_6_a(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_7__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_EQ
	movl	_INT_5(%rip), %edx
	movl	_INT_3(%rip), %eax
	cmpl	%eax, %edx
	sete	%al
	movzbl	%al, %eax
	movl	%eax, _TEMP_5(%rip)

## TAC_PRINT
	movl	_TEMP_5(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_7__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_DIF
	movl	_INT_5(%rip), %edx
	movl	_INT_3(%rip), %eax
	cmpl	%eax, %edx
	setne	%al
	movzbl	%al, %eax
	movl	%eax, _TEMP_6(%rip)

## TAC_PRINT
	movl	_TEMP_6(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_7__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_LE
	movl	_INT_5(%rip), %edx
	movl	_INT_3(%rip), %eax
	cmpl	%eax, %edx
	setle	%al
	movzbl	%al, %eax
	movl	%eax, _TEMP_7(%rip)

## TAC_PRINT
	movl	_TEMP_7(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_7__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_GE
	movl	_INT_5(%rip), %edx
	movl	_INT_3(%rip), %eax
	cmpl	%eax, %edx
	setge	%al
	movzbl	%al, %eax
	movl	%eax, _TEMP_8(%rip)

## TAC_PRINT
	movl	_TEMP_8(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_7__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_LESS
	movl	_INT_5(%rip), %edx
	movl	_INT_3(%rip), %eax
	cmpl	%eax, %edx
	setl	%al
	movzbl	%al, %eax
	movl	%eax, _TEMP_9(%rip)

## TAC_PRINT
	movl	_TEMP_9(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_7__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_GREAT
	movl	_INT_5(%rip), %edx
	movl	_INT_3(%rip), %eax
	cmpl	%eax, %edx
	setg	%al
	movzbl	%al, %eax
	movl	%eax, _TEMP_10(%rip)

## TAC_PRINT
	movl	_TEMP_10(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_7__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_ENDFUN
	popq	%rbp
	ret




## DATA
.section .data
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
_TEMP_3:
	.long	0
_VAR_6_a:
	.long	0
_TEMP_7:
	.long	0
_TEMP_0:
	.long	0
_TEMP_4:
	.long	0
_TEMP_8:
	.long	0
_TEMP_1:
	.long	0
_TEMP_5:
	.long	0
_TEMP_9:
	.long	0
_STRING_7__n_:
	.string	"\n"
_TEMP_2:
	.long	0
_INT_19:
	.long	19
_TEMP_6:
	.long	0
_TEMP_10:
	.long	0
