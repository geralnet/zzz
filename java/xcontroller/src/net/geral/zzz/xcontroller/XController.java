package net.geral.zzz.xcontroller;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.SystemTray;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.net.URL;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JOptionPane;
import javax.swing.SwingUtilities;
import javax.swing.UIManager;

import net.geral.lib.table.GNTableRenderer;
import net.geral.zzz.shared.UDPMessage;
import net.geral.zzz.shared.configuration.ZConfiguration;
import net.geral.zzz.xcontroller.comm.UDPController;
import net.geral.zzz.xcontroller.comm.UDPControllerListener;
import net.geral.zzz.xcontroller.gui.ConfigWindow;
import net.geral.zzz.xcontroller.gui.TrayMenu;

import org.apache.log4j.BasicConfigurator;

public class XController implements Runnable, UDPControllerListener {
	private static XController xController = null;

	public static void main(String[] args) {
		BasicConfigurator.configure();
		GNTableRenderer.setDefaultDeleteIcon(new ImageIcon(XController.class
				.getResource("/res/delete.png")));

		try {
			UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (!SystemTray.isSupported()) {
			JOptionPane.showMessageDialog(null, "SystemTray not supported.",
					"Error", JOptionPane.ERROR_MESSAGE);
			System.exit(1);
		}

		xController = new XController();
		SwingUtilities.invokeLater(xController);
	}

	private final String title = "zZz xController";
	private final BufferedImage icon;
	private ConfigWindow window = null;
	private TrayMenu tray = null;
	private UDPController udp = null;

	public XController() {
		URL res = getClass().getResource("/res/lightning.png");
		BufferedImage img = null;
		if (res != null) {
			try {
				img = ImageIO.read(res);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if (img == null) {
			img = new BufferedImage(32, 32, BufferedImage.TYPE_INT_RGB);
			Graphics g = img.getGraphics();
			g.setColor(Color.MAGENTA);
			g.fillRect(0, 0, img.getWidth(), img.getHeight());
		}
		icon = img;
	}

	@Override
	public void run() {
		window = new ConfigWindow();
		window.setTitle(title);
		window.setIconImage(icon);

		tray = new TrayMenu(icon, title);
		tray.register();

		udp = new UDPController();
		udp.addListener(this);
		udp.start();
	}

	public static void exit() {
		// dispose window
		xController.window.dispose();
		// remove tray icon
		xController.tray.unregister();
		// stop UDP Controller
		xController.udp.finish();
		// exit
		System.exit(0);
	}

	public static void fatal(Exception e, String string) {
		e.printStackTrace();
		JOptionPane.showMessageDialog(null, "Could not add to system tray.",
				"Fatal Error", JOptionPane.ERROR_MESSAGE);
		System.exit(1);
	}

	public static void showConfig() {
		xController.window.setVisible(true);
	}

	@Override
	public void udpException(Exception e) {
		e.printStackTrace();
		fatal(e, "UDP problem.");
	}

	@Override
	public void udpReceived(UDPMessage msg, long millis) {
		System.out.println(msg.toString(16));
	}

	public static ZConfiguration getConfiguration() {
		return xController.window.getConfiguration();
	}

	public static UDPController getUdpController() {
		return xController.udp;
	}
}
