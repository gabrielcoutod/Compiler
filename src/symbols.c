
#include "symbols.h"
#include "hash.h"

SymbolList *symbolList;

void startSymbols(){
    symbolList = 0;
}
void addSymbols(HASH *node){
    if(symbolList == 0){
        symbolList = (SymbolList*) calloc(1, sizeof(SymbolList));
        symbolList->symb = node;
    } else {
        SymbolList *temp;
        temp = (SymbolList*) calloc(1, sizeof(SymbolList));
        temp->symb = node;

        temp->next = symbolList;
        symbolList = temp;
    }
}

void emptySymbols(){
    while(symbolList != 0){
        SymbolList *temp;

        symbolList->symb->type = SYMBOL_IDENT;
        
        temp = symbolList;
        symbolList = symbolList->next;
        free(temp);
    }
}