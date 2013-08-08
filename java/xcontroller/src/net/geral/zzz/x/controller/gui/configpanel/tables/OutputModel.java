package net.geral.zzz.x.controller.gui.configpanel.tables;

import net.geral.lib.table.GNTableModel;
import net.geral.zzz.shared.configuration.ZOutputConfiguration;

public class OutputModel extends GNTableModel<ZOutputConfiguration> {
	private static final long serialVersionUID = 1L;

	public OutputModel() {
		super(true, true, true);
	}

	@Override
	protected ZOutputConfiguration changeEntry(ZOutputConfiguration t,
			int columnIndex, Object aValue) {
		if (aValue == null)
			return null;

		switch (columnIndex) {
		case 0:
			try {
				int n = Integer.valueOf(aValue.toString());
				t.setNumber(n);
				return t;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		case 1:
			t.setGroup(aValue.toString());
			return t;
		case 2:
			t.setName(aValue.toString());
			return t;
		case 3:
			t.setDescription(aValue.toString());
			return t;
		}
		return null;
	}

	@Override
	public ZOutputConfiguration createNewEntry() {
		return new ZOutputConfiguration(getRowCount(), "New Input", "", "");
	}

	@Override
	protected Object getValueFor(ZOutputConfiguration obj, int columnIndex) {
		switch (columnIndex) {
		case 0:
			return obj.getNumber() + 1;
		case 1:
			return obj.getGroup();
		case 2:
			return obj.getName();
		case 3:
			return obj.getDescription();
		default:
			return "C" + columnIndex;
		}
	}
}
