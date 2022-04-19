	.file	"exemplo.c"
	.text
	.globl	int_um
	.data
	.align 4
	.type	int_um, @object
	.size	int_um, 4
int_um:
	.long	1
	.globl	int_dois
	.align 4
	.type	int_dois, @object
	.size	int_dois, 4
int_dois:
	.long	2
	.globl	int_res
	.align 4
	.type	int_res, @object
	.size	int_res, 4
int_res:
	.long	50
	.globl	um_bool
	.align 4
	.type	um_bool, @object
	.size	um_bool, 4
um_bool:
	.long	97
	.globl	uma_string
	.section	.rodata
.LC0:
	.string	"uma string"
	.section	.data.rel.local,"aw"
	.align 8
	.type	uma_string, @object
	.size	uma_string, 8
uma_string:
	.quad	.LC0
	.globl	um_vec
	.data
	.align 8
	.type	um_vec, @object
	.size	um_vec, 12
um_vec:
	.long	97
	.long	2
	.long	0
	.text
	.globl	sum
	.type	sum, @function
sum:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	int_um(%rip), %edx
	movl	int_dois(%rip), %eax
	addl	%edx, %eax
	movl	%eax, int_res(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	sum, .-sum
	.globl	sub
	.type	sub, @function
sub:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	int_um(%rip), %edx
	movl	int_dois(%rip), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, int_res(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	sub, .-sub
	.globl	div
	.type	div, @function
div:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	int_um(%rip), %eax
	movl	int_dois(%rip), %ecx
	cltd
	idivl	%ecx
	movl	%eax, int_res(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	div, .-div
	.globl	mul
	.type	mul, @function
mul:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	int_um(%rip), %edx
	movl	int_dois(%rip), %eax
	imull	%edx, %eax
	movl	%eax, int_res(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	mul, .-mul
	.globl	not_equal
	.type	not_equal, @function
not_equal:
.LFB4:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	int_um(%rip), %edx
	movl	int_dois(%rip), %eax
	cmpl	%eax, %edx
	setne	%al
	movzbl	%al, %eax
	movl	%eax, int_res(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	not_equal, .-not_equal
	.globl	equal
	.type	equal, @function
equal:
.LFB5:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	int_um(%rip), %edx
	movl	int_dois(%rip), %eax
	cmpl	%eax, %edx
	sete	%al
	movzbl	%al, %eax
	movl	%eax, int_res(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	equal, .-equal
	.globl	great_or_equal
	.type	great_or_equal, @function
great_or_equal:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	int_um(%rip), %edx
	movl	int_dois(%rip), %eax
	cmpl	%eax, %edx
	setge	%al
	movzbl	%al, %eax
	movl	%eax, int_res(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	great_or_equal, .-great_or_equal
	.globl	less_or_equal
	.type	less_or_equal, @function
less_or_equal:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	int_um(%rip), %edx
	movl	int_dois(%rip), %eax
	cmpl	%eax, %edx
	setle	%al
	movzbl	%al, %eax
	movl	%eax, int_res(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	less_or_equal, .-less_or_equal
	.globl	great
	.type	great, @function
great:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	int_um(%rip), %edx
	movl	int_dois(%rip), %eax
	cmpl	%eax, %edx
	setg	%al
	movzbl	%al, %eax
	movl	%eax, int_res(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	great, .-great
	.globl	less
	.type	less, @function
less:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	int_um(%rip), %edx
	movl	int_dois(%rip), %eax
	cmpl	%eax, %edx
	setl	%al
	movzbl	%al, %eax
	movl	%eax, int_res(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	less, .-less
	.globl	copy
	.type	copy, @function
copy:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	int_um(%rip), %eax
	movl	%eax, int_res(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	copy, .-copy
	.globl	jfalse
	.type	jfalse, @function
jfalse:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	um_bool(%rip), %eax
	cmpl	$1, %eax
	jne	.L14
	movl	int_um(%rip), %eax
	movl	%eax, int_res(%rip)
.L14:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	jfalse, .-jfalse
	.globl	jump
	.type	jump, @function
jump:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
.L16:
	jmp	.L16
	.cfi_endproc
.LFE12:
	.size	jump, .-jump
	.globl	copy_vec
	.type	copy_vec, @function
copy_vec:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	int_um(%rip), %edx
	movl	int_dois(%rip), %eax
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	leaq	um_vec(%rip), %rdx
	movl	%eax, (%rcx,%rdx)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	copy_vec, .-copy_vec
	.globl	acc_vec
	.type	acc_vec, @function
acc_vec:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	int_um(%rip), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	um_vec(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, int_res(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	acc_vec, .-acc_vec
	.section	.rodata
.LC1:
	.string	"%s"
	.text
	.globl	print_str
	.type	print_str, @function
print_str:
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	uma_string(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	print_str, .-print_str
	.section	.rodata
.LC2:
	.string	"%d"
	.text
	.globl	print_int
	.type	print_int, @function
print_int:
.LFB16:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	int_um(%rip), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	print_int, .-print_int
	.globl	um_return
	.type	um_return, @function
um_return:
.LFB17:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	int_res(%rip), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	um_return, .-um_return
	.globl	call
	.type	call, @function
call:
.LFB18:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, %eax
	call	um_return
	movl	%eax, int_res(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	call, .-call
	.globl	read
	.type	read, @function
read:
.LFB19:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	int_res(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	read, .-read
	.section	.rodata
.LC3:
	.string	"uma string na main"
	.text
	.globl	main
	.type	main, @function
main:
.LFB20:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	uma_string(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	int_um(%rip), %eax
	movl	int_dois(%rip), %ecx
	cltd
	idivl	%ecx
	movl	%eax, int_um(%rip)
	movl	um_bool(%rip), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	um_vec(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, int_um(%rip)
	movl	$0, um_bool(%rip)
	movl	um_bool(%rip), %edx
	movl	int_res(%rip), %eax
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	leaq	um_vec(%rip), %rdx
	movl	%eax, (%rcx,%rdx)
	movl	um_bool(%rip), %eax
	cmpl	$1, %eax
	jne	.L26
	movl	$5, int_dois(%rip)
.L26:
	leaq	int_um(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC3(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$5, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
