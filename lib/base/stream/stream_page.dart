import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';

class StreamPage extends StatelessWidget {
  const StreamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'Stream测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Center(
      child: StreamBuilder(
        builder: (context, snapshot) {
          return Text(snapshot.data ?? "");
        },
        initialData: "init data",
        stream: _getData(),
      ),
    );
  }

  Stream<String> _getData() {
    return Stream.fromFuture(Future.delayed(const Duration(milliseconds: 1000), () => Future.value("get data success.")));
  }
}
