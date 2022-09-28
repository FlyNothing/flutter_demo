import 'package:flutter/material.dart';
import 'package:flutter_demo/base/enumpage/blend_mode_page.dart';
import 'package:flutter_demo/base/enumpage/box_fit_page.dart';
import 'package:flutter_demo/base/futuretimer/future_demo_page.dart';
import 'package:flutter_demo/base/progressindicator/circular_progress_indicator_demo_page.dart';
import 'package:flutter_demo/base/progressindicator/linear_progress_indicator_demo_page.dart';
import 'package:flutter_demo/base/router/origin_demo_page.dart';
import 'package:flutter_demo/base/widget/bottom_sheet_demo_page.dart';
import 'package:flutter_demo/base/widget/listview_gridview_demo1_page.dart';
import 'package:flutter_demo/base/widget/listview_gridview_demo2_page.dart';
import 'package:flutter_demo/base/widget/state_demo_page.dart';
import 'package:flutter_demo/base/widget/widget_demo_page.dart';

List<BaseMenuVO> baseMenuList = [
  BaseMenuVO("路由测试", const OriginDemoPage()),
  BaseMenuVO("Widget测试", const WidgetDemoPage()),
  BaseMenuVO("State测试", const StateDemoPage()),
  BaseMenuVO("底部弹窗测试", const BottomSheetDemoPage()),
  BaseMenuVO("FutureBuilder测试", const FutureDemoPage()),
  BaseMenuVO("ListView和GridView测试1", const ListviewGridviewDemo1Page()),
  BaseMenuVO("ListView和GridView测试2", const ListviewGridviewDemo2Page()),
  BaseMenuVO("BoxFit模式", const BoxFitPage()),
  BaseMenuVO("BlendMode模式", const BlendModePage()),
  BaseMenuVO("圆形指示器", const CircularProgressIndicatorDemoPage()),
  BaseMenuVO("线性指示器", const LinearProgressIndicatorDemoPage()),
];

class BaseMenuVO {
  BaseMenuVO(this.name, this.page);

  final String name;
  final Widget page;
}
