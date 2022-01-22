
%{
#include "lex.yy.h"

int running = 0;
int lineNumber = 1;
Hash **table;

%}

%x COMMENT

%%

 /* Tabs and spaces*/
[ \t]

 /* New line */
"\n" {++lineNumber;}

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

 /* Identifiers */
[a-z_-]*    {hash_insert(table, yytext, TK_IDENTIFIER); return TK_IDENTIFIER;}

 /* Literals */
[0-9]+  {hash_insert(table, yytext, LIT_INTEGER); return LIT_INTEGER;}
\'(\\.|[^'\\\n])\'    {hash_insert(table, yytext, LIT_CHAR); return LIT_CHAR;}
\"(\\.|[^"\\\n])*\" {hash_insert(table, yytext, LIT_STRING); return LIT_STRING;}

 /* Comments */
"//".*
"/*"    {BEGIN(COMMENT);}
<COMMENT>"*/"   {BEGIN(INITIAL);}
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
    table = hash_create_empty_table();
    running = 1;
    lineNumber = 1;
}