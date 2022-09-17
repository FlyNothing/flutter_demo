import 'package:flutter/material.dart';
import 'package:flutter_demo/plugin/easyloading/init.dart';
import 'package:flutter_demo/plugin/easyloading/page/easy_loading_home_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class EasyLoadingApp extends StatelessWidget {
  const EasyLoadingApp({super.key});

  @override
  Widget build(BuildContext context) {
    initEasyLoading(); // 初始化EasyLoading
    return MaterialApp(
      title: 'Flutter EasyLoading',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EasyLoadingHomePage(title: 'Flutter EasyLoading'),
      builder: EasyLoading.init(),
    );
  }
}
