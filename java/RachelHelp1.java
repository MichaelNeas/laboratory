import java.util.Scanner;

public class RachelHelp1 {
	public static void main(String[] args){
		Scanner kbd = new Scanner(System.in);
		System.out.print("Please enter a positive integer for your array size: ");
		int userInput = kbd.nextInt();
		int[] userArray = new int[userInput];
		int sum = 0;
		int max = 0;
		int space = 1;

		for(int i = 0; i < userInput; i++){
			System.out.print("What even number would you like to put in space number " + space + "?: ");
			int assignInt = kbd.nextInt();
			userArray[i] = assignInt;
			sum = sum + assignInt;
			space++;
			if(assignInt > max){
				max = assignInt; 
			}	
		}
		System.out.println("Your sum is: " + sum);
		System.out.println("The max number you entered is: " + max);
	}
}