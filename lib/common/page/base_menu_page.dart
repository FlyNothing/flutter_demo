import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/standard_widget.dart';
import 'package:flutter_demo/common/vo/base_menu_vo.dart';

class BaseMenuPage extends StatelessWidget {
  final String _title;
  final List<BaseMenuVO> _baseMenuList;
  const BaseMenuPage(this._title, this._baseMenuList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: _title),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Text(_baseMenuList[index].name),
        trailing: StandardIconButton(
          Icons.navigate_next,
          () => Navigator.push(context, MaterialPageRoute(builder: (context) => _baseMenuList[index].page)),
        ),
      ),
      itemCount: _baseMenuList.length,
    );
  }
}
