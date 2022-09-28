import 'package:flutter/material.dart';
import 'package:flutter_demo/base/progressindicator/base_progress_indicator_menu_config.dart';
import 'package:flutter_demo/common/util/global_widget.dart';

class BaseProgressIndicatorMenuPage extends StatelessWidget {
  const BaseProgressIndicatorMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: '指示器'),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Text(baseProgressIndicatorMenuList[index].name),
        trailing: IconButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => baseProgressIndicatorMenuList[index].page)),
          icon: Icon(
            Icons.navigate_next,
            color: Colors.black.withOpacity(0.2),
          ),
        ),
      ),
      itemCount: baseProgressIndicatorMenuList.length,
    );
  }
}
