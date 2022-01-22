
#ifndef LEX_YY_H
#define LEX_YY_H

#include "hash.h"
#include "tokens.h"

extern char *yytext;
extern Hash **table;

int isRunning(void);

int getLineNumber(void);

int yywrap();

void initMe(void);

int yylex();

#endif