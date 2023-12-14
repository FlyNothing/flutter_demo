import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenutilHomePage extends StatelessWidget {
  const ScreenutilHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'ScreenutilHomePage'),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            getDivider(bottom: 30.w),
            getDivider(bottom: 30.h),
            getDivider(bottom: 30.w),
            getDivider(bottom: 30.h),
            getDivider(bottom: 30.w),
          ],
        ),
      ),
    );
  }

  Padding getDivider({double bottom = 0.0}) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: const Divider(thickness: 2),
    );
  }
}
