#include <stdio.h> //include imports contents of one file into this source file, .h is a header file with lists of functions you want to use in your program

/*
* The os loads your program and runs the function named main,
* In order fo the function to be complete it needs to return an int and take 2 parameters:
*	Int - argument control
*	char * - strings for the arguments
*/


int main(int argc, char *argv[]){
	int distance =100;
	float power = 2.345f;
	double superPower = 56789.4523;
	char initial = 'A';
	char firstName[] = "Zed";
	char lastName[] = "Shaw";	

	//also a comment
	printf("you are %d miles away. \n", distance);
	printf("You have %f levels of power. \n", power);
	printf("You have %f awesome super powers.\n", superPower);
	printf("full name is %s, %c, %s! \n",firstName, initial, lastName); 	


	return 0;
}

