import 'package:flutter/material.dart';
import 'package:flutter_demo/base/navigator/1.0/router2_page.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';

/// OriginPage结合RouterPage一起，实现参数通过Route的Settings传递
class RouterPage extends StatelessWidget {
  static const String routeName = "/router-page";
  const RouterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: '路由跳转'),
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
          decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.blue)),
          child: Text("This is a router page. argMap = $argu", textAlign: TextAlign.center, style: size16W500(color: Colors.blue)),
        ),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          settings: const RouteSettings(arguments: {"page-title": "router2"}),
          builder: (context) => const Router2Page(),
        ),
      ),
      // Navigator.pushNamed(context, Router2Page.routeName, arguments: {"page-title": "router2"}),
    );
  }
}
