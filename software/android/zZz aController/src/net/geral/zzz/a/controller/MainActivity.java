package net.geral.zzz.a.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import net.geral.zzz.shared.IOStateMap;
import net.geral.zzz.shared.UDPMessage;
import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

public class MainActivity extends Activity {
	private class LightListAdapter extends ArrayAdapter<String> {
		HashMap<String, Integer>	mIdMap	= new HashMap<String, Integer>();

		public LightListAdapter(Context context, int textViewResourceId, List<String> objects) {
			super(context, textViewResourceId, objects);
			for (int i = 0; i < objects.size(); ++i) {
				mIdMap.put(objects.get(i), i);
			}
		}

		@Override
		public long getItemId(int position) {
			String item = getItem(position);
			return mIdMap.get(item);
		}

		@Override
		public boolean hasStableIds() {
			return true;
		}
	}

	private final IOStateMap	outputs	= new IOStateMap(false);
	private final UDPController	udp		= new UDPController(this);

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		final ListView listview = (ListView) findViewById(R.id.listViewLights);
		String[] values = new String[] { "Lavanderia - Branca Tanque", "Lavanderia - Branca Janela",
				"Lavanderia - Amarela", "Lavanderia - Bancada", "Lavanderia - Banheiro", "Sala - Jantar",
				"Sala - Estar", "Sala - Corredor" };

		final ArrayList<String> list = new ArrayList<String>();
		for (int i = 0; i < values.length; ++i) {
			list.add(values[i]);
		}
		final LightListAdapter adapter = new LightListAdapter(this, android.R.layout.simple_list_item_1, list);
		listview.setAdapter(adapter);

		listview.setOnItemClickListener(new AdapterView.OnItemClickListener() {
			@Override
			public void onItemClick(AdapterView<?> parent, final View view, int position, long id) {
				boolean status = !outputs.get(position);
				outputs.setValue(position, status);

				System.out.println("Changed (" + position + "): " + status);
				Log.i("light", "Changed (" + position + "): " + status);
				Toast.makeText(MainActivity.this, "Changed (" + position + "): " + status, Toast.LENGTH_SHORT).show();

				udp.requestSetOutput(position, status);
			}
		});

		udp.start();
		udp.ping();

		outputs.setMaxValues(8);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	public void udpReceived(UDPMessage msg) {
		// TODO Auto-generated method stub

	}
}
