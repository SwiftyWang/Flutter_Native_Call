package com.zsl.mallflutter.cart;

import android.content.Context;
import android.support.v4.app.FragmentActivity;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

class CartFactory extends PlatformViewFactory {

    private final FragmentActivity fragmentActivity;
    private final BinaryMessenger messenger;

    public CartFactory(FragmentActivity fragmentActivity, BinaryMessenger messenger) {
        super(StandardMessageCodec.INSTANCE);
        this.messenger = messenger;
        this.fragmentActivity = fragmentActivity;
    }

    @Override
    public PlatformView create(Context context, int i, Object o) {
        return new Cart(fragmentActivity, context, messenger, i, o);
    }
}