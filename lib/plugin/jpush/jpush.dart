import 'package:flutter/material.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

late JPush _jpush;

void initJpush() {
  _jpush = JPush();

  _jpush.addEventHandler(
    // 接收通知回调方法
    onReceiveNotification: (Map<String, dynamic> message) async {
      debugPrint("onReceiveNotification: $message");
    },
    // 点击通知回调方法
    onOpenNotification: (Map<String, dynamic> message) async {
      debugPrint("onOpenNotification: $message");
      _jpush.clearAllNotifications(); //清除通知栏上所有通知
    },
    onReceiveMessage: (Map<String, dynamic> message) async {
      debugPrint("onReceiveMessage: $message");
    },
    onReceiveNotificationAuthorization: (Map<String, dynamic> message) async {
      debugPrint("onReceiveNotificationAuthorization: $message");
    },
    onNotifyMessageUnShow: (Map<String, dynamic> message) async {
      debugPrint("onNotifyMessageUnShow: $message");
    },
  );
  _jpush.setup(
    appKey: "xxxxxxxxxxxxxxxxxxxxxx",
    channel: "developer-default",
    production: false,
    debug: false, // 设置是否打印 debug 日志
  );
}

Future<String> getRegistrationID() async {
  String rid = await _jpush.getRegistrationID();
  return rid;
}
