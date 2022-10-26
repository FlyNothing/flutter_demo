import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/text_style.dart';

AppBar appBarStandard({required String title}) {
  return AppBar(
    centerTitle: true,
    elevation: 0, // 取消阴影
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyleUtil.size18W600(color: Colors.white),
    ),
  );
}

TextButton textButtonStandard(String text, Function()? onPressed) {
  return TextButton(
    onPressed: onPressed,
    child: Text(text, style: TextStyleUtil.size14W400(color: Colors.white)),
  );
}
