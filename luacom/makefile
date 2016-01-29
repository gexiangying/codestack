CC = $(BIN)g++
PRJ = luacom
CFLAGS = -DWIN32 -D_CRT_SECURE_NO_DEPRECATE -DLUA_COMPAT_MODULE -DNLUA51 -DLUACOM_DLL=\"luacom.dll\" -DNO_HTMLHELP
INCPATH = -I/usr/local/include
LIBPATH = -L/usr/local/lib
LIBS = -lkernel32 -luser32 -lshell32 -ladvapi32 -lole32 -lwinspool -luuid -loleaut32 -lshlwapi -lgdi32 -llua
LDFLAGS = -pipe -shared 
EXP = $(PRJ).exp
SRCS :=$(wildcard *.cpp)
HPPS :=$(wildcard *.h)
OBJS :=$(patsubst %.cpp,%.o,$(SRCS))
all:$(PRJ).dll tags
tags:$(SRCS) $(HPPS)
	ctags -R .
$(PRJ).dll :$(OBJS) $(EXP) 
	$(CC) -o $@ $(EXP) $(OBJS) $(LIBPATH) $(LIBS) $(LDFLAGS)
luacom.o:luacom.cpp luacom5.loh
	$(CC) $(CFLAGS) $(C_PROC) $(INCPATH) -c $< 
luacom5.loh:luacom5.lua
	bin2c.lua +luacom5.lua >luacom5.loh
$(EXP):$(PRJ).def
	dlltool -e $@ -d $< --no-export-all-symbols
%.o:%.cpp	
	$(CC) $(CFLAGS) $(C_PROC) $(INCPATH) -c $< 
install:
	cp $(PRJ).dll /usr/local/bin
	cp $(PRJ).dll /ge/gcad/bin
clean:
	-@rm *.o $(PRJ).dll *.exp *.loh
