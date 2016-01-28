CC = $(BIN)gcc
INCPATH = -I/usr/include
LIBPATH = -L/usr/lib
LIBS = -llua5.1
all:test.exe
test.exe:main.o ap2d.o
	$(CC) -o $@ main.o ap2d.o $(LIBPATH) $(LIBS)
%.o:%.c
	$(CC) $(INCPATH) -c $<
