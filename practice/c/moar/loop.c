#include <stdio.h>
#define NUM(a) (sizeof(a) / sizeof(*a))

int main() {
	int array[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
	int factorial = 1;
        int i;

	for(i = 0; i < NUM(array); i++) {
		factorial = array[i] * factorial;
		printf("%d \n", factorial);
	}
	printf("10! is %d.\n", factorial);
}
