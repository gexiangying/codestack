#ifndef _LPROC_H_
#define _LPROC_H_
#include <lua.h>
#include <pthread.h>
typedef struct _PROC{
	lua_State* L;
	pthread_t thread;
	pthread_cond_t cond;
	const char* channel;
	struct _PROC *previous,*next;
}Proc,*LProc;
#endif

