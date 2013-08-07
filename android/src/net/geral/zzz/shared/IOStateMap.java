package net.geral.zzz.shared;


public class IOStateMap {
	private final boolean isInputMap;
	private boolean defaultValue = false;
	private boolean[] values = new boolean[0];

	public IOStateMap(boolean isInputMap) {
		this.isInputMap = isInputMap;
	}

	public boolean getDefaultValue() {
		return defaultValue;
	}

	public void setDefaultValue(boolean defaultValue) {
		this.defaultValue = defaultValue;
	}

	public synchronized boolean get(int number) {
		boolean[] sync = values; // if array is recreated, we are using a copy
		if (number >= sync.length)
			return defaultValue;
		return values[number];
	}

	public synchronized void update(UDPMessage udp) {
		if (isInputMap)
			updateInput(udp);
		else
			updateOutput(udp);
	}

	private void updateOutput(UDPMessage udp) {
		switch (udp.getMessageType()) {
		case RESPOND_CHECK_OUTPUT:
			respondCheckOne(udp);
			break;
		case RESPOND_CHECK_OUTPUTS:
			respondCheckAll(udp);
			break;
		case RESPOND_IO_CHANGED:
			respondIoChanged(udp);
			break;
		case RESPOND_IO_COUNT:
			respondIoCount(udp);
			break;
		case RESPOND_TURNOFF_MANY:
			respondTurnoffMany(udp);
			break;
		case RESPOND_TURNOFF_ONE:
			respondTurnoffOne(udp);
			break;
		case RESPOND_TURNONOFF_ALL:
			respondTurnonoffAll(udp);
			break;
		case RESPOND_TURNON_MANY:
			respondTurnonMany(udp);
			break;
		case RESPOND_TURNON_ONE:
			respondTurnonOne(udp);
			break;
		default:
			break;
		}
	}

	private void respondTurnonOne(UDPMessage udp) {
		byte[] bytes = udp.getBytes();
		int n = bytes[1] & 0xFF;
		setValue(n, true);
	}

	private void respondTurnonMany(UDPMessage udp) {
		byte[] bytes = udp.getBytes();
		int bits = (bytes.length - 1) * 8;
		bits = Math.min(values.length, bits);
		for (int i = 0; i < bits; i++) {
			if (values[i])
				continue; // already on
			int nByte = 1 + i / 8;
			int nBit = i % 8;
			byte mask = (byte) (1 << nBit);
			boolean b = ((bytes[nByte] & mask) == mask);
			if (b)
				values[i] = true;
		}
	}

	private void respondTurnonoffAll(UDPMessage udp) {
		byte[] bytes = udp.getBytes();
		int bits = (bytes.length - 1) * 8;
		bits = Math.min(values.length, bits);
		for (int i = 0; i < bits; i++) {
			int nByte = 1 + i / 8;
			int nBit = i % 8;
			byte mask = (byte) (1 << nBit);
			boolean b = ((bytes[nByte] & mask) == mask);
			values[i] = b;
		}
	}

	private void respondTurnoffOne(UDPMessage udp) {
		byte[] bytes = udp.getBytes();
		int n = bytes[1] & 0xFF;
		setValue(n, false);
	}

	private void respondTurnoffMany(UDPMessage udp) {
		byte[] bytes = udp.getBytes();
		int bits = (bytes.length - 1) * 8;
		bits = Math.min(values.length, bits);
		for (int i = 0; i < bits; i++) {
			if (!values[i])
				continue; // already off
			int nByte = 1 + i / 8;
			int nBit = i % 8;
			byte mask = (byte) (1 << nBit);
			boolean b = ((bytes[nByte] & mask) == mask);
			if (b)
				values[i] = false;
		}
	}

	private void respondIoCount(UDPMessage udp) {
		byte[] bytes = udp.getBytes();
		int n = bytes[isInputMap ? 0 : 1] & 0xFF;
		setMaxValues(n);
	}

	public synchronized void setMaxValues(int n) {
		if (values.length == n)
			return;

		boolean[] oldValues = values;
		boolean[] newValues = new boolean[n];
		for (int i = 0; i < newValues.length; i++) {
			newValues[i] = (oldValues.length < i) ? oldValues[i] : defaultValue;
		}
		values = newValues;
	}

	private void respondIoChanged(UDPMessage udp) {
		byte[] bytes = udp.getBytes();
		int n = bytes[isInputMap ? 1 : 3] & 0xFF;
		boolean v = (bytes[isInputMap ? 2 : 4] != 0);
		setValue(n, v);
	}

	private void respondCheckAll(UDPMessage udp) {
		byte[] bytes = udp.getBytes();
		int bits = (bytes.length - 1) * 8;
		bits = Math.min(values.length, bits);
		for (int i = 0; i < bits; i++) {
			int nByte = 1 + i / 8;
			int nBit = i % 8;
			byte mask = (byte) (1 << nBit);
			boolean b = ((bytes[nByte] & mask) == mask);
			values[i] = b;
		}
	}

	private void respondCheckOne(UDPMessage udp) {
		byte[] bytes = udp.getBytes();
		int n = bytes[1] & 0xFF;
		boolean v = (bytes[2] != 0);
		setValue(n, v);
	}

	public synchronized void setValue(int index, boolean value) {
		if (index < values.length)
			values[index] = value;
	}

	private void updateInput(UDPMessage udp) {
		// TODO Auto-generated method stub
		// add methods to set input states
	}

	public synchronized int getSize() {
		return values.length;
	}
}
