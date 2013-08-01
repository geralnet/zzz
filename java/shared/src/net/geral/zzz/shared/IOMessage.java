package net.geral.zzz.shared;

import java.nio.ByteBuffer;
import java.security.InvalidParameterException;

// bytecode could be dynamic, but we do not want it to change easily

public enum IOMessage {
	PING(0x00, 9, 9, "B1-8=Current time in millis", "B1-8=Echo same bytes back"),
	IO_COUNT(0x01, 0, 2, "[nothing]", "B1=Number of Inputs ; B2=Number of Outputs"),
	TURNON_ONE(0x02, 1, 1, "B1=Output # to set ON", "B1=Same byte back"),
	TURNOFF_ONE(0x03, 1, 1, "B1=Output # to set OFF", "B1=Same byte back"),
	TURNON_MANY(0x04, 32, 32, "B1-32=Output bits, 1(turn on) 0(do not change)", "B1-32 Same bytes back"),
	TURNOFF_MANY(0x05, 32, 32, "B1-32=Output bits, 1(turn off) 0(do not change)", "B1-32 Same bytes back"),
	TURNONOFF_ALL(0x06, 32, 32, "B1-32=Output bits, 1(turn on) 0(turn off)", "B1-32 Same bytes back"),
	CHECK_OUTPUT(0x07, 1, 2, "B1=Output # to check", "B1=Output # checked, B2=0(off) 1(on)"),
	CHECK_OUTPUTS(0x08, 0, 32, "[nothing]", "B1-32=Output bits, 0(off) 1(on)"),
	CHECK_INPUT(0x09, 1, 2, "B1=Input # to check", "B1=Input # checked, B2=0(off) 1(on)"),
	CHECK_INPUTS(0x0A, 0, 32, "[nothing]", "B1-32=Input bits, 0(off) 1(on)");

	private static final IOMessage[]	bytecodeMap;
	private static final int			maxBytes;
	private final byte					bytecode;
	private final int					sendMaxBytes, recvMaxBytes;
	private final String				sendDescription, recvDescription;

	static {
		// class dynamic-constants LOL
		int max = 0;
		bytecodeMap = new IOMessage[0xFF];
		for (int i = 0; i < 0xFF; i++) {
			bytecodeMap[i] = null;
		}
		// create map and find max bytes
		for (IOMessage msg : values()) {
			if (bytecodeMap[msg.bytecode] != null) {
				throw new RuntimeException("Duplicated bytecode: " + msg.bytecode);
			}
			bytecodeMap[msg.bytecode] = msg;
			max = Math.max(max, Math.max(msg.sendMaxBytes, msg.recvMaxBytes));
		}
		maxBytes = max;
	}

	private IOMessage(int bytecode, int sendBytes, int recvBytes, String sendDescription, String recvDescription) {
		this.bytecode = (byte) bytecode;
		this.sendMaxBytes = sendBytes;
		this.recvMaxBytes = recvBytes;
		this.sendDescription = sendDescription;
		this.recvDescription = recvDescription;
	}

	public byte[] withInt(int i) {
		ByteBuffer buf = ByteBuffer.allocate(sendMaxBytes);
		buf.put(bytecode);
		buf.putInt(i);
		if (buf.hasRemaining()) throw new InvalidParameterException("Missing " + buf.remaining() + " bytes.");
		return buf.array();
	}

	public byte[] with(byte b) {
		ByteBuffer buf = ByteBuffer.allocate(sendMaxBytes);
		buf.put(bytecode);
		buf.put(b);
		if (buf.hasRemaining()) throw new InvalidParameterException("Missing " + buf.remaining() + " bytes.");
		return buf.array();
	}

	public byte[] with(long l) {
		ByteBuffer buf = ByteBuffer.allocate(sendMaxBytes);
		buf.put(bytecode);
		buf.putLong(l);
		if (buf.hasRemaining()) throw new InvalidParameterException("Missing " + buf.remaining() + " bytes.");
		return buf.array();
	}

	public static void main(String[] args) {
		System.out.println("#define MAX_MESSAGE_SIZE " + maxBytes);
		for (IOMessage msg : values()) {
			System.out.println();
			System.out.println("// Client Output (" + msg.sendMaxBytes + "): " + msg.sendDescription);
			System.out.println("// Client Input (" + msg.recvMaxBytes + "): " + msg.recvDescription);
			System.out.println("#define MSG_" + msg.name() + " " + (msg.bytecode & 0xFF));
			System.out.println("#define COB_" + msg.name() + " " + msg.sendMaxBytes);
			System.out.println("#define CIB_" + msg.name() + " " + msg.recvMaxBytes);
		}
	}

	public byte[] with() {
		return new byte[] { bytecode };
	}
}
