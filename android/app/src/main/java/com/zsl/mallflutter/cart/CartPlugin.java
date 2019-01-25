package com.zsl.mallflutter.cart;

import android.support.v4.app.FragmentActivity;

import io.flutter.plugin.common.PluginRegistry;

public class CartPlugin {

    public static void registerWith(FragmentActivity fragmentActivity, PluginRegistry.Registrar registrar) {
        registrar.platformViewRegistry()
                .registerViewFactory("com.rhyme/cart", new CartFactory(fragmentActivity, registrar.messenger()));
    }
}