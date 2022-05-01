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

## TAC_PRINT
	leaq	_STRING_0_Valor_de_c_a_b___(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_VAR_1_c_a_b(%rip), %eax
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
	leaq	_STRING_3_Valor_de_c_a_b___(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_VAR_4_c_a_b(%rip), %eax
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
	leaq	_STRING_5_Valor_de_a___(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_VAR_6_a(%rip), %eax
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
	leaq	_STRING_7_Valor_de_i___(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_VAR_8_i(%rip), %eax
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
	leaq	_STRING_9_Valor_de_y_y_a_b_0____(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_ACC_VEC
	movl	_INT_0(%rip), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	_VEC_11_y_y_a_b(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, _TEMP_0(%rip)

## TAC_PRINT
	movl	_TEMP_0(%rip), %eax
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
	leaq	_STRING_12_Valor_de_y_y_a_b_1____(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_ACC_VEC
	movl	_INT_1(%rip), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	_VEC_11_y_y_a_b(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, _TEMP_1(%rip)

## TAC_PRINT
	movl	_TEMP_1(%rip), %eax
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
	leaq	_STRING_14_Valor_de_y_y_a_b_2____(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_ACC_VEC
	movl	_INT_2(%rip), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	_VEC_11_y_y_a_b(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, _TEMP_2(%rip)

## TAC_PRINT
	movl	_TEMP_2(%rip), %eax
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
	leaq	_STRING_16_Valor_de_y_y_a_b_3____(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_ACC_VEC
	movl	_INT_3(%rip), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	_VEC_11_y_y_a_b(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, _TEMP_3(%rip)

## TAC_PRINT
	movl	_TEMP_3(%rip), %eax
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
	leaq	_STRING_18_Valor_de_y_y_a_b_4____(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_ACC_VEC
	movl	_INT_4(%rip), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	_VEC_11_y_y_a_b(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, _TEMP_4(%rip)

## TAC_PRINT
	movl	_TEMP_4(%rip), %eax
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
	leaq	_STRING_20_Valor_de_y_y_a_b_0____(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_ACC_VEC
	movl	_INT_0(%rip), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	_VEC_21_y_y_a_b(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, _TEMP_5(%rip)

## TAC_PRINT
	movl	_TEMP_5(%rip), %eax
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
	leaq	_STRING_22_Valor_de_y_y_a_b_1____(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_ACC_VEC
	movl	_INT_1(%rip), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	_VEC_21_y_y_a_b(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, _TEMP_6(%rip)

## TAC_PRINT
	movl	_TEMP_6(%rip), %eax
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
	leaq	_STRING_23_Valor_de_y_y_a_b_2____(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_ACC_VEC
	movl	_INT_2(%rip), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	_VEC_21_y_y_a_b(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, _TEMP_7(%rip)

## TAC_PRINT
	movl	_TEMP_7(%rip), %eax
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
	leaq	_STRING_24_Valor_de_f_um___(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_VAR_25_f_um(%rip), %eax
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
	leaq	_STRING_26_Valor_de_f_dois___(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_VAR_27_f_dois(%rip), %eax
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
	leaq	_STRING_28_uma_string_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_2__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_29_uma_string_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	leaq	_STRING_2__n_(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_READ
	leaq	_TEMP_8(%rip), %rsi
	leaq	.scanintstr(%rip), %rdi
	movl	$0, %eax
	call   __isoc99_scanf@PLT

## TAC_COPY
	movl	_TEMP_8(%rip), %eax
	movl	%eax, _VAR_6_a(%rip)

## TAC_PRINT
	leaq	_STRING_30_Valor_lido___(%rip), %rsi
	leaq	.printstringstr(%rip), %rdi
	movl	$0, %eax
	call   printf@PLT

## TAC_PRINT
	movl	_VAR_6_a(%rip), %eax
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
_VAR_27_f_dois:
	.long	33
_STRING_30_Valor_lido___:
	.string	"Valor lido: "
_INT_0:
	.long	0
_INT_1:
	.long	1
_INT_2:
	.long	2
_INT_3:
	.long	3
_STRING_28_uma_string_:
	.string	"uma_string"
_INT_4:
	.long	4
_INT_5:
	.long	5
_STRING_22_Valor_de_y_y_a_b_1____:
	.string	"Valor de y_y-a-b[1]: "
_TEMP_3:
	.long	0
_VAR_6_a:
	.long	65
_VAR_8_i:
	.long	1
_TEMP_7:
	.long	0
_STRING_18_Valor_de_y_y_a_b_4____:
	.string	"Valor de y-y-a-b[4]: "
_VAR_1_c_a_b:
	.long	120
_STRING_5_Valor_de_a___:
	.string	"Valor de a: "
_STRING_16_Valor_de_y_y_a_b_3____:
	.string	"Valor de y-y-a-b[3]: "
_STRING_14_Valor_de_y_y_a_b_2____:
	.string	"Valor de y-y-a-b[2]: "
_TEMP_0:
	.long	0
_TEMP_4:
	.long	0
_STRING_12_Valor_de_y_y_a_b_1____:
	.string	"Valor de y-y-a-b[1]: "
_TEMP_8:
	.long	0
_CHAR_32_b_:
	.long	98
_VEC_11_y_y_a_b:
	.long	97
	.long	0
	.long	3
	.long	0
	.long	98
_STRING_20_Valor_de_y_y_a_b_0____:
	.string	"Valor de y_y-a-b[0]: "
_STRING_9_Valor_de_y_y_a_b_0____:
	.string	"Valor de y-y-a-b[0]: "
_VAR_25_f_um:
	.long	0
_STRING_26_Valor_de_f_dois___:
	.string	"Valor de f_dois: "
_STRING_24_Valor_de_f_um___:
	.string	"Valor de f_um: "
_STRING_0_Valor_de_c_a_b___:
	.string	"Valor de c_a_b: "
_TEMP_1:
	.long	0
_INT_100:
	.long	100
_TEMP_5:
	.long	0
_VEC_21_y_y_a_b:
	.long	0
	.long	0
	.long	0
_STRING_23_Valor_de_y_y_a_b_2____:
	.string	"Valor de y_y-a-b[2]: "
_STRING_3_Valor_de_c_a_b___:
	.string	"Valor de c-a-b: "
_STRING_29_uma_string_:
	.string	"uma string"
_CHAR_34_A_:
	.long	65
_CHAR_35_x_:
	.long	120
_CHAR_36_a_:
	.long	97
_STRING_2__n_:
	.string	"\n"
_TEMP_2:
	.long	0
_VAR_4_c_a_b:
	.long	100
_TEMP_6:
	.long	0
_STRING_7_Valor_de_i___:
	.string	"Valor de i: "
