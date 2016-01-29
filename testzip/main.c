#include <stdio.h>
#include <zip.h>
int main(int argc,char* argv[])
{
	struct zip* z;
	int errorp;
	z = zip_open("testzip.zip",0,&errorp);
	if(zip_delete(z,1) != 0){
		printf("zip_delete error!\n");
	}
	if(zip_close(z) != 0){
		printf("zip_close error!\n");
	}
	return 0;
}
