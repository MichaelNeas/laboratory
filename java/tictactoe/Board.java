import java.awt.GridLayout;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class Board extends JFrame
{
	JPanel panel = new JPanel();
	TixButton buttons[] = new TixButton[9];
	
	public static void main(String[] args)
	{
		new Board();
	}
	
	public Board()
	{
		super("TicTacToe");
		setSize(400,400);
		setResizable(false);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		panel.setLayout(new GridLayout(3,3));
		for(int i=0; i<9; i++)
		{
			buttons[i] = new TixButton();
			panel.add(buttons[i]);
		}
		add(panel);
		
		setVisible(true);
	}
	
}
