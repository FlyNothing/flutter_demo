import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';

class NavigationBarHiddenPage extends StatefulWidget {
  const NavigationBarHiddenPage(this._setVisible, {super.key});
  final Function(bool visiable) _setVisible;

  @override
  State<StatefulWidget> createState() => _NavigationBarHiddenPageState();
}

class _NavigationBarHiddenPageState extends State<NavigationBarHiddenPage> {
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: "NavigationBar测试"),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Center(
      child: TextButton(
          onPressed: () {
            visible = !visible;
            widget._setVisible(visible);
            setState(() {});
          },
          child: visible
              ? Text(
                  "Hide NavigationBar",
                  style: size18W400(color: Colors.red),
                )
              : Text(
                  "Show NavigationBar",
                  style: size18W400(color: Colors.green),
                )),
    );
  }
}
