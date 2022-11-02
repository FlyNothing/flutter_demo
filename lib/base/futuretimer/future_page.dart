import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';

class FuturePage extends StatelessWidget {
  const FuturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'Future测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Center(
      child: FutureBuilder(
        builder: (context, snapshot) {
          return Text(snapshot.data ?? "");
        },
        initialData: "init data",
        future: _getData(),
      ),
    );
  }

  Future<String> _getData() {
    return Future.delayed(const Duration(milliseconds: 1000), () => Future.value("get data success."));
  }
}
