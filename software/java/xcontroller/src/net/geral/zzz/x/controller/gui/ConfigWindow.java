package net.geral.zzz.x.controller.gui;

import java.awt.BorderLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTabbedPane;
import net.geral.zzz.shared.configuration.ZConfiguration;
import net.geral.zzz.x.controller.XController;
import net.geral.zzz.x.controller.gui.configpanel.ConfigPanel;

public class ConfigWindow extends JFrame {
	private static final long	serialVersionUID	= 1L;
	private static final String	SAVEFILE			= "default.cfg";
	private final ConfigPanel	configPanel;

	public ConfigWindow() {
		setSize(800, 600);
		setLocationRelativeTo(null);

		JTabbedPane tabbedPane = new JTabbedPane(JTabbedPane.TOP);
		getContentPane().add(tabbedPane, BorderLayout.CENTER);

		configPanel = new ConfigPanel();
		tabbedPane.addTab("Hardware", null, configPanel, null);

		JPanel panelButtons = new JPanel();
		getContentPane().add(panelButtons, BorderLayout.SOUTH);
		panelButtons.setLayout(new BorderLayout(0, 0));

		JPanel panelButtonsGrid = new JPanel();
		panelButtons.add(panelButtonsGrid, BorderLayout.EAST);
		panelButtonsGrid.setLayout(new GridLayout(1, 0, 0, 0));

		JButton btnLoad = new JButton("Load");
		btnLoad.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				load();
			}
		});
		panelButtonsGrid.add(btnLoad);

		JButton btnSave = new JButton("Save");
		btnSave.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				save();
			}
		});
		panelButtonsGrid.add(btnSave);

		JPanel panel = new JPanel();
		panelButtonsGrid.add(panel);

		JButton btnExit = new JButton("Exit");
		btnExit.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				exit();
			}
		});
		panelButtonsGrid.add(btnExit);

		JButton btnHide = new JButton("Hide");
		btnHide.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				hideme();
			}
		});
		panelButtonsGrid.add(btnHide);

		load();
	}

	private void exit() {
		int i = JOptionPane.showConfirmDialog(this, "Shutdown the xController?", "Exit", JOptionPane.WARNING_MESSAGE);
		if (i == JOptionPane.YES_OPTION) XController.exit();
	}

	public ZConfiguration getConfiguration() {
		return configPanel.getConfiguration();
	}

	private void hideme() {
		setVisible(false);
	}

	public void load() {
		ZConfiguration cfg;
		try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(SAVEFILE))) {
			cfg = (ZConfiguration) ois.readObject();
		}
		catch (Exception e) {
			e.printStackTrace();
			JOptionPane.showMessageDialog(this, "Cannot load configuration. Please configure the system.", "Error",
					JOptionPane.ERROR_MESSAGE);
			configPanel.setVisible(true);
			cfg = new ZConfiguration();
		}

		configPanel.setConfiguration(cfg);
	}

	private void save() {
		try (ObjectOutputStream ois = new ObjectOutputStream(new FileOutputStream(SAVEFILE))) {
			ZConfiguration cfg = configPanel.getConfiguration();
			ois.writeObject(cfg);
			JOptionPane.showMessageDialog(this, "Configuration Saved!", "Success", JOptionPane.INFORMATION_MESSAGE);
		}
		catch (Exception e) {
			e.printStackTrace();
			JOptionPane.showMessageDialog(this, "Cannot save configuration.", "Error", JOptionPane.ERROR_MESSAGE);
			configPanel.setVisible(true);
		}
	}
}
