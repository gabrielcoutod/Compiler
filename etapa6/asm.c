#include "asm.h"
#include "hash.h"
#include "string.h"

void generateAsm(TAC *first){
    FILE *fout;
    TAC *tac;

    fout = fopen("out.s","w");

    // INIT
    fprintf(fout, "## FIXED INIT\n"
            ".section	.rodata\n"
            ".printintstr:\n"
	        ".string	\"%%d\"\n"
	        ".text\n"
            ".scanintstr:\n"
            ".string    \"%%d\"\n"
            ".printstringstr:\n"
	        ".string	\"%%s\"\n"
	        ".text\n\n\n");

    // EACH TAC
    for(tac = first; tac; tac = tac->next){
        switch(tac->type){
            case TAC_ADD: 
                fprintf(fout, "## TAC_ADD\n");
                fprintf(fout, "\tmovl	_%s(%%rip), %%edx\n", hashStringName(tac->op1)->name);
	            fprintf(fout, "\tmovl	_%s(%%rip), %%eax\n", hashStringName(tac->op2)->name);
	            fprintf(fout, "\taddl	%%edx, %%eax\n");
	            fprintf(fout, "\tmovl	%%eax, _%s(%%rip)\n\n", hashStringName(tac->res)->name);
                break;
            case TAC_SUB: 
                fprintf(fout, "## TAC_SUB\n");
                fprintf(fout, "\tmovl	_%s(%%rip), %%edx\n", hashStringName(tac->op1)->name);
	            fprintf(fout, "\tmovl	_%s(%%rip), %%eax\n", hashStringName(tac->op2)->name);
	            fprintf(fout, "\tsubl	%%eax, %%edx\n");
                fprintf(fout, "\tmovl	%%edx, %%eax\n");
	            fprintf(fout, "\tmovl	%%eax, _%s(%%rip)\n\n", hashStringName(tac->res)->name);
                break;
            case TAC_DIV: 
                fprintf(fout, "## TAC_DIV\n");
                fprintf(fout, "\tmovl	_%s(%%rip), %%eax\n", hashStringName(tac->op1)->name);
	            fprintf(fout, "\tmovl   _%s(%%rip), %%ecx\n", hashStringName(tac->op2)->name);
                fprintf(fout, "\tcltd\n");
	            fprintf(fout, "\tidivl  %%ecx\n");
	            fprintf(fout, "\tmovl	%%eax, _%s(%%rip)\n\n", hashStringName(tac->res)->name);
                break;
            case TAC_MUL: 
                fprintf(fout, "## TAC_MUL\n");
                fprintf(fout, "\tmovl	_%s(%%rip), %%edx\n", hashStringName(tac->op1)->name);
	            fprintf(fout, "\tmovl	_%s(%%rip), %%eax\n", hashStringName(tac->op2)->name);
	            fprintf(fout, "\timull	%%edx, %%eax\n");
	            fprintf(fout, "\tmovl	%%eax, _%s(%%rip)\n\n", hashStringName(tac->res)->name);
                break;


            case TAC_DIF: 
                fprintf(fout, "## TAC_DIF\n");
                fprintf(fout, "\tmovl	_%s(%%rip), %%edx\n", hashStringName(tac->op1)->name);
	            fprintf(fout, "\tmovl	_%s(%%rip), %%eax\n", hashStringName(tac->op2)->name);
	            fprintf(fout, "\tcmpl	%%eax, %%edx\n");
                fprintf(fout, "\tsetne	%%al\n");
                fprintf(fout, "\tmovzbl	%%al, %%eax\n");
	            fprintf(fout, "\tmovl	%%eax, _%s(%%rip)\n\n", hashStringName(tac->res)->name);
                break;
            case TAC_EQ: 
                fprintf(fout, "## TAC_EQ\n");
                fprintf(fout, "\tmovl	_%s(%%rip), %%edx\n", hashStringName(tac->op1)->name);
	            fprintf(fout, "\tmovl	_%s(%%rip), %%eax\n", hashStringName(tac->op2)->name);
	            fprintf(fout, "\tcmpl	%%eax, %%edx\n");
                fprintf(fout, "\tsete	%%al\n");
                fprintf(fout, "\tmovzbl	%%al, %%eax\n");
	            fprintf(fout, "\tmovl	%%eax, _%s(%%rip)\n\n", hashStringName(tac->res)->name);
                break;
            case TAC_GE: 
                fprintf(fout, "## TAC_GE\n");
                fprintf(fout, "\tmovl	_%s(%%rip), %%edx\n", hashStringName(tac->op1)->name);
	            fprintf(fout, "\tmovl	_%s(%%rip), %%eax\n", hashStringName(tac->op2)->name);
	            fprintf(fout, "\tcmpl	%%eax, %%edx\n");
                fprintf(fout, "\tsetge	%%al\n");
                fprintf(fout, "\tmovzbl	%%al, %%eax\n");
	            fprintf(fout, "\tmovl	%%eax, _%s(%%rip)\n\n", hashStringName(tac->res)->name);
                break;
            case TAC_LE: 
                fprintf(fout, "## TAC_LE\n");
                fprintf(fout, "\tmovl	_%s(%%rip), %%edx\n", hashStringName(tac->op1)->name);
	            fprintf(fout, "\tmovl	_%s(%%rip), %%eax\n", hashStringName(tac->op2)->name);
	            fprintf(fout, "\tcmpl	%%eax, %%edx\n");
                fprintf(fout, "\tsetle	%%al\n");
                fprintf(fout, "\tmovzbl	%%al, %%eax\n");
	            fprintf(fout, "\tmovl	%%eax, _%s(%%rip)\n\n", hashStringName(tac->res)->name);
                break;
            case TAC_GREAT: 
                fprintf(fout, "## TAC_GREAT\n");
                fprintf(fout, "\tmovl	_%s(%%rip), %%edx\n", hashStringName(tac->op1)->name);
	            fprintf(fout, "\tmovl	_%s(%%rip), %%eax\n", hashStringName(tac->op2)->name);
	            fprintf(fout, "\tcmpl	%%eax, %%edx\n");
                fprintf(fout, "\tsetg	%%al\n");
                fprintf(fout, "\tmovzbl	%%al, %%eax\n");
	            fprintf(fout, "\tmovl	%%eax, _%s(%%rip)\n\n", hashStringName(tac->res)->name);
                break;
            case TAC_LESS: 
                fprintf(fout, "## TAC_LESS\n");
                fprintf(fout, "\tmovl	_%s(%%rip), %%edx\n", hashStringName(tac->op1)->name);
	            fprintf(fout, "\tmovl	_%s(%%rip), %%eax\n", hashStringName(tac->op2)->name);
	            fprintf(fout, "\tcmpl	%%eax, %%edx\n");
                fprintf(fout, "\tsetl	%%al\n");
                fprintf(fout, "\tmovzbl	%%al, %%eax\n");
	            fprintf(fout, "\tmovl	%%eax, _%s(%%rip)\n\n", hashStringName(tac->res)->name);
                break;


            case TAC_COPY: 
                fprintf(fout, "## TAC_COPY\n");
                fprintf(fout, "\tmovl	_%s(%%rip), %%eax\n", hashStringName(tac->op1)->name);
	            fprintf(fout, "\tmovl	%%eax, _%s(%%rip)\n\n", hashStringName(tac->res)->name);
                break;
            case TAC_ARG:
                fprintf(fout, "## TAC_ARG\n");
                fprintf(fout, "\tmovl	_%s(%%rip), %%eax\n", hashStringName(tac->op1)->name);
	            fprintf(fout, "\tmovl	%%eax, _%s(%%rip)\n\n", hashStringName(tac->res)->name);
                break;
            

            case TAC_JFALSE: 
                fprintf(fout, "## TAC_JFALSE\n");
                fprintf(fout, "\tmovl	_%s(%%rip), %%eax\n", hashStringName(tac->op1)->name);
	            fprintf(fout, "\tcmpl	$1, %%eax\n");
                fprintf(fout, "\tjne	_%s\n\n", hashStringName(tac->res)->name);
                break;
            case TAC_JUMP: 
                fprintf(fout, "## TAC_JUMP\n");
                fprintf(fout, "\tjmp	_%s\n\n", hashStringName(tac->res)->name);
                break;


            case TAC_LABEL:
                fprintf(fout, "## TAC_LABEL\n");
                fprintf(fout, "_%s:\n", hashStringName(tac->res)->name);
                break;

            
            case TAC_BEGFUN: 
                fprintf(fout, "## TAC_BEGFUN\n");
                if(strcmp(tac->res->name,"main") == 0){
                    fprintf(fout, ".globl	%s\n", tac->res->name);
                    fprintf(fout, "%s:\n", tac->res->name);
                } else {
                    fprintf(fout, ".globl	_%s\n", hashStringName(tac->res)->name);
                    fprintf(fout, "_%s:\n", hashStringName(tac->res)->name);
                }
	            fprintf(fout, "\tpushq	%%rbp\n");
	            fprintf(fout, "\tmovq	%%rsp, %%rbp\n\n");
                break;
            case TAC_ENDFUN: 
                fprintf(fout, "## TAC_ENDFUN\n");
	            fprintf(fout, "\tpopq	%%rbp\n");
	            fprintf(fout, "\tret\n\n");
                break;
        

            case TAC_COPY_VEC:
                fprintf(fout, "## TAC_COPY_VEC\n");
                fprintf(fout, "\tmovl	_%s(%%rip), %%edx\n", hashStringName(tac->op1)->name);
                fprintf(fout, "\tmovl	_%s(%%rip), %%eax\n", hashStringName(tac->op2)->name);
                fprintf(fout, "\tmovslq	%%edx, %%rdx\n");
	            fprintf(fout, "\tleaq	0(,%%rdx,4), %%rcx\n");
	            fprintf(fout, "\tleaq	_%s(%%rip), %%rdx\n", hashStringName(tac->res)->name);
	            fprintf(fout, "\tmovl	%%eax, (%%rcx,%%rdx)\n\n");
                break;
            case TAC_ACC_VEC: 
                fprintf(fout, "## TAC_ACC_VEC\n");
                fprintf(fout, "\tmovl	_%s(%%rip), %%eax\n", hashStringName(tac->op2)->name);
                fprintf(fout, "\tcltq\n");
	            fprintf(fout, "\tleaq	0(,%%rax,4), %%rdx\n");
	            fprintf(fout, "\tleaq	_%s(%%rip), %%rax\n", hashStringName(tac->op1)->name);
                fprintf(fout, "\tmovl	(%%rdx,%%rax), %%eax\n");
	            fprintf(fout, "\tmovl	%%eax, _%s(%%rip)\n\n", hashStringName(tac->res)->name);
                break;


            case TAC_PRINT: 
                if(tac->res->type==SYMBOL_STRING){
                    fprintf(fout, "## TAC_PRINT\n");
                    fprintf(fout, "\tleaq	_%s(%%rip), %%rsi\n", hashStringName(tac->res)->name);
                    fprintf(fout, "\tleaq	.printstringstr(%%rip), %%rdi\n");
                    fprintf(fout, "\tmovl	$0, %%eax\n");
	                fprintf(fout, "\tcall   printf@PLT\n\n");
                } else {
                    fprintf(fout, "## TAC_PRINT\n");
                    fprintf(fout, "\tleaq	.printintstr(%%rip), %%rdi\n");
                    fprintf(fout, "\tmovl	_%s(%%rip), %%esi\n", hashStringName(tac->res)->name);
                    fprintf(fout, "\tmovl	$0, %%eax\n");
	                fprintf(fout, "\tcall   printf@PLT\n\n");
                }
                break;


            case TAC_RET: 
                fprintf(fout, "## TAC_RET\n");
                fprintf(fout, "\tmovl	_%s(%%rip), %%eax\n", hashStringName(tac->res)->name);
                fprintf(fout, "\tpopq	%%rbp\n");
	            fprintf(fout, "\tret\n\n");
                break;
            case TAC_CALL: 
                fprintf(fout, "## TAC_CALL\n");
                fprintf(fout, "\tmovl	$0, %%eax\n");
                if(strcmp(tac->res->name,"main") == 0){
                    fprintf(fout, "\tcall   %s\n", tac->op1->name);
                } else {
                    fprintf(fout, "\tcall   _%s\n", hashStringName(tac->op1)->name);
                }
	            fprintf(fout, "\tmovl	%%eax, _%s(%%rip)\n\n", hashStringName(tac->res)->name);
                break;


            case TAC_READ:
                fprintf(fout, "## TAC_READ\n");
                fprintf(fout, "\tleaq	_%s(%%rip), %%rsi\n", hashStringName(tac->res)->name);
                fprintf(fout, "\tleaq	.scanintstr(%%rip), %%rdi\n");
                fprintf(fout, "\tmovl	$0, %%eax\n");
                fprintf(fout, "\tcall   __isoc99_scanf@PLT\n\n");
                break;


            case TAC_SYMBOL:break;

            default: fprintf(stderr, "%d",tac->type); exit(1); break;
        }

        fflush(fout);
    }

    // HASH
    printAsm(fout);
    fclose(fout);
}