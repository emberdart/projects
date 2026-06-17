#include <stdio.h>

int main(int argc, char *argv[])
{
    for(short i=0; i<argc; i++) {
        printf("%hu arg is %s at %p\n", i, argv[i], &argv[i]);
    }
    return 0;
}
