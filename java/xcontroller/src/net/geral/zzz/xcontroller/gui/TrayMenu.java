package net.geral.zzz.xcontroller.gui;

import java.awt.AWTException;
import java.awt.CheckboxMenuItem;
import java.awt.Image;
import java.awt.Menu;
import java.awt.MenuItem;
import java.awt.PopupMenu;
import java.awt.SystemTray;
import java.awt.TrayIcon;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.util.ArrayList;
import java.util.Collections;

import net.geral.zzz.shared.IOStateMap;
import net.geral.zzz.shared.ZMessageType;
import net.geral.zzz.shared.configuration.ZConfiguration;
import net.geral.zzz.shared.configuration.ZOutputConfiguration;
import net.geral.zzz.xcontroller.XController;
import net.geral.zzz.xcontroller.comm.UDPController;

public class TrayMenu extends TrayIcon implements ActionListener,
		MouseListener, ItemListener {
	private Menu optionsMenu = createOptionsMenu();

	public TrayMenu(Image icon, String title) {
		super(icon, title);
		setPopupMenu(new PopupMenu());
		addMouseListener(this);
		setImageAutoSize(true);
	}

	private Menu createOptionsMenu() {
		Menu menu = new Menu("More");
		Menu master = new Menu("Master Switch");
		master.add(createItem("On", "MASTER_ON"));
		master.add(createItem("Off", "MASTER_OFF"));
		menu.add(master);
		menu.addSeparator();
		menu.add(createItem("Configuration...", "CONFIG"));
		menu.add(createItem("Exit", "EXIT"));
		return menu;
	}

	private MenuItem createItem(String label, String command) {
		MenuItem item = new MenuItem(label);
		item.setActionCommand(command);
		item.addActionListener(this);
		return item;
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		String cmd = e.getActionCommand();
		if (cmd == null)
			return;

		if ("EXIT".equals(cmd))
			exit();
		else if ("CONFIG".equals(cmd))
			config();
		else if ("MASTER_ON".equals(cmd)) {
			master(true);
		} else if ("MASTER_OFF".equals(cmd)) {
			master(false);
		} else
			System.err.println("Invalid command: " + cmd);
	}

	private void master(boolean onoff) {
		int n = XController.getUdpController().getOutputStateMap().getSize();
		n = (n / 8) + (n % 8 == 0 ? 0 : 1);
		byte[] bytes = new byte[n + 1];
		bytes[0] = (byte) ZMessageType.REQUEST_TURNONOFF_ALL.getBytecode();
		for (int i = 1; i < bytes.length; i++) {
			bytes[i] = (byte) (onoff ? 0xFF : 0x00);
		}
		UDPController.send(bytes);
	}

	private void config() {
		XController.showConfig();
	}

	private void exit() {
		XController.exit();
	}

	public void register() {
		try {
			SystemTray.getSystemTray().add(this);
		} catch (AWTException e) {
			XController.fatal(e, "Could not add to system tray.");
		}
	}

	public void unregister() {
		SystemTray.getSystemTray().remove(this);
	}

	@Override
	public void mouseClicked(MouseEvent e) {
		if (e.isPopupTrigger())
			createPopUp();
	}

	private void createPopUp() {
		PopupMenu menu = new PopupMenu();
		menu.removeAll();
		createInputsMenu(menu);
		menu.addSeparator();
		menu.add(optionsMenu);
		setPopupMenu(menu);
	}

	private void createInputsMenu(Menu menu) {
		ZConfiguration cfg = XController.getConfiguration();
		ZOutputConfiguration[] os = cfg.getOutputConfiguration();
		// check groups
		ArrayList<String> groups = new ArrayList<>();
		for (ZOutputConfiguration o : os) {
			if (!groups.contains(o.getGroup()))
				groups.add(o.getGroup());
		}
		Collections.sort(groups);
		// get output status
		IOStateMap states = XController.getUdpController().getOutputStateMap();
		// add by group
		for (String g : groups) {
			Menu sub = (g.length() == 0) ? menu : new Menu(g);
			for (ZOutputConfiguration o : os) {
				if (g.equals(o.getGroup())) {
					boolean state = states.get(o.getNumber());
					CheckboxMenuItem item = new CheckboxMenuItem(o.getName(),
							state);
					item.setActionCommand(String.valueOf(o.getNumber()));
					item.addItemListener(this);
					sub.add(item);
				}
			}
			menu.add(sub);
		}
	}

	@Override
	public void mouseEntered(MouseEvent e) {
	}

	@Override
	public void mouseExited(MouseEvent e) {
	}

	@Override
	public void mousePressed(MouseEvent e) {
		if (e.isPopupTrigger())
			createPopUp();
	}

	@Override
	public void mouseReleased(MouseEvent e) {
		if (e.isPopupTrigger())
			createPopUp();
	}

	@Override
	public void itemStateChanged(ItemEvent e) {
		CheckboxMenuItem cb = ((CheckboxMenuItem) e.getSource());
		int nInput = Integer.parseInt(cb.getActionCommand());
		ZMessageType turnOnOrOff = cb.getState() ? ZMessageType.REQUEST_TURNON_ONE
				: ZMessageType.REQUEST_TURNOFF_ONE;
		byte[] bytes = new byte[] { (byte) turnOnOrOff.getBytecode(),
				(byte) nInput };
		UDPController.send(bytes);
	}
}
