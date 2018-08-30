#include <stdio.h>

int main(int argc, char *argv[]){
	int areas[] = {10, 20, 30, 40, 50};
	char name[] = "Zed";
	char fullName = {'Z', 'e', 'd', ' ', 'A', '.', 'S', 'h', 'a', 'w', '\O'};

	printf("The size of an int: %ld\n" , sizeof(int));
	printf("The size of areas int array: %ld\n", sizeof(areas));
	printf("The first area is %d, the second is %d\n", areas[0], areas[1]);
	printf("The size of a char: %ld\n", sizeof(char));
	printf("The size of name array %ld\n", sizeof(name));
	printf("The number of chars: %ld\n", sizeof(name)/sizeof(char));
	printf("The size of full name %ld\n", sizeof(fullName));
	printf("The number of chars: %ld\n", sizeof(fullName) / sizeof(char));
	
	return 0;
}
