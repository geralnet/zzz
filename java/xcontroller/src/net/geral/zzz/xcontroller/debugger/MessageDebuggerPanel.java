package net.geral.zzz.xcontroller.debugger;

import java.awt.BorderLayout;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.util.ArrayList;

import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.border.EmptyBorder;

import net.geral.zzz.shared.ZMessageType;
import net.geral.zzz.shared.UDPMessage;
import net.geral.zzz.xcontroller.comm.UDPController;

public class MessageDebuggerPanel extends JPanel {
	private static final long serialVersionUID = 1L;

	private JTextField txtContents;
	private JComboBox<ZMessageType> cbMessage;
	private JLabel lblDescription;
	private JTextField txtToFrom;
	private JLabel lblToFrom;

	public MessageDebuggerPanel() {
		setLayout(new BorderLayout(0, 0));

		JPanel panelT = new JPanel();
		add(panelT, BorderLayout.NORTH);
		panelT.setLayout(new BorderLayout(0, 0));

		JPanel panelTL = new JPanel();
		panelT.add(panelTL, BorderLayout.WEST);
		panelTL.setLayout(new BorderLayout(0, 0));

		JPanel panelTLL = new JPanel();
		panelTL.add(panelTLL, BorderLayout.WEST);
		panelTLL.setLayout(new BorderLayout(0, 0));

		lblToFrom = new JLabel("To:");
		panelTLL.add(lblToFrom, BorderLayout.NORTH);

		txtToFrom = new JTextField();
		txtToFrom.setText(UDPController.getBroadcastAddress() + ":"
				+ UDPController.getDefaultPort());
		panelTLL.add(txtToFrom, BorderLayout.SOUTH);
		txtToFrom.setColumns(15);

		JPanel panelTLR = new JPanel();
		panelTLR.setBorder(new EmptyBorder(0, 5, 0, 5));
		panelTL.add(panelTLR, BorderLayout.EAST);
		panelTLR.setLayout(new BorderLayout(0, 0));

		JLabel lblMessage = new JLabel("Message:");
		panelTLR.add(lblMessage, BorderLayout.NORTH);

		cbMessage = new JComboBox<ZMessageType>();
		panelTLR.add(cbMessage, BorderLayout.SOUTH);
		for (ZMessageType msg : ZMessageType.values())
			cbMessage.addItem(msg);
		cbMessage.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e) {
				messageChanged();
			}
		});

		JPanel panelTC = new JPanel();
		panelT.add(panelTC, BorderLayout.CENTER);
		panelTC.setLayout(new BorderLayout(0, 0));

		JLabel lblContents = new JLabel("Contents:");
		panelTC.add(lblContents, BorderLayout.NORTH);

		txtContents = new JTextField();
		panelTC.add(txtContents, BorderLayout.SOUTH);
		txtContents.setColumns(10);

		lblDescription = new JLabel("...");
		add(lblDescription, BorderLayout.SOUTH);

		messageChanged();
	}

	private void messageChanged() {
		ZMessageType msg = (ZMessageType) cbMessage.getSelectedItem();
		if (msg == null) {
			lblDescription.setText("...");
		} else {
			// set to maximum of data bytes
			lblDescription.setText("Data Max Bytes: " + (msg.getMaxBytes() - 1)
					+ ", Description: " + msg.getDescription());
		}
	}

	public void setPassive(boolean b) {
		txtToFrom.setEditable(!b);
		txtContents.setEditable(!b);
		cbMessage.setEnabled(!b);
	}

	public void setMessage(UDPMessage msg, int base) {
		lblToFrom.setText(msg.isSent() ? "To:" : "From:");
		txtToFrom.setText(msg.getAddressPort());
		cbMessage.setSelectedItem(msg.getMessageType());
		txtContents.setText(msg.getDataString(base));
	}

	public byte[] getBytes(int base) {
		ZMessageType io = (ZMessageType) cbMessage.getSelectedItem();
		if (io == null)
			return new byte[] { (byte) ZMessageType.MT_UNKNOW.getBytecode() };
		String[] parts = txtContents.getText().split("[^A-Za-z0-9]");
		ArrayList<Byte> aBytes = new ArrayList<>();
		aBytes.add(new Byte((byte) io.getBytecode()));
		for (String p : parts) {
			if (p.length() == 0)
				continue;
			aBytes.add(new Byte((byte) Integer.valueOf(p, base).intValue()));
		}
		byte[] bytes = new byte[aBytes.size()];
		for (int i = 0; i < bytes.length; i++) {
			bytes[i] = aBytes.get(i).byteValue();
		}
		return bytes;
	}

	public String getAddress() {
		String[] parts = txtToFrom.getText().split(":");
		if (parts.length != 2)
			return null;
		return parts[0];
	}

	public int getPort() {
		String[] parts = txtToFrom.getText().split(":");
		if (parts.length != 2)
			return 0;
		return Integer.parseInt(parts[1]);
	}

	public void setAddressPort(String address, int port) {
		txtToFrom.setText(address + ":" + port);
	}
}
