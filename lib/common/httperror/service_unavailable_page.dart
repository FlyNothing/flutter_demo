import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/text_style.dart';

class HttpServiceUnavailablePage extends StatelessWidget {
  const HttpServiceUnavailablePage({Key? key}) : super(key: key);
  static const String routeName = "/service-unavailable";

  @override
  Widget build(BuildContext context) {
    return getTextContainer();
  }

  Container getTextContainer() {
    return Container(
      alignment: Alignment.center,
      child: Text("页面出错了", style: size16W400(color: const Color.fromRGBO(169, 169, 169, 1))),
    );
  }
}
