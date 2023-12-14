import 'package:flutter/material.dart';
import 'package:flutter_demo/common/home/app.dart';
import 'package:flutter_demo/plugin/devicepreview/device_preview_demo.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(isDevicePreview() ? getDevicePreview() : const App());
}
