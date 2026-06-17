/* Stolen from https://www.youtube.com/watch?v=o9iZucYSkQA */

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int die(char* reason) {
    perror(reason);
    return EXIT_FAILURE;
}

int main() {
    int fd = open("/etc/passwd", O_RDONLY);

    if (fd == -1) {
        return die("open");
    }


    int count = 80;
    char buf[count + 1];
    ssize_t n = read(fd, &buf, count);

    if (n < 1) {
        die("read");
    }

    buf[80] = '\0';

    printf("read data: %s\n", buf);

    int closed = close(fd);

    if (closed == -1) {
        die("close");
    }

    return 0;

}