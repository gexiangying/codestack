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
	char msg[1024] = {0};
	unsigned long count = 0;
	HANDLE hStdOut=GetStdHandle(STD_OUTPUT_HANDLE);
	if(hStdOut == INVALID_HANDLE_VALUE )
		return 0;
	va_list argList;
  va_start(argList, format);
  _vsnprintf(msg,1023,format,argList);
  va_end(argList);
	WriteFile(hStdOut,msg,strlen(msg),&count,NULL);
	return count;
}
