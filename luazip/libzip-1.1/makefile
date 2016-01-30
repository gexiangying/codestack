PRJ =	zip
CC = gcc
DLL = lib$(PRJ)-4.dll 
CFLAGS = -D_WIN32 -DHAVE_CONFIG_H -DPIC
INCPATH = -I/usr/local/include
LIBPATH = -L/usr/local/lib
LIBS = -lz
#EXP = $(PRJ).exp
SRCS :=$(wildcard *.c)
HPPS :=$(wildcard *.h)
OBJS :=$(patsubst %.c,%.o,$(SRCS))
all:$(DLL)
$(DLL):$(OBJS) 
	$(CC) -o $@ $(OBJS) $(LIBPATH) $(LIBS) -shared -Wl,--out-implib,lib$(PRJ).dll.a 
%.o:%.c	
	$(CC) $(CFLAGS) $(INCPATH) -c $< 
install:
	cp $(DLL) /usr/local/bin
	cp $(DLL) /ge/gcad/bin
	cp lib$(PRJ).dll.a /usr/local/lib
clean:
	-@rm *.o $(DLL)
