import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlexiblePage extends StatelessWidget {
  FlexiblePage({Key? key}) : super(key: key);
  final List<int> _flexList31 = [1, 2, 2];
  final List<int> _flexList32 = [2, 3, 5];
  final List<int> _flexList41 = [1, 1, 1, 2];
  final List<int> _flexList42 = [1, 2, 3, 4];
  final List<Color> _colorList = [Colors.red, Colors.blue, Colors.yellow];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'Flexible测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    List<Widget> colums = List.empty(growable: true);
    colums.add(Padding(padding: EdgeInsets.only(top: 10.h)));
    colums.addAll(_getFlexRow(_flexList31, FlexFit.tight));
    colums.addAll(_getFlexRow(_flexList32, FlexFit.tight));
    colums.addAll(_getFlexRow(_flexList41, FlexFit.tight));
    colums.addAll(_getFlexRow(_flexList42, FlexFit.tight));
    colums.add(Padding(padding: EdgeInsets.only(top: 30.h)));
    colums.addAll(_getFlexRow(_flexList31, FlexFit.loose));
    colums.addAll(_getFlexRow(_flexList32, FlexFit.loose));
    colums.addAll(_getFlexRow(_flexList41, FlexFit.loose));
    colums.addAll(_getFlexRow(_flexList42, FlexFit.loose));
    colums.add(Padding(padding: EdgeInsets.only(top: 30.h)));
    colums.addAll(_getExpandedRow(_flexList31));
    colums.addAll(_getExpandedRow(_flexList32));
    colums.addAll(_getExpandedRow(_flexList41));
    colums.addAll(_getExpandedRow(_flexList42));
    return Stack(
      children: [_getLine(10), Column(children: colums)],
    );
  }

  Row _getLine(int cnt) {
    return Row(
      children: List.generate(
        cnt,
        (index) => Container(
          height: double.infinity,
          width: 1.sw / cnt,
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(width: 0.5),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _getFlexRow(List<int> flexList, FlexFit fit, {double? width}) {
    return [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Text("flex:${flexList.join("/")}  fit:${fit.name}", style: size14W600(color: Colors.orange)),
      ),
      Row(
        children: List.generate(
          flexList.length,
          (index) => _getFlexible(_colorList[index % _colorList.length], flexList[index], fit, width: width),
        ),
      ),
    ];
  }

  Flexible _getFlexible(Color color, int flex, FlexFit fit, {double? width}) {
    return Flexible(
      flex: flex,
      fit: fit,
      child: Container(
        color: color,
        width: width ?? 0.30.sw,
        height: 20.h,
      ),
    );
  }

  List<Widget> _getExpandedRow(List<int> flexList, {double? width}) {
    return [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Text("flex:${flexList.join("/")}", style: size14W600(color: Colors.orange)),
      ),
      Row(
        children: List.generate(
          flexList.length,
          (index) => _getExpanded(_colorList[index % _colorList.length], flexList[index], width: width),
        ),
      ),
    ];
  }

  Flexible _getExpanded(Color color, int flex, {double? width}) {
    return Expanded(
      flex: flex,
      child: Container(
        color: color,
        width: width ?? 0.30.sw,
        height: 20.h,
      ),
    );
  }
}
