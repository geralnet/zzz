package net.geral.zzz.xcontroller.gui.configpanel.tables;

import net.geral.lib.table.GNTableModel;
import net.geral.zzz.shared.configuration.ZInputConfiguration;

public class InputModel extends GNTableModel<ZInputConfiguration> {
	private static final long serialVersionUID = 1L;

	public InputModel() {
		super(true, true, true);
	}

	@Override
	protected ZInputConfiguration changeEntry(ZInputConfiguration t,
			int columnIndex, Object aValue) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ZInputConfiguration createNewEntry() {
		return new ZInputConfiguration(getRowCount(), "New Input", "");
	}

	@Override
	protected Object getValueFor(ZInputConfiguration obj, int columnIndex) {
		switch (columnIndex) {
		case 0:
			return obj.getNumber() + 1;
		case 1:
			return obj.getName();
		case 2:
			return obj.getDescription();
		default:
			return "C" + columnIndex;
		}
	}
}
