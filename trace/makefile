#BIN = /cygdrive/d/MinGWStudio/MinGw/bin/
#BIN = /cygdrive/c/mingw/bin/
CC = $(BIN)gcc 
PRJ = trace
INCPATH = -I/usr/local/include
LIBPATH = -L/usr/local/lib
EXP = $(PRJ).exp
SRCS :=$(wildcard *.c)
HPPS :=$(wildcard *.h)
OBJS :=$(patsubst %.c,%.o,$(SRCS))
all:$(PRJ).dll 
$(PRJ).dll :$(OBJS) 
	$(CC) -o $@ $(OBJS) -shared -Wl,--out-implib,lib$(PRJ).a 
%.o:%.c	
	$(CC) -c $< 
install:
	cp $(PRJ).dll /usr/local/bin
	cp $(HPPS) /usr/local/include
	cp lib$(PRJ).a /usr/local/lib
clean:
	-@rm *.o $(PRJ).dll  *.exp
