 /* Made by Gabriel Couto Domingues */

#include "hash.h"

HASH **table;

void hashInit(void){
    table = (HASH **) calloc(HASH_SIZE, sizeof(HASH *));
}

int hashFunction(char *name){
    int hash = 1;
    int c;

    while (c = *name++){
        hash = (hash * c) % HASH_SIZE + 1;
    }
    
    return hash - 1;
}

HASH *hashInsert(char *name, int type){

    HASH *temp = hashFind(name);

    if (temp != NULL)
        return temp;

    HASH *newNode = (HASH *) calloc(1, sizeof(HASH));
    char *newName = (char *) calloc(strlen(name) + 1, sizeof(char));
    strcpy(newName, name);

    int pos = hashFunction(name);
    HASH *list = table[pos];

    newNode->type = type;
    newNode->name = newName;
    newNode->next = list;
    
    table[pos] = newNode;

    return newNode;
}

void hashFree(void){
    int i;

    for (i = 0; i < HASH_SIZE; ++i) {
        HASH *list = table[i];

        while (list != NULL) {
            HASH *prev = list;
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
        HASH *list = table[i];

        if (list != NULL){
            printf("Table[%d]: ", i);

            while (list != NULL) {
                printf("(str=%s type=%d datatype=%d) ", list->name, list->type, list->datatype);
                list = list->next;
            }
            printf("\n");
        }
    }
}

HASH *hashFind(char *name){
    int pos = hashFunction(name);
    HASH *list = table[pos];

    while (list != NULL) {
        if (strcmp(list->name, name) == 0){
            return list;
        }
        list = list->next;
    }

    return NULL;
}

HASH *makeTemp(void){
    static int serial = 0;
    char buffer[256] = "";

    sprintf(buffer, "TEMP_%d", serial++);
    return hashInsert(buffer, SYMBOL_VARIABLE);
}

HASH *makeLabel(void){
    static int serial = 0;
    char buffer[256] = "";

    sprintf(buffer, "LABEL_%d", serial++);
    return hashInsert(buffer, SYMBOL_LABEL);
}