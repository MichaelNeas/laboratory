class Student extends Person{
	private int[] testScores;
    
    Student(String firstName, String lastName, int id, int[] scores){
        super(firstName, lastName, id);
        this.testScores = scores;
    }
    
    public char calculate(){
        int total = 0;
        double avg;
        for(int score: testScores){
            total += score;
        }
        avg = total / testScores.length;
        if(100 >= avg && avg >= 90){
            return 'O';
        }else if(90 > avg && 80 <= avg){
            return 'E';
        }else if(80 > avg && 70 <= avg){
            return 'A';
        }else if(70 > avg && 55 <= avg){
            return 'P';
        }else if(55 > avg && 40 <= avg){
            return 'D';
        }else{
            return 'T';
        }
    }
    
}