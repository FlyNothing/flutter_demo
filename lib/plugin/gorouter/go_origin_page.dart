import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/standard_widget.dart';
import 'package:flutter_demo/plugin/gorouter/generate/go_router_page_gen.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';

class GoOriginPage extends StatelessWidget {
  const GoOriginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: '路由跳转'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.red)),
        child: Column(
          children: [
            Text("Origin.", textAlign: TextAlign.center, style: size16W500(color: Colors.red)),
            /* url方式路由 */
            // iconButtonStandard(Icons.forward, () => context.go("/router1")),
            // iconButtonStandard(Icons.forward, () => GoRouter.of(context).go("/router2")),

            /* 空安全方式路由 */
            StandardIconButton(Icons.forward, () => GoRouterPageRoute().go(context)),
            StandardIconButton(Icons.forward, () => GoRouter2PageRoute().go(context)),
          ],
        ),
      ),
    );
  }
}
