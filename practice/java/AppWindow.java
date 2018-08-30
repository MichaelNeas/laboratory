import java.awt.Color;
import java.awt.EventQueue;

import javax.swing.JFrame;

public class AppWindow {

	private JFrame frame;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					AppWindow window = new AppWindow();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public AppWindow() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(300, 200, 750, 500);
		frame.setTitle("Test App");
		frame.setBackground(Color.BLACK);
		frame.set
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}

}
