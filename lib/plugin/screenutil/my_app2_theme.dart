import 'package:flutter/material.dart';
import 'package:flutter_demo/plugin/screenutil/my_home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 混合开发 - 设置全局主题
class MyApp2Theme extends StatelessWidget {
  const MyApp2Theme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        ScreenUtil.init(context, designSize: const Size(200, 600));
        return Theme(
          data: ThemeData(
            primarySwatch: Colors.blue,
          ),
          child: const MyHomePage(),
        );
      },
    );
  }
}
