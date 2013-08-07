package net.geral.zzz.xcontroller;

import javax.swing.SwingUtilities;
import javax.swing.UIManager;

import net.geral.zzz.xcontroller.comm.UDPController;
import net.geral.zzz.xcontroller.debugger.DebuggerWindow;

public class Debugger implements Runnable {
	public static void main(String[] args) {
		try {
			UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
		} catch (Exception e) {
			e.printStackTrace();
		}
		SwingUtilities.invokeLater(new Debugger());
	}

	@Override
	public void run() {
		DebuggerWindow w = new DebuggerWindow();
		UDPController controller = new UDPController();
		controller.addListener(w);
		controller.start();
	}
}