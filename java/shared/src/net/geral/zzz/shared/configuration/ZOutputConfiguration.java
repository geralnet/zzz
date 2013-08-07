package net.geral.zzz.shared.configuration;

import java.io.Serializable;

public class ZOutputConfiguration implements Serializable {
	private static final long	serialVersionUID	= 1L;

	private int					number;
	private String				name;
	private String				group;
	private String				description;

	public ZOutputConfiguration(int number, String name, String group, String description) {
		this.number = number;
		this.name = name;
		this.group = group;
		this.description = description;
	}

	public String getDescription() {
		return description;
	}

	public String getGroup() {
		return group;
	}

	public String getName() {
		return name;
	}

	public int getNumber() {
		return number;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setNumber(int number) {
		this.number = number;
	}
}
