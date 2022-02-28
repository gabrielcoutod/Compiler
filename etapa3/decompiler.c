 /* Made by Gabriel Couto Domingues */

#include "decompiler.h"

void decompile(AST *node, FILE *out){
    if(node == 0){
        return;
    }

    switch(node->type){
        case AST_GOTO: decompile_AST_GOTO(node, out); break;
        case AST_WHILE: decompile_AST_WHILE(node, out); break;
        case AST_IF_ELSE: decompile_AST_IF_ELSE(node, out); break;
        case AST_IF: decompile_AST_IF(node, out); break;
        case AST_ARGL: decompile_AST_ARGL(node, out); break;
        case AST_FCALL: decompile_AST_FCALL(node, out); break;
        case AST_READ: decompile_AST_READ(node, out); break;
        case AST_DIF: decompile_AST_DIF(node, out); break;
        case AST_EQ: decompile_AST_EQ(node, out); break;
        case AST_GE: decompile_AST_GE(node, out); break;
        case AST_LE: decompile_AST_LE(node, out); break;
        case AST_GREAT: decompile_AST_GREAT(node, out); break;
        case AST_LESS: decompile_AST_LESS(node, out); break;
        case AST_DIV: decompile_AST_DIV(node, out); break;
        case AST_MUL: decompile_AST_MUL(node, out); break;
        case AST_SUB: decompile_AST_SUB(node, out); break;
        case AST_ADD: decompile_AST_ADD(node, out); break;
        case AST_EXPR_PAR: decompile_AST_EXPR_PAR(node, out); break;
        case AST_EXPR_VEC: decompile_AST_EXPR_VEC(node, out); break;
        case AST_RET: decompile_AST_RET(node, out); break;
        case AST_PRINTL: decompile_AST_PRINTL(node, out); break;
        case AST_PRINT: decompile_AST_PRINT(node, out); break;
        case AST_ATTR_VEC: decompile_AST_ATTR_VEC(node, out); break;
        case AST_ATTR: decompile_AST_ATTR(node, out); break;
        case AST_CMDL_ROT: decompile_AST_CMDL_ROT(node, out); break;
        case AST_CMDL_CMD: decompile_AST_CMDL_CMD(node, out); break;
        case AST_PAR: decompile_AST_PAR(node, out); break;
        case AST_PARL: decompile_AST_PARL(node, out); break;
        case AST_DECL_FUNC: decompile_AST_DECL_FUNC(node, out); break;
        case AST_FLOAT: decompile_AST_FLOAT(node, out); break;
        case AST_CHAR: decompile_AST_CHAR(node, out); break;
        case AST_INT: decompile_AST_INT(node, out); break;
        case AST_LITL: decompile_AST_LITL(node, out); break;
        case AST_DECL_ARR_EMPT: decompile_AST_DECL_ARR_EMPT(node, out); break;
        case AST_DECL_ARR_LIT: decompile_AST_DECL_ARR_LIT(node, out); break;
        case AST_DECL_VAR: decompile_AST_DECL_VAR(node, out); break;
        case AST_DECL_VAR_FLOAT: decompile_AST_DECL_VAR_FLOAT(node, out); break;
        case AST_DECL: decompile_AST_DECL(node, out); break;
        case AST_SYMBOL: decompile_AST_SYMBOL(node, out); break;
        case AST_BODY: decompile_AST_BODY(node, out); break;

        default: fprintf(stderr, "ERROR\n"); exit(1); break;
    }
}
void decompile_AST_GOTO(AST *node, FILE *out){
    fprintf(out, "goto ");
    decompile(node->son[0], out);
}

void decompile_AST_WHILE(AST *node, FILE *out){
    fprintf(out, "while ");
    decompile(node->son[0], out);
    fprintf(out, " ");
    decompile(node->son[1], out);
}

void decompile_AST_IF_ELSE(AST *node, FILE *out){
    fprintf(out, "if ");
    decompile(node->son[0], out);
    fprintf(out, " then ");
    decompile(node->son[1], out);
    fprintf(out, " else ");
    decompile(node->son[2], out);
}

void decompile_AST_IF(AST *node, FILE *out){
    fprintf(out, "if ");
    decompile(node->son[0], out);
    fprintf(out, " then ");
    decompile(node->son[1], out);
}

void decompile_AST_ARGL(AST *node, FILE *out){
    decompile(node->son[0], out);
    if(node->son[1] != 0) {
        fprintf(out, ", ");
        decompile(node->son[1], out);
    }
}

void decompile_AST_FCALL(AST *node, FILE *out){
    decompile(node->son[0], out);
    fprintf(out, "(");
    decompile(node->son[1], out);
    fprintf(out, ")");
}

void decompile_AST_READ(AST *node, FILE *out){
    fprintf(out, "read");
}

void decompile_AST_DIF(AST *node, FILE *out){
    decompile(node->son[0], out);
    fprintf(out, " != ");
    decompile(node->son[1], out);
}

void decompile_AST_EQ(AST *node, FILE *out){
    decompile(node->son[0], out);
    fprintf(out, " == ");
    decompile(node->son[1], out);
}

void decompile_AST_GE(AST *node, FILE *out){
    decompile(node->son[0], out);
    fprintf(out, " >= ");
    decompile(node->son[1], out);
}

void decompile_AST_LE(AST *node, FILE *out){
    decompile(node->son[0], out);
    fprintf(out, " <= ");
    decompile(node->son[1], out);
}

void decompile_AST_GREAT(AST *node, FILE *out){
    decompile(node->son[0], out);
    fprintf(out, " > ");
    decompile(node->son[1], out);
}

void decompile_AST_LESS(AST *node, FILE *out){
    decompile(node->son[0], out);
    fprintf(out, " < ");
    decompile(node->son[1], out);
}

void decompile_AST_DIV(AST *node, FILE *out){
    decompile(node->son[0], out);
    fprintf(out, " / ");
    decompile(node->son[1], out);
}

void decompile_AST_MUL(AST *node, FILE *out){
    decompile(node->son[0], out);
    fprintf(out, " * ");
    decompile(node->son[1], out);
}

void decompile_AST_SUB(AST *node, FILE *out){
    decompile(node->son[0], out);
    fprintf(out, " - ");
    decompile(node->son[1], out);
}

void decompile_AST_ADD(AST *node, FILE *out){
    decompile(node->son[0], out);
    fprintf(out, " + ");
    decompile(node->son[1], out);
}

void decompile_AST_EXPR_PAR(AST *node, FILE *out){
    fprintf(out, "(");
    decompile(node->son[0], out);
    fprintf(out, ")");
}

void decompile_AST_EXPR_VEC(AST *node, FILE *out){
    decompile(node->son[0], out);
    fprintf(out, "[");
    decompile(node->son[1], out);
    fprintf(out, "]");
}

void decompile_AST_RET(AST *node, FILE *out){
    fprintf(out, "return ");
    decompile(node->son[0], out);
}

void decompile_AST_PRINTL(AST *node, FILE *out){
    decompile(node->son[0], out);
    if(node->son[1] != 0) {
        fprintf(out, ", ");
        decompile(node->son[1], out);
    }
}


void decompile_AST_PRINT(AST *node, FILE *out){
    fprintf(out, "print ");
    decompile(node->son[0], out);
}

void decompile_AST_ATTR_VEC(AST *node, FILE *out){
    decompile(node->son[0], out);
    fprintf(out, "[");
    decompile(node->son[1], out);
    fprintf(out, "] = ");
    decompile(node->son[2], out);
}

void decompile_AST_ATTR(AST *node, FILE *out){
    decompile(node->son[0], out);
    fprintf(out, " = ");
    decompile(node->son[1], out);
}

void decompile_AST_CMDL_ROT(AST *node, FILE *out){
    decompile(node->son[0], out);
    fprintf(out, ":\n");
    decompile(node->son[1], out);
}

void decompile_AST_CMDL_CMD(AST *node, FILE *out){
    decompile(node->son[0], out);
    fprintf(out, ";\n");
    decompile(node->son[1], out);
}

void decompile_AST_PAR(AST *node, FILE *out){
    decompile(node->son[0], out);
    fprintf(out, " ");
    decompile(node->son[1], out);
}

void decompile_AST_PARL(AST *node, FILE *out){
    decompile(node->son[0], out);
    if(node->son[1] != 0) {
        fprintf(out, ", ");
        decompile(node->son[1], out);
    }
}

void decompile_AST_DECL_FUNC(AST *node, FILE *out){
    fprintf(out, "\n");
    decompile(node->son[0], out);
    fprintf(out, " ");
    decompile(node->son[1], out);
    fprintf(out, "(");
    decompile(node->son[2], out);
    fprintf(out, ") ");
    decompile(node->son[3], out);
}

void decompile_AST_FLOAT(AST *node, FILE *out){
    fprintf(out, "float");
}

void decompile_AST_CHAR(AST *node, FILE *out){
    fprintf(out, "char");
}

void decompile_AST_INT(AST *node, FILE *out){
    fprintf(out, "int");
}

void decompile_AST_LITL(AST *node, FILE *out){
    decompile(node->son[0], out);
    if(node->son[1] != 0) {
        fprintf(out, " ");
        decompile(node->son[1], out);
    }
}

void decompile_AST_DECL_ARR_EMPT(AST *node, FILE *out){
    decompile(node->son[0], out);
    fprintf(out, " ");
    decompile(node->son[1], out);
    fprintf(out, "[");
    decompile(node->son[2], out);
    fprintf(out, "];");
}

void decompile_AST_DECL_ARR_LIT(AST *node, FILE *out){
    decompile(node->son[0], out);
    fprintf(out, " ");
    decompile(node->son[1], out);
    fprintf(out, "[");
    decompile(node->son[2], out);
    fprintf(out, "]: ");
    decompile(node->son[3], out);
    fprintf(out, ";");
}

void decompile_AST_DECL_VAR(AST *node, FILE *out){
    decompile(node->son[0], out);
    fprintf(out, " ");
    decompile(node->son[1], out);
    fprintf(out, ": ");
    decompile(node->son[2], out);
    fprintf(out, ";");
}

void decompile_AST_DECL_VAR_FLOAT(AST *node, FILE *out){
    fprintf(out, "float ");
    decompile(node->son[0], out);
    fprintf(out, ": ");
    decompile(node->son[1], out);
    fprintf(out, " / ");
    decompile(node->son[2], out);
    fprintf(out, ";");
}

void decompile_AST_DECL(AST *node, FILE *out){
    decompile(node->son[0], out);
    fprintf(out, "\n");
    decompile(node->son[1], out);
}

void decompile_AST_SYMBOL(AST *node, FILE *out){
    fprintf(out,"%s", node->symbol->name);
}

void decompile_AST_BODY(AST *node, FILE *out){
    fprintf(out,"{\n");
    decompile(node->son[0], out);
    fprintf(out,"}");
}