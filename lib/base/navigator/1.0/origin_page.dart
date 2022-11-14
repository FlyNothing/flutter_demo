import 'package:flutter/material.dart';
import 'package:flutter_demo/base/navigator/1.0/router_page.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';

/// OriginPage结合RouterPage一起，实现参数通过Route的Settings传递
class OriginPage extends StatelessWidget {
  static const String routeName = "/router";
  const OriginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: '路由跳转'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.red)),
          child: Text("This is a home page.", textAlign: TextAlign.center, style: size16W500(color: Colors.red)),
        ),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          settings: const RouteSettings(name: RouterPage.routeName, arguments: {"page-title": "router"}),
          builder: (context) => const RouterPage(),
        ),
        // Navigator.pushNamed(context, RouterPage.routeName, arguments: {"page-title": "router"}),
      ),
    );
  }
}
