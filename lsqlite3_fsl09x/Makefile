#BIN = /cygdrive/d/MinGWStudio/MinGw/bin/
#BIN = /cygdrive/c/mingw/bin/
CC = $(BIN)gcc 
PRJ = lsqlite3
INCPATH = -I/usr/local/include
LIBPATH = -L/usr/local/lib
LIBS = -llua 
LDFLAGS = -pipe -shared 
DEPS = $(PRJ).dep
EXP = $(PRJ).exp
SRCS :=$(wildcard *.c)
HPPS :=$(wildcard *.h)
OBJS :=$(patsubst %.c,%.o,$(SRCS))
all:$(PRJ).dll $(DEPS) tags
tags:$(SRCS) $(HPPS)
	ctags -R .
$(PRJ).dll :$(OBJS)  $(EXP)
	$(CC) -o $@ $(EXP) $(OBJS)  $(LIBPATH) $(LIBS) $(LDFLAGS)
$(EXP):$(PRJ).def
	dlltool -e $@ -d $< --no-export-all-symbols
%.o:%.c	
	$(CC) $(CFLAGS) $(C_PROC) $(INCPATH) -c $< 
$(DEPS):$(SRCS) $(HPPS)
	$(CC) -MM $(INCPATH) *.c >$(DEPS)
-include $(DEPS)
install:
	cp $(PRJ).dll bin/
clean:
	-@rm *.o $(PRJ).dll *.dep *.exp
