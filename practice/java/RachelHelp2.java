import java.util.Scanner;

public class RachelHelp2 {
	public static double calcDiscount(double numBooks){
		double discount = 0.0;
		if(numBooks < 3)
		{
			discount=10.0;
		}
		else if(numBooks < 5)
		{
			discount = 15.0;
		}
		else
		{
			discount = 20.0;
		}
		return discount;
	}
	
	public static void main(String[] args){	
		Scanner kbd = new Scanner(System.in);
		System.out.print("How many books do you have?: ");
		int amountOfBooks = kbd.nextInt();
		int start = 1;
		double total = 0.0;
		for(int i=0;i<amountOfBooks;i++)
		{
			System.out.print("What is the price of book number " + start + ": ");
			start++;
			total = total + kbd.nextDouble();
		}
		System.out.println("Your total is $" + total);
		double discountAmount = calcDiscount(amountOfBooks);
		double totalWithDiscount = total - (total*(discountAmount/100));
		System.out.println("You qualify for a " + discountAmount + "% discount");
		System.out.println("Your new total is: " + totalWithDiscount);
	}
}