import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularProgressIndicator2Page extends StatefulWidget {
  const CircularProgressIndicator2Page({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CircularProgressIndicator2PageState();
}

class _CircularProgressIndicator2PageState extends State<CircularProgressIndicator2Page> {
  int _percent = 0;

  @override
  void initState() {
    super.initState();
    _calcPercent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: '圆形指示器'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              _getProgress(),
              _getContent(),
            ],
          ),
        )
      ],
    );
  }

  Padding _getProgress() {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 80.w,
            height: 80.h,
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey[400],
              value: _percent / 100,
              strokeWidth: 6,
            ),
          ),
          Text(
            "$_percent%",
            style: size16W400(color: Colors.blue),
          )
        ],
      ),
    );
  }

  Padding _getContent() {
    return Padding(
      padding: EdgeInsets.only(top: 40.h, bottom: 40.h),
      child: Text("正在加载中", style: size16W600(color: Colors.blue)),
    );
  }

  void _calcPercent() async {
    for (int i = 0; i < 100; i++) {
      await Future.delayed(const Duration(milliseconds: 50));
      _percent = i + 1;
      setState(() {});
    }
  }
}
