import 'package:flutter/material.dart';
import 'package:flutter_demo/common/home/my_app.dart';
import 'package:flutter_demo/plugin/devicepreview/device_preview_demo.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(isDevicePreview() ? getDevicePreview() : const MyApp());
}
