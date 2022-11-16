import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';

List<String> fruits = ["西瓜", "草莓", "苹果", "香蕉", "梨子", "桃子"];

class ListPage extends StatefulWidget {
  static const String valueKey = "ListPage";
  final Function(String item) _itemTapped;
  const ListPage(this._itemTapped, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ListPageState();
}

class ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: '路由跳转'),
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
          onTap: () => widget._itemTapped(fruits[index]),
        ),
      ),
    );
  }
}
