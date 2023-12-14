import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/standard_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesPage extends StatefulWidget {
  const SharedPreferencesPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SharedPreferencesPageState();
}

class _SharedPreferencesPageState extends State<SharedPreferencesPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late int _intValue = -1;

  @override
  void initState() {
    super.initState();
    _initValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'SharedPreferences测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 30.h, bottom: 40.h),
          width: double.infinity,
          child: Text(
            "当前值为: $_intValue",
            style: size22W600(color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StandardTextButton("加一", _addInt),
            StandardTextButton("减一", _plusInt),
          ],
        )
      ],
    );
  }

  _initValue() {
    _prefs.then((value) {
      _intValue = value.getInt("int") ?? 0;
      setState(() {});
    });
  }

  _addInt() {
    _prefs.then((value) {
      value.setInt("int", ++_intValue);
      setState(() {});
    });
  }

  _plusInt() {
    _prefs.then((value) {
      value.setInt("int", --_intValue);
      setState(() {});
    });
  }
}
