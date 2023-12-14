import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/text_style.dart';

class HttpLoadingPage extends StatelessWidget {
  const HttpLoadingPage({Key? key}) : super(key: key);
  static const String routeName = "/loading";

  @override
  Widget build(BuildContext context) {
    return getTextContainer();
  }

  Container getTextContainer() {
    return Container(
      alignment: Alignment.center,
      child: Text("正在加载中", style: size16W400(color: Colors.red)),
    );
  }
}
