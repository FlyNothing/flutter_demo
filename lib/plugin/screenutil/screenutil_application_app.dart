import 'package:flutter/material.dart';
import 'package:flutter_demo/plugin/screenutil/screenutil_home_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// APP开发
class ScreenutilApplicationApp extends StatelessWidget {
  const ScreenutilApplicationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(200, 600), // 默认Size(360, 690)
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false, // 去掉右上角debug贴纸
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: const ScreenutilHomePage(),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
