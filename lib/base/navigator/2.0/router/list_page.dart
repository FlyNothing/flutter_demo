import 'package:flutter/material.dart';
import 'package:flutter_demo/base/navigator/2.0/router/item_page.dart';
import 'package:flutter_demo/base/navigator/2.0/router/listitem_router_delegate.dart';

List<String> fruits = ["西瓜", "草莓", "苹果", "香蕉", "梨子", "桃子"];

class ListPage extends StatelessWidget {
  static const String valueKey = "/list";
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return ListView(
      children: List.generate(
        fruits.length,
        (index) => ListTile(
          leading: Text(index.toString()),
          title: Text(fruits[index]),
          onTap: () => ListitemRouterDelegate.of(context)
              .push(MaterialPage(key: const ValueKey(ItemPage.valueKey), name: ItemPage.valueKey, child: ItemPage(fruits[index]))),
        ),
      ),
    );
  }
}
