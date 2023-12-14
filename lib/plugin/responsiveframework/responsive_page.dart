import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';

class ResponsivePage extends StatelessWidget {
  const ResponsivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'ResponsivePage'),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(width: 200, height: 50, color: Colors.red),
        Container(width: 400, height: 50, color: Colors.orange),
        Container(width: 600, height: 50, color: Colors.yellow),
        Container(width: 800, height: 50, color: Colors.green),
        Container(width: 1000, height: 50, color: Colors.cyan),
        Container(width: 1200, height: 50, color: Colors.blue),
        Container(width: 1400, height: 50, color: Colors.purple),
        Container(width: 1600, height: 50, color: Colors.grey),
      ],
    );
  }
}
