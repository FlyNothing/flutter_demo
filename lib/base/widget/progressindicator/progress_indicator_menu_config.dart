import 'package:flutter_demo/common/vo/base_menu_vo.dart';
import 'package:flutter_demo/base/widget/progressindicator/circular_progress_indicator_page.dart';
import 'package:flutter_demo/base/widget/progressindicator/circular_progress_indicator2_page.dart';
import 'package:flutter_demo/base/widget/progressindicator/linear_progress_indicator_page.dart';

List<BaseMenuVO> progressIndicatorMenuList = [
  BaseMenuVO("圆形指示器1", const CircularProgressIndicatorPage()),
  BaseMenuVO("圆形指示器2", const CircularProgressIndicator2Page()),
  BaseMenuVO("线性指示器", const LinearProgressIndicatorPage()),
];
