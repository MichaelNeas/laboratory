//Write MyBook Class
class MyBook extends Book {
    private int price = 0;
    public MyBook(String title, String author, int price){
        super(title, author);
        this.price = price;
    }
    
    public void display(){
        System.out.println("Title: "+this.title+ "\n"+"Author: "+this.author +"\n"+"Price: "+this.price);
    }
}