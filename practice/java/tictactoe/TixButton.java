import javax.swing.ImageIcon;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class TixButton extends JButton implements ActionListener{
	ImageIcon X,O;
	byte turnValue = 0;

	public TixButton(){
		X = new ImageIcon(this.getClass().getResource("x.png"));
		O = new ImageIcon(this.getClass().getResource("o.png"));
		this.addActionListener(this);
	}

	public void actionPerformed(ActionEvent e) {
		System.out.println(turnValue);
		if(turnValue%2 == 0){
			setIcon(X);
			turnValue++;
		}else if(turnValue%2 != 0){
			setIcon(O);
			turnValue++;
		}else{
			setIcon(null);
			turnValue++;
		}
	}
}
