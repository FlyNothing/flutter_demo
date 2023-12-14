import 'package:flutter/material.dart';
import 'package:flutter_demo/base/widget/bottomnavigationbar/navigation_bar_hidden_page.dart';
import 'package:flutter_demo/base/widget/bottomnavigationbar/navigation_bar_show_page1.dart';
import 'package:flutter_demo/base/widget/bottomnavigationbar/navigation_bar_show_page2.dart';

class NavigationBarHomePage extends StatefulWidget {
  const NavigationBarHomePage({Key? key}) : super(key: key);

  @override
  State<NavigationBarHomePage> createState() => _NavigationBarHomePageState();
}

class _NavigationBarHomePageState extends State<NavigationBarHomePage> {
  bool _visible = true;
  late List _barList;
  final List<BottomNavigationBarItem> _myTabs = [];
  final List<Widget> _myPages = [];
  int _selIndex = 0;

  @override
  void initState() {
    super.initState();
    _barList = [
      {'text': 'Show1', 'icon': const Icon(Icons.visibility), 'page': const NavigationBarShowPage1()},
      {'text': 'Show2', 'icon': const Icon(Icons.visibility), 'page': const NavigationBarShowPage2()},
      {'text': 'Hidden', 'icon': const Icon(Icons.disabled_visible), 'page': NavigationBarHiddenPage(_setVisible)},
    ];
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
      bottomNavigationBar: Visibility(
        visible: _visible,
        child: BottomNavigationBar(
          items: _myTabs,
          currentIndex: _selIndex,
          onTap: _onTap,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      body: _barList[_selIndex]['page'],
    );
  }

  void _onTap(int index) {
    setState(() {
      _selIndex = index;
    });
  }

  void _setVisible(bool visiable) {
    _visible = visiable;
    setState(() {});
  }
}
