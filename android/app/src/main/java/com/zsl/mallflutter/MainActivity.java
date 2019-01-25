package com.zsl.mallflutter;

import android.graphics.Color;
import android.os.Build;
import android.os.Bundle;
import android.view.Window;
import android.view.WindowManager;

import com.zsl.mallflutter.cart.CartPlugin;

import io.flutter.app.FlutterFragmentActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterFragmentActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Window window = getWindow();
        if (window != null) {
            //设置透明状态栏
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
                window.addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
            }
            //设置5.0及以上状态栏颜色透明
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                window.setStatusBarColor(Color.TRANSPARENT);
            }

        }
        CartPlugin.registerWith(this, getFlutterView().getPluginRegistry().registrarFor("test.key"));
        GeneratedPluginRegistrant.registerWith(this);
    }
}
