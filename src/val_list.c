#include "val_list.h"

VAL_LIST *create_val_list(int val){
    VAL_LIST *newnode = (VAL_LIST*) calloc(1, sizeof(VAL_LIST));
    newnode->val = val;
    newnode->next = 0;

    return newnode;
}

void append_val_list(VAL_LIST *lst, int val){
    VAL_LIST *newnode = (VAL_LIST*) calloc(1, sizeof(VAL_LIST));
    
    newnode->val = val;
    newnode->next = 0;

    while (lst->next)
        lst = lst->next;

    lst->next = newnode;
}