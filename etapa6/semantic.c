#include "semantic.h"
#include "symbols.h"

int semanticErrors = 0;

AST *currentFunction = 0;
int hasReturn = 0;
int returnType = 0;

int getSemanticErrors(){
    return semanticErrors;
}

void semanticChecks(AST *node){
    checkAndSetDeclarations(node);
    checkFunctions(node);
}

void checkAndSetDeclarations(AST *node){

    if (node == 0) {
        return;
    }

    if(node->type != AST_DECL){
        return;
    }

    AST *declNode = node;
    node = node->son[0];

    switch (node->type){
        
        case AST_DECL_FUNC: 
            setType(node->son[1], SYMBOL_FUNCTION, getDataTypeFromType(node->son[0]->type), "function");
            node->son[1]->symbol->function = node;
            break;

        case AST_DECL_ARR_LIT: 
            setType(node->son[1], SYMBOL_VECTOR, getDataTypeFromType(node->son[0]->type), "vector");
            node->son[1]->symbol->vecSize = atoi(node->son[2]->symbol->name);
            if(node->son[1]->symbol->vecSize > 0){
                checkIfLenMatchesSize(node->son[1]->symbol, node->son[1]->symbol->vecSize, node->son[3], node->son[1]->symbol->name, node->son[1]->line);
            } else {
                fprintf(stderr, "Semantic Error: vector %s needs to have positive size at line %d\n", node->son[1]->symbol->name, node->son[1]->line);
                ++semanticErrors;
            }

            break;

        case AST_DECL_ARR_EMPT: 
            setType(node->son[1], SYMBOL_VECTOR, getDataTypeFromType(node->son[0]->type), "vector");
            node->son[1]->symbol->vecSize = atoi(node->son[2]->symbol->name);
            if(node->son[1]->symbol->vecSize <= 0){
                fprintf(stderr, "Semantic Error: vector %s needs to have positive size at line %d\n", node->son[1]->symbol->name, node->son[1]->line);
                ++semanticErrors;
            } else {
                int len = node->son[1]->symbol->vecSize;
                int i = 0;
                while(i < len){
                    addValHash(node->son[1]->symbol, 0);
                    ++i;
                }
            }
            break;

        case AST_DECL_VAR: 
            setType(node->son[1], SYMBOL_VARIABLE, getDataTypeFromType(node->son[0]->type), "variable");
            if(node->son[2]->symbol->type == SYMBOL_LITCHAR)
                addValHash(node->son[1]->symbol, node->son[2]->symbol->name[1]);
            else
                addValHash(node->son[1]->symbol, atoi(node->son[2]->symbol->name));
            break;
        
        case AST_DECL_VAR_FLOAT: 
            setType(node->son[0], SYMBOL_VARIABLE, getDataTypeFromType(AST_FLOAT), "variable");
            int arg1 = 0;
            int arg2 = 0;

            if(node->son[1]->symbol->type == SYMBOL_LITCHAR)
                arg1 = node->son[1]->symbol->name[1];
            else
                arg1 = atoi(node->son[1]->symbol->name);

            if(node->son[2]->symbol->type == SYMBOL_LITCHAR)
                arg2 = node->son[2]->symbol->name[1];
            else
                arg2 = atoi(node->son[2]->symbol->name);


            addValHash(node->son[0]->symbol, arg1 / arg2);
            break;

        default: 
            break;
    }

    checkAndSetDeclarations(declNode->son[1]);
}

void setType(AST *node, int type, int datatype, char *name){
    if(node->symbol->type != SYMBOL_IDENT){
        fprintf(stderr, "Semantic Error: %s %s declared again at line %d\n", name,  node->symbol->name, node->line);
        ++semanticErrors;
    } else {
        node->symbol->type = type;
        node->symbol->datatype = datatype;
        node->symbol->datatypeFunction = 0;
    }
}

int getDataTypeFromType(int type){
    if(type == AST_INT)
        return DATATYPE_INT;
    if(type == AST_CHAR)
        return DATATYPE_CHAR; 
    if(type == AST_FLOAT)
        return DATATYPE_FLOAT;
    return 0;
}

void checkIfLenMatchesSize(HASH *vec, int val, AST *node, char *name, int line){
    int count = 0;

    while(node){
        if(node->son[0]->symbol->type == SYMBOL_LITCHAR)
            addValHash(vec, node->son[0]->symbol->name[1]);
        else
            addValHash(vec, atoi(node->son[0]->symbol->name));
        ++count;
        node = node->son[1];
    }

    if (count != val){
        fprintf(stderr, "Semantic Error: at declaration of %s number of values doesn't match at line %d\n", name, line);
        ++semanticErrors;
    }
}

void checkFunctions(AST *node){

    if (node == 0) {
        return;
    }

    if(node->type != AST_DECL){
        return;
    }

    AST *declNode = node;
    node = node->son[0];

    if(node->type == AST_DECL_FUNC){
        checkFunction(node);
    }

    checkFunctions(declNode->son[1]);
}


void checkFunction(AST *node){

    if (node == 0) {
        return;
    }

    AST *decl = node;

    // fill parameters
    hasReturn = 0;
    currentFunction = decl;
    returnType = getDataTypeFromType(node->son[0]->type);

    startSymbols();

    AST *pars = decl->son[2];
    while(pars){
        AST *par = pars->son[0];

        HASH *h = par->son[1]->symbol;

        if(h->type != SYMBOL_IDENT){
            fprintf(stderr, "Semantic Error: variable %s declared again at line %d\n", h->name, par->line);
            ++semanticErrors;
        } else {
            h->type = SYMBOL_VARIABLE;
            h->datatype = getDataTypeFromType(par->son[0]->type);
            h->datatypeFunction = getDataTypeFromType(par->son[0]->type);
            addValHash(h, 0);
        }

        pars = pars->son[1];
    }


    // check commands
    AST *command = decl->son[3];
    checkCommand(command);

    /*
    if (!hasReturn){
        fprintf(stderr, "Semantic Error: %s has no return command at line %d\n", decl->son[1]->symbol->name, decl->son[1]->line);
        ++semanticErrors;
    }
    */

    // unfill parameters
    hasReturn = 0;
    currentFunction = 0;
    returnType = 0;

    /*
    emptySymbols();

    pars = decl->son[2];
    while(pars){
        AST *par = pars->son[0];

        HASH *h = par->son[1]->symbol;

        if(h->datatypeFunction != 0){
            h->type = SYMBOL_IDENT;
            h->datatype = 0;
            h->datatypeFunction = 0;
        }

        pars = pars->son[1];
    }*/

}

void checkCommand(AST *command){
    if(command == 0)
        return;

    switch(command->type){
        case AST_GOTO: checkGOTO(command); break;
        case AST_WHILE: checkWHILE(command); break;
        case AST_IF_ELSE: checkIF_ELSE(command); break;
        case AST_IF: checkIF(command); break;
        case AST_RET: checkRET(command); break;
        case AST_PRINT: checkPRINT(command); break;
        case AST_ATTR_VEC: checkATTR_VEC(command); break;
        case AST_ATTR: checkATTR(command); break;
        case AST_BODY: checkBODY(command); break;
        default: break;
    }
}


void checkGOTO(AST *command){
    if(command->son[0]->symbol->type == SYMBOL_IDENT){
        //fprintf(stderr, "Semantic Error: label %s not declared at line %d\n", command->son[0]->symbol->name, command->son[0]->line);
        //++semanticErrors;
    } else if (command->son[0]->symbol->type != SYMBOL_LABEL){
        fprintf(stderr, "Semantic Error: %s is not a label at line %d\n", command->son[0]->symbol->name, command->son[0]->line);
        ++semanticErrors;
    }
} 

void checkWHILE(AST *command){
    if(!isBooleanExpression(command->son[0])){
        fprintf(stderr, "Semantic Error: while condition doesn't evaluate to boolean expression at line %d\n", command->son[0]->line);
        ++semanticErrors;
    }

    checkCommand(command->son[1]);
}

void checkIF_ELSE(AST *command){
    if(!isBooleanExpression(command->son[0])){
        fprintf(stderr, "Semantic Error: if/else condition doesn't evaluate to boolean expression at line %d\n", command->son[0]->line);
        ++semanticErrors;
    }

    checkCommand(command->son[1]);
    checkCommand(command->son[2]);
}
void checkIF(AST *command){
    if(!isBooleanExpression(command->son[0])){
        fprintf(stderr, "Semantic Error: if condition doesn't evaluate to boolean expression at line %d\n", command->son[0]->line);
        ++semanticErrors;
    }

    checkCommand(command->son[1]);
}


void checkRET(AST *command){
    int ret = getDatatypeExpr(command->son[0]);
    hasReturn = 1;

    if (!compatibleTypes(ret, returnType)){
        fprintf(stderr, "Semantic Error: return type of expression not compatible at line %d\n", command->son[0]->line);
        ++semanticErrors;
    }
}

void checkBODY(AST *command){
    AST *cmdl = command->son[0];

    while(cmdl){
        if(cmdl->type == AST_CMDL_ROT){

            AST *rot = cmdl->son[0];
            if(rot->symbol->type != SYMBOL_IDENT){
                fprintf(stderr, "Semantic Error: label %s already declared at line %d\n", rot->symbol->name, rot->line);
                ++semanticErrors;
            } else {
                rot->symbol->type = SYMBOL_LABEL;
                addSymbols(rot->symbol);
            }
            
        } else if (cmdl->type == AST_CMDL_CMD){
            checkCommand(cmdl->son[0]);
        }

        cmdl = cmdl->son[1];
    }
}

void checkPRINT(AST *command){
    AST *list = command->son[0];

    while(list){

        if(!(list->son[0]->type == AST_SYMBOL && list->son[0]->symbol->type == SYMBOL_STRING)) {
            getDatatypeExpr(list->son[0]);
        }

        list = list->son[1];
    }
}

void checkATTR_VEC(AST *command){
    if(command->son[0]->symbol->type == SYMBOL_IDENT){
        fprintf(stderr, "Semantic Error: vector %s not declared at line %d\n", command->son[0]->symbol->name, command->son[0]->line);
        ++semanticErrors;
    } else if(command->son[0]->symbol->type != SYMBOL_VECTOR){
        fprintf(stderr, "Semantic Error: %s is not a vector at line %d\n", command->son[0]->symbol->name, command->son[0]->line);
        ++semanticErrors;
    }else {

        int datatypeIndex = getDatatypeExpr(command->son[1]);
        if(!(datatypeIndex == DATATYPE_INT || datatypeIndex == DATATYPE_CHAR)){
            fprintf(stderr, "Semantic Error: wrong type of expression for index of %s at line %d\n", command->son[0]->symbol->name, command->son[0]->line);
            ++semanticErrors;
        }

        int datatype = getDatatypeExpr(command->son[2]);
        if(!compatibleTypes(datatype, command->son[0]->symbol->datatype)){
            fprintf(stderr, "Semantic Error: wrong type of expression for attribution of %s at line %d\n", command->son[0]->symbol->name, command->son[0]->line);
            ++semanticErrors;
        }
    }

}

void checkATTR(AST *command){
    if(command->son[0]->symbol->type == SYMBOL_IDENT){
        fprintf(stderr, "Semantic Error: variable %s not declared at line %d\n", command->son[0]->symbol->name, command->son[0]->line);
        ++semanticErrors;
    } else if(command->son[0]->symbol->type != SYMBOL_VARIABLE){
        fprintf(stderr, "Semantic Error: %s is not a variable at line %d\n", command->son[0]->symbol->name, command->son[0]->line);
        ++semanticErrors;
    }else {
        int datatype = getDatatypeExpr(command->son[1]);
        if(!compatibleTypes(datatype, command->son[0]->symbol->datatype)){
            fprintf(stderr, "Semantic Error: wrong type of expression for attribution of %s at line %d\n", command->son[0]->symbol->name, command->son[0]->line);
            ++semanticErrors;
        }
    }
}


int getDatatypeExpr(AST *expr){
    if (expr == 0) {
        return 0;
    }

    int type = 0;

    switch (expr->type){
        case AST_DIF: type = checkBooleanExpr(expr, "!="); break;
        case AST_EQ: type = checkBooleanExpr(expr, "=="); break;
        case AST_GE: type = checkBooleanExpr(expr, ">="); break;
        case AST_LE: type = checkBooleanExpr(expr, "<="); break;
        case AST_GREAT: type = checkBooleanExpr(expr, ">"); break;
        case AST_LESS: type = checkBooleanExpr(expr, "<"); break;

        case AST_DIV: type = checkArithExpr(expr, "/"); break;
        case AST_MUL: type = checkArithExpr(expr, "*"); break;
        case AST_SUB: type = checkArithExpr(expr, "-"); break;
        case AST_ADD: type = checkArithExpr(expr, "+"); break;


        case AST_READ:  type = DATATYPE_INT; break;

        case AST_EXPR_PAR: type = getDatatypeExpr(expr->son[0]); break; 

        case AST_FCALL:
            if(expr->son[0]->symbol->type == SYMBOL_IDENT){
                fprintf(stderr, "Semantic Error: function %s not declared at line %d\n", expr->son[0]->symbol->name, expr->son[0]->line);
                ++semanticErrors;
            }else if(expr->son[0]->symbol->type != SYMBOL_FUNCTION){
                fprintf(stderr, "Semantic Error: %s is not a function at line %d\n", expr->son[0]->symbol->name, expr->son[0]->line);
                ++semanticErrors;
            } else {// check if parameters match

                AST *func = expr->son[0]->symbol->function;
                AST *parsFunction = func->son[2];
                AST *parsCall = expr->son[1];

                while(parsFunction && parsCall){

                    int typeCall = getDatatypeExpr(parsCall->son[0]);
                    int typeFunction = getDataTypeFromType(parsFunction->son[0]->son[0]->type);

                    if(!compatibleTypes(typeCall, typeFunction)){
                        fprintf(stderr, "Semantic Error: incompatible type of argument for %s at line %d\n", func->son[1]->symbol->name, expr->son[0]->line);
                        ++semanticErrors;
                    } 

                    parsFunction = parsFunction->son[1];
                    parsCall = parsCall->son[1];
                }

                if(parsCall || parsFunction){
                    fprintf(stderr, "Semantic Error: wrong number of parameters of %s at line %d\n", func->son[1]->symbol->name, expr->son[0]->line);
                    ++semanticErrors;
                }

                type = expr->son[0]->symbol->datatype;
            }

            break; 
        case AST_EXPR_VEC: 
            if(expr->son[0]->symbol->type == SYMBOL_IDENT){
                fprintf(stderr, "Semantic Error: vector %s not declared at line %d\n", expr->son[0]->symbol->name, expr->son[0]->line);
                ++semanticErrors;
            } else if(expr->son[0]->symbol->type != SYMBOL_VECTOR){
                fprintf(stderr, "Semantic Error: %s is not a vector at line %d\n", expr->son[0]->symbol->name,  expr->son[0]->line);
                ++semanticErrors;
            } else {

                int datatypeIndex = getDatatypeExpr(expr->son[1]);
                if(!(datatypeIndex == DATATYPE_INT || datatypeIndex == DATATYPE_CHAR)){
                    fprintf(stderr, "Semantic Error: wrong type of expression for index of %s at line %d\n", expr->son[0]->symbol->name, expr->son[0]->line);
                    ++semanticErrors;
                } else {
                    type = expr->son[0]->symbol->datatype;
                }
            }

            break; 

        case AST_SYMBOL: 
            if(expr->symbol->type == SYMBOL_IDENT){
                fprintf(stderr, "Semantic Error: variable %s not declared at line %d\n", expr->symbol->name, expr->line);
                ++semanticErrors;
            }else {
                
                if(expr->symbol->type == SYMBOL_LITCHAR)
                    type = DATATYPE_CHAR;
                else if(expr->symbol->type == SYMBOL_LITINT)
                    type = DATATYPE_INT;
                else if(expr->symbol->type == SYMBOL_VARIABLE){
                    type = expr->symbol->datatype;
                } else {
                    fprintf(stderr, "Semantic Error: %s is not a variable at line %d\n", expr->symbol->name, expr->line);
                    ++semanticErrors;
                }
            }
            break; 

        default: break;
    }

    return type;
}

int isBooleanExpression(AST *expr){
    int expressionDatatype = getDatatypeExpr(expr);
    return expressionDatatype == DATATYPE_BOOL;
}

int upgradeType(int datatype1, int datatype2){
    if(datatype1 == DATATYPE_FLOAT || datatype2 == DATATYPE_FLOAT)
        return DATATYPE_FLOAT;
    if(datatype1 == DATATYPE_INT || datatype2 == DATATYPE_INT)
        return DATATYPE_INT;
    if(datatype1 == DATATYPE_BOOL && datatype2 == DATATYPE_BOOL)
        return DATATYPE_BOOL;
    return DATATYPE_CHAR;
}

int compatibleTypes(int datatype1, int datatype2){
    if(datatype1 == DATATYPE_BOOL && datatype2 == DATATYPE_BOOL)
        return 1;
    if(datatype1 == DATATYPE_BOOL || datatype2 == DATATYPE_BOOL)
        return 0;
    if(datatype1 == 0 || datatype2 == 0)
        return 0;
    return 1;
}

int checkBooleanExpr(AST *expr, char *type){
    int type1 = getDatatypeExpr(expr->son[0]);
    int type2 = getDatatypeExpr(expr->son[1]);

    if(type1 == DATATYPE_BOOL || type1 == 0){
        fprintf(stderr, "Semantic Error: invalid left operand for %s at line %d\n", type, expr->line);
        ++semanticErrors;
    }

    if(type2 == DATATYPE_BOOL || type2 == 0){
        fprintf(stderr, "Semantic Error: invalid right operand for %s at line %d\n", type, expr->line);
        ++semanticErrors;
    }

    if(type1 == DATATYPE_BOOL || type2 == DATATYPE_BOOL || type1 == 0 || type2 == 0)
        return 0;
    else
        return DATATYPE_BOOL;
}

int checkArithExpr(AST *expr, char *type){
    int type1 = getDatatypeExpr(expr->son[0]);
    int type2 = getDatatypeExpr(expr->son[1]);

    if(type1 == DATATYPE_BOOL || type1 == 0){
        fprintf(stderr, "Semantic Error: invalid left operand for %s at line %d\n", type, expr->line);
        ++semanticErrors;
    }

    if(type2 == DATATYPE_BOOL || type2 == 0){
        fprintf(stderr, "Semantic Error: invalid right operand for %s at line %d\n", type, expr->line);
        ++semanticErrors;
    }

    if(type1 == DATATYPE_BOOL || type2 == DATATYPE_BOOL || type1 == 0 || type2 == 0)
        return 0;
    else
        return upgradeType(type1, type2);
}