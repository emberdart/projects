CC = gcc
CFLAGS = -Wall -g -lm -L./lib
LD = ld
LDFLAGS = -g -lc -lm
LIBS = build/lib/libheap.so build/lib/libll.so
PLAIN_EXECUTABLES = build/exe/one build/exe/two build/exe/three build/exe/four build/exe/five build/exe/six build/exe/hacker build/exe/spinner build/exe/fake-exception build/exe/xorptr build/exe/duplicate build/exe/fd
LIB_EXECUTABLES = build/exe/heap build/exe/ll

.PHONY: all

all: build/exe build/lib $(PLAIN_EXECUTABLES) $(LIB_EXECUTABLES) $(LIBS)

build/lib:
	mkdir -p build/lib

build/exe:
	mkdir -p build/exe

%.o: %.c
	$(CC) $(CFLAGS) $< -c -o $@

build/lib/%.so: lib/%.o
	$(CC) $(CFLAGS) -shared -fPIC $< -o $@

build/exe/ll: lib/libll.o src/ll.o
	$(CC) $(CFLAGS) lib/libll.o src/ll.o -o $@

build/exe/heap: lib/libheap.o src/heap.o
	$(CC) $(CFLAGS) lib/libheap.o src/heap.o -o $@

build/exe/%: src/%.o
	$(CC) $(CFLAGS) $< -o $@

clean:
	$(RM) -r build src/*.o lib/*.o