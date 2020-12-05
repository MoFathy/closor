package com.hatemido.closer_app

import io.flutter.app.FlutterApplication
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugins.firebasemessaging.FlutterFirebaseMessagingService;

class Application : FlutterApplication(), PluginRegistrantCallback {
    override fun registerWith(registry: PluginRegistry?) {
        //        GeneratedPluginRegistrant.registerWith(registry)

    }

    override fun onCreate() {
        super.onCreate()
        FlutterFirebaseMessagingService.setPluginRegistrant(this)
    }

//    override fun registerWith(registry: PluginRegistry) {
//        GeneratedPluginRegistrant.registerWith(registry)
//    }
    

//    override fun registerWith(registry: PluginRegistry?) {
//        GeneratedPluginRegistrant.registerWith(registry)
//    }
}