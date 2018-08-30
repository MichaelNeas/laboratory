//Michael Neas, Easy challenge #1 in Java
//https://www.reddit.com/r/dailyprogrammer/comments/pih8x/easy_challenge_1/
import java.util.Scanner;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

public class NeasBasicIO {
	public static void main(String[] args) throws FileNotFoundException, UnsupportedEncodingException {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Hey, what's your name? ");
		String name = scanner.next();
		System.out.print("What about your age? ");
		String age = scanner.next();
		System.out.print("And your reddit username? ");
		String redditUsername = scanner.next();
		
		System.out.println("So, your name is " + name + ", you are " + age + " years old, and your username is " + redditUsername);
	
		//writing out that overwrites a text file
		PrintWriter writer = new PrintWriter("easyStoreInfo.txt", "UTF-8");
		writer.println("So, your name is " + name + ", you are " + age + " years old, and your username is " + redditUsername);
		writer.close();
		
		scanner.close();
	}

}
