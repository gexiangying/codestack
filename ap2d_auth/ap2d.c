#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"
#include "ap2d.h"
int login()
{
	int result = 0;
	lua_State* L = lua_open();
	luaL_openlibs(L);
#include "ap2d.loh"
	lua_getglobal(L,"logined");
	result = lua_toboolean(L,-1);
	lua_pop(L,1);
	lua_close(L);

	return result;
}
