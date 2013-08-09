package net.geral.zzz.shared.configuration;

import java.io.Serializable;

public class ZConfiguration implements Serializable {
	private static final long		serialVersionUID	= 1L;

	private byte[]					macAddress			= toByteArray(0x00, 0xAA, 0xBB, 0xCC, 0xDE, 0x02);
	private boolean					useDHCP				= true;
	private int						udpPort				= 0x7A5A;
	private byte[]					ipAddress			= toByteArray(192, 168, 1, 50);
	private byte[]					netmask				= toByteArray(255, 255, 255, 0);
	private byte[]					gateway				= toByteArray(192, 168, 1, 1);
	private String					name				= "zZz";
	private String					description			= "New zZz configuration.";
	private String					username			= "root";
	private String					password			= "zzz";
	private ZInputConfiguration[]	inputs				= createDefaultInputsConfig(64);
	private ZOutputConfiguration[]	outputs				= createDefaultOutputsConfig(64);

	public String getMacString() {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < macAddress.length; i++) {
			if (i > 0) sb.append(":");
			sb.append(String.format("%02X", macAddress[i] & 0xFF));
		}
		return sb.toString();
	}

	public String getName() {
		return name;
	}

	public String getDescription() {
		return description;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public static byte[] toByteArray(int... values) {
		byte[] bytes = new byte[values.length];
		for (int i = 0; i < bytes.length; i++) {
			bytes[i] = (byte) values[i];
		}
		return bytes;
	}

	private static ZOutputConfiguration[] createDefaultOutputsConfig(int nOutputs) {
		ZOutputConfiguration[] outputs = new ZOutputConfiguration[nOutputs];
		for (int i = 0; i < nOutputs; i++) {
			outputs[i] = new ZOutputConfiguration(i, "Output #" + (i + 1), "Group #" + (((i + 1) / 10) + 1),
					"Unconfigured output.");
		}
		return outputs;
	}

	private static ZInputConfiguration[] createDefaultInputsConfig(int nInputs) {
		ZInputConfiguration[] inputs = new ZInputConfiguration[nInputs];
		for (int i = 0; i < nInputs; i++) {
			inputs[i] = new ZInputConfiguration(i, "Input #" + (i + 1), "Unconfigured input.");
		}
		return inputs;
	}

	public boolean isUseDHCP() {
		return useDHCP;
	}

	public String getIpString() {
		return bytes2ip(ipAddress);
	}

	private static String bytes2ip(byte[] b) {
		if (b.length != 4) return "";
		return String.format("%d.%d.%d.%d", b[0] & 0xFF, b[1] & 0xFF, b[2] & 0xFF, b[3] & 0xFF);
	}

	public int getUdpPort() {
		return udpPort;
	}

	public String getNetmaskString() {
		return bytes2ip(netmask);
	}

	public String getGatewayString() {
		return bytes2ip(gateway);
	}

	public ZInputConfiguration[] getInputConfiguration() {
		return inputs.clone();
	}

	public ZOutputConfiguration[] getOutputConfiguration() {
		return outputs.clone();
	}

	public void setOutputConfiguration(ZOutputConfiguration[] data) {
		outputs = data;
	}

	public void setIp(byte[] newIP) {
		ipAddress = newIP;
	}
}
