import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';

class NavigationBarShowPage2 extends StatelessWidget {
  const NavigationBarShowPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: "NavigationBar测试"),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Center(
      child: Text(
        "NavigationBarShowPage2",
        style: size18W400(color: Colors.green),
      ),
    );
  }
}
