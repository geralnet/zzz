package net.geral.zzz.xcontroller.gui.configpanel.tables;

import net.geral.lib.table.GNTable;

public class OutputTable extends GNTable<OutputModel> {
	private static final long serialVersionUID = 1L;

	public OutputTable() {
		super(new OutputModel());
	}

	@Override
	protected void createColumns() {
		createColumn("#", 20);
		createColumn("Group", 50, 100, 1000);
		createColumn("Name", 50, 100, 1000);
		createColumn("Description", 50, 200, 1000);
	}

	@Override
	protected boolean deleteClicked(int viewRow, int tableColumn) {
		return true;
	}

	@Override
	public String getNewEntryText(int columnIndex) {
		if (columnIndex == 1)
			return "New Output";
		return null;
	}
}
