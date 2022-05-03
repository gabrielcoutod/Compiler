 /* Made by Gabriel Couto Domingues */
#include <stdio.h>
#include "hash.h"
#include "decompiler.h"
#include "ast.h"
#include "semantic.h"
#include "tacs.h"
#include "asm.h"

extern FILE *yyin;
extern AST *ast;
int yyparse();
void initMe();
int getSyntaxErrors();

int main(int argc, char** argv){

    initMe();

    if (argc < 3){
        fprintf(stderr, "Missing file argument.\n");
        exit(1);
    }

    yyin = fopen(argv[1],"r");
    if (yyin == 0) {
        fprintf(stderr, "Cannot open file %s.\n",argv[1]);
        exit(2);
    }

    yyparse();

    if(getSyntaxErrors() > 0){
        fprintf(stderr, "Syntax errors found.\n");
        exit(3);
    }

    //astPrint(ast, 0);

    semanticChecks(ast);
    if(getSemanticErrors() > 0){
        exit(4);
    }

    //hashPrint();

    FILE *out = fopen(argv[2],"w");
    if (out == 0) {
        fprintf(stderr, "Cannot open file %s.\n",argv[2]);
        exit(2);
    }

    decompile(ast, out);

    TAC *code = generateCode(ast);

    //tacPrintBackwards(code);

    code = tacReverse(code);
    generateAsm(code);

    hashFree();

    fprintf(stderr, "Compilation Successful\n");

    exit(0);
}