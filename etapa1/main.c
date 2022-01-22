#include <stdio.h>
#include "lex.yy.h"

int yylex();
extern char *yytext;

int main(int argc, char** argv){

    initMe();
    
    while (isRunning()){
        int token = yylex();

        printf("(%d,%s,%d)\n", getLineNumber(),yytext,token);
    }

    hash_print(table);

    hash_free(table);
}