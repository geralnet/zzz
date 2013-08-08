package net.geral.zzz.a.controller;

import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.SocketTimeoutException;
import net.geral.zzz.shared.UDPMessage;
import net.geral.zzz.shared.ZMessageType;
import android.util.Log;

public class UDPController extends Thread {
	private final String		zzzAddress		= "255.255.255.255";
	private final int			zzzPort			= 0x7A5A;

	private final MainActivity	mainActivity;

	private long				lastPingSearch	= 0;

	public UDPController(MainActivity ma) {
		mainActivity = ma;
	}

	public void ping() {
		lastPingSearch = System.currentTimeMillis();
		byte[] bytes = new byte[ZMessageType.REQUEST_PING.getMaxBytes()];
		bytes[0] = (byte) ZMessageType.REQUEST_PING.getBytecode();
		for (int i = 0; i < 8; i++) {
			bytes[i + 1] = (byte) (lastPingSearch >> ((8 - i) * 8));
		}
		UDPMessage msg = new UDPMessage(bytes, true, zzzAddress, zzzPort);
		send(msg);
	}

	public void requestSetOutput(int position, boolean status) {
		lastPingSearch = System.currentTimeMillis();
		byte[] bytes = new byte[3];
		bytes[0] = (byte) (status ? ZMessageType.REQUEST_TURNON_ONE : ZMessageType.REQUEST_TURNOFF_ONE).getBytecode();
		bytes[1] = (byte) position;
		UDPMessage msg = new UDPMessage(bytes, true, zzzAddress, zzzPort);
		send(msg);
	}

	@Override
	public void run() {
		byte[] buffer = new byte[ZMessageType.getMaxMessageLength()];
		DatagramSocket socket = null;
		try {
			socket = new DatagramSocket(null);
			socket.setReuseAddress(true); // allow several listens to same port
											// (maybe other apps together?)
			socket.bind(new InetSocketAddress(zzzPort));
			while (true) { // TODO think about suspending...
				final DatagramPacket recv = new DatagramPacket(buffer, buffer.length);
				try {
					socket.receive(recv);

					// copy bytes, in case another reference keeps using them
					final byte[] recvBytes = new byte[recv.getLength()];
					for (int i = 0; i < recvBytes.length; i++) {
						recvBytes[i] = buffer[i];
					}
					final UDPMessage msg = new UDPMessage(recvBytes, false, recv.getAddress().getHostAddress(),
							recv.getPort());

					udpReceived(msg);
				}
				catch (SocketTimeoutException e) {
					// TODO if using that, need to set so timeout...
					// no connection received, no problems...
				}
			}
		}
		catch (Exception e) {
			Log.e("udp", "Cannot receive zZz data", e);
			throw new RuntimeException(e); // will force quit
		}
		finally {
			if (socket != null) socket.close();
		}
	}

	public void send(final UDPMessage msg) {
		(new Thread() {
			@Override
			public void run() {
				Log.d("udp", msg.toString());
				byte[] data = msg.getBytes();

				DatagramSocket socket = null;
				try {
					socket = new DatagramSocket();
					InetAddress ip = InetAddress.getByName(msg.getAddress());
					DatagramPacket pkt = new DatagramPacket(data, data.length, ip, msg.getPort());
					socket.send(pkt);
				}
				catch (Exception e) {
					Log.e("udp", "Cannot send zZz data", e);
					throw new RuntimeException(e); // will force quit
				}
				finally {
					if (socket != null) socket.close();
				}
			}
		}).start();
	}

	private void udpReceived(UDPMessage msg) {
		Log.d("udp", msg.toString());
		if (msg.isRequest()) return; // ignore requests

		if (msg.getMessageType() == ZMessageType.RESPOND_PONG) {
			Log.i("udp", "Found zZz at " + msg.getAddress());
		}

		mainActivity.udpReceived(msg);
	}
}
