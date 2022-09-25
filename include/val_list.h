 /* Made by Gabriel Couto Domingues */

#ifndef VAL_LIST_H
#define VAL_LIST_H

#include <stddef.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct val_list {
    struct val_list *next;
    int val;
} VAL_LIST;


VAL_LIST *create_val_list(int val);
void append_val_list(VAL_LIST *lst, int val);

#endif