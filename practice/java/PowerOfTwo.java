public class PowerOfTwo{
	static boolean isPowerOfTwo(int n) {

	  while (n % 2 != 0) {
	    n >>= 1;
	  }

	  if (n == 1) {
	    return true;
	  }

	  return false;
	}
	public static void main(String[] args){
		int blah = 4;
		System.out.println(isPowerOfTwo(blah));
	}
}