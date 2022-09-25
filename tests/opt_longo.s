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

## TAC_LABEL
_LABEL_2:
## TAC_LESS
	movl	_VAR_0_c(%rip), %edx
	movl	_INT_10(%rip), %eax
	cmpl	%eax, %edx
	setl	%al
	movzbl	%al, %eax
	movl	%eax, _TEMP_0(%rip)

## TAC_JFALSE
	movl	_TEMP_0(%rip), %eax
	cmpl	$1, %eax
	jne	_LABEL_3

## TAC_COPY
	movl	_INT_0(%rip), %eax
	movl	%eax, _VAR_3_b(%rip)

## TAC_LABEL
_LABEL_0:
## TAC_LESS
	movl	_VAR_3_b(%rip), %edx
	movl	_INT_1000000(%rip), %eax
	cmpl	%eax, %edx
	setl	%al
	movzbl	%al, %eax
	movl	%eax, _TEMP_1(%rip)

## TAC_JFALSE
	movl	_TEMP_1(%rip), %eax
	cmpl	$1, %eax
	jne	_LABEL_1

## TAC_COPY
	movl	_INT__446(%rip), %eax
	movl	%eax, _VAR_6_a(%rip)

## TAC_ADD
	movl	_VAR_3_b(%rip), %edx
	movl	_INT_1(%rip), %eax
	addl	%edx, %eax
	movl	%eax, _TEMP_2(%rip)

## TAC_COPY
	movl	_TEMP_2(%rip), %eax
	movl	%eax, _VAR_3_b(%rip)

## TAC_JUMP
	jmp	_LABEL_0

## TAC_LABEL
_LABEL_1:
## TAC_ADD
	movl	_VAR_0_c(%rip), %edx
	movl	_INT_1(%rip), %eax
	addl	%edx, %eax
	movl	%eax, _TEMP_3(%rip)

## TAC_COPY
	movl	_TEMP_3(%rip), %eax
	movl	%eax, _VAR_0_c(%rip)

## TAC_JUMP
	jmp	_LABEL_2

## TAC_LABEL
_LABEL_3:
## TAC_ENDFUN
	popq	%rbp
	ret




## DATA
.section .data
_INT__24:
	.long	-24
_INT__326:
	.long	-326
_INT_0:
	.long	0
_INT_1:
	.long	1
_INT_2:
	.long	2
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
_VAR_3_b:
	.long	0
_VAR_0_c:
	.long	0
_INT__16:
	.long	-16
_INT__100:
	.long	-100
_INT__436:
	.long	-436
_INT__536:
	.long	-536
_TEMP_0:
	.long	0
_INT_10:
	.long	10
_INT_120:
	.long	120
_INT__5:
	.long	-5
_INT_1000000:
	.long	1000000
_INT_20:
	.long	20
_INT_30:
	.long	30
_INT__7:
	.long	-7
_INT__10:
	.long	-10
_TEMP_1:
	.long	0
_INT__8:
	.long	-8
_INT_14:
	.long	14
_INT_150:
	.long	150
_INT_420:
	.long	420
_INT_60:
	.long	60
_INT_17:
	.long	17
_INT__35:
	.long	-35
_INT_90:
	.long	90
_INT__446:
	.long	-446
_TEMP_2:
	.long	0
_INT__296:
	.long	-296
_INT_19:
	.long	19
_INT__506:
	.long	-506
