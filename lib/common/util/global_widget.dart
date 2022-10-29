import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/text_style.dart';

AppBar appBarStandard({required String title, Color? backgroundColor}) {
  return AppBar(
    centerTitle: true,
    elevation: 0, // 取消阴影
    backgroundColor: backgroundColor,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: size18W600(color: Colors.white),
    ),
  );
}

TextButton textButtonStandard(String text, Function()? onPressed) {
  return TextButton(
    onPressed: onPressed,
    child: Text(text, style: size14W400(color: Colors.white)),
  );
}

TextField textFieldStandard(TextEditingController? controller, {String? hintText}) {
  return TextField(
    decoration: InputDecoration(
      // 内容边距设置为0
      contentPadding: const EdgeInsets.symmetric(vertical: 0),
      hintText: hintText,
      // 设置填充颜色
      fillColor: Colors.grey[100],
      filled: true,
      // 边框
      border: const OutlineInputBorder(borderSide: BorderSide(width: 1)),
    ),
    // 文本垂直居中
    textAlignVertical: TextAlignVertical.center,
    // 文本水平居中
    textAlign: TextAlign.center,
    controller: controller,
  );
}
