package challenge8;
/*write a program that will print the song "99 bottles of beer on the wall".
*for extra credit, do not allow the program to print each loop on a new line.
* Challenge #8 easy
*/

public class BottlesofBeerOnTheWall {	
	public static int bottlesOfBeer = 99;
	public static void main(String[] args) {
		for(int i = 0; i< 99; i++){
			System.out.print(bottlesOfBeer + " bottles of beer on the wall, ");
			System.out.print(bottlesOfBeer + " bottles of BEER!");
			System.out.print(" Take one down pass it around, ");
			bottlesOfBeer = bottlesOfBeer - 1;
			if(bottlesOfBeer == 0){
				System.out.println("no more bottles of beer on the wall =(");
			}else if(bottlesOfBeer == 1){
				System.out.println("1 more bottle of beer on the wall!");
			}else{
				System.out.println(bottlesOfBeer + " of beer on the wall.");
			}
		}
	}
}
