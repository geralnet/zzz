package net.geral.zzz.acontroller;

import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.SocketTimeoutException;
import java.util.ArrayList;
import java.util.Arrays;

import net.geral.zzz.shared.IOStateMap;
import net.geral.zzz.shared.UDPControllerListener;
import net.geral.zzz.shared.UDPMessage;
import net.geral.zzz.shared.ZMessageType;
import net.geral.zzz.shared.configuration.ZConfiguration;

public class UDPController extends Thread {
	private static final String broadcastAddress = "255.255.255.255";
	private static final int defaultPort = 0x7A5A;
	private static final int udpTimeout = 500;
	private static final int secondsUpdateIOCount = 5 * 60;
	private static final int secondsUpdateAllOutputState = 30;
	private static final int millisRequestAgain = 1000;

	private ArrayList<UDPControllerListener> listeners = new ArrayList<>();
	private boolean running = true;
	private boolean finished = false;
	private IOStateMap inputState = new IOStateMap(true);
	private IOStateMap outputState = new IOStateMap(false);
	private long nextUpdateIOCount = 0;
	private long nextUpdateAllOutputState = 0;

	public UDPController() {
	}

	@Override
	public void run() {
		byte[] buffer = new byte[1024];
		DatagramSocket socket = null;
		try {
			socket = new DatagramSocket(null);
			socket.setReuseAddress(true); // allow several listens to same port
			socket.setSoTimeout(udpTimeout);
			socket.bind(new InetSocketAddress(defaultPort));
			while (running) {
				final DatagramPacket recv = new DatagramPacket(buffer,
						buffer.length);
				try {
					socket.receive(recv);
					final byte[] recvBytes = new byte[recv.getLength()];
					for (int i = 0; i < recvBytes.length; i++) {
						recvBytes[i] = buffer[i];
					}

					final UDPMessage msg = new UDPMessage(recvBytes, false,
							recv.getAddress().getHostAddress(), recv.getPort());

					udpReceived(msg);
				} catch (SocketTimeoutException e) {
					// no connection received, no problems...
				}
				// check timers
				long now = System.currentTimeMillis();
				if (nextUpdateIOCount < now) {
					nextUpdateIOCount = now + millisRequestAgain;
					updateIOCount();
				}
				if (nextUpdateAllOutputState < now) {
					nextUpdateAllOutputState = now + millisRequestAgain;
					updateAllOutputState();
				}
			}
		} catch (Exception e) {
			fireUdpException(e);
		} finally {
			if (socket != null) {
				socket.close();
			}
		}
		finished = true;
	}

	private void udpReceived(UDPMessage udp) {
		// requests are only for the firmware to respond
		if (udp.isRequest())
			return;
		final long now = System.currentTimeMillis();

		ZMessageType msg = udp.getMessageType();
		if (msg == ZMessageType.RESPOND_IO_COUNT) {
			nextUpdateIOCount = now + (secondsUpdateIOCount * 1000);
		}
		if (msg == ZMessageType.RESPOND_CHECK_OUTPUTS) {
			nextUpdateAllOutputState = now
					+ (secondsUpdateAllOutputState * 1000);
		}

		inputState.update(udp);
		outputState.update(udp);

		fireUdpReceived(udp, now);
	}

	private void updateAllOutputState() {
		send(ZMessageType.REQUEST_CHECK_OUTPUTS);
	}

	private void updateIOCount() {
		send(ZMessageType.REQUEST_IO_COUNT);
	}

	public static void send(ZMessageType msg, ZConfiguration config) {
		send(new byte[] { (byte) msg.getBytecode() }, config);
	}

	private void fireUdpException(Exception e) {
		for (UDPControllerListener l : listeners) {
			l.udpException(e);
		}
	}

	public boolean isFinished() {
		return finished;
	}

	private void fireUdpReceived(UDPMessage msg, long millis) {
		for (UDPControllerListener l : listeners) {
			l.udpReceived(msg, millis);
		}
	}

	public void addListener(UDPControllerListener l) {
		listeners.add( l);
	}

	public void removeListener(UDPControllerListener l) {
		listeners.remove(l);
	}

	public static void send(UDPMessage msg) {
		System.out.println(msg.toString(16));
		byte[] data = msg.getBytes();
		DatagramSocket socket = null;
		try {
			socket = new DatagramSocket(null);
			InetAddress ip = InetAddress.getByName(msg.getAddress());
			DatagramPacket pkt = new DatagramPacket(data, data.length, ip,
					msg.getPort());
			socket.send(pkt);
		} catch (Exception e) {
			e.printStackTrace();
			System.exit(1);
		} finally {
			if (socket != null) {
				socket.close();
			}
		}
	}

	public static int getDefaultPort() {
		return defaultPort;
	}

	public static String getBroadcastAddress() {
		return broadcastAddress;
	}

	public void finish() {
		running = false;
		if (currentThread() != this) {
			try {
				join(udpTimeout * 2);
			} catch (InterruptedException e) {
				// nothing to do
			}
		}
	}

	public IOStateMap getOutputStateMap() {
		return outputState;
	}

	public IOStateMap getInputStateMap() {
		return inputState;
	}

	public static void send(byte[] bytes, ZConfiguration config) {
		send(new UDPMessage(bytes, true, config.getIpString(), config.getUdpPort()));
	}
}