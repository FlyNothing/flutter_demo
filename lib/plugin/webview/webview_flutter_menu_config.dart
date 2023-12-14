import 'package:flutter_demo/common/vo/base_menu_vo.dart';
import 'package:flutter_demo/plugin/webview/webview_flutter/webview_flutter1_page.dart';
import 'package:flutter_demo/plugin/webview/webview_flutter/webview_flutter2_page.dart';

List<BaseMenuVO> webviewFlutterMenuList = [
  BaseMenuVO("Webview1", WebviewFlutter1Page("Webview1")),
  BaseMenuVO("Webview2", WebviewFlutter2Page("Webview2")),
];
