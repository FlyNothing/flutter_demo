import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/plugin/plugin_menu_config.dart';

class PluginMenuPage extends StatelessWidget {
  const PluginMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: '扩展插件'),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Text("${pluginMenuList[index].name}  ${pluginMenuList[index].code}"),
        trailing: IconButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => pluginMenuList[index].page)),
          icon: Icon(
            Icons.navigate_next,
            color: Colors.black.withOpacity(0.2),
          ),
        ),
      ),
      itemCount: pluginMenuList.length,
    );
  }
}
