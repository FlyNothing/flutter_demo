import 'package:flutter/material.dart';
import 'package:flutter_demo/common/home/home_page.dart';
// import 'package:flutter_demo/common/router/global_router.dart';
import 'package:flutter_demo/plugin/easyloading/init.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initEasyLoading(); //  初始化EasyLoading
    return ScreenUtilInit(
      designSize: const Size(390, 840), // 默认Size(360, 690)
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false, // 去掉右上角debug贴纸
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.indigo),
                minimumSize: MaterialStateProperty.all(Size(100.w, 40.h)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.w),
                  ),
                ),
              ),
            ),
          ),
          home: const HomePage(),
          // Navigator通过onGenerateRoute实现命名式路由管理
          // onGenerateRoute: GlobalRouter().onGenerateRoute,
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
