import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/plugin/easyloading/page/test_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class EasyLoadingPage extends StatefulWidget {
  const EasyLoadingPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EasyLoadingPageState();
}

class _EasyLoadingPageState extends State<EasyLoadingPage> {
  Timer? _timer;
  late double _progress;

  @override
  void initState() {
    super.initState();
    EasyLoading.addStatusCallback((status) {
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
    EasyLoading.showSuccess('Use in initState');
  }

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
        // runAlignment: WrapAlignment.center,
        // crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          textButtonStandard('push', () {
            _timer?.cancel();
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const TestPage()));
          }),
          textButtonStandard('dismiss', () async {
            _timer?.cancel();
            await EasyLoading.dismiss();
          }),
          textButtonStandard('show', () async {
            _timer?.cancel();
            await EasyLoading.show(
              status: 'loading...',
              maskType: EasyLoadingMaskType.black,
            );
          }),
          textButtonStandard('showInfo', () async {
            _timer?.cancel();
            await EasyLoading.showInfo(
              'loading...',
              maskType: EasyLoadingMaskType.black,
            );
          }),
          textButtonStandard('showToast', () {
            _timer?.cancel();
            EasyLoading.showToast('Toast');
          }),
          textButtonStandard('showSuccess', () async {
            _timer?.cancel();
            await EasyLoading.showSuccess('Great Success!');
          }),
          textButtonStandard('showError', () {
            _timer?.cancel();
            EasyLoading.showError('Failed with Error');
          }),
          textButtonStandard(
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
