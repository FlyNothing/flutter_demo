import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/plugin/easyloading/page/test_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class EasyLoadingPage extends StatefulWidget {
  const EasyLoadingPage({Key? key}) : super(key: key);

  @override
  EasyLoadingPageState createState() => EasyLoadingPageState();
}

class EasyLoadingPageState extends State<EasyLoadingPage> {
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
          _getTextButton('push', () {
            _timer?.cancel();
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const TestPage()));
          }),
          _getTextButton('dismiss', () async {
            _timer?.cancel();
            await EasyLoading.dismiss();
          }),
          _getTextButton('show', () async {
            _timer?.cancel();
            await EasyLoading.show(
              status: 'loading...',
              maskType: EasyLoadingMaskType.black,
            );
          }),
          _getTextButton('showInfo', () async {
            _timer?.cancel();
            await EasyLoading.showInfo(
              'loading...',
              maskType: EasyLoadingMaskType.black,
            );
          }),
          _getTextButton('showToast', () {
            _timer?.cancel();
            EasyLoading.showToast('Toast');
          }),
          _getTextButton('showSuccess', () async {
            _timer?.cancel();
            await EasyLoading.showSuccess('Great Success!');
          }),
          _getTextButton('showError', () {
            _timer?.cancel();
            EasyLoading.showError('Failed with Error');
          }),
          _getTextButton(
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

  TextButton _getTextButton(String text, Function()? onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(text),
      ),
    );
  }
}
