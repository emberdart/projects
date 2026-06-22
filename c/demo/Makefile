CC = gcc
CFLAGS = -O2 -Wall -g -lm -L./lib
CFLAGS_src/two.o = -Wno-strict-aliasing
LD = ld
LDFLAGS = -g -lc -lm
LIBS = build/lib/libheap.so build/lib/libll.so
PLAIN_EXECUTABLES = build/exe/one build/exe/two build/exe/three build/exe/four build/exe/five build/exe/six build/exe/hacker build/exe/spinner build/exe/fake-exception build/exe/xorptr build/exe/duplicate build/exe/fd build/exe/pipes
LIB_EXECUTABLES = build/exe/heap build/exe/ll

.PHONY: all

all: build/exe build/lib $(PLAIN_EXECUTABLES) $(LIB_EXECUTABLES) $(LIBS)

build/lib:
	mkdir -p build/lib

build/exe:
	mkdir -p build/exe

%.o: %.c
	$(CC) $(CFLAGS) $(CFLAGS_$@) $< -c -o $@

build/lib/%.so: lib/%.o
	$(CC) $(CFLAGS) $(CFLAGS_$@) -shared -fPIC $< -o $@

build/exe/ll: lib/libll.o src/ll.o
	$(CC) $(CFLAGS) $(CFLAGS_$@) lib/libll.o src/ll.o -o $@

build/exe/heap: lib/libheap.o src/heap.o
	$(CC) $(CFLAGS) $(CFLAGS_$@) lib/libheap.o src/heap.o -o $@

build/exe/%: src/%.o
	$(CC) $(CFLAGS) $(CFLAGS_$@) $< -o $@

clean:
	$(RM) -r build src/*.o lib/*.o