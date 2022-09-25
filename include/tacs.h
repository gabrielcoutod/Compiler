 /* Made by Gabriel Couto Domingues */

#ifndef TACS_H
#define TACS_H

#include "hash.h"
#include "ast.h"

#define TAC_SYMBOL 1
#define TAC_ADD 2
#define TAC_SUB 3
#define TAC_COPY 4
#define TAC_JFALSE 5
#define TAC_LABEL 6
#define TAC_DIV 7
#define TAC_MUL 8
#define TAC_DIF 9
#define TAC_EQ 10
#define TAC_GE 11
#define TAC_LE 12
#define TAC_GREAT 13
#define TAC_LESS 14
#define TAC_JUMP 15
#define TAC_READ 16
#define TAC_COPY_VEC 17
#define TAC_ACC_VEC 18
#define TAC_RET 19
#define TAC_PRINT 20
#define TAC_ARG 21
#define TAC_CALL 22
#define TAC_BEGFUN 23
#define TAC_ENDFUN 24

typedef struct tac_node{
    int type;
    HASH *res;
    HASH *op1;
    HASH *op2;
    int isConstant;
    struct tac_node *prev;
    struct tac_node *next;
} TAC;

TAC *tacCreate(int type, HASH *res, HASH *op1, HASH *op2);
void tacPrint(TAC *tac);
void tacPrintBackwards(TAC *tac);
TAC *tacReverse(TAC *tac);
TAC *tacJoin(TAC *l1, TAC *l2);

TAC *generateCode(AST *node);

#endif