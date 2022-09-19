import 'package:flutter/material.dart';
import 'package:flutter_demo/base/base_menu_config.dart';
import 'package:flutter_demo/common/util/global_widget.dart';

class BaseMenuPage extends StatelessWidget {
  const BaseMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'Flutter基础'),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Text(baseMenuList[index].name),
        trailing: IconButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => baseMenuList[index].page)),
          icon: Icon(
            Icons.navigate_next,
            color: Colors.black.withOpacity(0.2),
          ),
        ),
      ),
      itemCount: baseMenuList.length,
    );
  }
}
