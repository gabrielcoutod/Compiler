


 /* Made by Gabriel Couto Domingues */

#ifndef HASH_H
#define HASH_H

#include <stddef.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#define HASH_SIZE 997

typedef struct HashStruct {
    int type;
    char *name;
    struct HashStruct *next;
} Hash;

// Create empty table.
void hashInit(void);

// Hash Function (same as the one shown in class).
int hashFunction(char *name);

// Inserts a name with a type in the hash table.
Hash *hashInsert(char *name, int type);

// Frees the hash table.
void hashFree(void);

// Prints the table. For debugging purposes.
void hashPrint(void);

// Finds the entry associated with the given name.
Hash *hashFind(char *name);

#endif