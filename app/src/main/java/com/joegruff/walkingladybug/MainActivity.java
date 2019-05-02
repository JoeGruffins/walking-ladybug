package com.joegruff.walkingladybug;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;

/**
 * Created by joe on 12/29/16.
 */

public class MainActivity extends Activity {
    MySurfaceView view;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        view = new MySurfaceView(this);
        setContentView(view);
    }
}
