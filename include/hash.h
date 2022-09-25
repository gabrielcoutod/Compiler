 /* Made by Gabriel Couto Domingues */

#ifndef HASH_H
#define HASH_H

#include <stddef.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "val_list.h"

#define HASH_SIZE 997

#define SYMBOL_IDENT 1
#define SYMBOL_LITINT 2
#define SYMBOL_LITCHAR 3
#define SYMBOL_STRING 4
#define SYMBOL_FUNCTION 5
#define SYMBOL_VARIABLE 6
#define SYMBOL_VECTOR 7
#define SYMBOL_LABEL 8
#define SYMBOL_TEMP_NAME 9

#define DATATYPE_INT 1
#define DATATYPE_CHAR 2
#define DATATYPE_FLOAT 3
#define DATATYPE_BOOL 4

struct astnode *function;

typedef struct HashStruct {
    int type;
    char *name;
    int datatype;
    int datatypeFunction;
    struct HashStruct *next;
    struct astnode *function;
    struct HashStruct *ASMname;
    VAL_LIST *vals;
    int vecSize;
} HASH;

// Create empty table.
void hashInit(void);

// Hash Function (same as the one shown in class).
int hashFunction(char *name);

// Inserts a name with a type in the hash table.
HASH *hashInsert(char *name, int type);

// Frees the hash table.
void hashFree(void);

// Prints the table. For debugging purposes.
void hashPrint(void);

void printAsm(FILE *fout);

// Finds the entry associated with the given name.
HASH *hashFind(char *name);

HASH *makeTemp(void);

HASH *makeLabel(void);

void addValHash(HASH *node, int val);

HASH *hashStringName(HASH *par);

#endif