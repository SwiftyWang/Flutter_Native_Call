package com.zsl.mallflutter.cart;

import android.content.Context;
import android.graphics.Color;
import android.support.v4.app.FragmentActivity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

import io.flutter.facade.Flutter;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.platform.PlatformView;

class Cart implements PlatformView, MethodChannel.MethodCallHandler {
    private LinearLayout mCartView;
    int i = 0;

    Cart(FragmentActivity fragmentActivity, Context context, BinaryMessenger messenger, int i, Object o) {
        mCartView = new LinearLayout(context);
        mCartView.setOrientation(LinearLayout.VERTICAL);
        mCartView.setLayoutParams(new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        TextView textView = new TextView(context);
        textView.setText("This text is from Android native view");
        textView.setBackgroundColor(Color.BLUE);
        textView.setTextColor(Color.WHITE);
        textView.setPadding(20, 20, 20, 20);
        
        mCartView.addView(textView, new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        View flutterView = Flutter.createView(fragmentActivity, fragmentActivity.getLifecycle(), "route1");
        FrameLayout.LayoutParams layout = new FrameLayout.LayoutParams(FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.MATCH_PARENT);
        mCartView.addView(flutterView, layout);

        MethodChannel methodChannel = new MethodChannel(messenger, "com.rhyme/cart_" + i);
        methodChannel.setMethodCallHandler(this);
    }

    @Override
    public View getView() {
        return mCartView;
    }

    @Override
    public void dispose() {
        //this is destroy
    }

    @Override
    public void onMethodCall(final MethodCall methodCall, final MethodChannel.Result result) {
        switch (methodCall.method) {
            case "add":
                break;
        }
    }
}