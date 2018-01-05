import javax.swing.*;

public class StopWatch {

	private static void runableWatch() {
        StopWatchGUI wearable = new StopWatchGUI();
        
    }
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		 SwingUtilities.invokeLater(new Runnable() {
	            public void run() {
	                runableWatch();
	            }
		 });
	}
}
