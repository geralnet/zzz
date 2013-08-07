package net.geral.zzz.acontroller;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

public class LightListAdapter extends BaseAdapter {
	private Context mContext;
	private static String labels[] = new String[] {
			"Lavanderia - Branca Tanque", "Lavanderia - Branca Janela",
			"Lavanderia - Amarela", "Lavanderia - Bancada",
			"Lavanderia - Banheiro", "Sala - Estar", "Sala - Jantar",
			"Sala - Corredor" };

	public LightListAdapter(Context c) {
		mContext = c;
	}

	public View getView(int position, View convertView, ViewGroup parent) {
		TextView view;
		if (convertView == null) {
			// itemView = new ImageView(mContext);
			view = new TextView(mContext);
			view.setText(position < labels.length ? labels[position] : "P"
					+ position);
			view.setTextSize(20.0f);
			view.setCompoundDrawablesWithIntrinsicBounds(
					R.drawable.ic_light_isoff, // left
					0, // top
					0, // right
					0// bottom
			);
			view.setPadding(8, 8, 8, 8);
		} else {
			view = (TextView) convertView;
		}
		return view;
	}

	@Override
	public int getCount() {
		return 64;
	}

	@Override
	public Object getItem(int position) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long getItemId(int position) {
		// TODO Auto-generated method stub
		return 0;
	}
}