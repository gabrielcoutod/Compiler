#ifndef SEMANTIC_H
#define SEMANTIC_H

#include "hash.h"
#include "ast.h"

extern int semanticErrors;

int checkArithExpr(AST *expr, char *type);
int checkBooleanExpr(AST *expr, char *type);
int compatibleTypes(int datatype1, int datatype2);
int upgradeType(int datatype1, int datatype2);
int isBooleanExpression(AST *expr);
int getDatatypeExpr(AST *expr);
void checkATTR(AST *command);
void checkATTR_VEC(AST *command);
void checkPRINT(AST *command);
void checkBODY(AST *command);
void checkRET(AST *command);
void checkIF(AST *command);
void checkIF_ELSE(AST *command);
void checkWHILE(AST *command);
void checkGOTO(AST *command);
void checkCommand(AST *command);
void checkFunction(AST *node);
void checkFunctions(AST *node);
void checkIfLenMatchesSize(HASH *vec, int val, AST *node, char *name, int line);
int getDataTypeFromType(int type);
void setType(AST *node, int type, int datatype, char *name);
void checkAndSetDeclarations(AST *node);
void semanticChecks(AST *node);
int getSemanticErrors();

#endif

