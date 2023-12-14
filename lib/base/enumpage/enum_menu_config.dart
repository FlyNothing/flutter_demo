import 'package:flutter_demo/base/enumpage/blend_mode_page.dart';
import 'package:flutter_demo/base/enumpage/box_fit_page.dart';
import 'package:flutter_demo/common/vo/base_menu_vo.dart';

List<BaseMenuVO> enumMenuList = [
  BaseMenuVO("BoxFit模式", const BoxFitPage()),
  BaseMenuVO("BlendMode模式", const BlendModePage()),
];
