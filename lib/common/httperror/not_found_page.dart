import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/text_style.dart';

class HttpNotFoundPage extends StatelessWidget {
  const HttpNotFoundPage({Key? key}) : super(key: key);
  static const String routeName = "/not-found";

  @override
  Widget build(BuildContext context) {
    return getTextContainer();
  }

  Container getTextContainer() {
    return Container(
      alignment: Alignment.center,
      child: Text("找不到页面", style: size16W400(color: const Color.fromRGBO(169, 169, 169, 1))),
    );
  }
}
