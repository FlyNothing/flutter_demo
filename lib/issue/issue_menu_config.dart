import 'package:flutter/material.dart';

List<IssueMenuVO> issueMenuList = [
  IssueMenuVO("测试页面", const Center(child: Text("测试页面"))),
];

class IssueMenuVO {
  IssueMenuVO(this.name, this.page);

  final String name;
  final Widget page;
}
