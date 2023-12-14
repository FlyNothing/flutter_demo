import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/standard_widget.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: "主题测试"),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      children: [
        _getButton(),
        Theme(
          data: Theme.of(context).copyWith(
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
            ),
          ),
          child: _getButton(),
        ),
        Theme(
          data: ThemeData(
              textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.yellow)),
          )),
          child: _getButton(),
        )
      ],
    );
  }

  Center _getButton() {
    return Center(
      child: StandardTextButton("Button", () {}),
    );
  }
}
