
public class Foo {

	int n;
	Foo() { n = 0;}
	int run(int n) {
		int i;
		int j;
		i = 0;
		j = 0;
		while (i < n) {
	//		int n;
			n = i * 2;
			j = j + n;
		}
		return j; }
	
	
	// What happens if your assumptions in unification are incorrect?
	
	private static void readAble(int aVariable) {
		aVariable = 13;	
	}
	
	public static void writeToFloat(int anInt, boolean aBool, float aFloat){
		float myFloat;
		myFloat = anInt;
		myFloat = (aBool)? 1:0; //but it's not 1 and 0?
		
		int myInt;
		myInt = anInt;
		myInt = (int) aFloat;
		myInt = (aBool)? 1:0;
	}
	
	
	static Integer[] integerArray = new Integer[10];
	static Object[] o = integerArray;
	

	public static void main(String[] args) {
		double aDouble = 34.12;
		readAble((int)aDouble);
		
		
		boolean binaryValue = true;
		integerArray[1] = new Integer(2);
		//integerArray[1] = aFloat;
		o[1] = new Trex("fluffy"); //we can do this and we shouldn't be able to.
		// x[1]
		int w = integerArray[1].intValue();
	}


}
