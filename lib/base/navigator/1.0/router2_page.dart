import 'package:flutter/material.dart';
import 'package:flutter_demo/base/navigator/1.0/router_page.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';

class Router2Page extends StatelessWidget {
  static const String routeName = "/router2-page";
  const Router2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: '路由跳转2'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    Object? argMap = ModalRoute.of(context)?.settings.arguments;
    Map argu = {};
    if (argMap != null && (argMap as Map).isNotEmpty) {
      argu = argMap;
    }

    return GestureDetector(
      child: Center(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.purple)),
          child: Text("This is a router2 page. argMap = $argu", textAlign: TextAlign.center, style: size16W500(color: Colors.purple)),
        ),
      ),
      onTap: () => Navigator.popUntil(context, ModalRoute.withName(RouterPage.routeName)),
      // Navigator.pop(context),
    );
  }
}
