
CFLAGS  := $(shell pkg-config luajit --cflags)
LDLIBS  := $(shell pkg-config luajit --libs)
LDFLAGS := -shared -fpic

all: hello.so

hello.so: hello.c
	$(CC) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $< -o $@ $(LDLIBS)

hello.dll: hello.c
	$(CC) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $< -o $@ $(LDLIBS)

hello.dylib: hello.c
	$(CC) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $< -o $@ $(LDLIBS)

clean:
	$(RM) hello.so

