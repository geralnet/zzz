package net.geral.zzz.x.debugger;

import javax.swing.SwingUtilities;
import javax.swing.UIManager;

public class XDebugger implements Runnable {
	public static void main(String[] args) {
		try {
			UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
		} catch (Exception e) {
			e.printStackTrace();
		}
		SwingUtilities.invokeLater(new XDebugger());
	}

	@Override
	public void run() {
		DebuggerWindow w = new DebuggerWindow();
		UDPController controller = new UDPController(w);
		controller.start();
	}
}