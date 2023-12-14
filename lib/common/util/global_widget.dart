import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/text_style.dart';

AppBar appBarStandard({required String title, Color? backgroundColor, List<Widget>? actions, bool? centerTitle}) {
  return AppBar(
    centerTitle: centerTitle ?? true,
    elevation: 0, // 取消阴影
    backgroundColor: backgroundColor,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: size18W600(color: Colors.white),
    ),
    actions: actions,
  );
}
