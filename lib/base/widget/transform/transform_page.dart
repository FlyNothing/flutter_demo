import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransformPage extends StatelessWidget {
  const TransformPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'Transform测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 移动
          Transform.translate(
            offset: Offset(-100.w, 10.h),
            child: _getText(),
          ),
          // 旋转
          Transform.rotate(
            angle: math.pi / 12.0,
            child: _getText(),
          ),
          // 伸缩
          Transform.scale(
            scaleX: 2,
            scaleY: 0.5,
            child: _getText(),
          ),
        ],
      ),
    );
  }

  Container _getText() {
    return Container(
      height: 0.4.sw,
      width: 0.4.sw,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.lightGreen,
        border: Border.all(width: 1),
      ),
      child: Text(
        "测试文本",
        style: size14W400(color: Colors.red),
      ),
    );
  }
}
