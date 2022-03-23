 /* Made by Gabriel Couto Domingues */
#include <stdio.h>
#include "hash.h"
#include "decompiler.h"
#include "ast.h"
#include "semantic.h"

extern FILE *yyin;
extern AST *ast;
int yyparse();
void initMe();

int main(int argc, char** argv){

    initMe();

    if (argc < 2){
        fprintf(stderr, "Missing file argument.\n");
        exit(1);
    }

    yyin = fopen(argv[1],"r");
    if (yyin == 0) {
        fprintf(stderr, "Cannot open file %s.\n",argv[1]);
        exit(2);
    }


    yyparse();

    //astPrint(ast, 0);

    semanticChecks(ast);
    if(getSemanticErrors() > 0){
        exit(4);
    }

    hashFree();

    fprintf(stderr, "Compilation Successful\n");

    exit(0);
}