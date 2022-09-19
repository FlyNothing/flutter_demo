import 'package:flutter/material.dart';
import 'package:flutter_demo/plugin/cachednetworkimage/cached_network_image_page.dart';
import 'package:flutter_demo/plugin/easyloading/page/easy_loading_page.dart';
import 'package:flutter_demo/plugin/qrcode/qr_code_page.dart';
import 'package:flutter_demo/plugin/sharedpreferences/shared_preferences_page.dart';

List<PluginMenuVO> pluginMenuList = [
  PluginMenuVO("easy_loading", "进度加载", const EasyLoadingPage()),
  PluginMenuVO("qr_code", "二维码生成", const QRCodePage('{"code": "A Test QR Code"}')),
  PluginMenuVO("cached_network_image", "图片缓存", const CachedNetworkImagePage()),
  PluginMenuVO("shared_preferences", "轻量级本地存储", const SharedPreferencesPage()),
];

class PluginMenuVO {
  PluginMenuVO(this.code, this.name, this.page);

  final String code;
  final String name;
  final Widget page;
}
