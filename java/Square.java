import java.util.Scanner;

public class Square {
	static double side = 0;
	
	public static void main(){
	Scanner kbd = new Scanner(System.in);
	System.out.print("Please enter side length ");
	side = kbd.nextInt();
	}
	
	public Square(double mySide)
	{
		side = mySide;
	}
	
	public Square()
	{
		side = 0.0;
	}
	
	public void setSide(double newSide)
	{
		side = newSide;
	}
	
	public double getSide()
	{
		return side;
	}
	
	public double getArea()
	{
		return side*side;
	}
	
	public double getCircumference()
	{
		return 4*side;
	}
}
