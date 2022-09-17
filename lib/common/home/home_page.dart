import 'package:flutter/material.dart';

/// 通用全局使用HomePage，可以将具体页面通过HomePage
class HomePage extends StatelessWidget {
  const HomePage({super.key, this.title = "首页", required this.body});

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
    );
  }
}
