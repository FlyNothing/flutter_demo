import 'package:flutter_demo/base/navigator/1.0/origin_page.dart';
import 'package:flutter_demo/base/navigator/2.0/navigator/listitem_navigator_app.dart';
import 'package:flutter_demo/base/navigator/2.0/router/listitem_navigator_router_app.dart';
import 'package:flutter_demo/common/vo/base_menu_vo.dart';

List<BaseMenuVO> navigatorMenuList = [
  BaseMenuVO("路由1.0测试", const OriginPage()),
  BaseMenuVO("路由2.0测试1", const ListitemNavigatorApp()),
  BaseMenuVO("路由2.0测试2", const ListitemNavigatorRouterApp()),
];
