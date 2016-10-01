import java.awt.Font;

import javax.swing.JLabel;
import javax.swing.JPanel;


public class TimerLabel extends JPanel{
	
	public TimerLabel(){
		JLabel minutes = new JLabel("00");
		minutes.setFont(new Font("00", Font.PLAIN, 30));
		minutes.setSize(100,50);
		this.add(minutes);
		JLabel seconds = new JLabel(":00");
		seconds.setFont(new Font(":00", Font.PLAIN, 30));
		seconds.setSize(100,50);
		this.add(seconds);
		JLabel miliSeconds = new JLabel(":000");
		miliSeconds.setSize(100,50);
		this.add(miliSeconds);
		
	}

}
