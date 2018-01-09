public class ToStringTest {
	String title;
	String author;
	ToStringTest(String author, String title){
		this.title = title;
		this.author = author;
	}
	public String toString(){
		return "Book: " + title + " by " + author;
	}
}
