public class DynamicProgramming {
	public static int[] S = {1,3,7,11}; //coin denominations
	public static int total = 34; //total to make change for
	private static int count = 0; //initialize count variable
	public static int[] memoKept = new int[total + 1]; //cache for memoization

	public static void main(String[] args) {	
		for(int k=0; k< memoKept.length; k++)
			memoKept[k] = -1; //see what has been read or not
		memoKept[0] = 0; //there is 0 change you can make for 0 total

		System.out.print("Coin Values: ");
		for(int k = 0; k<S.length; k++)
			System.out.print(S[k] + " ");
		System.out.println("\n "+ "-------------------------------------");

		System.out.println("Standard Recursive implementation for minimum change");
		System.out.println("Total" + "\t" + "Coins" + "\t" + "RecursiveCalls");
		for (int m = 1; m <= total; m++) {
			System.out.println("$" + m + "\t" + recursiveChange(S, m) + "\t" + count);
			count = 0;
		}

		System.out.println("\n" +  "Top-down minimum change by Memoizing");
		System.out.println("Total" + "\t" + "Coins" + "\t" + "RecursiveCalls");
		for (int n = 1; n <= total; n++) {
			System.out.println("$" + n + "\t" + topDownFewestCoins(S, n) + "\t" + count);
			count = 0;
		}

		System.out.println("\n" + "Bottom-Up minimum change with Dynamic Programming");
		System.out.println("Total" + "\t" + "Coins" + "\t" + "RecursiveCalls");
		for (int o = 1; o <= total; o++) {
			System.out.println("$" + o + "\t" + fewestCoins(S, o) + "\t" + count);
			count = 0;
		}

		System.out.println("\n" + "Choose recurssive solution: " + choose(5,2));
		System.out.println("Dynamically build choose solution:" + betterChoose(5,2));
		System.out.println("\n" + "Probability team X whens when p is .4 and the 7 game series just started:" + winProbability(.4, 7));
	}

	//Memoization only computes stuff that is directly needed but has arguably same runtime as bottom up	
	public static int topDownFewestCoins(int[] coins, int changeFor){ //O(mn) to check all the coins with all possibilities in worse case
		int leastCoins = changeFor + 1; //should never take more coins
		count++;

		if(changeFor == 0) //no need to make change base case #2
			return 0;

		if(memoKept[changeFor] != -1) // base case allows knowledge of previously solved in memory
			return memoKept[changeFor];

		for(int f = 0; f< coins.length; f++){ //span through the coins in the array
			if(coins[f] <= changeFor) //if the value is less than or equal to the change you need look at the minimum stored and recursively call until satisfies
				leastCoins = Math.min(leastCoins, topDownFewestCoins(coins, changeFor - coins[f]) + 1); //checking if less than stored comprised min
		}
		memoKept[changeFor] = leastCoins; //store the least amount of coins for later
		return leastCoins;
	}

	//Bottom Up, stores all computed values in a table
	public static int fewestCoins(int[] coins, int changeFor){//O(mn) bot up
		int row, column;
		int[][] table = new int[coins.length][changeFor+1]; //rowsxcolumns

		for(row=0; row < coins.length; row++){
			for(column=0; column < changeFor+1; column++){
				if(row == 0 && coins[0] == 1) //row 0 in column always i cause 1 min
					table[row][column] = column;
				else if(row == 0 && coins[0] > column) //cant make change if don't have ability to
					table[row][column] =  0;
				else if(column == 0) 
					table[row][column] = 0; //0 ways to make change for 0 total
				else if(column >= coins[row]) //take the smallest of the two available in table
					table[row][column] = Math.min(table[row-1][column] , 1 + table[row][column-coins[row]]); 
				else
					table[row][column] = table[row-1][column]; //its the one above it
				count++;
			}
		}
		return table[coins.length - 1][changeFor]; //get the value at bottom right of table
	}


	//simple but EXPENSIVE
	public static int recursiveChange(int[] coins, int changeFor){ //O(2^n)
		count++;
		if(changeFor == 0) //no change for changeFor
			return 0;
		int amountOfCoins = Integer.MAX_VALUE;//if it was initialized to 0 it would always be the min in the recurrence
		for(int currentCoin: coins)
		{
			if (currentCoin <= changeFor) //optimal recurrence relation
				amountOfCoins = Math.min(amountOfCoins, recursiveChange(coins, changeFor - currentCoin) + 1);
		}
		return amountOfCoins;
	}




	//the closer to the middle the more the build is split into twos
	public static int choose(int n, int k){ //n/2=k takes a long time O(2^n)
		if(n >= 0 && k == 0 || k == n)
			return 1;
		else
			return choose(n-1, k) + choose(n-1, k-1); //recurrence draws from previous row and column
	}




	//O(nk) dynamic bottom up build
	public static int betterChoose(int n, int k){
		int i,j;
		int[][] chooseTable = new int[n+1][k+1];

		for(i = 0; i <= n;i++)
			for(j = 0; j <= k; j++) //set up table
				if(j == 0 || j == i)
					chooseTable[i][j] = 1; //base case is 1 if first column or diagonal
				else if(i == 0)
					chooseTable[i][j] = 0; //another basecase is 0 on the top cause you can't choose from nothing
				else
					chooseTable[i][j] = chooseTable[i-1][j-1] + chooseTable[i-1][j]; //dynamic build off previous entries


		return chooseTable[n][k];
	}




	//Two teams affecting X's probability of winning bottom up
	public static double winProbability(double p, int gameSeries){ //O(XY) time
		int i,j;
		int teamX = (gameSeries + 1)/2; //wins needed to take series
		int teamY = (gameSeries + 1)/2;

		double[][] xWinTable = new double[teamX+1][teamY+1]; 

		for(i = 0; i <= teamX;i++)
			for(j = 0; j <= teamY; j++)
				if(i == 0) //top row is always 1 because x has 0 games to win
					xWinTable[i][j]= 1;
				else if(j == 0) //left column always 0 cause x cant win anymore
					xWinTable[i][j]= 0;
				else if(i==1 && j>0 || j==1 && i>0) //first column and row is set up as a geometric base case
					xWinTable[i][j] = (Math.pow(p, i)* Math.pow(1-p,j-1)) + xWinTable[i][j-1]; //add previous
				else
					xWinTable[i][j] = (p*xWinTable[i-1][j]) + ((1-p)*xWinTable[i][j-1]);//dynamically set up table for W(i,j) game

		return xWinTable[teamX][teamY];
	}
}