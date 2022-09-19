import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';

class WidgetDemoPage extends StatefulWidget {
  final String finalName = "widget-demo";
  const WidgetDemoPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WidgetDemoPageState();
  }
}

class WidgetDemoPageState extends State<WidgetDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'Widget测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.blue)),
        child: Text("This is a test widget page. widget final name : ${widget.finalName}", textAlign: TextAlign.center, style: TextStyleUtil.size16W500()),
      ),
    );
  }
}
