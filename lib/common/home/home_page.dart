import 'package:flutter/material.dart';
import 'package:flutter_demo/base/base_menu_config.dart';
import 'package:flutter_demo/common/page/base_menu_page.dart';
import 'package:flutter_demo/issue/issue_menu_config.dart';
import 'package:flutter_demo/plugin/plugin_menu_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _barList = [
    {'text': 'Base', 'icon': const Icon(Icons.account_balance), 'page': BaseMenuPage('Flutter基础', baseMenuList)},
    {'text': 'Issue', 'icon': const Icon(Icons.ac_unit), 'page': BaseMenuPage('问题修复', issueMenuList)},
    {'text': 'Plugin', 'icon': const Icon(Icons.access_alarms), 'page': const PluginMenuPage()},
  ];
  final List<BottomNavigationBarItem> _myTabs = [];
  int _selIndex = 0;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _barList.length; i++) {
      _myTabs.add(BottomNavigationBarItem(
        icon: _barList[i]['icon'],
        label: _barList[i]['text'],
      ));
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
