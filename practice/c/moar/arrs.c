#include <stdio.h>

int main() {
	int average;
	int grades[3];

	grades[0] = 80;
	grades[2] = 90;
	grades[1] = 85;

	average = (grades[0] + grades[1] + grades[2]) / 3;
	printf("Avge is: %d", average);
	return 0;
}
