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

## TAC_SUB
	movl	_INT_1(%rip), %edx
	movl	_INT_8(%rip), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, _TEMP_2(%rip)

## TAC_MUL
	movl	_INT_5(%rip), %edx
	movl	_TEMP_2(%rip), %eax
	imull	%edx, %eax
	movl	%eax, _TEMP_3(%rip)

## TAC_DIV
	movl	_TEMP_3(%rip), %eax
	movl   _INT_4(%rip), %ecx
	cltd
	idivl  %ecx
	movl	%eax, _TEMP_4(%rip)

## TAC_ADD
	movl	_TEMP_4(%rip), %edx
	movl	_INT_3(%rip), %eax
	addl	%edx, %eax
	movl	%eax, _TEMP_5(%rip)

## TAC_SUB
	movl	_TEMP_5(%rip), %edx
	movl	_INT_19(%rip), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, _TEMP_6(%rip)

## TAC_DIV
	movl	_INT_17(%rip), %eax
	movl   _INT_2(%rip), %ecx
	cltd
	idivl  %ecx
	movl	%eax, _TEMP_7(%rip)

## TAC_ADD
	movl	_TEMP_6(%rip), %edx
	movl	_TEMP_7(%rip), %eax
	addl	%edx, %eax
	movl	%eax, _TEMP_8(%rip)

## TAC_MUL
	movl	_INT_30(%rip), %edx
	movl	_INT_14(%rip), %eax
	imull	%edx, %eax
	movl	%eax, _TEMP_9(%rip)

## TAC_SUB
	movl	_TEMP_8(%rip), %edx
	movl	_TEMP_9(%rip), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, _TEMP_10(%rip)

## TAC_SUB
	movl	_INT_14(%rip), %edx
	movl	_INT_19(%rip), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, _TEMP_11(%rip)

## TAC_MUL
	movl	_TEMP_11(%rip), %edx
	movl	_INT_20(%rip), %eax
	imull	%edx, %eax
	movl	%eax, _TEMP_12(%rip)

## TAC_DIV
	movl	_TEMP_12(%rip), %eax
	movl   _INT_10(%rip), %ecx
	cltd
	idivl  %ecx
	movl	%eax, _TEMP_13(%rip)

## TAC_ADD
	movl	_TEMP_10(%rip), %edx
	movl	_TEMP_13(%rip), %eax
	addl	%edx, %eax
	movl	%eax, _TEMP_14(%rip)

## TAC_MUL
	movl	_INT_30(%rip), %edx
	movl	_INT_2(%rip), %eax
	imull	%edx, %eax
	movl	%eax, _TEMP_15(%rip)

## TAC_SUB
	movl	_TEMP_14(%rip), %edx
	movl	_TEMP_15(%rip), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, _TEMP_16(%rip)

## TAC_MUL
	movl	_INT_30(%rip), %edx
	movl	_INT_2(%rip), %eax
	imull	%edx, %eax
	movl	%eax, _TEMP_17(%rip)

## TAC_ADD
	movl	_TEMP_16(%rip), %edx
	movl	_TEMP_17(%rip), %eax
	addl	%edx, %eax
	movl	%eax, _TEMP_18(%rip)

## TAC_MUL
	movl	_INT_30(%rip), %edx
	movl	_INT_3(%rip), %eax
	imull	%edx, %eax
	movl	%eax, _TEMP_19(%rip)

## TAC_SUB
	movl	_TEMP_18(%rip), %edx
	movl	_TEMP_19(%rip), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, _TEMP_20(%rip)

## TAC_MUL
	movl	_INT_30(%rip), %edx
	movl	_INT_3(%rip), %eax
	imull	%edx, %eax
	movl	%eax, _TEMP_21(%rip)

## TAC_ADD
	movl	_TEMP_20(%rip), %edx
	movl	_TEMP_21(%rip), %eax
	addl	%edx, %eax
	movl	%eax, _TEMP_22(%rip)

## TAC_MUL
	movl	_INT_30(%rip), %edx
	movl	_INT_4(%rip), %eax
	imull	%edx, %eax
	movl	%eax, _TEMP_23(%rip)

## TAC_ADD
	movl	_TEMP_22(%rip), %edx
	movl	_TEMP_23(%rip), %eax
	addl	%edx, %eax
	movl	%eax, _TEMP_24(%rip)

## TAC_MUL
	movl	_INT_30(%rip), %edx
	movl	_INT_4(%rip), %eax
	imull	%edx, %eax
	movl	%eax, _TEMP_25(%rip)

## TAC_SUB
	movl	_TEMP_24(%rip), %edx
	movl	_TEMP_25(%rip), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, _TEMP_26(%rip)

## TAC_MUL
	movl	_INT_30(%rip), %edx
	movl	_INT_5(%rip), %eax
	imull	%edx, %eax
	movl	%eax, _TEMP_27(%rip)

## TAC_ADD
	movl	_TEMP_26(%rip), %edx
	movl	_TEMP_27(%rip), %eax
	addl	%edx, %eax
	movl	%eax, _TEMP_28(%rip)

## TAC_MUL
	movl	_INT_30(%rip), %edx
	movl	_INT_5(%rip), %eax
	imull	%edx, %eax
	movl	%eax, _TEMP_29(%rip)

## TAC_SUB
	movl	_TEMP_28(%rip), %edx
	movl	_TEMP_29(%rip), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, _TEMP_30(%rip)

## TAC_COPY
	movl	_TEMP_30(%rip), %eax
	movl	%eax, _VAR_16_a(%rip)

## TAC_ADD
	movl	_VAR_3_b(%rip), %edx
	movl	_INT_1(%rip), %eax
	addl	%edx, %eax
	movl	%eax, _TEMP_31(%rip)

## TAC_COPY
	movl	_TEMP_31(%rip), %eax
	movl	%eax, _VAR_3_b(%rip)

## TAC_JUMP
	jmp	_LABEL_0

## TAC_LABEL
_LABEL_1:
## TAC_ADD
	movl	_VAR_0_c(%rip), %edx
	movl	_INT_1(%rip), %eax
	addl	%edx, %eax
	movl	%eax, _TEMP_32(%rip)

## TAC_COPY
	movl	_TEMP_32(%rip), %eax
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
_TEMP_28:
	.long	0
_INT_0:
	.long	0
_INT_1:
	.long	1
_INT_2:
	.long	2
_TEMP_17:
	.long	0
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
_VAR_16_a:
	.long	0
_VAR_3_b:
	.long	0
_VAR_0_c:
	.long	0
_TEMP_7:
	.long	0
_TEMP_21:
	.long	0
_TEMP_12:
	.long	0
_TEMP_27:
	.long	0
_TEMP_19:
	.long	0
_TEMP_20:
	.long	0
_TEMP_14:
	.long	0
_TEMP_0:
	.long	0
_TEMP_26:
	.long	0
_TEMP_4:
	.long	0
_TEMP_8:
	.long	0
_INT_10:
	.long	10
_INT_1000000:
	.long	1000000
_INT_20:
	.long	20
_TEMP_16:
	.long	0
_TEMP_25:
	.long	0
_INT_30:
	.long	30
_TEMP_11:
	.long	0
_TEMP_1:
	.long	0
_INT_14:
	.long	14
_TEMP_5:
	.long	0
_TEMP_30:
	.long	0
_TEMP_18:
	.long	0
_TEMP_9:
	.long	0
_TEMP_24:
	.long	0
_TEMP_31:
	.long	0
_TEMP_13:
	.long	0
_INT_17:
	.long	17
_TEMP_32:
	.long	0
_TEMP_23:
	.long	0
_TEMP_2:
	.long	0
_TEMP_29:
	.long	0
_INT_19:
	.long	19
_TEMP_6:
	.long	0
_TEMP_15:
	.long	0
_TEMP_10:
	.long	0
_TEMP_22:
	.long	0
