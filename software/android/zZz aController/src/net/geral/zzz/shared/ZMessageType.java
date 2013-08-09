package net.geral.zzz.shared;

import java.util.Arrays;

/**
 * Messages exchanged between the controllers and the firmware.
 * 
 * The bytecode (1-byte) identifies the message or command. they are
 * hardcoded instead of using the enum index so it does not change accidentally
 * if new values are inserted.
 * 
 * This class' references to libraries should be kept minimal to increase its
 * compatibilities with other JVM (e.g. smartphones). It should be referenced
 * by any Java application that communicates with the zZz firmware.
 * 
 * With that in mind, it is still possible to create methods that print
 * 'translated' version of this file to other programming languages, as the example
 * of the firmware zZz in Arduino language. Please check the 'main()' method
 * and the 'outputArduino()' method as an example.
 * 
 * PING are special messages, they can be broadcasted by the controller
 * and the firmware should reply to the sender.
 * 
 * All other messages should be send to an specific controller and it will
 * reply by broadcasting.
 * 
 * All messages from controllers must have a bytecode with the leftmost bit set to zero,
 * while all responses from the firmware will have this bit set to one.
 */
public enum ZMessageType {
	MT_UNKNOW(0x00, 0, "[n/a]"),
	MT_ERROR(0x80, 0, "[n/a]"),

	REQUEST_PING(0x01, 8, "B1-8=Current time in millis"),
	RESPOND_PONG(REQUEST_PING, 8, "B1-8=Echo same bytes back"),

	REQUEST_IO_COUNT(0x02, 0, "[n/a]"),
	RESPOND_IO_COUNT(REQUEST_IO_COUNT, 2, "B1=Number of Inputs ; B2=Number of Outputs"),

	REQUEST_TURNON_ONE(0x03, 1, "B1=Output# to set ON"),
	RESPOND_TURNON_ONE(REQUEST_TURNON_ONE, 1, "B1=Output# set to ON"),

	REQUEST_TURNOFF_ONE(0x04, 1, "B1=Output# to set OFF"),
	RESPOND_TURNOFF_ONE(REQUEST_TURNOFF_ONE, 1, "B1=Output# set to OFF"),

	REQUEST_TURNON_MANY(0x05, 32, "B1-32=Output bits, 1(turn on) 0(do not change)"),
	RESPOND_TURNON_MANY(REQUEST_TURNON_MANY, 32, "B1-32=Output bits, 1(turned on) 0(unchanged)"),

	REQUEST_TURNOFF_MANY(0x06, 32, "B1-32=Output bits, 1(turn off) 0(do not change)"),
	RESPOND_TURNOFF_MANY(REQUEST_TURNOFF_MANY, 32, "B1-32=Output bits, 1(turned off) 0(unchanged)"),

	REQUEST_TURNONOFF_ALL(0x07, 32, "B1-32=Output bits, 1(turn on) 0(turn off)"),
	RESPOND_TURNONOFF_ALL(REQUEST_TURNONOFF_ALL, 32, "B1-32=Output bits, 1(turned on) 0(turned off)"),

	REQUEST_CHECK_OUTPUT(0x08, 1, "B1=Output# to check"),
	RESPOND_CHECK_OUTPUT(REQUEST_CHECK_OUTPUT, 2, "B1=Output # checked ; B2=0x00(off) other(on)"),

	REQUEST_CHECK_OUTPUTS(0x09, 0, "[n/a]"),
	RESPOND_CHECK_OUTPUTS(REQUEST_CHECK_OUTPUTS, 32, "B1-32=Output bits, 0(off) 1(on)"),

	REQUEST_CHECK_INPUT(0x0A, 1, "B1=Input# to check"),
	RESPOND_CHECK_INPUT(REQUEST_CHECK_INPUT, 2, "B1=Input# checked ; B2=0(off) 1(on)"),

	REQUEST_CHECK_INPUTS(0x0B, 0, "[n/a]"),
	RESPOND_CHECK_INPUTS(REQUEST_CHECK_INPUTS, 32, "B1-32=Input bits, 0(off) 1(on)"),

	RESPOND_IO_CHANGED(0x8C, 4, "B1=Input# Changed ; B2=Input New State ; B3=Output# Changed ; B4=Output New State");

	private static final ZMessageType[]	bytecodeMap;
	private static final int				maxMessageLength;

	public static ZMessageType forBytecode(int b) {
		ZMessageType t = bytecodeMap[b];
		if (t == null) return MT_UNKNOW;
		return t;
	}

	public static int getMaxMessageLength() {
		return maxMessageLength;
	}

	public static void main(String[] args) {
		String[] languages = new String[] { "arduino" };
		Arrays.sort(languages);
		if ((args.length != 1) || (!output(args[0].trim().toLowerCase()))) {
			System.err.println("Please provide one of the following languages:");
			for (String s : languages) {
				System.err.println(s);
			}
			System.exit(1);
		}
	}

	private static boolean output(String language) {
		if ("arduino".equals(language)) return outputArduino();
		System.err.println("Invalid language: " + language);
		return false;
	}

	private static boolean outputArduino() {
		System.out.println("#define MAX_MESSAGE_LENGTH " + maxMessageLength);
		for (ZMessageType msg : values()) {
			System.out.println(String.format("#define %-30s 0x%02X  // (%3dB max) %s", msg.name(), msg.bytecode,
					msg.maxBytes, msg.description));
		}
		return true;
	}

	// since java does not have unsigned values, let's use int for bytecode
	// remember: ((byte)0xFF == 0xFF) evaluates to false.
	private final int		bytecode;

	private final int		maxBytes;

	private final String	description;

	static {
		// class dynamic-constants LOL
		int max = 0;
		bytecodeMap = new ZMessageType[0xFF];
		for (int i = 0; i < 0xFF; i++) {
			bytecodeMap[i] = null;
		}
		// create map and find max bytes
		for (ZMessageType msg : values()) {
			if (bytecodeMap[msg.bytecode] != null) {
				throw new RuntimeException("Duplicated bytecode: " + msg.bytecode);
			}
			bytecodeMap[msg.bytecode] = msg;
			max = Math.max(max, msg.maxBytes);
		}
		maxMessageLength = max;
	}

	private ZMessageType(int bytecode, int dataBytes, String description) {
		// check bytecode range (int will become byte)
		if ((bytecode < 0) || (bytecode > 0xFF)) {
			throw new RuntimeException(String.format(
					"Invalid message: %s - Bytecode (0x%02X) is not one byte (0x00 to 0xFF).", name(), bytecode));
		}

		// check if name matches bytecode (request/respond)
		if (name().startsWith("REQUEST_")) {
			if (bytecode >= 0x80) {
				// first bit of bytecode is one
				throw new RuntimeException(String.format("Invalid message: %s - Bytecode (0x%02X) is not a request.",
						name(), bytecode));
			}
		}
		else if (name().startsWith("RESPOND_")) {
			if (bytecode < 0x80) {
				// first bit of bytecode is zero
				throw new RuntimeException(String.format("Invalid message: %s - Bytecode (0x%02X) is not a response.",
						name(), bytecode));
			}
		}
		else {
			if (!name().equals("MT_UNKNOW") && !name().equals("MT_ERROR")) {
				throw new RuntimeException("Invalid message: " + name()
						+ " - All messages (except MT_UNKNOW and MT_ERROR) must be 'REQUEST_' or 'RESPOND_'.");
			}
		}

		// set data
		this.bytecode = bytecode;
		this.maxBytes = dataBytes + 1; // data bytes + bytecode byte
		this.description = description;
	}

	private ZMessageType(ZMessageType responseFor, int dataBytes, String description) {
		// responses must have the first bit set to one
		// 0x80 = 0b1000000, but old compilers do not accept the 0b... form
		this(responseFor.bytecode | 0x80, dataBytes, description);
	}

	public String getDescription() {
		return description;
	}

	public int getMaxBytes() {
		return maxBytes;
	}

	public int getBytecode() {
		return bytecode;
	}
}
