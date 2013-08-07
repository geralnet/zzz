package net.geral.zzz.xcontroller.debugger;

import javax.swing.DefaultListModel;
import net.geral.zzz.shared.UDPMessage;

public class LogListModel extends DefaultListModel<LogListModel.UDPLogMessage> {
	public static class UDPLogMessage {
		public final UDPMessage Value;
		private int base;

		public UDPLogMessage(UDPMessage msg, int base) {
			Value = msg;
			this.base = base;
		}

		@Override
		public String toString() {
			return Value.toString(base);
		}

		public void setBase(int base) {
			this.base = base;
		}

		public int getBase() {
			return base;
		}
	}

	private static final long serialVersionUID = 1L;
	private int base = 10;

	public void setBase(int base) {
		this.base = base;
		for (int i = 0; i < getSize(); i++) {
			get(i).setBase(base);
		}
		fireContentsChanged(this, 0, getSize() - 1);
	}

	public void addElement(UDPMessage element) {
		addElement(new UDPLogMessage(element, base));
	}
}
