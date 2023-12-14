import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class MobileScannerPage extends StatefulWidget {
  const MobileScannerPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MobileScannerPageState();
}

class _MobileScannerPageState extends State<MobileScannerPage> {
  final MobileScannerController _controller = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: '扫描二维码'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(0, 0, 0, 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _getMobileScanner(),
          _getOperateList(),
        ],
      ),
    );
  }

  Container _getMobileScanner() {
    Widget? widget = _controller.isStarting
        ? MobileScanner(
            allowDuplicates: true,
            controller: _controller,
            onDetect: (barcode, args) {
              if (barcode.rawValue != null) {
                String code = barcode.rawValue!;
                _controller.stop();
                EasyLoading.showInfo("扫描到的二维码是：$code", duration: const Duration(seconds: 3));
              }
            },
          )
        : null;
    return Container(
      height: 0.6.sw,
      width: 0.6.sw,
      color: const Color.fromRGBO(255, 255, 255, 0.15),
      child: widget,
    );
  }

  Container _getOperateList() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getOperateButton(Icons.play_arrow, () => _controller.start()),
              _getOperateButton(Icons.stop, () => _controller.stop()),
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10.h)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getOperateButton(Icons.flashlight_on, () => _controller.toggleTorch()),
              _getOperateButton(Platform.isAndroid ? Icons.flip_camera_android : Icons.flip_camera_ios, () => _controller.switchCamera()),
              _getOperateButton(Icons.image, () async {
                XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                if (xFile == null) {
                  EasyLoading.showInfo("选择图片失败");
                  return;
                }
                bool hasCode = await _controller.analyzeImage(xFile.path);
                if (!hasCode) {
                  EasyLoading.showInfo("图片解析二维码失败");
                  return;
                }
              }),
            ],
          ),
        ],
      ),
    );
  }

  Container _getOperateButton(IconData iconData, Function()? onPressed) {
    return Container(
      height: 60.h,
      width: 60.h,
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      color: const Color.fromRGBO(255, 255, 255, 0.15),
      child: IconButton(
        iconSize: 30.h,
        icon: Icon(
          iconData,
          color: Colors.white,
          size: 30.h,
        ),
        onPressed: onPressed,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
