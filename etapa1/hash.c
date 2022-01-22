#include "hash.h"

Hash **hash_create_empty_table(){
    Hash **table = (Hash **)calloc(HASH_SIZE, sizeof(Hash *));
    return table;
}

int hash_function(char *name){
    unsigned long hash = 5381;
    int c;

    while (c = *name++){
        hash = ((hash << 5) + hash) + c;
    }
    
    return hash % HASH_SIZE;
}

void hash_insert(Hash **table, char *name, int type){
    Hash *newNode = (Hash *)calloc(1, sizeof(Hash));
    char *newName = (char *)calloc(strlen(name), sizeof(char));
    strcpy(newName, name);

    newNode->type = type;
    newNode->name = newName;
    newNode->next = NULL;

    int pos = hash_function(name);
    Hash *list = table[pos];

    newNode->next = list;
    table[pos] = newNode;
}

void hash_free(Hash **table){
    int i;

    for (i = 0; i < HASH_SIZE; ++i) {
        Hash *list = table[i];
        Hash *prev;

        while (list != NULL) {
            prev = list;
            list = list->next;

            free(prev->name);    
            free(prev);
        }
    }
}

void hash_print(Hash **table){
    int i;
    for (i = 0; i < HASH_SIZE; ++i){
        Hash *list = table[i];

        if (list != NULL){
            printf("%d ", i);

            while (list != NULL) {
                printf("(%s %d)", list->name, list->type);
                list = list->next;
            }
        }
    }
}

Hash *hash_find(Hash **table, char *name){
    int pos = hash_function(name);
    Hash *list = table[pos];

    while (list != NULL) {
        if (strcmp(list->name, name) == 0){
            return list;
        }
        list = list->next;
    }

    return NULL;
}