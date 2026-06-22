#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>

/*
int bracket(void *open, void *close, void *catch, void *op) {
    int ret = 
}
*/

/*
int withfile(char* filename, char* opts, void* catch, void* op) {
    FILE* file = fopen(filename, opts);
    return bracket(file, fclose, catch, op);
}
*/


int do_thing(char* filename) {
    FILE *file = fopen(filename, "w");
    if (NULL == file) {
        char *buf = malloc(100); /* Yeah, break it! This isn't prod code! */
        sprintf(buf, "fopen %s", filename);
        perror(buf);
        return 1;
    }

    int outchars = fprintf(file, "Hello %s! You are fd %d\n", filename, fileno(file));
    printf("Printed %d characters to %s.\n", outchars, filename);

    fclose(file);

    return 0;
}

int main() {
    /* FILE *in = fopen("/dev/stdin", "r"); */

    puts("Welcome to this funny program I'm sure you'd be able to exploit super well with your great knowledge of security.");

    char* files[] = {
        "/dev/stdout",
        "/dev/stderr",
        "/dev/tty",
        "/dev/null"
    };

    int i = 0;
    while (i < sizeof(files)/sizeof(char*) && do_thing(files[i++]) == 0) {
    }
}