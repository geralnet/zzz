package net.geral.zzz.xcontroller.debugger;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.nio.ByteBuffer;

import javax.swing.ButtonGroup;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JScrollPane;
import javax.swing.SwingConstants;
import javax.swing.SwingUtilities;
import javax.swing.border.CompoundBorder;
import javax.swing.border.EmptyBorder;
import javax.swing.border.MatteBorder;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;

import net.geral.zzz.shared.ZMessageType;
import net.geral.zzz.shared.UDPMessage;
import net.geral.zzz.xcontroller.comm.UDPController;
import net.geral.zzz.xcontroller.comm.UDPControllerListener;
import net.geral.zzz.xcontroller.debugger.LogListModel.UDPLogMessage;

public class DebuggerWindow extends JFrame implements ListSelectionListener,
		ActionListener, UDPControllerListener {
	private static final long serialVersionUID = 1L;

	private final ButtonGroup topRadioGroup = new ButtonGroup();
	private JList<LogListModel.UDPLogMessage> logList;
	private MessageDebuggerPanel messagePanelSelected;
	private JRadioButton rdbtnBinary;
	private JRadioButton rdbtnDecimal;
	private JRadioButton rdbtnHexadecimal;
	private MessageDebuggerPanel messagePanelSend;
	private LogListModel logListModel = new LogListModel();
	private long lastPing = -1;
	private JLabel lblPong;

	public DebuggerWindow() {
		setSize(new Dimension(640, 480));
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setLocationRelativeTo(null);
		getContentPane().setLayout(new BorderLayout(0, 0));

		JPanel panelBorder = new JPanel();
		panelBorder.setBorder(new EmptyBorder(2, 2, 2, 2));
		getContentPane().add(panelBorder, BorderLayout.CENTER);
		panelBorder.setLayout(new BorderLayout(0, 0));

		JPanel panelT = new JPanel();
		panelBorder.add(panelT, BorderLayout.NORTH);
		panelT.setBorder(new MatteBorder(0, 0, 1, 0, (Color) new Color(0, 0, 0)));
		panelT.setLayout(new FlowLayout(FlowLayout.CENTER, 5, 0));

		rdbtnBinary = new JRadioButton("Bin");
		rdbtnBinary.addActionListener(this);
		topRadioGroup.add(rdbtnBinary);
		panelT.add(rdbtnBinary);

		rdbtnDecimal = new JRadioButton("Dec");
		rdbtnDecimal.setSelected(true);
		rdbtnDecimal.addActionListener(this);
		topRadioGroup.add(rdbtnDecimal);
		panelT.add(rdbtnDecimal);

		rdbtnHexadecimal = new JRadioButton("Hex");
		rdbtnHexadecimal.addActionListener(this);
		topRadioGroup.add(rdbtnHexadecimal);
		panelT.add(rdbtnHexadecimal);

		JPanel panelC = new JPanel();
		panelBorder.add(panelC);
		panelC.setLayout(new BorderLayout(0, 0));

		JPanel panelCC = new JPanel();
		panelC.add(panelCC);
		panelCC.setLayout(new BorderLayout(0, 0));

		JPanel panelCCT = new JPanel();
		panelCC.add(panelCCT, BorderLayout.NORTH);
		panelCCT.setLayout(new BorderLayout(0, 0));

		JPanel panelCCTT = new JPanel();
		panelCCT.add(panelCCTT, BorderLayout.NORTH);
		panelCCTT.setLayout(new BorderLayout(0, 0));

		JPanel panelCCTTT = new JPanel();
		panelCCTT.add(panelCCTTT, BorderLayout.NORTH);
		panelCCTTT.setLayout(new BorderLayout(0, 0));

		JLabel lblMessagePanel1 = new JLabel("Message to Send");
		lblMessagePanel1.setFont(lblMessagePanel1.getFont().deriveFont(
				lblMessagePanel1.getFont().getStyle() | Font.BOLD,
				lblMessagePanel1.getFont().getSize() + 1f));
		lblMessagePanel1.setHorizontalAlignment(SwingConstants.CENTER);
		panelCCTTT.add(lblMessagePanel1, BorderLayout.NORTH);

		messagePanelSend = new MessageDebuggerPanel();
		panelCCTTT.add(messagePanelSend);

		JPanel panelCCTTTB = new JPanel();
		panelCCTTT.add(panelCCTTTB, BorderLayout.SOUTH);
		panelCCTTTB.setLayout(new BorderLayout(0, 0));

		lblPong = new JLabel("-");
		panelCCTTTB.add(lblPong, BorderLayout.WEST);

		JPanel panelCCTTTBR = new JPanel();
		FlowLayout flowLayout_1 = (FlowLayout) panelCCTTTBR.getLayout();
		flowLayout_1.setVgap(0);
		panelCCTTTB.add(panelCCTTTBR, BorderLayout.EAST);

		JButton btnPing = new JButton("Ping");
		btnPing.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				ping();
			}
		});
		panelCCTTTBR.add(btnPing);

		JButton btnSend = new JButton("Send");
		panelCCTTTBR.add(btnSend);
		btnSend.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				send();
			}
		});

		JPanel panelCCTB = new JPanel();
		panelCCTB.setBorder(new CompoundBorder(new EmptyBorder(3, 0, 0, 0),
				new CompoundBorder(new MatteBorder(2, 0, 0, 0,
						(Color) new Color(0, 0, 0)),
						new EmptyBorder(0, 0, 3, 0))));
		panelCCT.add(panelCCTB, BorderLayout.SOUTH);
		panelCCTB.setLayout(new BorderLayout(0, 0));

		JLabel lblMessagePanel2 = new JLabel("Selected Message");
		lblMessagePanel2.setHorizontalAlignment(SwingConstants.CENTER);
		lblMessagePanel2.setFont(lblMessagePanel2.getFont().deriveFont(
				lblMessagePanel2.getFont().getStyle() | Font.BOLD,
				lblMessagePanel2.getFont().getSize() + 1f));
		panelCCTB.add(lblMessagePanel2, BorderLayout.NORTH);

		messagePanelSelected = new MessageDebuggerPanel();
		messagePanelSelected.setPassive(true);
		panelCCTB.add(messagePanelSelected);

		JScrollPane scrollPane = new JScrollPane();
		panelCC.add(scrollPane, BorderLayout.CENTER);

		logList = new JList<>(logListModel);
		logList.setFont(new Font("monospaced", logList.getFont().getStyle(),
				logList.getFont().getSize()));
		logList.getSelectionModel().addListSelectionListener(this);
		scrollPane.setViewportView(logList);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		refreshBase();
	}

	private int getBase() {
		if (rdbtnBinary.isSelected())
			return 2;
		if (rdbtnHexadecimal.isSelected())
			return 16;
		return 10;
	}

	private void log(UDPMessage msg) {
		logListModel.addElement(msg);
		logList.setSelectedIndex(logListModel.getSize() - 1);
		logList.ensureIndexIsVisible(logListModel.getSize() - 1);
	}

	private void ping() {
		ByteBuffer bytes = ByteBuffer.allocate(ZMessageType.REQUEST_PING
				.getMaxBytes());
		bytes.put((byte) ZMessageType.REQUEST_PING.getBytecode());
		lastPing = System.currentTimeMillis();
		bytes.putLong(lastPing);
		UDPMessage msg = new UDPMessage(bytes.array(), true,
				UDPController.getBroadcastAddress(),
				UDPController.getDefaultPort());
		log(msg);
		UDPController.send(msg);
	}

	private void refreshBase() {
		int base = getBase();
		logListModel.setBase(base);
		UDPLogMessage v = logList.getSelectedValue();
		messagePanelSelected.setMessage(v == null ? null : v.Value, base);
	}

	private void send() {
		try {
			byte[] bytes = messagePanelSend.getBytes(getBase());
			String address = messagePanelSend.getAddress();
			int port = messagePanelSend.getPort();
			UDPMessage msg = new UDPMessage(bytes, true, address, port);
			log(msg);
			UDPController.send(msg);
		} catch (Exception e) {
			JOptionPane.showMessageDialog(this, e, "Exception",
					JOptionPane.ERROR_MESSAGE);
		}
	}

	public void udpReceived(final UDPMessage msg, final long recvMillis) {
		SwingUtilities.invokeLater(new Runnable() {
			@Override
			public void run() {
				log(msg);
				// check if was our ping
				if (lastPing == -1)
					return;
				if (msg.getMessageType() == ZMessageType.RESPOND_PONG) {
					int needs = ZMessageType.RESPOND_PONG.getMaxBytes() - 1;
					byte[] bytes = msg.getBytes();
					if (bytes.length != (needs + 1)) {
						return;
					}
					ByteBuffer buf = ByteBuffer.wrap(bytes, 1, needs);
					long ms = buf.getLong();
					if (ms == lastPing) {
						messagePanelSend.setAddressPort(msg.getAddress(),
								msg.getPort());
						lblPong.setText("Ping/Pong: "
								+ (System.currentTimeMillis() - recvMillis)
								+ "ms");
						lastPing = -1;
					}
				}
			}
		});
	}

	@Override
	public void valueChanged(ListSelectionEvent e) {
		if (e.getValueIsAdjusting())
			return;
		messagePanelSelected.setMessage(logList.getSelectedValue().Value,
				getBase());
	}

	@Override
	public void udpException(Exception e) {
		e.printStackTrace();
		System.exit(1);
	}
}
