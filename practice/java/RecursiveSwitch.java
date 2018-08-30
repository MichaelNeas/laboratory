public class RecursiveSwitch {
	public static void main(String[] args){
		int i = 0;
		int j = 2;
		switch(i){
			case 0:
				switch(j){
					case 0:
						System.out.println("i is 0, j is 0");
						break;
					case 1:
						System.out.println("i is 0, j is 1");
						break;
					default:
						System.out.println("nested default case!!");
				}
				break;
			default:
				System.out.println("No matching case found!!");
		}
	}
}
