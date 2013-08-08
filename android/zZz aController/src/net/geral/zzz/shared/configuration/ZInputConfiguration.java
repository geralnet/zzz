package net.geral.zzz.shared.configuration;

import java.io.Serializable;

public class ZInputConfiguration implements Serializable {
	private static final long	serialVersionUID	= 1L;

	private int					number;
	private String				name;
	private String				description;

	public ZInputConfiguration(int number, String name, String description) {
		this.number = number;
		this.name = name;
		this.description = description;
	}

	public String getDescription() {
		return description;
	}

	public String getName() {
		return name;
	}

	public int getNumber() {
		return number;
	}
}
