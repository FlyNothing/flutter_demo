import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/text_style.dart';

List<Widget> widgets = [
  _genWidget("1", Colors.red.withOpacity(0.8)),
  _genWidget("2", Colors.orange.withOpacity(0.8)),
  _genWidget("3", Colors.yellow.withOpacity(0.8)),
  _genWidget("4", Colors.green.withOpacity(0.8)),
  _genWidget("5", Colors.cyan.withOpacity(0.8)),
  _genWidget("6", Colors.blue.withOpacity(0.8)),
  _genWidget("7", Colors.purple.withOpacity(0.8)),
  _genWidget("8", Colors.black.withOpacity(0.8)),
];

Widget _genWidget(String text, Color color) {
  return Container(
    alignment: Alignment.center,
    height: double.infinity,
    width: double.infinity,
    color: color,
    child: Text(text, style: size36W600()),
  );
}
