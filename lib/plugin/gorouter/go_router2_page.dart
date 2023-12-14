import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';
import 'package:go_router/go_router.dart';

class GoRouter2Page extends StatelessWidget {
  const GoRouter2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: '路由跳转2'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.blue)),
          child: Text("Router2.", textAlign: TextAlign.center, style: size16W500(color: Colors.blue)),
        ),
      ),
      onTap: () => context.pop(),
    );
  }
}
