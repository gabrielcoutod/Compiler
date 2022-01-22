


#ifndef HASH_H
#define HASH_H

#include <stddef.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#define HASH_SIZE 1024

typedef struct HashStruct {
    int type;
    char *name;
    struct HashStruct *next;
} Hash;

// Create empty table
Hash **hash_create_empty_table();

// Hash Function with djb2 algorithm.
int hash_function(char *name);

// Inserts a name with a type in the hash table.
void hash_insert(Hash **table, char *name, int type);

// Frees the hash table.
void hash_free(Hash **table);

// Prints the table. For debugging purposes.
void hash_print(Hash **table);

Hash *hash_find(Hash **table, char *name);

#endif