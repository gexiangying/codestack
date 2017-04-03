#define TRACE_DLL
#include "trace.h"
#include <windows.h>
#include <stdio.h>
#include <stdarg.h>
int TraceInit()
{
	return AllocConsole();
}
int TraceClose()
{
	return FreeConsole();
}
int TraceOut(char* format,...)
{
	unsigned long count = 0;
	HANDLE hStdOut=GetStdHandle(STD_OUTPUT_HANDLE);
	if(hStdOut == INVALID_HANDLE_VALUE )
		return 0;
	va_list argList;
  va_start(argList, format);
	int size = _vscprintf(format,argList);
	char* msg = calloc(size + 1,sizeof(char));
	if(msg != NULL){
		_vsnprintf(msg,size + 1,format,argList);
		va_end(argList);
		WriteFile(hStdOut,msg,size + 1,&count,NULL);
		free(msg);
	}
	return count;
}
