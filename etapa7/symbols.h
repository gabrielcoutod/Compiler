
#ifndef SYMBOLS_H
#define SYMBOLS_H

#include "hash.h"

typedef struct SYMBOLLIST{
    HASH *symb;
    struct SYMBOLLIST *next;
} SymbolList;

void startSymbols(void);
void addSymbols(HASH *node);
void emptySymbols(void);


#endif