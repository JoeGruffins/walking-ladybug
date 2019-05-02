package com.joegruff.walkingladybug;

import android.content.Context;
import android.opengl.GLSurfaceView;

/**
 * Created by joe on 12/29/16.
 */

public class MySurfaceView extends GLSurfaceView {
    private final MyRenderer mRenderer;

    public MySurfaceView (Context context) {
        super(context);
        setEGLContextClientVersion(2);
        mRenderer = new MyRenderer();
        setRenderer(mRenderer);
    }
}
