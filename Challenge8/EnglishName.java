package challenge8;

import java.util.Scanner;

/* Write a program that will print the english name of a value. for example, "1211" would become
 * "one-thousand, two hundred, eleven".
 * for extra credit, allow it to read the english value of a number and output the integer.
 * input: one-hundred, four output: 104
 * Challenge 8 intermediate
 */
public class EnglishName {
	static Scanner numberInput = new Scanner(System.in);
	static String digitArray[] = {"", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"};
	static String numTeens[] = {"eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eightteen", "nineteen"};
	static String tensArray[] = {"ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninty"};
	static String returnString = "";
	
	public static void getFirstInt(int someNumber){
		char firstInt = String.valueOf(someNumber).charAt(0);
		int arrayLocation = Integer.parseInt(Character.toString(firstInt));
		if(String.valueOf(someNumber).length() == 2){
			returnString += tensArray[arrayLocation-1];
		}
		else{
			returnString += digitArray[arrayLocation];
		}
	}
	
	public static void getFirstIntdigits(int someNumber){
		char firstInt = String.valueOf(someNumber).charAt(0);
		int arrayLocation = Integer.parseInt(Character.toString(firstInt));
		returnString += tensArray[arrayLocation-1];
	}
	
	
	public static void intToWords(int inputNumber, int lengthOfNumber){
		
		switch(lengthOfNumber){
		case 1:
			returnString += digitArray[inputNumber];
			break;
		case 2:
			if(inputNumber < 20 && inputNumber > 10){
				returnString += numTeens[inputNumber-11];
			}else{
				getFirstInt(inputNumber);
				intToWords(inputNumber%10, lengthOfNumber-1);
			}
			break;
		case 3:
			getFirstInt(inputNumber);
			returnString += "-hundred-";
			intToWords(inputNumber%100, lengthOfNumber-1);
			break;
		case 4:
			getFirstInt(inputNumber);
			returnString += "-thousand-";
			intToWords(inputNumber%1000, lengthOfNumber-1);
			break;
		default:
			returnString += "Sorry haven't accounted for a number that large!";
			break;
		}
	}
	
	public static void wordsToInt(String inputString){
		System.out.println("word");
	}
	
	public static void main(String[] args) {
		System.out.println("Enter in a number value or words for a number value");
		String scannedType = numberInput.nextLine();
		try{
			int myNumber = Integer.parseInt(scannedType);
			int myNumberLength = scannedType.length();
			intToWords(myNumber, myNumberLength);
			System.out.println(returnString);
		}
		catch (Exception e){
			wordsToInt(scannedType);
		}
	}

}
