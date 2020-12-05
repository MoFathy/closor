package com.hatemido.closer_app


import android.os.Bundle

import io.flutter.plugins.GeneratedPluginRegistrant
import android.view.WindowManager.LayoutParams
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {

//    override fun onCreate(savedInstanceState: Bundle?) {
//        super.onCreate(savedInstanceState)
//        GeneratedPluginRegistrant.registerWith(this)
//        getWindow().addFlags(LayoutParams.FLAG_SECURE)
//    }
//    confi
override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    GeneratedPluginRegistrant.registerWith(flutterEngine)

}
}
