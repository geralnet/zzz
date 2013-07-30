package net.geral.zzz.shared;

public enum OutputMessage {
	ECHO_REQUEST(0x00, 4);

	private int byteCode;
	private int dataBytes;

	private OutputMessage(int byteCode, int dataBytes) {
		this.byteCode = byteCode;
		this.dataBytes = dataBytes;
	}
}
