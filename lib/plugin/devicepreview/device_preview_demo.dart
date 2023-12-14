import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/common/home/app.dart';

isDevicePreview() {
  return false;
}

getDevicePreview() {
  return DevicePreview(
    // devices: [DeviceInfo.genericPhone(platform: TargetPlatform.iOS, id: "iPhone8", name: "iPhone8", screenSize: const Size(375, 668))],
    // isToolbarVisible: true,
    enabled: true,
    availableLocales: const [Locale('zh')],
    defaultDevice: Devices.ios.iPhone13,
    tools: const [...DevicePreview.defaultTools],
    // storage: DevicePreviewStorage.none(),
    // backgroundColor: Colors.red,
    builder: (context) => const App(),
  );
}
