package net.geral.zzz.desktop.debugger;

import javax.swing.JFrame;
import javax.swing.SwingUtilities;
import javax.swing.JPanel;
import java.awt.BorderLayout;
import javax.swing.JTextField;
import javax.swing.JButton;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

public class DebuggerWindow extends JFrame {
	private static final long serialVersionUID = 1L;
	private JTextField txtSend;

	public DebuggerWindow() {
		
		JPanel panelSend = new JPanel();
		getContentPane().add(panelSend, BorderLayout.SOUTH);
		panelSend.setLayout(new BorderLayout(0, 0));
		
		txtSend = new JTextField();
		panelSend.add(txtSend);
		txtSend.setColumns(10);
		
		JButton btnSend = new JButton("Send");
		panelSend.add(btnSend, BorderLayout.EAST);
		
		JScrollPane ioScroll = new JScrollPane();
		getContentPane().add(ioScroll, BorderLayout.CENTER);
		
		JTextArea ioText = new JTextArea();
		ioText.setEditable(false);
		ioScroll.setViewportView(ioText);

	}

	public static void main(String[] args) {
		SwingUtilities.invokeLater(new Runnable() {
			@Override
			public void run() {
				new DebuggerWindow();
			}
		});
	}
}
