 /* Made by Gabriel Couto Domingues */
#include <stdio.h>
#include "hash.h"
#include "decompiler.h"

extern FILE *yyin;
extern AST *ast;
int yyparse();
void initMe();

int main(int argc, char** argv){

    initMe();

    if (argc < 3){
        printf("Missing args\n");
        exit(1);
    }

    yyin = fopen(argv[1],"r");
    if (yyin == 0) {
        printf("Cannot open file %s... \n",argv[1]);
        exit(1);
    }

    FILE *out = fopen(argv[2],"w");
    if (out == 0) {
        printf("Cannot open file %s... \n",argv[2]);
        exit(1);
    }


    yyparse();

    decompile(ast, out);

    hashFree();

    fprintf(stderr, "Compilation Successful");

    exit(0);
}