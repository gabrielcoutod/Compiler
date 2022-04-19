 /* Made by Gabriel Couto Domingues */

#include "hash.h"
#include "val_list.h"
#include "string.h"

HASH **table;

void hashInit(void){
    table = (HASH **) calloc(HASH_SIZE, sizeof(HASH *));
}

int hashFunction(char *name){
    int hash = 1;
    int c;

    while (*name){
        c = *name;
        hash = (hash * c) % HASH_SIZE + 1;
        ++name;
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

void printAsm(FILE *fout){
    int i;
    fprintf(fout, "\n\n\n## DATA\n.section .data\n");

    for (i = 0; i < HASH_SIZE; ++i){
        HASH *list = table[i];

        if (list != NULL){
            while (list != NULL) {
                if(list->type == SYMBOL_VARIABLE || list->type == SYMBOL_VECTOR){
                    fprintf(fout, "_%s:\n", hashStringName(list)->name);
                    VAL_LIST *lst;
                    for(lst = list->vals; lst; lst = lst->next){
                        fprintf(fout, "\t.long\t%d\n", lst->val);
                    }
                } else if(list->type == SYMBOL_LITINT){
                    fprintf(fout, "_%s:\n", hashStringName(list)->name);
                    fprintf(fout, "\t.long\t%d\n", atoi(list->name));
                } else if(list->type == SYMBOL_LITCHAR){
                    fprintf(fout, "_%s:\n", hashStringName(list)->name);
                    fprintf(fout, "\t.long\t%d\n", list->name[1]);
                } else if(list->type == SYMBOL_STRING){
                    fprintf(fout, "_%s:\n", hashStringName(list)->name);
                    fprintf(fout, "\t.string\t%s\n", list->name);
                }

                list = list->next;
            }
        }
    }
}

char *string_with_alpha_under(char *str){
    char *new_str = (char *) calloc(strlen(str) + 1, sizeof(char));
    strcpy(new_str, str);

    int i;
    for(i = 0; new_str[i]; ++i){
        if(!((new_str[i] >= 'a' && new_str[i] <= 'z') || (new_str[i] >= 'A' && new_str[i] <= 'Z'))){
            new_str[i] = '_';
        }
    }
    return new_str;
}

HASH *hashStringName(HASH *par){
    static int serial = 0;
    char buffer[256] = "";

    if(par->ASMname){
        return par->ASMname;
    }

    sprintf(buffer, "NAME_%d_%s", serial++, string_with_alpha_under(par->name));
    HASH *h = hashInsert(buffer, SYMBOL_TEMP_NAME);

    par->ASMname = h;
    
    return h;
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
    HASH *h = hashInsert(buffer, SYMBOL_VARIABLE);
    h->ASMname = h;

    h->vals = (VAL_LIST*) calloc(1, sizeof(VAL_LIST));

    return h;
}

HASH *makeLabel(void){
    static int serial = 0;
    char buffer[256] = "";

    sprintf(buffer, "LABEL_%d", serial++);
    HASH *h = hashInsert(buffer, SYMBOL_LABEL);
    h->ASMname = h;

    return h;
}

void addValHash(HASH *node, int val){
    if(node->vals == NULL){
        node->vals = create_val_list(val);
    } else {
        append_val_list(node->vals, val);
    }
}