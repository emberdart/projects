/* stolen from https://www.youtube.com/watch?app=desktop&v=4KdvcQKNfbQ */
#include <assert.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    int value;
    uintptr_t xored;
} Node;

Node *node_create(int value) {
    Node *node = malloc(sizeof(*node));
    memset(node, 0, sizeof(*node));
    node->value = value;
    return node;
}

typedef struct {
    Node *begin;
    Node *end;
} Linked_List;

void ll_append(Linked_List *ll, int value) {
    if (ll->end == NULL) {
        assert(ll->begin == NULL);
        ll->end = node_create(value);
        ll->begin = ll->end;
    } else {
        Node *node = node_create(value); 
        node->xored = (uintptr_t)ll->end;
        ll->end->xored ^= (uintptr_t)node;
        ll->end = node;
    }
}

Node *node_next(Node *node, uintptr_t *prev) {
    Node *next = (Node*)(node->xored^(*prev));
    *prev = (uintptr_t)node;
    return next;
}


int main() {
    Linked_List xs = {0};
    for (int x = 5; x<=10; x++) {
        ll_append(&xs, x);
    }
    uintptr_t prev;
    
    prev = 0;
    for (Node *iter = xs.begin; iter; iter = node_next(iter, &prev)) {
        printf("%d\n", iter->value);
    }

    // And I wanted to see what would happen with this part!

    prev = 0;
    for (Node *iter = xs.end; iter; iter = node_next(iter, &prev)) {
        printf("%d\n", iter->value);
    }

    return 0;
}


