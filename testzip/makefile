CC = $(BIN)gcc
INCPATH = -I/usr/local/include
LIBPATH = -L/usr/local/lib
LIBS = -lzip
all:test.exe
test.exe:main.o 
	$(CC) -o $@ main.o  $(LIBPATH) $(LIBS)
%.o:%.c
	$(CC) $(INCPATH) -c $<
