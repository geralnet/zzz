package net.geral.zzz.shared;

import java.nio.ByteBuffer;

public enum IOMessage {
	// run this enum's main() to generate arduino code
	
	PING(0x00, 8, "Ping (pong) with 8 bytes"),
	IO_COUNT(0x01, 2, "Get (send) number of inputs and outputs"),
	SET_OUTPUT_ON(0x02, 1, "Set (confirm) the status of output X to ON"),
	SET_OUTPUT_OFF(0x03, 1, "Set (confirm) the status of output X to OFF"),
	SWITCH_OUTPUT(0x04, 1, "Switch (confirm) the status of output X");

	private byte byteCode;
	private int size;
	private String description;

	private IOMessage(int byteCode, int dataBytes, String description) {
		this.byteCode = (byte) byteCode;
		this.size = dataBytes + 1;
		this.description = description;
	}

	public byte[] with(int i) {
		ByteBuffer buf = ByteBuffer.allocate(size);
		buf.put(byteCode);
		buf.putInt(i);
		return buf.array();
	}
	public byte[] with(byte b) {
		ByteBuffer buf = ByteBuffer.allocate(size);
		buf.put(byteCode);
		buf.put(b);
		return buf.array();
	}

	public byte[] with(long l) {
		ByteBuffer buf = ByteBuffer.allocate(size);
		buf.put(byteCode);
		buf.putLong(l);
		return buf.array();
	}

	public static void main(String[] args) {
		int max = 0;
		for (IOMessage msg : values()) {
			max = Math.max(max, msg.size);
		}
		System.out.println("#define MAX_MESSAGE_SIZE "+max);
		for (IOMessage msg : values()) {
			System.out.println("#define MSG_" + msg.name() + " "
					+ (msg.byteCode & 0xFF) + " // " + msg.description);
			System.out
					.println("#define MSGSIZE_" + msg.name() + " " + msg.size);
		}
	}

	public byte[] with() {
		return new byte[] { byteCode };
	}
}
