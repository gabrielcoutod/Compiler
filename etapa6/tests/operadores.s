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
.globl	_FUNCTION_0_add
_FUNCTION_0_add:
	pushq	%rbp
	movq	%rsp, %rbp

## TAC_ADD
	movl	_VAR_1_par_um_add(%rip), %edx
	movl	_VAR_2_par_dois_add(%rip), %eax
	addl	%edx, %eax
	movl	%eax, _TEMP_0(%rip)

## TAC_RET
	movl	_TEMP_0(%rip), %eax
	popq	%rbp
	ret

## TAC_ENDFUN
	popq	%rbp
	ret

## TAC_BEGFUN
.globl	_FUNCTION_3_sub
_FUNCTION_3_sub:
	pushq	%rbp
	movq	%rsp, %rbp

## TAC_SUB
	movl	_VAR_4_par_um_sub(%rip), %edx
	movl	_VAR_5_par_dois_sub(%rip), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, _TEMP_1(%rip)

## TAC_RET
	movl	_TEMP_1(%rip), %eax
	popq	%rbp
	ret

## TAC_ENDFUN
	popq	%rbp
	ret

## TAC_BEGFUN
.globl	_FUNCTION_6_mul
_FUNCTION_6_mul:
	pushq	%rbp
	movq	%rsp, %rbp

## TAC_MUL
	movl	_VAR_7_par_um_mul(%rip), %edx
	movl	_VAR_8_par_dois_mul(%rip), %eax
	imull	%edx, %eax
	movl	%eax, _TEMP_2(%rip)

## TAC_RET
	movl	_TEMP_2(%rip), %eax
	popq	%rbp
	ret

## TAC_ENDFUN
	popq	%rbp
	ret

## TAC_BEGFUN
.globl	_FUNCTION_9_div
_FUNCTION_9_div:
	pushq	%rbp
	movq	%rsp, %rbp

## TAC_DIV
	movl	_VAR_10_par_um_div(%rip), %eax
	movl   _VAR_11_par_dois_div(%rip), %ecx
	cltd
	idivl  %ecx
	movl	%eax, _TEMP_3(%rip)

## TAC_RET
	movl	_TEMP_3(%rip), %eax
	popq	%rbp
	ret

## TAC_ENDFUN
	popq	%rbp
	ret

## TAC_BEGFUN
.globl	_FUNCTION_12_eq
_FUNCTION_12_eq:
	pushq	%rbp
	movq	%rsp, %rbp

## TAC_EQ
	movl	_VAR_13_par_um_eq(%rip), %edx
	movl	_VAR_14_par_dois_eq(%rip), %eax
	cmpl	%eax, %edx
	sete	%al
	movzbl	%al, %eax
	movl	%eax, _TEMP_4(%rip)

## TAC_JFALSE
	movl	_TEMP_4(%rip), %eax
	cmpl	$1, %eax
	jne	_LABEL_0

## TAC_RET
	movl	_INT_1(%rip), %eax
	popq	%rbp
	ret

## TAC_LABEL
_LABEL_0:
## TAC_RET
	movl	_INT_0(%rip), %eax
	popq	%rbp
	ret

## TAC_ENDFUN
	popq	%rbp
	ret

## TAC_BEGFUN
.globl	_FUNCTION_17_neq
_FUNCTION_17_neq:
	pushq	%rbp
	movq	%rsp, %rbp

## TAC_DIF
	movl	_VAR_18_par_um_neq(%rip), %edx
	movl	_VAR_19_par_dois_neq(%rip), %eax
	cmpl	%eax, %edx
	setne	%al
	movzbl	%al, %eax
	movl	%eax, _TEMP_5(%rip)

## TAC_JFALSE
	movl	_TEMP_5(%rip), %eax
	cmpl	$1, %eax
	jne	_LABEL_1

## TAC_RET
	movl	_INT_1(%rip), %eax
	popq	%rbp
	ret

## TAC_JUMP
	jmp	_LABEL_2

## TAC_LABEL
_LABEL_1:
## TAC_RET
	movl	_INT_0(%rip), %eax
	popq	%rbp
	ret

## TAC_LABEL
_LABEL_2:
## TAC_ENDFUN
	popq	%rbp
	ret

## TAC_BEGFUN
.globl	_FUNCTION_20_less
_FUNCTION_20_less:
	pushq	%rbp
	movq	%rsp, %rbp

## TAC_JUMP
	jmp	_LABEL_21_pula_returns

## TAC_LABEL
_LABEL_22_less_return_true:
## TAC_RET
	movl	_INT_1(%rip), %eax
	popq	%rbp
	ret

## TAC_LABEL
_LABEL_23_less_return_false:
## TAC_RET
	movl	_INT_0(%rip), %eax
	popq	%rbp
	ret

## TAC_LABEL
_LABEL_21_pula_returns:
## TAC_LESS
	movl	_VAR_24_par_um_less(%rip), %edx
	movl	_VAR_25_par_dois_less(%rip), %eax
	cmpl	%eax, %edx
	setl	%al
	movzbl	%al, %eax
	movl	%eax, _TEMP_6(%rip)

## TAC_JFALSE
	movl	_TEMP_6(%rip), %eax
	cmpl	$1, %eax
	jne	_LABEL_3

## TAC_RET
	movl	_INT_1(%rip), %eax
	popq	%rbp
	ret

## TAC_JUMP
	jmp	_LABEL_4

## TAC_LABEL
_LABEL_3:
## TAC_RET
	movl	_INT_0(%rip), %eax
	popq	%rbp
	ret

## TAC_LABEL
_LABEL_4:
## TAC_ENDFUN
	popq	%rbp
	ret

## TAC_BEGFUN
.globl	_FUNCTION_26_less_or_equal
_FUNCTION_26_less_or_equal:
	pushq	%rbp
	movq	%rsp, %rbp

## TAC_LE
	movl	_VAR_27_par_um_le(%rip), %edx
	movl	_VAR_28_par_dois_le(%rip), %eax
	cmpl	%eax, %edx
	setle	%al
	movzbl	%al, %eax
	movl	%eax, _TEMP_7(%rip)

## TAC_JFALSE
	movl	_TEMP_7(%rip), %eax
	cmpl	$1, %eax
	jne	_LABEL_5

## TAC_RET
	movl	_INT_1(%rip), %eax
	popq	%rbp
	ret

## TAC_JUMP
	jmp	_LABEL_6

## TAC_LABEL
_LABEL_5:
## TAC_RET
	movl	_INT_0(%rip), %eax
	popq	%rbp
	ret

## TAC_LABEL
_LABEL_6:
## TAC_ENDFUN
	popq	%rbp
	ret

## TAC_BEGFUN
.globl	_FUNCTION_29_great
_FUNCTION_29_great:
	pushq	%rbp
	movq	%rsp, %rbp

## TAC_GREAT
	movl	_VAR_30_par_um_great(%rip), %edx
	movl	_VAR_31_par_dois_great(%rip), %eax
	cmpl	%eax, %edx
	setg	%al
	movzbl	%al, %eax
	movl	%eax, _TEMP_8(%rip)

## TAC_JFALSE
	movl	_TEMP_8(%rip), %eax
	cmpl	$1, %eax
	jne	_LABEL_7

## TAC_RET
	movl	_INT_1(%rip), %eax
	popq	%rbp
	ret

## TAC_JUMP
	jmp	_LABEL_8

## TAC_LABEL
_LABEL_7:
## TAC_RET
	movl	_INT_0(%rip), %eax
	popq	%rbp
	ret

## TAC_LABEL
_LABEL_8:
## TAC_ENDFUN
	popq	%rbp
	ret

## TAC_BEGFUN
.globl	_FUNCTION_32_great_or_equal
_FUNCTION_32_great_or_equal:
	pushq	%rbp
	movq	%rsp, %rbp

## TAC_GE
	movl	_VAR_33_par_um_ge(%rip), %edx
	movl	_VAR_34_par_dois_ge(%rip), %eax
	cmpl	%eax, %edx
	setge	%al
	movzbl	%al, %eax
	movl	%eax, _TEMP_9(%rip)

## TAC_JFALSE
	movl	_TEMP_9(%rip), %eax
	cmpl	$1, %eax
	jne	_LABEL_9

## TAC_RET
	movl	_INT_1(%rip), %eax
	popq	%rbp
	ret

## TAC_JUMP
	jmp	_LABEL_10

## TAC_LABEL
_LABEL_9:
## TAC_RET
	movl	_INT_0(%rip), %eax
	popq	%rbp
	ret

## TAC_LABEL
_LABEL_10:
## TAC_ENDFUN
	popq	%rbp
	ret

## TAC_BEGFUN
.globl	_FUNCTION_35_print_resultados
_FUNCTION_35_print_resultados:
	pushq	%rbp
	movq	%rsp, %rbp

## TAC_PRINT
	leaq	_STRING_36_Resultado_add__(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_VAR_37_a(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_38___(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_VAR_39_b(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_40_____(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_ARG
	movl	_VAR_37_a(%rip), %eax
	movl	%eax, _VAR_1_par_um_add(%rip)

## TAC_ARG
	movl	_VAR_39_b(%rip), %eax
	movl	%eax, _VAR_2_par_dois_add(%rip)

## TAC_CALL
	movl	$0, %eax
	call   _FUNCTION_0_add
	movl	%eax, _TEMP_10(%rip)

## TAC_PRINT
	movl	_TEMP_10(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_41__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_42_Resultado_sub__(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_VAR_37_a(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_38___(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_VAR_39_b(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_40_____(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_ARG
	movl	_VAR_37_a(%rip), %eax
	movl	%eax, _VAR_4_par_um_sub(%rip)

## TAC_ARG
	movl	_VAR_39_b(%rip), %eax
	movl	%eax, _VAR_5_par_dois_sub(%rip)

## TAC_CALL
	movl	$0, %eax
	call   _FUNCTION_3_sub
	movl	%eax, _TEMP_11(%rip)

## TAC_PRINT
	movl	_TEMP_11(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_41__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_43_Resultado_mul__(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_VAR_37_a(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_38___(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_VAR_39_b(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_40_____(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_ARG
	movl	_VAR_37_a(%rip), %eax
	movl	%eax, _VAR_7_par_um_mul(%rip)

## TAC_ARG
	movl	_VAR_39_b(%rip), %eax
	movl	%eax, _VAR_8_par_dois_mul(%rip)

## TAC_CALL
	movl	$0, %eax
	call   _FUNCTION_6_mul
	movl	%eax, _TEMP_12(%rip)

## TAC_PRINT
	movl	_TEMP_12(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_41__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_44_Resultado_div__(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_VAR_37_a(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_38___(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_VAR_39_b(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_40_____(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_ARG
	movl	_VAR_37_a(%rip), %eax
	movl	%eax, _VAR_10_par_um_div(%rip)

## TAC_ARG
	movl	_VAR_39_b(%rip), %eax
	movl	%eax, _VAR_11_par_dois_div(%rip)

## TAC_CALL
	movl	$0, %eax
	call   _FUNCTION_9_div
	movl	%eax, _TEMP_13(%rip)

## TAC_PRINT
	movl	_TEMP_13(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_41__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_45_Resultado_eq__(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_VAR_37_a(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_38___(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_VAR_39_b(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_40_____(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_ARG
	movl	_VAR_37_a(%rip), %eax
	movl	%eax, _VAR_13_par_um_eq(%rip)

## TAC_ARG
	movl	_VAR_39_b(%rip), %eax
	movl	%eax, _VAR_14_par_dois_eq(%rip)

## TAC_CALL
	movl	$0, %eax
	call   _FUNCTION_12_eq
	movl	%eax, _TEMP_14(%rip)

## TAC_PRINT
	movl	_TEMP_14(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_41__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_46_Resultado_neq__(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_VAR_37_a(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_38___(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_VAR_39_b(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_40_____(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_ARG
	movl	_VAR_37_a(%rip), %eax
	movl	%eax, _VAR_18_par_um_neq(%rip)

## TAC_ARG
	movl	_VAR_39_b(%rip), %eax
	movl	%eax, _VAR_19_par_dois_neq(%rip)

## TAC_CALL
	movl	$0, %eax
	call   _FUNCTION_17_neq
	movl	%eax, _TEMP_15(%rip)

## TAC_PRINT
	movl	_TEMP_15(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_41__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_47_Resultado_less__(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_VAR_37_a(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_38___(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_VAR_39_b(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_40_____(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_ARG
	movl	_VAR_37_a(%rip), %eax
	movl	%eax, _VAR_24_par_um_less(%rip)

## TAC_ARG
	movl	_VAR_39_b(%rip), %eax
	movl	%eax, _VAR_25_par_dois_less(%rip)

## TAC_CALL
	movl	$0, %eax
	call   _FUNCTION_20_less
	movl	%eax, _TEMP_16(%rip)

## TAC_PRINT
	movl	_TEMP_16(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_41__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_48_Resultado_less_or_equal__(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_VAR_37_a(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_38___(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_VAR_39_b(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_40_____(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_ARG
	movl	_VAR_37_a(%rip), %eax
	movl	%eax, _VAR_27_par_um_le(%rip)

## TAC_ARG
	movl	_VAR_39_b(%rip), %eax
	movl	%eax, _VAR_28_par_dois_le(%rip)

## TAC_CALL
	movl	$0, %eax
	call   _FUNCTION_26_less_or_equal
	movl	%eax, _TEMP_17(%rip)

## TAC_PRINT
	movl	_TEMP_17(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_41__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_49_Resultado_greater__(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_VAR_37_a(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_38___(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_VAR_39_b(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_40_____(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_ARG
	movl	_VAR_37_a(%rip), %eax
	movl	%eax, _VAR_30_par_um_great(%rip)

## TAC_ARG
	movl	_VAR_39_b(%rip), %eax
	movl	%eax, _VAR_31_par_dois_great(%rip)

## TAC_CALL
	movl	$0, %eax
	call   _FUNCTION_29_great
	movl	%eax, _TEMP_18(%rip)

## TAC_PRINT
	movl	_TEMP_18(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_41__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_50_Resultado_greater_or_equal__(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_VAR_37_a(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_38___(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_VAR_39_b(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_40_____(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_ARG
	movl	_VAR_37_a(%rip), %eax
	movl	%eax, _VAR_33_par_um_ge(%rip)

## TAC_ARG
	movl	_VAR_39_b(%rip), %eax
	movl	%eax, _VAR_34_par_dois_ge(%rip)

## TAC_CALL
	movl	$0, %eax
	call   _FUNCTION_32_great_or_equal
	movl	%eax, _TEMP_19(%rip)

## TAC_PRINT
	movl	_TEMP_19(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_41__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_RET
	movl	_INT_0(%rip), %eax
	popq	%rbp
	ret

## TAC_ENDFUN
	popq	%rbp
	ret

## TAC_BEGFUN
.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp

## TAC_PRINT
	leaq	_STRING_51_Resultados_a_100__b_100___n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_ARG
	movl	_INT_100(%rip), %eax
	movl	%eax, _VAR_37_a(%rip)

## TAC_ARG
	movl	_INT_100(%rip), %eax
	movl	%eax, _VAR_39_b(%rip)

## TAC_CALL
	movl	$0, %eax
	call   _FUNCTION_35_print_resultados
	movl	%eax, _TEMP_20(%rip)

## TAC_PRINT
	movl	_TEMP_20(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_41__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_53_Resultados_a_150__b_5___n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_ARG
	movl	_INT_150(%rip), %eax
	movl	%eax, _VAR_37_a(%rip)

## TAC_ARG
	movl	_INT_5(%rip), %eax
	movl	%eax, _VAR_39_b(%rip)

## TAC_CALL
	movl	$0, %eax
	call   _FUNCTION_35_print_resultados
	movl	%eax, _TEMP_21(%rip)

## TAC_PRINT
	movl	_TEMP_21(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_41__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_56_Resultados_a_30__b_200___n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_ARG
	movl	_INT_30(%rip), %eax
	movl	%eax, _VAR_37_a(%rip)

## TAC_ARG
	movl	_INT_200(%rip), %eax
	movl	%eax, _VAR_39_b(%rip)

## TAC_CALL
	movl	$0, %eax
	call   _FUNCTION_35_print_resultados
	movl	%eax, _TEMP_22(%rip)

## TAC_PRINT
	movl	_TEMP_22(%rip), %eax
	movl	%eax, %esi
	leaq	.printintstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_41__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_ENDFUN
	popq	%rbp
	ret




## DATA
.section .data
_STRING_53_Resultados_a_150__b_5___n_:
	.string	"Resultados(a=150, b=5):\n"
_INT_0:
	.long	0
_INT_1:
	.long	1
_VAR_18_par_um_neq:
	.long	0
_TEMP_17:
	.long	0
_INT_5:
	.long	5
_TEMP_3:
	.long	0
_VAR_37_a:
	.long	0
_VAR_39_b:
	.long	0
_VAR_25_par_dois_less:
	.long	0
_VAR_14_par_dois_eq:
	.long	0
_TEMP_7:
	.long	0
_TEMP_21:
	.long	0
_TEMP_12:
	.long	0
_STRING_40_____:
	.string	"): "
_STRING_51_Resultados_a_100__b_100___n_:
	.string	"Resultados(a=100, b=100):\n"
_VAR_31_par_dois_great:
	.long	0
_STRING_48_Resultado_less_or_equal__:
	.string	"Resultado less or equal("
_STRING_43_Resultado_mul__:
	.string	"Resultado mul("
_STRING_45_Resultado_eq__:
	.string	"Resultado eq("
_TEMP_19:
	.long	0
_STRING_50_Resultado_greater_or_equal__:
	.string	"Resultado greater_or_equal("
_TEMP_20:
	.long	0
_TEMP_14:
	.long	0
_VAR_33_par_um_ge:
	.long	0
_VAR_5_par_dois_sub:
	.long	0
_TEMP_0:
	.long	0
_VAR_2_par_dois_add:
	.long	0
_TEMP_4:
	.long	0
_VAR_30_par_um_great:
	.long	0
_TEMP_8:
	.long	0
_VAR_27_par_um_le:
	.long	0
_TEMP_16:
	.long	0
_VAR_7_par_um_mul:
	.long	0
_INT_30:
	.long	30
_VAR_4_par_um_sub:
	.long	0
_STRING_46_Resultado_neq__:
	.string	"Resultado neq("
_STRING_38___:
	.string	","
_STRING_56_Resultados_a_30__b_200___n_:
	.string	"Resultados(a=30, b=200):\n"
_TEMP_11:
	.long	0
_VAR_19_par_dois_neq:
	.long	0
_TEMP_1:
	.long	0
_VAR_11_par_dois_div:
	.long	0
_INT_100:
	.long	100
_TEMP_5:
	.long	0
_VAR_13_par_um_eq:
	.long	0
_INT_150:
	.long	150
_VAR_34_par_dois_ge:
	.long	0
_TEMP_18:
	.long	0
_TEMP_9:
	.long	0
_VAR_24_par_um_less:
	.long	0
_TEMP_13:
	.long	0
_STRING_47_Resultado_less__:
	.string	"Resultado less("
_VAR_1_par_um_add:
	.long	0
_STRING_41__n_:
	.string	"\n"
_TEMP_2:
	.long	0
_VAR_28_par_dois_le:
	.long	0
_TEMP_6:
	.long	0
_STRING_49_Resultado_greater__:
	.string	"Resultado greater("
_TEMP_15:
	.long	0
_STRING_44_Resultado_div__:
	.string	"Resultado div("
_INT_200:
	.long	200
_STRING_36_Resultado_add__:
	.string	"Resultado add("
_TEMP_10:
	.long	0
_TEMP_22:
	.long	0
_VAR_8_par_dois_mul:
	.long	0
_STRING_42_Resultado_sub__:
	.string	"Resultado sub("
_VAR_10_par_um_div:
	.long	0
