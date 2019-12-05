import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

import javax.swing.JButton;
import javax.swing.JPanel;


public class WatchButtons extends JPanel implements MouseListener {

	
	public WatchButtons(){
		super();
		//this.setLayout(null);
		//this.setSize(300,400);
		//this.setLayout(new FlowLayout);
	    JButton startButton = new JButton("Start");
	    startButton.setSize(100, 50);
	    this.add(startButton);
	    JButton stopButton = new JButton("Stop");
	    startButton.setSize(100, 50);
	    this.add(stopButton);
	    JButton lapButton = new JButton("Lap");
	    startButton.setSize(100, 50);
	    this.add(lapButton);
	}
	
	
	public void mouseClicked(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	public void mousePressed(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	public void mouseExited(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

}
