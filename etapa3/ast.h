 /* Made by Gabriel Couto Domingues */

#ifndef AST_H
#define AST_H

#include "hash.h"

#define MAX_SONS 4

#define AST_UNKNOWN 0
#define AST_GOTO 1
#define AST_WHILE 2
#define AST_IF_ELSE 3
#define AST_IF 4
#define AST_ARGL 5
#define AST_FCALL 6
#define AST_READ 7
#define AST_DIF 8
#define AST_EQ 9
#define AST_GE 10
#define AST_LE 11
#define AST_GREAT 12
#define AST_LESS 13
#define AST_DIV 14
#define AST_MUL 15
#define AST_SUB 16
#define AST_ADD 17
#define AST_EXPR_PAR 18
#define AST_EXPR_VEC 19
#define AST_RET 20
#define AST_PRINTL 21
#define AST_PRINT 22
#define AST_ATTR_VEC 23
#define AST_ATTR 24
#define AST_CMDL_ROT 25
#define AST_CMDL_CMD 26
#define AST_PAR 27
#define AST_PARL 28
#define AST_DECL_FUNC 29
#define AST_FLOAT 30
#define AST_CHAR 31
#define AST_INT 32
#define AST_LITL 33
#define AST_DECL_ARR_EMPT 34
#define AST_DECL_ARR_LIT 35
#define AST_DECL_VAR 36
#define AST_DECL_VAR_FLOAT 37
#define AST_DECL 38
#define AST_SYMBOL 39
#define AST_BODY 40

typedef struct astnode{
    int type;
    HASH *symbol;
    struct astnode *son[MAX_SONS];
} AST;

AST *astCreate(int type, HASH *symbol, AST* s0, AST* s1, AST* s2, AST* s3);
AST *astSymbol(HASH *symbol);
void astPrint(AST *node, int level);


#endif