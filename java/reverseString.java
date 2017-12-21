import java.util.Scanner;

public class reverseString{
	private static String myString;
	private static int front = 0;
	private static int end;

	private static String reverseMe(String[] aFakeCharArray){
		if(front-end==-1 || front-end == 0){
			String aString = new String(aCharArray);
			return aString;
		}else{
			aFakeCharArray[front]=+ aFakeCharArray[end];

			front++;
			end--;
			reverseMe(aString);
		}
	}

	public static void main(String args[]){
		Scanner sc = new Scanner(System.in);
		myString = sc.next();
		end = myString.length()-1;
		String[] fakeCharArray = myString.split("");
		myString = reverseMe(charArray);
		System.out.println(myString);
	}
}