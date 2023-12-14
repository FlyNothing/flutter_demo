import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularProgressIndicatorPage extends StatefulWidget {
  const CircularProgressIndicatorPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CircularProgressIndicatorPageState();
}

class _CircularProgressIndicatorPageState extends State<CircularProgressIndicatorPage> with SingleTickerProviderStateMixin {
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
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 80.w,
                height: 80.h,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey[400],
                  valueColor: _colorAnimation,
                  value: _controller.value,
                  strokeWidth: 6,
                ),
              ),
              Text(
                "${(_controller.value * 100).round()}%",
                style: size16W400(color: Colors.blue),
              )
            ],
          );
        },
      ),
    );
  }

  Padding _getContent() {
    return Padding(
      padding: EdgeInsets.only(top: 40.h, bottom: 40.h),
      child: Text("正在加载中", style: size16W600(color: Colors.blue)),
    );
  }
}
