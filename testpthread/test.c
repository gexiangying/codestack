#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <windows.h>
#define NUM_THREADS     8

void *PrintHello(void *threadid)
{
	long taskid;
	//sleep(1);
	taskid = *(long *)threadid;
	printf("Hello from thread %ld\n", taskid);
	fflush(stdout);
	free(threadid);
	//pthread_exit(NULL);
	return 0;
}

int main(int argc, char *argv[])
{
	pthread_t threads[NUM_THREADS];
	int rc;
	long t;

	for(t=0;t<NUM_THREADS;t++) {
		printf("Creating thread %ld\n", t);
		long* a = (long*)malloc(sizeof(LONG));
		*a = t;
		rc = pthread_create(&threads[t], NULL, PrintHello, (void *)a);
		if (rc) {
			printf("ERROR; return code from pthread_create() is %d\n", rc);
			exit(-1);
		}
		//pthread_detach(threads[t]);
	 fflush(stdout);	
	}
	for( t = 0 ; t < NUM_THREADS; t++) {
		void* status;
		pthread_join(threads[t],&status);
	}
	//pthread_exit(NULL);
	//getchar();
}
