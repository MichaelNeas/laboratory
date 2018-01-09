public class Tracing {
	public static void main(String[] args){
		int i;
		int x = 10;
		int y = 5;
		int z = 20;
		
		for(i = 0; i < 10; i++){
			x = x + i;
			y = y + x;
			z = i + x + y;
			System.out.println(" " + x + " " + y + " " + z + " " + i);
		}
		System.out.println(i);
	}
}