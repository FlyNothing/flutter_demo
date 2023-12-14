import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LinearProgressIndicatorPage extends StatefulWidget {
  const LinearProgressIndicatorPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LinearProgressIndicatorPageState();
}

class _LinearProgressIndicatorPageState extends State<LinearProgressIndicatorPage> with SingleTickerProviderStateMixin {
  final int _durationSeconds = 10;
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: _durationSeconds));
    _controller.forward();
    _colorAnimation = ColorTween(begin: Colors.blue, end: Colors.blue).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: "线性指示器"),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Center(
      child: Column(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 100.h, bottom: 15.h),
                    child: Text(
                      "${(_controller.value * 100).round()}%",
                      style: size16W500(color: Colors.blue),
                    ),
                  ),
                  SizedBox(
                      width: 1.sw - 50.w,
                      child: LinearProgressIndicator(
                        minHeight: 6.h,
                        backgroundColor: Colors.grey[400],
                        valueColor: _colorAnimation,
                        value: _controller.value,
                      ))
                ],
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: Text("正在加载中", style: size16W600(color: Colors.blue)),
          ),
        ],
      ),
    );
  }
}
