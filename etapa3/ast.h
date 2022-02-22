 /* Made by Gabriel Couto Domingues */

#ifndef AST_H
#define AST_H

#include "hash.h"

#define MAX_SONS 4

#define AST_SYMBOL 1
#define AST_ADD 2
#define AST_SUB 3

typedef struct astnode{
    int type;
    HASH *symbol;
    struct astnode *son[MAX_SONS];
} AST;

AST *astCreate(int type, HASH *symbol, AST* s0, AST* s1, AST* s2, AST* s3);
void astPrint(AST *node, int level);


#endif