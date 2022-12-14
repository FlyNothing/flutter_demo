import 'package:flutter/material.dart';
import 'package:flutter_demo/plugin/badges/badges_page.dart';
import 'package:flutter_demo/plugin/cachednetworkimage/cached_network_image_page.dart';
import 'package:flutter_demo/plugin/datepickertimeline/date_picker_timeline_page.dart';
import 'package:flutter_demo/plugin/flutterdatepickertimeline/flutter_date_picker_timeline_page.dart';
import 'package:flutter_demo/plugin/easyloading/page/easy_loading_page.dart';
import 'package:flutter_demo/plugin/easyrefresh/easy_refresh_page.dart';
import 'package:flutter_demo/plugin/imagecropper/image_cropper_page.dart';
import 'package:flutter_demo/plugin/imagegallerysaver/image_gallery_saver_page.dart';
import 'package:flutter_demo/plugin/imagepicker/base_image_picker_menu_page.dart';
import 'package:flutter_demo/plugin/mobilescanner/mobile_scanner_page.dart';
import 'package:flutter_demo/plugin/pathprovider/path_provider_page.dart';
import 'package:flutter_demo/plugin/qrcode/qr_code_page.dart';
import 'package:flutter_demo/plugin/qrcodescanner/qr_code_scanner_page.dart';
import 'package:flutter_demo/plugin/screenshot/screenshot_page.dart';
import 'package:flutter_demo/plugin/sharedpreferences/shared_preferences_page.dart';

List<PluginMenuVO> pluginMenuList = [
  PluginMenuVO("easy_loading", "进度加载", const EasyLoadingPage()),
  PluginMenuVO("qr_code", "二维码生成", const QRCodePage('{"code": "A Test QR Code"}')),
  PluginMenuVO("cached_network_image", "图片缓存", const CachedNetworkImagePage()),
  PluginMenuVO("shared_preferences", "轻量级本地存储", const SharedPreferencesPage()),
  PluginMenuVO("easy_refresh", "下拉刷新及上拉加载", const EasyRefreshPage()),
  PluginMenuVO("date_picker_timeline", "水平日期选择器测试1", const DatePickerTimelinePage()),
  PluginMenuVO("flutter_date_picker_timeline", "水平日期选择器测试2", const FlutterDatePickerTimelinePage()),
  PluginMenuVO("badges", "徽标测试", const BadgesPage()),
  PluginMenuVO("image_picker", "图片选择", const BaseImagePickerMenuPage()),
  PluginMenuVO("image_cropper", "图片裁剪", const ImageCropperPage()),
  PluginMenuVO("image_gallery_saver", "保存到相册", const ImageGallerySaverPage()),
  PluginMenuVO("path_provider", "文件访问", const PathProviderPage()),
  PluginMenuVO("qr_code_scanner", "二维码扫码1", const QRCodeScannerPage()),
  PluginMenuVO("mobile_scanner", "二维码扫码2", const MobileScannerPage()),
  PluginMenuVO("screenshot", "截图", const ScreenshotPage()),
];

class PluginMenuVO {
  PluginMenuVO(this.code, this.name, this.page);

  final String code;
  final String name;
  final Widget page;
}
