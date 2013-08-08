package net.geral.zzz.x.debugger;

import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.SocketTimeoutException;
import java.util.Arrays;

import net.geral.zzz.shared.UDPMessage;

public class UDPController extends Thread {
	private static final String defaultBroadcast = "255.255.255.255";
	private static final int defaultPort = 0x7A5A;

	public static void send(UDPMessage msg) {
		System.out.println(msg.toString(16));
		byte[] data = msg.getBytes();
		try (DatagramSocket socket = new DatagramSocket()) {
			InetAddress ip = InetAddress.getByName(msg.getAddress());
			DatagramPacket pkt = new DatagramPacket(data, data.length, ip,
					msg.getPort());
			socket.send(pkt);
		} catch (Exception e) {
			e.printStackTrace();
			System.exit(1);
		}
	}

	private final DebuggerWindow window;

	public UDPController(DebuggerWindow w) {
		window = w;
	}

	@Override
	public void run() {
		byte[] buffer = new byte[1024];
		try (DatagramSocket socket = new DatagramSocket(null)) {
			socket.setReuseAddress(true); // allow several listens to same port
			socket.bind(new InetSocketAddress(defaultPort));
			while (true) {
				final DatagramPacket recv = new DatagramPacket(buffer,
						buffer.length);
				try {
					socket.receive(recv);
					final byte[] recvBytes = Arrays.copyOf(buffer,
							recv.getLength());
					final UDPMessage msg = new UDPMessage(recvBytes, false,
							recv.getAddress().getHostAddress(), recv.getPort());

					window.udpReceived(msg);
				} catch (SocketTimeoutException e) {
					// no connection received, no problems...
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.exit(1);
		}
	}

	public static String getBroadcastAddress() {
		return defaultBroadcast;
	}

	public static int getDefaultPort() {
		return defaultPort;
	}
}
