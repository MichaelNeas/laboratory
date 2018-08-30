package cse3504_project_p1;

import java.util.Random;

public class Practice1 {
	

	public static int walkLattice(int N){
		
		// Create N x N lattice of booleans
		boolean lattice[][] = new boolean[N][N];
		for (int i = 0; i < N; i++){
			for (int j = 0; j < N; j++){
				lattice[i][j] = false;
				System.out.print(0);
			}
			System.out.println();
		}
		
		// x,y to track random walk (start point in middle of lattice)
		int x = N/2;
		int y = N/2;
		
		int length = 0;
		
		while (!checkTrapped(lattice, x, y)){
			lattice[x][y] = true;
			int newPos[] = move(lattice, x, y);
			length++;
			x = newPos[0];
			y = newPos[1];
		}
		
		return length;
		
	}
	
	public static int[] move(boolean[][] lattice, int x, int y){
		int newPos[] = new int[2];
		Random rand = new Random();
		int ranDir = rand.nextInt(4);
		
		while (!isLegit(lattice, x, y, ranDir)){
			ranDir = rand.nextInt(4);
		}
				
		switch(ranDir){
		case 0:
			newPos[0] = x + 1;
			newPos[1] = y;
			break;
		case 1:
			newPos[0] = x - 1;
			newPos[1] = y;
			break;
		case 2:
			newPos[0] = x;
			newPos[1] = y + 1;
			break;
		case 3:
			newPos[0] = x;
			newPos[1] = y - 1;
			break;
		}
		
		return newPos;
	}
	
	// Checks if one particular move is possible, returns true if it is
	public static boolean isLegit(boolean[][] lattice, int x, int y, int dir){
		boolean legit = true;
		
		switch(dir){
		case 0: // Check right
			try {
				if (lattice[x + 1][y] == true){
					legit = false;
				}
			}
			catch(Exception e){
				legit = false;
			}
			break;
		case 1: // Check left
			try {
				if (lattice[x - 1][y] == true){
					legit = false;
				}
			}
			catch(Exception e){
				legit = false;
			}
			break;
		case 2: // Check above
			try {
				if (lattice[x][y + 1] == true){
					legit = false;
				}
			}
			catch(Exception e){
				legit = false;
			}
			break;
		case 3: // Look out below
			try {
				if (lattice[x][y - 1] == true){
					legit = false;
				}
			}
			catch(Exception e){
				legit = false;
			}
			break;
		}
		
		return legit;	
		
	}
	
	// Checks if position x,y in lattice trapped
	public static boolean checkTrapped(boolean[][] lattice, int x, int y){
		boolean trapDirs[] = {false, false, false, false};
		
		for (int i = 0; i < 4; i ++){
			if (!isLegit(lattice, x, y, i)){
				trapDirs[i] = true;
			}
		}
		
		return trapDirs[0] && trapDirs[1] && trapDirs[2] && trapDirs[3];
	}
	
	public static void metrics(int N){
		int lengths[] = new int[100];
		double avgLength = 0;
		// Do random walks, get average
		for (int i = 0; i < 100; i++){
			lengths[i] = walkLattice(N);
			System.out.println(lengths[i]);
			avgLength = avgLength + lengths[i];
		}
		avgLength = avgLength/100;
		
		// Get standard dev using mean
		double stdDev = 0;
		for (int i = 0; i < 100; i++){
			stdDev = stdDev + (lengths[i] - avgLength)*(lengths[i] - avgLength);
		}
		stdDev = Math.sqrt((double) 1/99*stdDev);
		
		System.out.println("Average length (" + N + " x " + N + ") lattice is : " + avgLength);
		System.out.println("Standard deviation (" + N + " x " + N + ") lattice is : " + stdDev);
	}
	
	public static void main(String[] args) {
		metrics(100);
		metrics(1000);
	}

}
