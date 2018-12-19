package com.example.growingioexample;

import io.flutter.app.FlutterApplication;
import com.growingio.android.sdk.collection.Configuration;
import com.growingio.android.sdk.collection.GrowingIO;

public class Application extends FlutterApplication {

    @Override
    public void onCreate() {
        super.onCreate();
        GrowingIO.startWithConfiguration( this,
          new Configuration()
            .setChannel("CHANNEL_NAME")
            .setRnMode(true)     // 这个必须设置
            .setDebugMode(true)   // 显示日志， release环境请关闭
            .setTestMode(true));  // 即时发送， release环境请关闭
    }
}