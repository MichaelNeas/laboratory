#include <stdio.h>

void guessNumber(int guess) {
	if (guess == 555) {
		printf("You guessed it!\n");
	} else if (guess < 555) {
		printf("Your guess is too low \n");
	} else { 
		printf("Your guess is too high\n");
	}
	return;
}

int main() {
	guessNumber(500);
	guessNumber(600);
	guessNumber(555);
}
