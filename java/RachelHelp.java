public class RachelHelp 
{
	public static void main(String[] args)
	{
		double[] salary = new double[6];
		double x = 3.5;
		for(int i = 0; i<6; i++)
		{
			salary[i] = 100*i;
			System.out.println(salary[(int) x]);
		}
				
	}
}
