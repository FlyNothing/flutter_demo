import 'package:flutter/material.dart';
import 'package:flutter_demo/plugin/easyloading/page/easy_loading_page.dart';

class EasyLoadingHomePage extends StatelessWidget {
  const EasyLoadingHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const EasyLoadingPage(),
    );
  }
}
