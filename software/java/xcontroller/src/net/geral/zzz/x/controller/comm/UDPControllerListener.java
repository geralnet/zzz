package net.geral.zzz.x.controller.comm;

import java.util.EventListener;

import net.geral.zzz.shared.UDPMessage;

public interface UDPControllerListener extends EventListener {
	public void udpException(Exception e);

	public void udpReceived(UDPMessage msg, long millis);
}
