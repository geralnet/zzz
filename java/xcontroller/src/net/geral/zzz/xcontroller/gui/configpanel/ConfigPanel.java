package net.geral.zzz.xcontroller.gui.configpanel;

import java.awt.BorderLayout;
import java.awt.GridLayout;
import java.util.ArrayList;

import javax.swing.JCheckBox;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.SwingConstants;
import javax.swing.border.TitledBorder;

import net.geral.zzz.shared.configuration.ZConfiguration;
import net.geral.zzz.shared.configuration.ZOutputConfiguration;
import net.geral.zzz.xcontroller.gui.configpanel.tables.InputTable;
import net.geral.zzz.xcontroller.gui.configpanel.tables.OutputTable;

public class ConfigPanel extends JPanel {
	private static final long serialVersionUID = 1L;
	private JTextField txtMAC;
	private JTextField txtIP;
	private JTextField txtMask;
	private JTextField txtGateway;
	private JTextField txtName;
	private JTextField txtDescription;
	private JTextField txtUsername;
	private JTextField txtPassword;
	private JTextField txtUdpPort;
	private InputTable tableInputs;
	private OutputTable tableOutputs;
	private JCheckBox chkDHCP;

	public ConfigPanel() {
		setLayout(new BorderLayout(0, 0));

		JPanel panelTop = new JPanel();
		add(panelTop, BorderLayout.NORTH);
		panelTop.setLayout(new BorderLayout(0, 0));

		JPanel panelIdentification = new JPanel();
		panelTop.add(panelIdentification, BorderLayout.CENTER);
		panelIdentification.setBorder(new TitledBorder(null,
				" zZz Identification", TitledBorder.LEADING, TitledBorder.TOP,
				null, null));
		panelIdentification.setLayout(new BorderLayout(0, 0));

		JPanel panelIdentificationTop = new JPanel();
		panelIdentification.add(panelIdentificationTop, BorderLayout.NORTH);
		panelIdentificationTop.setLayout(new GridLayout(0, 1, 0, 0));

		JPanel panelIdentificationName = new JPanel();
		panelIdentificationTop.add(panelIdentificationName);
		panelIdentificationName.setLayout(new GridLayout(0, 1, 0, 0));

		JLabel lblName = new JLabel("Name:");
		panelIdentificationName.add(lblName);
		lblName.setVerticalAlignment(SwingConstants.BOTTOM);

		txtName = new JTextField();
		panelIdentificationName.add(txtName);
		txtName.setColumns(10);

		JPanel panelIdentificationDescription = new JPanel();
		panelIdentificationTop.add(panelIdentificationDescription);
		panelIdentificationDescription.setLayout(new GridLayout(0, 1, 0, 0));

		JLabel lblDescription = new JLabel("Description:");
		lblDescription.setVerticalAlignment(SwingConstants.BOTTOM);
		panelIdentificationDescription.add(lblDescription);

		txtDescription = new JTextField();
		panelIdentificationDescription.add(txtDescription);
		txtDescription.setColumns(10);

		JPanel panelIdentificationUserPass = new JPanel();
		panelIdentificationTop.add(panelIdentificationUserPass);
		panelIdentificationUserPass.setLayout(new GridLayout(0, 2, 2, 0));

		JLabel lblUsername = new JLabel("Username:");
		lblUsername.setVerticalAlignment(SwingConstants.BOTTOM);
		panelIdentificationUserPass.add(lblUsername);

		JLabel lblPassword = new JLabel("Password:");
		lblPassword.setVerticalAlignment(SwingConstants.BOTTOM);
		panelIdentificationUserPass.add(lblPassword);

		txtUsername = new JTextField();
		panelIdentificationUserPass.add(txtUsername);
		txtUsername.setColumns(10);

		txtPassword = new JTextField();
		panelIdentificationUserPass.add(txtPassword);
		txtPassword.setColumns(10);

		JPanel panelNetwork = new JPanel();
		panelTop.add(panelNetwork, BorderLayout.EAST);
		panelNetwork.setBorder(new TitledBorder(null, "Network Settings",
				TitledBorder.LEADING, TitledBorder.TOP, null, null));
		panelNetwork.setLayout(new BorderLayout(0, 0));

		JPanel panelNetworkTop = new JPanel();
		panelNetwork.add(panelNetworkTop, BorderLayout.NORTH);
		panelNetworkTop.setLayout(new GridLayout(0, 1, 0, 0));

		chkDHCP = new JCheckBox("Use DHCP");
		panelNetworkTop.add(chkDHCP);
		chkDHCP.setHorizontalAlignment(SwingConstants.RIGHT);

		JLabel lblMacAddress = new JLabel("MAC Address:");
		panelNetworkTop.add(lblMacAddress);
		lblMacAddress.setVerticalAlignment(SwingConstants.BOTTOM);

		txtMAC = new JTextField();
		panelNetworkTop.add(txtMAC);
		txtMAC.setColumns(15);

		JPanel panelNetworkBottom = new JPanel();
		panelNetwork.add(panelNetworkBottom, BorderLayout.SOUTH);
		panelNetworkBottom.setLayout(new GridLayout(0, 2, 2, 0));

		JLabel lblIp = new JLabel("IP:");
		panelNetworkBottom.add(lblIp);
		lblIp.setVerticalAlignment(SwingConstants.BOTTOM);

		JLabel lblUdpPort = new JLabel("UDP Port:");
		lblUdpPort.setVerticalAlignment(SwingConstants.BOTTOM);
		panelNetworkBottom.add(lblUdpPort);

		txtIP = new JTextField();
		panelNetworkBottom.add(txtIP);
		txtIP.setColumns(10);

		txtUdpPort = new JTextField();
		panelNetworkBottom.add(txtUdpPort);
		txtUdpPort.setColumns(10);

		JLabel lblMask = new JLabel("Netmask:");
		panelNetworkBottom.add(lblMask);
		lblMask.setVerticalAlignment(SwingConstants.BOTTOM);

		JLabel lblGateway = new JLabel("Gateway:");
		panelNetworkBottom.add(lblGateway);
		lblGateway.setVerticalAlignment(SwingConstants.BOTTOM);

		txtMask = new JTextField();
		panelNetworkBottom.add(txtMask);
		txtMask.setColumns(10);

		txtGateway = new JTextField();
		panelNetworkBottom.add(txtGateway);
		txtGateway.setColumns(10);

		JPanel panelCenter = new JPanel();
		add(panelCenter, BorderLayout.CENTER);
		panelCenter.setLayout(new GridLayout(0, 2, 0, 0));

		JPanel panelInputs = new JPanel();
		panelCenter.add(panelInputs);
		panelInputs.setBorder(new TitledBorder(null, "Inputs Configuration",
				TitledBorder.LEADING, TitledBorder.TOP, null, null));
		panelInputs.setLayout(new BorderLayout(0, 0));

		tableInputs = new InputTable();
		panelInputs.add(tableInputs.getScroll());

		JPanel panelOutputs = new JPanel();
		panelCenter.add(panelOutputs);
		panelOutputs.setBorder(new TitledBorder(null, "Outputs Configuration",
				TitledBorder.LEADING, TitledBorder.TOP, null, null));
		panelOutputs.setLayout(new BorderLayout(0, 0));

		tableOutputs = new OutputTable();
		panelOutputs.add(tableOutputs.getScroll());
	}

	public void setConfiguration(ZConfiguration cfg) {
		txtName.setText(cfg.getName());
		txtDescription.setText(cfg.getDescription());
		txtUsername.setText(cfg.getUsername());
		txtPassword.setText(cfg.getPassword());
		chkDHCP.setSelected(cfg.isUseDHCP());
		txtMAC.setText(cfg.getMacString());
		txtIP.setText(cfg.getIpString());
		txtUdpPort.setText(String.valueOf(cfg.getUdpPort()));
		txtMask.setText(cfg.getNetmaskString());
		txtGateway.setText(cfg.getGatewayString());
		tableInputs.getModel().setData(cfg.getInputConfiguration());
		tableOutputs.getModel().setData(cfg.getOutputConfiguration());
	}

	public ZConfiguration getConfiguration() {
		// TODO add all other data
		ZConfiguration cfg = new ZConfiguration();
		ArrayList<ZOutputConfiguration> data = tableOutputs.getModel().getAll();
		cfg.setOutputConfiguration(data.toArray(new ZOutputConfiguration[data
				.size()]));
		return cfg;
	}
}
