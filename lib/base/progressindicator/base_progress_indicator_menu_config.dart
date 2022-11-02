import 'package:flutter/material.dart';
import 'package:flutter_demo/base/progressindicator/circular_progress_indicator_page.dart';
import 'package:flutter_demo/base/progressindicator/circular_progress_indicator2_page.dart';
import 'package:flutter_demo/base/progressindicator/linear_progress_indicator_page.dart';

List<BaseMenuVO> baseProgressIndicatorMenuList = [
  BaseMenuVO("圆形指示器1", const CircularProgressIndicatorPage()),
  BaseMenuVO("圆形指示器2", const CircularProgressIndicator2Page()),
  BaseMenuVO("线性指示器", const LinearProgressIndicatorPage()),
];

class BaseMenuVO {
  BaseMenuVO(this.name, this.page);

  final String name;
  final Widget page;
}
