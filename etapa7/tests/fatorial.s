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
	movl	_INT_1(%rip), %eax
	movl	%eax, _VAR_1_cur_fat(%rip)

## TAC_COPY
	movl	_INT_0(%rip), %eax
	movl	%eax, _VAR_3_cur_iter(%rip)

## TAC_LABEL
_LABEL_0:
## TAC_DIF
	movl	_VAR_3_cur_iter(%rip), %edx
	movl	_VAR_4_iter(%rip), %eax
	cmpl	%eax, %edx
	setne	%al
	movzbl	%al, %eax
	movl	%eax, _TEMP_0(%rip)

## TAC_JFALSE
	movl	_TEMP_0(%rip), %eax
	cmpl	$1, %eax
	jne	_LABEL_1

## TAC_COPY_VEC
	movl	_VAR_3_cur_iter(%rip), %edx
	movl	_VAR_1_cur_fat(%rip), %eax
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	leaq	_VEC_5_fat(%rip), %rdx
	movl	%eax, (%rcx,%rdx)

## TAC_ACC_VEC
	movl	_VAR_3_cur_iter(%rip), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	_VEC_5_fat(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, _TEMP_1(%rip)

## TAC_PRINT
	movl	_TEMP_1(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_6__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_ADD
	movl	_VAR_3_cur_iter(%rip), %edx
	movl	_INT_1(%rip), %eax
	addl	%edx, %eax
	movl	%eax, _TEMP_2(%rip)

## TAC_COPY
	movl	_TEMP_2(%rip), %eax
	movl	%eax, _VAR_3_cur_iter(%rip)

## TAC_ADD
	movl	_VAR_3_cur_iter(%rip), %edx
	movl	_INT_1(%rip), %eax
	addl	%edx, %eax
	movl	%eax, _TEMP_3(%rip)

## TAC_MUL
	movl	_VAR_1_cur_fat(%rip), %edx
	movl	_TEMP_3(%rip), %eax
	imull	%edx, %eax
	movl	%eax, _TEMP_4(%rip)

## TAC_COPY
	movl	_TEMP_4(%rip), %eax
	movl	%eax, _VAR_1_cur_fat(%rip)

## TAC_JUMP
	jmp	_LABEL_0

## TAC_LABEL
_LABEL_1:
## TAC_COPY
	movl	_INT_0(%rip), %eax
	movl	%eax, _VAR_3_cur_iter(%rip)

## TAC_LABEL
_LABEL_2:
## TAC_LESS
	movl	_VAR_3_cur_iter(%rip), %edx
	movl	_VAR_4_iter(%rip), %eax
	cmpl	%eax, %edx
	setl	%al
	movzbl	%al, %eax
	movl	%eax, _TEMP_5(%rip)

## TAC_JFALSE
	movl	_TEMP_5(%rip), %eax
	cmpl	$1, %eax
	jne	_LABEL_3

## TAC_PRINT
	leaq	_STRING_7_fat__(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_ADD
	movl	_VAR_3_cur_iter(%rip), %edx
	movl	_INT_1(%rip), %eax
	addl	%edx, %eax
	movl	%eax, _TEMP_6(%rip)

## TAC_PRINT
	movl	_TEMP_6(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_8_____(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_ACC_VEC
	movl	_VAR_3_cur_iter(%rip), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	_VEC_5_fat(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, _TEMP_7(%rip)

## TAC_PRINT
	movl	_TEMP_7(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_6__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_ADD
	movl	_VAR_3_cur_iter(%rip), %edx
	movl	_INT_1(%rip), %eax
	addl	%edx, %eax
	movl	%eax, _TEMP_8(%rip)

## TAC_COPY
	movl	_TEMP_8(%rip), %eax
	movl	%eax, _VAR_3_cur_iter(%rip)

## TAC_JUMP
	jmp	_LABEL_2

## TAC_LABEL
_LABEL_3:
## TAC_ENDFUN
	popq	%rbp
	ret




## DATA
.section .data
_INT_0:
	.long	0
_INT_1:
	.long	1
_STRING_7_fat__:
	.string	"fat("
_TEMP_3:
	.long	0
_TEMP_7:
	.long	0
_STRING_8_____:
	.string	"): "
_TEMP_0:
	.long	0
_TEMP_4:
	.long	0
_TEMP_8:
	.long	0
_INT_10:
	.long	10
_VAR_1_cur_fat:
	.long	0
_VEC_5_fat:
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
_VAR_3_cur_iter:
	.long	0
_TEMP_1:
	.long	0
_TEMP_5:
	.long	0
_VAR_4_iter:
	.long	10
_STRING_6__n_:
	.string	"\n"
_TEMP_2:
	.long	0
_TEMP_6:
	.long	0
