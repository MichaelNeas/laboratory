	// Add your code here
    public Difference(int[] elements){
        this.elements = elements;
        Arrays.sort(this.elements);
    }
    
    public void computeDifference(){
        maximumDifference = Math.abs(this.elements[0] - this.elements[this.elements.length-1]);
    }