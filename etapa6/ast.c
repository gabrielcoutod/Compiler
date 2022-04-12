 /* Made by Gabriel Couto Domingues */

#include "ast.h"


int getLineNumber();

AST *astCreate(int type, HASH *symbol, AST* s0, AST* s1, AST* s2, AST* s3){
    AST *newnode;
    newnode = (AST*) calloc(1, sizeof(AST));

    newnode->type = type;
    newnode->symbol = symbol;
    newnode->son[0] = s0;
    newnode->son[1] = s1;
    newnode->son[2] = s2;
    newnode->son[3] = s3;

    newnode->line = getLineNumber();

    return newnode;
}

AST *astSymbol(HASH *symbol){
    return astCreate(AST_SYMBOL, symbol, 0, 0, 0, 0);
}

void astPrint(AST *node, int level){
    int i = 0;

    if (node == 0) {
        return;
    }

    for(i = 0; i < level; ++i) {
        fprintf(stderr," ");
    }

    fprintf(stderr, "ast(");
    switch (node->type){
        case AST_GOTO: fprintf(stderr, "AST_GOTO"); break;
        case AST_WHILE: fprintf(stderr, "AST_WHILE"); break;
        case AST_IF_ELSE: fprintf(stderr, "AST_IF_ELSE"); break;
        case AST_IF: fprintf(stderr, "AST_IF"); break;
        case AST_ARGL: fprintf(stderr, "AST_ARGL"); break;
        case AST_FCALL: fprintf(stderr, "AST_FCALL"); break;
        case AST_READ: fprintf(stderr, "AST_READ"); break;
        case AST_DIF: fprintf(stderr, "AST_DIF"); break;
        case AST_EQ: fprintf(stderr, "AST_EQ"); break;
        case AST_GE: fprintf(stderr, "AST_GE"); break;
        case AST_LE: fprintf(stderr, "AST_LE"); break;
        case AST_GREAT: fprintf(stderr, "AST_GREAT"); break;
        case AST_LESS: fprintf(stderr, "AST_LESS"); break;
        case AST_DIV: fprintf(stderr, "AST_DIV"); break;
        case AST_MUL: fprintf(stderr, "AST_MUL"); break;
        case AST_SUB: fprintf(stderr, "AST_SUB"); break;
        case AST_ADD: fprintf(stderr, "AST_ADD"); break;
        case AST_EXPR_PAR: fprintf(stderr, "AST_EXPR_PAR"); break;
        case AST_EXPR_VEC: fprintf(stderr, "AST_EXPR_VEC"); break;
        case AST_RET: fprintf(stderr, "AST_RET"); break;
        case AST_PRINTL: fprintf(stderr, "AST_PRINTL"); break;
        case AST_PRINT: fprintf(stderr, "AST_PRINT"); break;
        case AST_ATTR_VEC: fprintf(stderr, "AST_ATTR_VEC"); break;
        case AST_ATTR: fprintf(stderr, "AST_ATTR"); break;
        case AST_CMDL_ROT: fprintf(stderr, "AST_CMDL_ROT"); break;
        case AST_CMDL_CMD: fprintf(stderr, "AST_CMDL_CMD"); break;
        case AST_PAR: fprintf(stderr, "AST_PAR"); break;
        case AST_PARL: fprintf(stderr, "AST_PARL"); break;
        case AST_DECL_FUNC: fprintf(stderr, "AST_DECL_FUNC"); break;
        case AST_FLOAT: fprintf(stderr, "AST_FLOAT"); break;
        case AST_CHAR: fprintf(stderr, "AST_CHAR"); break;
        case AST_INT: fprintf(stderr, "AST_INT"); break;
        case AST_LITL: fprintf(stderr, "AST_LITL"); break;
        case AST_DECL_ARR_EMPT: fprintf(stderr, "AST_DECL_ARR_EMPT"); break;
        case AST_DECL_ARR_LIT: fprintf(stderr, "AST_DECL_ARR_LIT"); break;
        case AST_DECL_VAR: fprintf(stderr, "AST_DECL_VAR"); break;
        case AST_DECL_VAR_FLOAT: fprintf(stderr, "AST_DECL_VAR_FLOAT"); break;
        case AST_DECL: fprintf(stderr, "AST_DECL"); break;
        case AST_SYMBOL: fprintf(stderr, "AST_SYMBOL"); break;
        case AST_BODY: fprintf(stderr, "AST_BODY"); break;
        default: fprintf(stderr, "ERROR\n"); exit(1); break;
    }

    if(node->symbol != 0){
        fprintf(stderr, ",%s)\n", node->symbol->name);
    } else {
        fprintf(stderr, ")\n");
    }

    for(i = 0; i < MAX_SONS; ++i){
        astPrint(node->son[i], level+1);
    }
}

