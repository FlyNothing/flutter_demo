import 'package:flutter/material.dart';
import 'package:flutter_demo/base/router/router_demo_page.dart';
import 'package:flutter_demo/common/util/text_style.dart';

/// OriginDemoPage结合RouterDemoPage一起，实现参数通过Route的Settings传递
class OriginDemoPage extends StatelessWidget {
  static const String routeName = "/router";
  const OriginDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.red)),
          child: Text("This is a home page.", textAlign: TextAlign.center, style: TextStyleUtil.size16W500(color: Colors.red)),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, RouterDemoPage.routeName, arguments: {"page-title": "router"});
      },
    );
  }
}
