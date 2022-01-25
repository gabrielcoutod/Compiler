 /* Feito por Gabriel Couto Domingues */

#include "hash.h"

Hash **table;

void hashInit(void){
    table = (Hash **) calloc(HASH_SIZE, sizeof(Hash *));
}

int hashFunction(char *name){
    int hash = 1;
    int c;

    while (c = *name++){
        hash = (hash * c) % HASH_SIZE + 1;
    }
    
    return hash - 1;
}

void hashInsert(char *name, int type){

    if (hashFind(name) != NULL)
        return;

    Hash *newNode = (Hash *) calloc(1, sizeof(Hash));
    char *newName = (char *) calloc(strlen(name) + 1, sizeof(char));
    strcpy(newName, name);

    int pos = hashFunction(name);
    Hash *list = table[pos];

    newNode->type = type;
    newNode->name = newName;
    newNode->next = list;
    
    table[pos] = newNode;
}

void hashFree(void){
    int i;

    for (i = 0; i < HASH_SIZE; ++i) {
        Hash *list = table[i];

        while (list != NULL) {
            Hash *prev = list;
            list = list->next;

            free(prev->name);    
            free(prev);
        }
    }

    free(table);
    table = NULL;
}

void hashPrint(void){
    int i;
    for (i = 0; i < HASH_SIZE; ++i){
        Hash *list = table[i];

        if (list != NULL){
            printf("Table[%d]: ", i);

            while (list != NULL) {
                printf("(str=%s type=%d) ", list->name, list->type);
                list = list->next;
            }
            printf("\n");
        }
    }
}

Hash *hashFind(char *name){
    int pos = hashFunction(name);
    Hash *list = table[pos];

    while (list != NULL) {
        if (strcmp(list->name, name) == 0){
            return list;
        }
        list = list->next;
    }

    return NULL;
}