import 'package:flutter/material.dart';
import 'package:flutter_demo/base/base_menu_page.dart';
import 'package:flutter_demo/common/router/global_router.dart';
import 'package:flutter_demo/common/util/text_style.dart';
import 'package:flutter_demo/issue/issue_menu_page.dart';
import 'package:flutter_demo/plugin/easyloading/init.dart';
import 'package:flutter_demo/plugin/plugin_menu_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
            primarySwatch: Colors.blue,
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                minimumSize: MaterialStateProperty.all(Size(100.w, 40.h)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.w),
                  ),
                ),
              ),
            ),
          ),
          home: const MyHomePage(),
          onGenerateRoute: GlobalRouter().onGenerateRoute,
          builder: EasyLoading.init(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List _barList = [
    {'text': 'Base', 'icon': const Icon(Icons.account_balance), 'page': const BaseMenuPage()},
    {'text': 'Issue', 'icon': const Icon(Icons.ac_unit), 'page': const IssueMenuPage()},
    {'text': 'Plugin', 'icon': const Icon(Icons.access_alarms), 'page': const PluginMenuPage()},
  ];
  final List<BottomNavigationBarItem> _myTabs = [];
  final List<Widget> _myPages = [];
  int _selIndex = 0;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _barList.length; i++) {
      _myTabs.add(BottomNavigationBarItem(
        icon: _barList[i]['icon'],
        label: _barList[i]['text'],
      ));
      _myPages.add(_barList[i]['page']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: _myTabs,
        currentIndex: _selIndex,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
      ),
      body: _barList[_selIndex]['page'],
    );
  }

  void _onTap(int index) {
    setState(() {
      _selIndex = index;
    });
  }
}
