import 'package:flutter/material.dart';
import 'package:flutter_demo/base/base_menu_page.dart';
import 'package:flutter_demo/common/router/global_router.dart';
import 'package:flutter_demo/issue/issue_menu_page.dart';
import 'package:flutter_demo/plugin/easyloading/init.dart';
import 'package:flutter_demo/plugin/plugin_menu_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 667));
    initEasyLoading(); // 初始化EasyLoading
    return MaterialApp(
      title: 'flutter_demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: GlobalRouter().onGenerateRoute,
      home: const MyHomePage(),
      builder: EasyLoading.init(), // 初始化EasyLoading
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
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
        fixedColor: Colors.green,
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
