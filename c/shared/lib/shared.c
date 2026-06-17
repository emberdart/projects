#include <stdio.h>

char *data = "Data";

char *fn(char *param) {
    static char *out; /* or malloc - you can't return a stack allocation */
    sprintf(out, "!! %s !!\n", param);
    // printf(out);
    return out;
}

void io(char *param) {
    printf("!! %s !!\n", param);
}