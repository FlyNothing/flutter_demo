// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/standard_widget.dart';
import 'package:flutter_demo/plugin/easyloading/page/test_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlutterEasyLoadingPage extends StatelessWidget {
  FlutterEasyLoadingPage({Key? key}) : super(key: key);

  Timer? _timer;
  late double _progress;

  // @override
  // void initState() {
  //   EasyLoading.addStatusCallback((status) {
  //     if (status == EasyLoadingStatus.dismiss) {
  //       _timer?.cancel();
  //     }
  //   });
  //   EasyLoading.showSuccess('Use in initState');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'EasyLoading测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 20.w,
        runSpacing: 10.h,
        children: [
          StandardTextButton('push', () {
            _timer?.cancel();
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const TestPage()));
          }),
          StandardTextButton('dismiss', () async {
            _timer?.cancel();
            await EasyLoading.dismiss();
          }),
          StandardTextButton('show', () async {
            _timer?.cancel();
            await EasyLoading.show(
              status: 'loading...',
              maskType: EasyLoadingMaskType.black,
            );
          }),
          StandardTextButton('showInfo', () async {
            _timer?.cancel();
            await EasyLoading.showInfo(
              'loading...',
              maskType: EasyLoadingMaskType.black,
            );
          }),
          StandardTextButton('showToast', () {
            _timer?.cancel();
            EasyLoading.showToast('Toast');
          }),
          StandardTextButton('showSuccess', () async {
            _timer?.cancel();
            await EasyLoading.showSuccess('Great Success!');
          }),
          StandardTextButton('showError', () {
            _timer?.cancel();
            EasyLoading.showError('Failed with Error');
          }),
          StandardTextButton(
            'showProgress',
            () {
              _progress = 0;
              _timer?.cancel();
              _timer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
                EasyLoading.showProgress(_progress, status: '${(_progress * 100).toStringAsFixed(0)}%');
                _progress += 0.03;
                if (_progress >= 1) {
                  _timer?.cancel();
                  EasyLoading.dismiss();
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
