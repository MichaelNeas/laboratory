import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.Toolkit;

import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingConstants;


public class StopWatchGUI {
	
	private int screenWidth = 400;
	private int screenHeight = 600;
	
	public StopWatchGUI(){
		JFrame watchFrame = new JFrame("StopWatch");
		JPanel panel = new JPanel();
		watchFrame.setSize(screenWidth, screenHeight);
		watchFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		watchFrame.getContentPane().setLayout(new BoxLayout(watchFrame.getContentPane(), BoxLayout.Y_AXIS));
		
		Dimension screenLocation = new Dimension();
		screenLocation = Toolkit.getDefaultToolkit().getScreenSize();
		watchFrame.setLocation(screenLocation.width/2 - screenWidth/2, screenLocation.height/2 - screenHeight/2);
	    watchFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	    //Add the name of watch
	    JLabel nameLabel = new JLabel("Mike's Stop Watch", SwingConstants.CENTER);
	    watchFrame.getContentPane().add(nameLabel);
	    
	    TimerLabel timeContainer = new TimerLabel();
	    timeContainer.setBackground(Color.CYAN);
	    //timeContainer.setPreferredSize(new Dimension(200,200));
	    
	    WatchButtons buttonContainer = new WatchButtons();
	    buttonContainer.setBackground(Color.GREEN);
	    //buttonContainer.setLayout(null);
	    //buttonContainer.setPreferredSize(new Dimension(200,200));
	   // buttonContainer.setLocation(19, 300);
	    //buttonContainer.setLocation(200, 200);
	    
	    
	    //buttonContainer.setLocation();
	    watchFrame.getContentPane().add(timeContainer);
	    watchFrame.getContentPane().add(buttonContainer);
	    
	    
	    //watchFrame.pack();
	    watchFrame.setVisible(true);
	}
	
	
	
}
