
 /* Made by Gabriel Couto Domingues */

%{
#include "hash.h"
#include "ast.h"
#include "y.tab.h"

int running = 1;
int lineNumber = 1;

int isRunning(void);

int getLineNumber(void);

void initMe(void);


%}

%x COMMENT

%%


 /* Reserved */
char  {return KW_CHAR;}
int   {return KW_INT;}
float {return KW_FLOAT;}
if    {return KW_IF;}
then  {return KW_THEN;}
else  {return KW_ELSE;}
while {return KW_WHILE;}
goto  {return KW_GOTO;}
read  {return KW_READ;}
print {return KW_PRINT;}
return    {return KW_RETURN;}

 /* Special chars */
[\,\;\:\(\)\[\]\{\}\+\-\*\/\<\>\=]  {return yytext[0];}

 /* Operators */
"<="   {return OPERATOR_LE;}
">="    {return OPERATOR_GE;}
"=="    {return OPERATOR_EQ;}
"!="   {return OPERATOR_DIF;}

 /* Tabs and spaces*/
[ \t]

 /* New line */
"\n" {++lineNumber;}

 /* Identifiers */
[a-z_-]*    {yylval.symbol = hashInsert(yytext, SYMBOL_IDENT); return TK_IDENTIFIER;}

 /* Literals */
[0-9]+  {yylval.symbol = hashInsert(yytext, SYMBOL_LITINT); return LIT_INTEGER;}
\'(\\.|[^'\\\n])\'    {yylval.symbol = hashInsert(yytext, SYMBOL_LITCHAR); return LIT_CHAR;}
\"(\\.|[^"\\\n])*\" {yylval.symbol = hashInsert(yytext, SYMBOL_STRING); return LIT_STRING;}

 /* Comments */
"\\\\".*
"\\*"    {BEGIN(COMMENT);}
<COMMENT>"*\\"   {BEGIN(INITIAL);}
<COMMENT>"\n"   {++lineNumber;}
<COMMENT>.

 /* Error */
.   {return TOKEN_ERROR;}
%%


int isRunning(void) {
    return running;
}

int getLineNumber(void) {
    return lineNumber;
}

int yywrap(){
    running = 0;
    return 1;
}

void initMe(void){
    hashInit();
    running = 1;
    lineNumber = 1;
}