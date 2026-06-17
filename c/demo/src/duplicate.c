#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define MAX 100
#define SIZE 101

int xs[SIZE];

int main() {
    srand(time(0));

    /* Generate it */
    int dup = rand() % MAX + 1;
    printf("dup = %d\n", dup);

    /* Form the array */
    for (int i = 1; i <= MAX; i++) {
        if (i == dup) {
            printf("Mwahahaha adding an extra %d\n", i);
            xs[MAX] = i;
        }
        xs[i - 1] = i;
    }

    /* Initial xorage for comparison */
    int x = 0;
    for (int i = 0; i <= MAX; i++) {
        x ^= i;
    }

    /* Find it */
    size_t n = sizeof(xs)/sizeof(xs[0]);
    for (int i = 0; i < n; i++) {
        x ^= xs[i];
    }

    printf("Found it! x = %d", x);

    return 0;
}