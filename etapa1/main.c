#include <stdio.h>
#include "lex.yy.h"

// Main baseada na main em http://www.inf.ufrgs.br/~johann/comp/main.c
int main(int argc, char** argv){

    initMe();
    
    while (isRunning()){
        int token = yylex();

        printf("(%d,%s,%d)\n", getLineNumber(),yytext,token);
    }

    hash_print(table);

    hash_free(table);
}