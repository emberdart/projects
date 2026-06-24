#ifndef LIB_LL_H
#define LIB_LL_H

typedef struct ll {
    char *value;
    struct ll* next;
} LL;

LL* newlist();

void* printlist(LL* list, int from);

LL* from_array(char *array[], int size);

void insert(char *value, LL* list);

#endif