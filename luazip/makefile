CC = $(BIN)gcc 
PRJ = luazip
CFLAGS = 
C_PROC =
INCPATH = -I/usr/local/include
LIBPATH = -L/usr/local/lib
LIBS = -llua -lzip.dll
LDFLAGS = -pipe -shared -static
EXP = $(PRJ).exp
SRCS :=$(wildcard *.c)
HPPS :=$(wildcard *.h)
OBJS :=$(patsubst %.c,%.o,$(SRCS))
all:$(PRJ).dll tags
tags:$(SRCS) $(HPPS)
	ctags -R .
$(PRJ).dll :$(OBJS) $(EXP)
	$(CC) -o $@ $(LDFLAGS) $(EXP) $(OBJS) $(LIBPATH) $(LIBS) 
$(EXP):$(PRJ).def
	dlltool -e $@ -d $< --no-export-all-symbols
%.o:%.c	
	$(CC) $(CFLAGS) $(C_PROC) $(INCPATH) -c $< 
clean:
	-@rm *.o $(PRJ).dll *.exp
