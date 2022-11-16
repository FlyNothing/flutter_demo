import 'package:flutter/material.dart';
import 'package:flutter_demo/base/navigator/2.0/item_page.dart';
import 'package:flutter_demo/base/navigator/2.0/list_page.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  String _selectedItem = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 去掉右上角debug贴纸
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Navigator(
        pages: [
          MaterialPage(key: const ValueKey(ListPage.valueKey), name: ListPage.valueKey, child: ListPage(_itemTapped)),
          if (_selectedItem.isNotEmpty) MaterialPage(key: ValueKey(ItemPage.valueKey + _selectedItem), child: ItemPage(_selectedItem))
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }
          return true;
        },
      ),
    );
  }

  void _itemTapped(String item) {
    setState(() {
      _selectedItem = item;
    });
  }
}
