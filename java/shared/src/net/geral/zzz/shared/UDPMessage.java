package net.geral.zzz.shared;

public class UDPMessage {
	private final byte[]	bytes;
	private final boolean	sent;
	private final String	address;
	private final int		port;

	public UDPMessage(byte[] bytes, boolean sent, String address, int port) {
		this.bytes = bytes;
		this.sent = sent;
		this.address = address;
		this.port = port;
	}

	public int getPort() {
		return port;
	}

	public String getAddress() {
		return address;
	}

	@Override
	public String toString() {
		return toString(16);
	}

	public ZMessageType getMessageType() {
		// use & 0xFF to convert negative bytes to proper positive int
		return ZMessageType.forBytecode(bytes[0] & 0xFF);
	}

	public String getDataString(int base) {
		StringBuilder sb = new StringBuilder();
		// base2=8, base16=2, others (decimal)=3
		int len = (base == 2) ? 8 : (base == 16 ? 2 : 3);
		for (int i = 1; i < bytes.length; i++) {
			if (i > 1) {
				int sep = i - 1;
				if (sep % 8 == 0) sb.append(':');
				else if (sep % 4 == 0) sb.append('.');
				else sb.append(' ');
			}
			int v = bytes[i] & 0xFF;
			String s = Integer.toString(v, base).toUpperCase();
			for (int j = s.length(); j < len; j++) {
				sb.append('0');
			}
			sb.append(s);
		}
		return sb.toString();
	}

	public byte[] getBytes() {
		return bytes.clone();
	}

	public String toString(int base) {
		char sr = sent ? '>' : '<';
		return String.format("%-15s%c 0x%02X=%-30s[%3d] %s", address, sr, bytes[0], getMessageType(), bytes.length - 1,
				getDataString(base));
	}

	public boolean isSent() {
		return sent;
	}

	public String getAddressPort() {
		return String.format("%s:%d", address, port);
	}

	public boolean isRequest() {
		return ((bytes[0] & 0x80) == 0);
	}

	public boolean isResponse() {
		return ((bytes[0] & 0x80) == 0x80);
	}
}
