CC=gcc
PRJ=lproc
INCPATH = -I/usr/local/include
LIBPATH = -L/usr/local/lib
LIBS = -llua
DEPS = $(PRJ).dep
SRCS := $(wildcard *.c)
HPPS := $(wildcard *.h)
OBJS := $(patsubst %.c,%.o,$(SRCS))
all: $(PRJ) $(DEPS)
$(PRJ):$(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBPATH) $(LIBS)
%.o:%.c
	$(CC) $(INCPATH) -c $<
$(DEPS):$(SRCS) $(HPPS)
	$(CC) -MM $(INCPATH) *.c >$(DEPS)
-include $(DEPS)
clean:
	-rm *.o $(PRJ) *.dep
