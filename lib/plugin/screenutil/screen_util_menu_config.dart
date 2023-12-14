import 'package:flutter_demo/common/vo/base_menu_vo.dart';
import 'package:flutter_demo/plugin/screenutil/screenutil_application_app.dart';
import 'package:flutter_demo/plugin/screenutil/screenutil_hybrid_app.dart';
import 'package:flutter_demo/plugin/screenutil/screenutil_hybrid_global_theme_app.dart';

List<BaseMenuVO> screenUtilMenuList = [
  BaseMenuVO("APP开发", const ScreenutilApplicationApp()),
  BaseMenuVO("混合开发-部分主题", const ScreenutilHybridPartThemeApp()),
  BaseMenuVO("混合开发-全局主题", const ScreenutilHybridGlobalThemeApp()),
];
