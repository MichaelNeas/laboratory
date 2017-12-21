public class Apples{
		static int k = 5;
		static int yellow = 0;
		static int red = 0;
	public static void main(String[] args){

		for(int i=1; i != k; i++){
			if(i%2 == 0 ){
				yellow += i*i;
			}else{
				red += i*i;
			}
		}
		System.out.println(red + " reds, " + yellow  + " yellows!");

	}
}