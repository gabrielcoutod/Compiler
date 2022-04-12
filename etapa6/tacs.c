#include "tacs.h"


typedef struct hash_list
{
    struct hash_list *next;
    HASH *val;
} HASH_LIST;

HASH_LIST *currentPar;

void append_hash_list(HASH *val){
    HASH_LIST *newnode = (HASH_LIST*) calloc(1, sizeof(HASH_LIST));
    
    newnode->val = val;
    newnode->next = 0;

    if(currentPar == 0){
        currentPar = newnode;
        return;
    }

    newnode->next = currentPar;
    currentPar= newnode;        
}

void pop_hash_list(){
    currentPar = currentPar->next;
}

TAC *makeDECL_FUNC(TAC *code0, TAC *code1, TAC *code2, TAC *code3);
TAC *makeARGL(TAC *code0, TAC *code1);
TAC *makeFCALL(TAC *code0, TAC *code1);
TAC *makePRINTL(TAC *code0, TAC *code1);
TAC *makeCMDL_ROT(TAC *code0, TAC *code1);
TAC *makeRET(TAC *code0);
TAC *makeEXPR_VEC(TAC *code0, TAC *code1);
TAC *makeATTR(TAC *code0, TAC *code1);
TAC *makeATTR_VEC(TAC *code0, TAC *code1, TAC *code2);
TAC *makeSYMBOL(AST *node);
TAC *makeOP(int type, TAC *code0, TAC *code1);
TAC *makeREAD();
TAC *makeGOTO(TAC *code0);
TAC *makeIF(TAC *code0, TAC *code1);
TAC *makeWHILE(TAC *code0, TAC *code1);
TAC *makeIFELSE(TAC *code0, TAC *code1, TAC *code2);
TAC *reverseArgs(TAC *code);

TAC *tacCreate(int type, HASH *res, HASH *op1, HASH *op2){
    TAC *newtac = (TAC *) calloc(1, sizeof(TAC));
    newtac->type = type;
    newtac->res = res;
    newtac->op1 = op1;
    newtac->op2 = op2;
    newtac->prev = 0;

    return newtac;
}

void tacPrint(TAC *tac){
    if (!tac) 
        return;

    if(tac->type == TAC_SYMBOL)
        return;
    
    fprintf(stdout, "TAC(");
    switch(tac->type){
        case TAC_SYMBOL: break;
        case TAC_ADD: fprintf(stdout, "TAC_ADD"); break;
        case TAC_SUB: fprintf(stdout, "TAC_SUB"); break;
        case TAC_COPY: fprintf(stdout, "TAC_COPY"); break;
        case TAC_JFALSE: fprintf(stdout, "TAC_JFALSE"); break;
        case TAC_LABEL: fprintf(stdout, "TAC_LABEL"); break;
        case TAC_DIV: fprintf(stdout, "TAC_DIV"); break;
        case TAC_MUL: fprintf(stdout, "TAC_MUL"); break;
        case TAC_DIF: fprintf(stdout, "TAC_DIF"); break;
        case TAC_EQ: fprintf(stdout, "TAC_EQ"); break;
        case TAC_GE: fprintf(stdout, "TAC_GE"); break;
        case TAC_LE: fprintf(stdout, "TAC_LE"); break;
        case TAC_GREAT: fprintf(stdout, "TAC_GREAT"); break;
        case TAC_LESS: fprintf(stdout, "TAC_LESS"); break;
        case TAC_JUMP: fprintf(stdout, "TAC_JUMP"); break;
        case TAC_READ: fprintf(stdout, "TAC_READ"); break;
        case TAC_COPY_VEC: fprintf(stdout, "TAC_COPY_VEC"); break;
        case TAC_ACC_VEC: fprintf(stdout, "TAC_ACC_VEC"); break;
        case TAC_RET: fprintf(stdout, "TAC_RET"); break;
        case TAC_PRINT: fprintf(stdout, "TAC_PRINT"); break;
        case TAC_ARG: fprintf(stdout, "TAC_ARG"); break;
        case TAC_CALL: fprintf(stdout, "TAC_CALL"); break;
        case TAC_BEGFUN: fprintf(stdout, "TAC_BEGFUN"); break;
        case TAC_ENDFUN: fprintf(stdout, "TAC_ENDFUN"); break;

        default: fprintf(stdout, "TAC_UNKNOWN"); break;
    }

    fprintf(stdout, ",%s", (tac->res)? tac->res->name: "0");
    fprintf(stdout, ",%s", (tac->op1)? tac->op1->name: "0");
    fprintf(stdout, ",%s", (tac->op2)? tac->op2->name: "0");
    fprintf(stdout, ");\n");
}

void tacPrintBackwards(TAC *tac){
    if (!tac)
        return;

    tacPrintBackwards(tac->prev);
    tacPrint(tac);
}


TAC *tacReverse(TAC *tac){
    TAC *t = tac;
    for(t = tac; t->prev; t = t->prev){
        t->prev->next = t;
    }
    return t;
}

TAC *tacJoin(TAC *l1, TAC *l2){
    TAC *point;

    if(!l1)
        return l2;
    if (!l2)
        return l1;
    
    for(point = l2; point->prev != 0; point = point->prev);

    point->prev = l1;
    return l2;
}

TAC *generateCode(AST *node){
    int i = 0;
    TAC *result = 0;
    TAC *code[MAX_SONS];

    if (!node)
        return 0;

    if(node->type == AST_FCALL){
        AST *args = node->son[0]->symbol->function->son[2];
        while(args){
            append_hash_list(args->son[0]->son[1]->symbol);
            args = args->son[1];
        }
    }

    for(i = 0; i < MAX_SONS; ++i){
        code[i] = generateCode(node->son[i]);
    }

    switch(node->type){
        case AST_GOTO: result = makeGOTO(code[0]); break;
        case AST_WHILE: result = makeWHILE(code[0], code[1]); break;
        case AST_IF_ELSE: result = makeIFELSE(code[0], code[1], code[2]); break;
        case AST_IF: result =  makeIF(code[0], code[1]); break;

        case AST_ARGL: result = makeARGL(code[0], code[1]); break;
        case AST_FCALL: result = makeFCALL(code[0], code[1]); break;

        case AST_READ: result = makeREAD(); break;

        case AST_DIF: result = makeOP(TAC_DIF, code[0], code[1]); break;
        case AST_EQ: result = makeOP(TAC_EQ, code[0], code[1]); break;
        case AST_GE: result = makeOP(TAC_GE, code[0], code[1]); break;
        case AST_LE: result = makeOP(TAC_LE, code[0], code[1]); break;
        case AST_GREAT: result = makeOP(TAC_GREAT, code[0], code[1]); break;
        case AST_LESS: result = makeOP(TAC_LESS, code[0], code[1]); break;
        case AST_DIV: result = makeOP(TAC_DIV, code[0], code[1]); break;
        case AST_MUL: result = makeOP(TAC_MUL, code[0], code[1]); break;
        case AST_SUB: result = makeOP(TAC_SUB, code[0], code[1]); break;
        case AST_ADD: result = makeOP(TAC_ADD, code[0], code[1]); break;

        case AST_EXPR_VEC: result = makeEXPR_VEC(code[0], code[1]); break;

        case AST_RET: result = makeRET(code[0]); break;

        case AST_PRINTL: result = makePRINTL(code[0], code[1]); break;

        case AST_ATTR_VEC: result = makeATTR_VEC(code[0], code[1], code[2]) ;break;
        case AST_ATTR:  result = makeATTR(code[0], code[1]); break;

        case AST_CMDL_ROT: result = makeCMDL_ROT(code[0], code[1]); break;

        case AST_DECL_FUNC: result = makeDECL_FUNC(code[0], code[1], code[2], code[3]); break;

        case AST_SYMBOL: result = makeSYMBOL(node); break;

        default: result = tacJoin(code[0], tacJoin(code[1], tacJoin(code[2], code[3]))); break;
    }

    return result;
}

TAC *makeDECL_FUNC(TAC *code0, TAC *code1, TAC *code2, TAC *code3){
    TAC *fdecbegtac = tacCreate(TAC_BEGFUN, code1? code1->res: 0, 0, 0);
    TAC *fdecendtac = tacCreate(TAC_ENDFUN, code1? code1->res: 0, 0, 0);

    return tacJoin(code0, tacJoin(code1, tacJoin(code2, tacJoin(fdecbegtac, tacJoin(code3, fdecendtac)))));
}

TAC *makeARGL(TAC *code0, TAC *code1){
    TAC *argtac = tacCreate(TAC_ARG, currentPar? (currentPar->val? currentPar->val: 0): 0, code0? code0->res: 0, 0);
    pop_hash_list();

    return tacJoin(code0, tacJoin(code1, argtac));
}

TAC *makeFCALL(TAC *code0, TAC *code1){
    TAC *ftac = tacCreate(TAC_CALL, makeTemp(), code0? code0->res: 0, 0);

    code1 = reverseArgs(code1);

    return tacJoin(code0, tacJoin(code1, ftac));
}

TAC *reverseArgs(TAC *code){
    TAC *firstArg = code;
    TAC *lastArg = code;
    TAC *prevArg = code;

    if(code == 0){
        return code;
    }

    code = code->prev;
    while(code != 0 && code->type == TAC_ARG){
        lastArg = code;
        code = code->prev;

        lastArg->prev = prevArg;
        prevArg = lastArg;
    }

    firstArg->prev = code;

    return lastArg;
}

TAC *makePRINTL(TAC *code0, TAC *code1){
    TAC *printtac = tacCreate(TAC_PRINT, code0? code0->res: 0, 0, 0);

    return tacJoin(code0, tacJoin(printtac, code1));
}

TAC *makeCMDL_ROT(TAC *code0, TAC *code1){
    TAC *labeltac = tacCreate(TAC_LABEL, code0? code0->res: 0, 0, 0);
    
    return tacJoin(code0, tacJoin(labeltac, code1));
}

TAC *makeRET(TAC *code0){
    TAC *rettac = tacCreate(TAC_RET, code0? code0->res: 0, 0, 0);

    return tacJoin(code0, rettac);
}

TAC *makeEXPR_VEC(TAC *code0, TAC *code1){
    TAC *exprtac = tacCreate(TAC_ACC_VEC, makeTemp(), code0? code0->res: 0, code1? code1->res: 0);

    return tacJoin(code0, tacJoin(code1, exprtac));
}

TAC *makeATTR(TAC *code0, TAC *code1){
    TAC *copytac = tacCreate(TAC_COPY, code0? code0->res: 0, code1? code1->res: 0, 0);

    return  tacJoin(code0, tacJoin(code1, copytac));
}

TAC *makeATTR_VEC(TAC *code0, TAC *code1, TAC *code2){
    TAC *copytac = tacCreate(TAC_COPY_VEC, code0? code0->res: 0, code1? code1->res: 0, code2? code2->res: 0);

    return tacJoin(code0, tacJoin(code1, tacJoin(code2, copytac)));
}

TAC *makeSYMBOL(AST *node){
    return tacCreate(TAC_SYMBOL, node->symbol, 0, 0);
}

TAC *makeOP(int type, TAC *code0, TAC *code1){
    TAC *optac = tacCreate(type, makeTemp(), code0? code0->res: 0, code1? code1->res: 0);

    return tacJoin(code0, tacJoin(code1, optac));
}

TAC *makeREAD(){
    return tacCreate(TAC_READ, makeTemp(), 0, 0);
}

TAC *makeGOTO(TAC *code0){
    TAC *jumptac = tacCreate(TAC_JUMP, code0? code0->res: 0, 0, 0);

    return tacJoin(code0, jumptac);
}

TAC *makeIF(TAC *code0, TAC *code1){
    HASH *newlabel = makeLabel();

    TAC *jumptac = tacCreate(TAC_JFALSE, newlabel, code0? code0->res: 0 , 0);
    jumptac->prev = code0;

    TAC *labeltac = tacCreate(TAC_LABEL, newlabel, 0, 0);
    labeltac->prev = code1;

    return tacJoin(jumptac, labeltac);
}

TAC *makeWHILE(TAC *code0, TAC *code1){
    HASH *labelwhile = makeLabel();
    HASH *labelend = makeLabel();

    TAC *labelwhiletac = tacCreate(TAC_LABEL, labelwhile, 0, 0);

    TAC *whiletac = tacCreate(TAC_JFALSE, labelend, code0? code0->res: 0 , 0);
    whiletac->prev = code0;

    TAC *jumptac = tacCreate(TAC_JUMP, labelwhile, 0, 0);
    jumptac->prev = code1;

    TAC *labelendtac = tacCreate(TAC_LABEL, labelend, 0, 0);

    return tacJoin(labelwhiletac, tacJoin(whiletac, tacJoin(jumptac, labelendtac)));
}

TAC *makeIFELSE(TAC *code0, TAC *code1, TAC *code2){
    HASH *labelelse = makeLabel();
    HASH *labelend = makeLabel();

    TAC *jumpelsetac = tacCreate(TAC_JFALSE, labelelse, code0? code0->res: 0 , 0);
    jumpelsetac->prev = code0;
    
    TAC *jumpendtac = tacCreate(TAC_JUMP, labelend, 0 , 0);
    jumpendtac->prev = code1;

    TAC *labelelsetac = tacCreate(TAC_LABEL, labelelse, 0, 0);

    TAC *labelendtac = tacCreate(TAC_LABEL, labelend, 0, 0);
    labelendtac->prev = code2;

    return tacJoin(jumpelsetac, tacJoin(jumpendtac, tacJoin(labelelsetac, labelendtac)));
}