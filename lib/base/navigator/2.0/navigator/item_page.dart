import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';

class ItemPage extends StatelessWidget {
  static const String valueKey = "/item";
  final String _item;
  const ItemPage(this._item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: '路由跳转'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.red)),
      child: Text("你选择的选项是：$_item", textAlign: TextAlign.center, style: size16W500(color: Colors.red)),
    );
  }
}
