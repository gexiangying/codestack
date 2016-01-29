#BIN = /cygdrive/d/MinGWStudio/MinGw/bin/
#BIN = /cygdrive/c/mingw/bin/
CC = $(BIN)gcc 
PRJ = crypto
#CFLAGS = -mno-cygwin
CFLAGS = 
ifeq ($(notrace),1)
C_PROC= 
else
C_PROC = -DENABLE_TRACE
endif
ifeq ($(test),1)
C_PROC += -DENABLE_TEST
endif
INCPATH = -I/usr/local/include
LIBPATH = -L/usr/local/lib
LIBS = -ltrace -llua -lcrypto -lgdi32
#LDFLAGS = -mwindows -mno-cygwin
LDFLAGS = -pipe -shared -static
DEPS = $(PRJ).dep
EXP = $(PRJ).exp
SRCS :=$(wildcard *.c)
HPPS :=$(wildcard *.h)
OBJS :=$(patsubst %.c,%.o,$(SRCS))
RRCS :=$(wildcard *.rc)
RRCS_OBJS :=$(patsubst %.rc,%.res,$(RRCS))
WINDRES = $(BIN)windres
all:$(PRJ).dll $(DEPS) tags
tags:$(SRCS) $(HPPS)
	ctags -R .
$(PRJ).dll :$(OBJS) $(RRCS_OBJS) $(EXP)
	$(CC) -o $@ $(EXP) $(OBJS) $(RRCS_OBJS) $(LIBPATH) $(LIBS) $(LDFLAGS)
$(EXP):$(PRJ).def
	dlltool -e $@ -d $< --no-export-all-symbols
%.o:%.c	
	$(CC) $(CFLAGS) $(C_PROC) $(INCPATH) -c $< 
%.res:%.rc
	$(WINDRES) -O COFF -i "$<" -o "$@"
$(DEPS):$(SRCS) $(HPPS)
	$(CC) -MM $(INCPATH) *.c >$(DEPS)
#-@if test ! -r "$(DEPS)";then echo>$(DEPS);fi
#	makedepend  -f$(DEPS)>&/dev/null *.c
-include $(DEPS)
install:
	cp $(PRJ).dll tests/
clean:
	-@rm *.o $(PRJ).dll *.dep *.exp
