 /* Made by Gabriel Couto Domingues */

#ifndef DECOMPILER_H
#define DECOMPILER_H

#include <stdio.h>
#include "ast.h"

void decompile(AST *node, FILE *out);
void decompile_AST_GOTO(AST *node, FILE *out);
void decompile_AST_WHILE(AST *node, FILE *out);
void decompile_AST_IF_ELSE(AST *node, FILE *out);
void decompile_AST_IF(AST *node, FILE *out);
void decompile_AST_ARGL(AST *node, FILE *out);
void decompile_AST_FCALL(AST *node, FILE *out);
void decompile_AST_READ(AST *node, FILE *out);
void decompile_AST_DIF(AST *node, FILE *out);
void decompile_AST_EQ(AST *node, FILE *out);
void decompile_AST_GE(AST *node, FILE *out);
void decompile_AST_LE(AST *node, FILE *out);
void decompile_AST_GREAT(AST *node, FILE *out);
void decompile_AST_LESS(AST *node, FILE *out);
void decompile_AST_DIV(AST *node, FILE *out);
void decompile_AST_MUL(AST *node, FILE *out);
void decompile_AST_SUB(AST *node, FILE *out);
void decompile_AST_ADD(AST *node, FILE *out);
void decompile_AST_EXPR_PAR(AST *node, FILE *out);
void decompile_AST_EXPR_VEC(AST *node, FILE *out);
void decompile_AST_RET(AST *node, FILE *out);
void decompile_AST_PRINTL(AST *node, FILE *out);
void decompile_AST_PRINT(AST *node, FILE *out);
void decompile_AST_ATTR_VEC(AST *node, FILE *out);
void decompile_AST_ATTR(AST *node, FILE *out);
void decompile_AST_CMDL_ROT(AST *node, FILE *out);
void decompile_AST_CMDL_CMD(AST *node, FILE *out);
void decompile_AST_PAR(AST *node, FILE *out);
void decompile_AST_PARL(AST *node, FILE *out);
void decompile_AST_DECL_FUNC(AST *node, FILE *out);
void decompile_AST_FLOAT(AST *node, FILE *out);
void decompile_AST_CHAR(AST *node, FILE *out);
void decompile_AST_INT(AST *node, FILE *out);
void decompile_AST_LITL(AST *node, FILE *out);
void decompile_AST_DECL_ARR_EMPT(AST *node, FILE *out);
void decompile_AST_DECL_ARR_LIT(AST *node, FILE *out);
void decompile_AST_DECL_VAR(AST *node, FILE *out);
void decompile_AST_DECL_VAR_FLOAT(AST *node, FILE *out);
void decompile_AST_DECL(AST *node, FILE *out);
void decompile_AST_SYMBOL(AST *node, FILE *out);
void decompile_AST_BODY(AST *node, FILE *out);

#endif