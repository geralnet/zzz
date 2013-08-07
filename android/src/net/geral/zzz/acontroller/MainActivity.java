package net.geral.zzz.acontroller;

import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends Activity implements OnItemClickListener {
	
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		final ListView listview = (ListView) findViewById(R.id.listViewLights);
		listview.setAdapter(new LightListAdapter(this));

		listview.setOnItemClickListener(this);
	}

	@Override
	protected void onStart() {
		super.onStart();
		System.out.println("onStart");
	}

	@Override
	protected void onResume() {
		super.onResume();
		System.out.println("onResume");
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	@Override
	public void onItemClick(AdapterView<?> parent, View view, int position,
			long id) {
		if (!(view instanceof TextView))
			return;
		TextView text = (TextView) view;

		boolean state = !ZZZ.outputs().get(position);
		ZZZ.outputs().setValue(position, state);
		text.setCompoundDrawablesWithIntrinsicBounds(
				state ? R.drawable.ic_light_ison : R.drawable.ic_light_isoff,
				0, 0, 0);

		Toast.makeText(MainActivity.this, "" + position, Toast.LENGTH_SHORT)
				.show();
	}
}
