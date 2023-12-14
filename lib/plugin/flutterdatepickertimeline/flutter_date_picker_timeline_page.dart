import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_date_picker_timeline/flutter_date_picker_timeline.dart';
import 'package:flutter_demo/common/util/date.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlutterDatePickerTimelinePage extends StatefulWidget {
  const FlutterDatePickerTimelinePage({super.key});

  @override
  State<StatefulWidget> createState() => _FlutterDatePickerTimelinePageState();
}

class _FlutterDatePickerTimelinePageState extends State<FlutterDatePickerTimelinePage> {
  late DateTime _selectDay = DateTime.now(); // 当前日期

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: '水平日期选择器测试2'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      children: [
        _getDatePicker(),
        _getDateText(),
      ],
    );
  }

  Container _getDatePicker() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20.w),
      child: FlutterDatePickerTimeline(
        startDate: DateTime(_selectDay.year, _selectDay.month, 1),
        endDate: DateTime(_selectDay.year, _selectDay.month + 1, 1).add(const Duration(days: -1)),
        initialSelectedDate: _selectDay,
        initialFocusedDate: _selectDay,
        itemHeight: 30.h,
        unselectedItemWidth: 30.w,
        unselectedItemTextStyle: size16W400(),
        selectedItemWidth: 30.w,
        selectedItemBackgroundColor: Colors.blue,
        selectedItemTextStyle: size16W400(color: Colors.white),
        itemRadius: 30.w,
        selectedItemMargin: const EdgeInsets.symmetric(horizontal: 10),
        unselectedItemMargin: const EdgeInsets.symmetric(horizontal: 10),
        onSelectedDateChange: (DateTime? dateTime) {
          dateTime ??= DateTime.now();
          _selectDay = dateTime;
          Timer(const Duration(milliseconds: 100), () async {
            setState(() {});
          });
        },
      ),
    );
  }

  Container _getDateText() {
    return Container(
      padding: EdgeInsets.all(20.w),
      alignment: Alignment.centerLeft,
      child: Text(
        "您选择的日期是：${DateUtil.toDay(_selectDay)}",
        style: size14W600(),
      ),
    );
  }
}
