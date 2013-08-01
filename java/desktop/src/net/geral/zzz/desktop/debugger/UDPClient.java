package net.geral.zzz.desktop.debugger;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;

import net.geral.zzz.shared.IOMessage;

class UDPClient {
	public static void main(String args[]) throws Exception {
		DatagramSocket clientSocket = new DatagramSocket();
		InetAddress IPAddress = InetAddress.getByName("192.168.12.255");
		byte[] receiveData = new byte[1024];
		// byte[] sendData = IOMessage.IO_COUNT.with();
		for (int i = 0; i < 10; i++) {
			byte[] sendData = IOMessage.TURNON_ONE.with((byte) i);
			DatagramPacket sendPacket = new DatagramPacket(sendData,
					sendData.length, IPAddress, 0x7A5A);
			clientSocket.send(sendPacket);
		}
		byte[] sendData = IOMessage.TURNOFF_ONE.with((byte) 0);
		DatagramPacket sendPacket = new DatagramPacket(sendData,
				sendData.length, IPAddress, 0x7A5A);
		clientSocket.send(sendPacket);
		DatagramPacket receivePacket = new DatagramPacket(receiveData,
				receiveData.length);
		clientSocket.receive(receivePacket);
		String modifiedSentence = new String(receivePacket.getData());
		System.out.println("FROM SERVER:" + modifiedSentence);
		clientSocket.close();
	}
}