//Michael Neas Palindrome solver for sentences and strings
import java.util.*;
public class IsPalindrome {
	static Map<Character, Integer> charHash = new HashMap<Character, Integer>();
	static int totalOddChars = 0;
	static boolean isPalindrome = false;

	public static void isPalindrome(String randomString){
		for(int i=0; i<randomString.length(); i++){
			char currentChar = randomString.charAt(i);
			if(!charHash.containsKey(currentChar))
				charHash.put(currentChar, 1);
			else
				charHash.put(currentChar, charHash.get(currentChar)+1);
		}

		if(randomString.length() % 2 == 0)
			checkNoOddChars(charHash);
		else
			checkForSingleOddAmount(charHash);
	}

	private static void checkForSingleOddAmount(Map<Character, Integer> sortedHash) {
		for(Integer counts : sortedHash.values()){
			if(counts%2 == 1)
				totalOddChars++;
		}
		if(totalOddChars>1){
			isPalindrome = false;
			System.out.println(isPalindrome + ", Sorry that can't form a palindrome");
		}	
		else{
			isPalindrome = true;
			System.out.println(isPalindrome + ", Yes, that can form a palindrome");
		}

	}

	private static void checkNoOddChars(Map<Character, Integer> sortedHash) {
		for(Integer counts : sortedHash.values()){
			if(counts%2 == 1){
				totalOddChars++;
				isPalindrome = false;
				System.out.println(isPalindrome + ", Sorry that can't form a palindrome");
				break;
			}
			isPalindrome = true;
		}
		if(isPalindrome == true)
			System.out.println(isPalindrome + ", Yes, that can form a palindrome");
	}
	
	private static String primeString(String sentence){
		sentence = sentence.toLowerCase();//no caps
		sentence = sentence.replaceAll("\\s","");//remove all whitespaces
		sentence = sentence.replaceAll("[\\W]", ""); //remove all non worded characters
		System.out.println(sentence);
		return sentence;
	}

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("What a string or sentence do you want to check? ");
		String checkString = sc.nextLine();
		checkString = primeString(checkString);
		isPalindrome(checkString);
		sc.close();
	}
}
