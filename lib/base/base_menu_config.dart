import 'package:flutter_demo/base/enumpage/enum_menu_config.dart';
import 'package:flutter_demo/base/navigator/navigator_menu_config.dart';
import 'package:flutter_demo/base/widget/widget_menu_config.dart';
import 'package:flutter_demo/common/page/base_menu_page.dart';
import 'package:flutter_demo/base/futuretimer/future_page.dart';
import 'package:flutter_demo/base/stream/stream_page.dart';
import 'package:flutter_demo/base/theme/theme_page.dart';

import 'package:flutter_demo/common/vo/base_menu_vo.dart';

List<BaseMenuVO> baseMenuList = [
  BaseMenuVO("常用码表", BaseMenuPage("常用码表", enumMenuList)),
  BaseMenuVO("路由", BaseMenuPage("路由", navigatorMenuList)),
  BaseMenuVO("常用部件", BaseMenuPage("常用部件", widgetMenuList)),
  BaseMenuVO("FutureBuilder", const FuturePage()),
  BaseMenuVO("StreamBuilder", const StreamPage()),
  BaseMenuVO("主题", const ThemePage()),
];
