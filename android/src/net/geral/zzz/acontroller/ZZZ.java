package net.geral.zzz.acontroller;

import net.geral.zzz.acontroller.sharedcopy.IOStateMap;
import net.geral.zzz.acontroller.sharedcopy.ZConfiguration;

public class ZZZ {
	private ZZZ() {
	}

	private static ZConfiguration config = new ZConfiguration();
	private static IOStateMap outputs = new IOStateMap(false);

	public static ZConfiguration config() {
		return config;
	}

	public static IOStateMap outputs() {
		return outputs;
	}
}
