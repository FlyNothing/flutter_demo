import 'package:flutter/material.dart';
import 'package:flutter_demo/base/bottomnavigationbar/navigation_bar_home_page.dart';
import 'package:flutter_demo/base/enumpage/blend_mode_page.dart';
import 'package:flutter_demo/base/enumpage/box_fit_page.dart';
import 'package:flutter_demo/base/flexible/flexible_page.dart';
import 'package:flutter_demo/base/futuretimer/future_page.dart';
import 'package:flutter_demo/base/image/image_page.dart';
import 'package:flutter_demo/base/navigator/1.0/origin_page.dart';
import 'package:flutter_demo/base/navigator/2.0/navigator_page.dart';
import 'package:flutter_demo/base/progressindicator/base_progress_indicator_menu_page.dart';
import 'package:flutter_demo/base/repaintboundary/repaint_boundary_page.dart';
import 'package:flutter_demo/base/textfield/text_field_border_page.dart';
import 'package:flutter_demo/base/theme/theme_page.dart';
import 'package:flutter_demo/base/transform/transform_page.dart';
import 'package:flutter_demo/base/valuenotifier/value_notifier_page.dart';
import 'package:flutter_demo/base/widget/bottom_sheet_page.dart';
import 'package:flutter_demo/base/widget/listview_gridview1_page.dart';
import 'package:flutter_demo/base/widget/listview_gridview2_page.dart';
import 'package:flutter_demo/base/widget/state_page.dart';
import 'package:flutter_demo/base/widget/widget_page.dart';

List<BaseMenuVO> baseMenuList = [
  BaseMenuVO("路由测试1", const OriginPage()),
  BaseMenuVO("路由测试2", const NavigatorPage()),
  BaseMenuVO("Widget测试", const WidgetPage()),
  BaseMenuVO("State测试", const StatePage()),
  BaseMenuVO("底部弹窗测试", const BottomSheetPage()),
  BaseMenuVO("FutureBuilder测试", const FuturePage()),
  BaseMenuVO("ListView和GridView测试1", const ListviewGridview1Page()),
  BaseMenuVO("ListView和GridView测试2", const ListviewGridview2Page()),
  BaseMenuVO("BoxFit模式", const BoxFitPage()),
  BaseMenuVO("BlendMode模式", const BlendModePage()),
  BaseMenuVO("指示器", const BaseProgressIndicatorMenuPage()),
  BaseMenuVO("主题", const ThemePage()),
  BaseMenuVO("隐藏NavigationBar", const NavigationBarHomePage()),
  BaseMenuVO("文本框边框", const TextFieldBorderPage()),
  BaseMenuVO("截图", const RepaintBoundaryPage()),
  BaseMenuVO("Flexible和Expanded", FlexiblePage()),
  BaseMenuVO("图片显示", const ImagePage()),
  BaseMenuVO("转换", const TransformPage()),
  BaseMenuVO("ValueNotifier", const ValueNotifierPage()),
];

class BaseMenuVO {
  BaseMenuVO(this.name, this.page);

  final String name;
  final Widget page;
}
