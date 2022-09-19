import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'EasyLoading测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return const Center(
      child: Text("TestPage"),
    );
  }
}
