import 'package:flutter/material.dart';
import 'package:flutter_demo/common/page/base_menu_page.dart';
import 'package:flutter_demo/plugin/badges/badges_page.dart';
import 'package:flutter_demo/plugin/cachednetworkimage/cached_network_image_page.dart';
import 'package:flutter_demo/plugin/carouselslider/carousel_slider_page.dart';
import 'package:flutter_demo/plugin/datepickertimeline/date_picker_timeline_page.dart';
import 'package:flutter_demo/plugin/flutterblueplus/flutter_blue_plus_page.dart';
import 'package:flutter_demo/plugin/flutterdatepickertimeline/flutter_date_picker_timeline_page.dart';
import 'package:flutter_demo/plugin/easyloading/page/easy_loading_page.dart';
import 'package:flutter_demo/plugin/easyrefresh/easy_refresh_page.dart';
import 'package:flutter_demo/plugin/gorouter/go_router_app.dart';
import 'package:flutter_demo/plugin/imagecropper/image_cropper_page.dart';
import 'package:flutter_demo/plugin/imagegallerysaver/image_gallery_saver_page.dart';
import 'package:flutter_demo/plugin/imagepicker/image_picker_menu_config.dart';
import 'package:flutter_demo/plugin/mobilescanner/mobile_scanner_page.dart';
import 'package:flutter_demo/plugin/pathprovider/path_provider_page.dart';
import 'package:flutter_demo/plugin/permissionhandler/permission_handler_page.dart';
import 'package:flutter_demo/plugin/photoview/photo_view_menu_config.dart';
import 'package:flutter_demo/plugin/provider/provider_menu_config.dart';
import 'package:flutter_demo/plugin/pulltorefresh/pull_to_refresh_app.dart';
import 'package:flutter_demo/plugin/qrcode/qr_code_page.dart';
import 'package:flutter_demo/plugin/qrcodescanner/qr_code_scanner_page.dart';
import 'package:flutter_demo/plugin/responsiveframework/responsive_app.dart';
import 'package:flutter_demo/plugin/screenshot/screenshot_page.dart';
import 'package:flutter_demo/plugin/screenutil/screen_util_menu_config.dart';
import 'package:flutter_demo/plugin/sharedpreferences/shared_preferences_page.dart';
import 'package:flutter_demo/plugin/sqlite/floor/floor_page.dart';
import 'package:flutter_demo/plugin/sqlite/sqflite/sqflite_page.dart';
import 'package:flutter_demo/plugin/svg/svg_page.dart';
import 'package:flutter_demo/plugin/urllauncher/url_launcher_page.dart';
import 'package:flutter_demo/plugin/video/chewie_menu_config.dart';
import 'package:flutter_demo/plugin/video/video_player_menu_config.dart';
import 'package:flutter_demo/plugin/webview/flutter_inappwebview_menu_config.dart';
import 'package:flutter_demo/plugin/webview/webview_flutter_menu_config.dart';

List<PluginMenuVO> pluginMenuList = [
  PluginMenuVO("badges", "徽标", const BadgesPage()),
  PluginMenuVO("cached_network_image", "网络图片缓存", const CachedNetworkImagePage()),
  PluginMenuVO("carousel_slider", "轮播图", CarouselSliderPage()),
  PluginMenuVO("chewie", "视频播放【2】", BaseMenuPage("视频播放【2】", chewieMenuList)),
  PluginMenuVO("date_picker_timeline", "左右滑动日期选择器【1】", const DatePickerTimelinePage()),
  PluginMenuVO("easy_refresh", "下拉刷新及上拉加载【1】", const EasyRefreshPage()),
  PluginMenuVO("floor", "SQLLite数据库【2】", const FloorPage()),
  PluginMenuVO("flutter_blue_plus", "蓝牙连接", const FlutterBluePlusPage()),
  PluginMenuVO("flutter_date_picker_timeline", "左右滑动日期选择器【2】", const FlutterDatePickerTimelinePage()),
  PluginMenuVO("flutter_easyloading", "简易弹窗和加载", FlutterEasyLoadingPage()),
  PluginMenuVO("flutter_inappwebview", "Webview【2】", BaseMenuPage("webview【2】", flutterInappwebviewMenuList)),
  PluginMenuVO("flutter_screenutil", "屏幕适配", BaseMenuPage("屏幕适配", screenUtilMenuList)),
  PluginMenuVO("flutter_svg", "Svg扩展", const FlutterSvgPage()),
  PluginMenuVO("go_router", "声明式路由", const GoRouterApp()),
  PluginMenuVO("image_cropper", "图片裁剪", const ImageCropperPage()),
  PluginMenuVO("image_gallery_saver", "保存到相册", ImageGallerySaverPage()),
  PluginMenuVO("image_picker", "图片选择", BaseMenuPage("图片选择", imagePickerMenuList)),
  PluginMenuVO("mobile_scanner", "二维码扫码【2】", const MobileScannerPage()),
  PluginMenuVO("path_provider", "访问设备文件系统", const PathProviderPage()),
  PluginMenuVO("permission_handler", "权限管理", const PermissionHandlerPage()),
  PluginMenuVO("photo_view", "图片预览", BaseMenuPage("图片预览", photoViewMenuList)),
  PluginMenuVO("provider", "状态管理", BaseMenuPage("状态管理", providerMenuList)),
  PluginMenuVO("pull_to_refresh", "下拉刷新及上拉加载【2】", const PullToRefreshApp()),
  PluginMenuVO("qr_code_scanner", "二维码扫码【1】", const QRCodeScannerPage()),
  PluginMenuVO("qr_flutter", "二维码生成", const QrFlutterPage()),
  PluginMenuVO("responsive_framework", "响应式框架", const ResponsiveFrameworkApp()),
  PluginMenuVO("screenshot", "截图", ScreenshotPage()),
  PluginMenuVO("shared_preferences", "轻量级本地存储", const SharedPreferencesPage()),
  PluginMenuVO("sqflite", "SQLLite数据库【1】", const SqflitePage()),
  PluginMenuVO("url_launcher", "Url跳转", const UrlLauncherPage()),
  PluginMenuVO("video_player", "视频播放【1】", BaseMenuPage("视频播放【1】", videoPlayerMenuList)),
  PluginMenuVO("webview_flutter", "Webview【1】", BaseMenuPage("webview【1】", webviewFlutterMenuList)),
];

/// 插件列表显示菜单VO对象
class PluginMenuVO {
  PluginMenuVO(this.code, this.name, this.page);

  /// 插件完整名称
  final String code;

  /// 插件中文说明
  final String name;

  /// 插件对应跳转页面
  final Widget page;
}
