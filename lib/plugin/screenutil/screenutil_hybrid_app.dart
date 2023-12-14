import 'package:flutter/material.dart';
import 'package:flutter_demo/plugin/screenutil/screenutil_init_home_page.dart';

/// 混合开发 - 部分主题
class ScreenutilHybridPartThemeApp extends StatelessWidget {
  const ScreenutilHybridPartThemeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ScreenutilInitHomePage(),
    );
  }
}
