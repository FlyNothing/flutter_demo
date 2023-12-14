import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/date.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DatePickerTimelinePage extends StatefulWidget {
  const DatePickerTimelinePage({super.key});

  @override
  State<StatefulWidget> createState() => _DatePickerTimelinePageState();
}

class _DatePickerTimelinePageState extends State<DatePickerTimelinePage> {
  late DateTime _selectDay = DateTime.now(); // 当前日期

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: '水平日期选择器测试1'),
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
      child: DatePicker(
        DateTime(_selectDay.year, _selectDay.month, 1),
        width: 60.w,
        height: 100.h,
        controller: DatePickerController(),
        selectedTextColor: Colors.white,
        selectionColor: Colors.blue,
        initialSelectedDate: _selectDay,
        activeDates: [
          DateTime.now().add(const Duration(days: 1)),
          DateTime.now().add(const Duration(days: 2)),
        ],
        locale: "zh_CN",
        onDateChange: (date) {
          setState(() {
            _selectDay = date;
          });
        },
        daysCount: 30,
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
