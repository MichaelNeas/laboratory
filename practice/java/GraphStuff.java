public class GraphStuff {

	static float edge;

	public static void main(String[] args) {
		//edgeVertex();
		//reallyHighLogs();
		sumRecurrence(10);
	}

	private static void reallyHighLogs() {
		float logz = 0;

		for(int i = 0; i<100; i++){
			logz = (float) Math.log(i) + logz;
			System.out.println(logz);
		}
		System.out.println(logz);
	}

	public static void sumRecurrence(int n){
		int k;

		for(k = 0; k<n; k++){
			System.out.print(k + "C + ");
			sumRecurrence(k);
		}
		System.out.print("D + ");
	}

	public static void edgeVertex(){
		for(float i = 0; i < 100; i++)
		{
			edge = (2*i) - 6;
			System.out.println(i + "vertices " + edge + "edges "+ ((i/2) * 3) + "edges ");

			//		if(edge == ((2*i) - 6))
			//			System.out.println("true");
			//		else 
			//			System.out.println("false");
		}
	}
}