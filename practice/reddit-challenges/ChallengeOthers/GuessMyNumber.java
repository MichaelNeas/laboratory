//Michael Neas, Difficult challenge #1 in Java
//https://www.reddit.com/r/dailyprogrammer/comments/pii6j/difficult_challenge_1/

import java.util.Scanner;
import java.util.Random;

public class GuessMyNumber {
	private static int _max = 100;
	private static int _min = 1;
	private static int _guessedNumber;
	private static boolean _guessed = false;
	private static String _response;
	private static Random randNumber = new Random();
	static Scanner scanner = new Scanner(System.in);


	public static int computerGuess(int min, int max){
		//2 Ways Iknow how to get randoms with built in functions
		//_guessedNumber = (int)(Math.random() * ( max - min )) + min; 
		_guessedNumber = randNumber.nextInt(max-min) + min;
		return _guessedNumber;
	}

	public static int recursiveGuess(int min, int max){
		_guessedNumber = randNumber.nextInt(max-min) + min;
		System.out.print("Is your number: " + _guessedNumber + "?");
		_response = scanner.next();
		if(_response.equalsIgnoreCase("higher"))
			recursiveGuess(_guessedNumber, max);
		else if(_response.equalsIgnoreCase("lower"))
			recursiveGuess(min, _guessedNumber);
		else if (_response.equalsIgnoreCase("yes")){
			System.out.println("Told you I'd guess it!");
			System.out.println("Want to play again? Y/N");
			_response = scanner.next();
			if(_response.equalsIgnoreCase("y"))
				recursiveGuess(1, 100);
			else
				System.out.println("C ya");
		}
		return _guessedNumber;
	}

	public static void nonRecursiveGuess(){
		while(_guessed == false){
			computerGuess(_min, _max);
			System.out.print("Is your number: " + _guessedNumber + "?");
			_response = scanner.next();
			System.out.println(_response);
			if(_response.equalsIgnoreCase("yes")){
				System.out.print("I knew I'd guess it! Want to play again? Y/N");
				_response = scanner.next();
				_response.toLowerCase();
				if(_response.equalsIgnoreCase("y"))
					_guessed = false;
				else{
					System.out.println("C,ya!");
					_guessed = true;
				}
			}
			else if(_response.equalsIgnoreCase("higher"))
				_min = _guessedNumber;
			else if(_response.equalsIgnoreCase("lower"))
				_max = _guessedNumber;
		}
	}

	public static void binarySearchGuess(int min, int max){
		_guessedNumber = (int)Math.floorDiv(max+min,2);
		System.out.println("Is your number: " + _guessedNumber + "?");
		_response = scanner.next();
		if(_response.equalsIgnoreCase("higher"))
			binarySearchGuess(_guessedNumber, max);
		else if(_response.equalsIgnoreCase("lower"))
			binarySearchGuess(min, _guessedNumber);
		else if (_response.equalsIgnoreCase("yes")){
			System.out.println("Told you I'd guess it!");
			System.out.println("Want to play again? Y/N");
			_response = scanner.next();
			if(_response.equalsIgnoreCase("y"))
				binarySearchGuess(1, 100);
			else
				System.out.println("C ya");
		}
		else{
			System.out.println("Sorry, couldn't understand that...");
			binarySearchGuess(min, max);
		}
	}

	public static void main(String[] args) {
		System.out.println("Let me try to guess your random number between 1-100!");
		System.out.println("Respond with either Yes, Higher, or Lower");
		System.out.println("Ready? \n Go!");
		//recursiveGuess(1, 100);
		//nonRecursiveGuess();
		binarySearchGuess(1, 100);
		scanner.close();
	}

}
