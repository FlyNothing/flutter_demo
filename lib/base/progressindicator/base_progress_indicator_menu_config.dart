import 'package:flutter/material.dart';
import 'package:flutter_demo/base/progressindicator/circular_progress_indicator_demo_page.dart';
import 'package:flutter_demo/base/progressindicator/circular_progress_indicator_demo2_page.dart';
import 'package:flutter_demo/base/progressindicator/linear_progress_indicator_demo_page.dart';

List<BaseMenuVO> baseProgressIndicatorMenuList = [
  BaseMenuVO("圆形指示器1", const CircularProgressIndicatorDemoPage()),
  BaseMenuVO("圆形指示器2", const CircularProgressIndicatorDemo2Page()),
  BaseMenuVO("线性指示器", const LinearProgressIndicatorDemoPage()),
];

class BaseMenuVO {
  BaseMenuVO(this.name, this.page);

  final String name;
  final Widget page;
}
