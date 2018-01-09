public class AreaOfShapes {
	public static double side, base, height, base1, base2, radius; //all values for shape areas
	public static double squareArea, rectangleArea, parallelogramArea, 
						 trapezoidArea, circleArea, triangleArea;

	private static double calculateTriangleArea(double b, double h){
		return .5*b*h;
		}

	private static double calculatCircleArea(double inputRadius) {
		return Math.PI*inputRadius*inputRadius;
	}

	private static double calculateTrapezoidArea(double inputHeight, double inputBase1, double inputBase2) {
		return (inputHeight/2)*(inputBase1 + inputBase2);	
	}

	private static double calculateParallelogramArea(double inputBase, double inputHeight) {
		return inputBase*inputHeight;
	}

	private static double calculateRectangleArea(double inputSide, double inputBase) {
		return inputSide*inputBase;
	}

	private static double calculateSquareArea(double inputSide) {
		return inputSide*inputSide;
	}
	public static void main(String[] args){
		side = 3; base = 5; height = 2; base1 = 12; base2 = 23; radius = 7;
		squareArea = calculateSquareArea(side);
		rectangleArea = calculateRectangleArea(side, base);
		parallelogramArea = calculateParallelogramArea(base, height);
		trapezoidArea = calculateTrapezoidArea(height, base1, base2);
		circleArea = calculatCircleArea(radius);
		triangleArea = calculateTriangleArea(base, height);
		System.out.println("Area of Square: " + squareArea);
		System.out.println("Area of Rectangle: " + rectangleArea);
		System.out.println("Area of Parallelogram: " + parallelogramArea);
		System.out.println("Area of Trapezoid: " + trapezoidArea);
		System.out.println("Area of Circle: " + circleArea);
		System.out.println("Area of Triangle: " + triangleArea);
	}
}
