CC = gcc
CFLAGS = -Wall
CFLAGS_build/exe/dlopen = -rdynamic -ldl
LDFLAGS =
EXECUTABLES = build/exe/dlopen build/exe/game
SHARED_LIBRARIES = build/lib/preload.so build/lib/shared.so build/lib/darkside.so build/lib/derand.so build/lib/evilstrs.so build/lib/memfuck.so build/lib/wrap.so build/lib/memlog.so

.PHONY: all

all: build/exe build/lib $(EXECUTABLES) $(SHARED_LIBRARIES)

build/exe:
	mkdir -p build/exe

build/lib:
	mkdir -p build/lib

%.o: %.c
	$(CC) $(CFLAGS) $(CFLAGS_$@) $< -c -o $@

build/exe/%: src/%.o
	$(CC) $(CFLAGS) $(CFLAGS_$@) -emain -lc $< -o $@

build/lib/%.so: lib/%.o
	$(CC) $(CFLAGS) $(CFLAGS_$@) -shared -fPIC $< -o $@

clean:
	$(RM) -r src/*.o lib/*.o build