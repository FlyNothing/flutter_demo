import 'package:flutter/material.dart';
import 'package:flutter_demo/base/futuretimer/future_demo_page.dart';
import 'package:flutter_demo/base/router/origin_demo_page.dart';
import 'package:flutter_demo/base/widget/bottom_sheet_demo_page.dart';
import 'package:flutter_demo/base/widget/state_demo_page.dart';
import 'package:flutter_demo/base/widget/widget_demo_page.dart';

List<BaseMenuVO> baseMenuList = [
  BaseMenuVO("路由测试", const OriginDemoPage()),
  BaseMenuVO("Widget测试", const WidgetDemoPage()),
  BaseMenuVO("State测试", const StateDemoPage()),
  BaseMenuVO("底部弹窗测试", const BottomSheetDemoPage()),
  BaseMenuVO("FutureBuilder测试", const FutureDemoPage()),
];

class BaseMenuVO {
  BaseMenuVO(this.name, this.page);

  final String name;
  final Widget page;
}
