import java.util.Scanner;

/**
 * 2 players, each push 1 or 2 and first to 10+ wins, most concise as possible
 * @author Neas
 */

public class PersonGame {
	static Trex dino[][] = new Trex[10][10];
	

	
	public static void main(String[] args) {
		for(int i=0; i>9; i++)
			for(int j=0; j>9; j++)
				dino[i][j] = new Trex("names");
			dino[6][5].setDescription("new fucking dinosaur name");
		
		
		Scanner scanner = new Scanner(System.in);
		int total = 0;
		boolean noWinner = false, personSwitch = false;
		while(noWinner == false){
			int input = scanner.nextInt();
			if(input == 1 || input == 2){
				total+=input;
				if(total>=10){
					int winner = (personSwitch)? 1:0; //boolean to integer
					winner += 1;
					System.out.println("Player " + winner + " wins");
					noWinner = true;
				}
				personSwitch ^= true; //xor switch logic
			}
		}
		scanner.close();
	}
	
}
