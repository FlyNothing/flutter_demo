import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/issue/issue_menu_config.dart';

class IssueMenuPage extends StatelessWidget {
  const IssueMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: '问题修复'),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Text(issueMenuList[index].name),
        trailing: IconButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => issueMenuList[index].page)),
          icon: Icon(
            Icons.navigate_next,
            color: Colors.black.withOpacity(0.2),
          ),
        ),
      ),
      itemCount: issueMenuList.length,
    );
  }
}
