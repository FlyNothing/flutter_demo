import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScannerPage extends StatefulWidget {
  const QRCodeScannerPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _QRCodeScannerPageState();
}

class _QRCodeScannerPageState extends State<QRCodeScannerPage> {
  QRViewController? _controller;
  Barcode? _barcode;
  final GlobalKey key = GlobalKey(debugLabel: 'ScanCode');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _controller!.pauseCamera();
    }
    _controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: '扫描二维码', backgroundColor: Colors.transparent),
      body: _getBody(context),
      extendBodyBehindAppBar: true,
    );
  }

  Widget _getBody(BuildContext context) {
    return Stack(
      children: [
        _getQRView(context),
        _getOperateList(),
      ],
    );
  }

  QRView _getQRView(BuildContext context) {
    return QRView(
      key: key,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.white,
        borderRadius: 0,
        borderLength: 12.w,
        borderWidth: 5.w,
        cutOutSize: 230.w,
        cutOutBottomOffset: 100.h,
      ),
    );
  }

  Container _getOperateList() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: EdgeInsets.only(top: 300.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getOperateButton(Icons.pause, () => _controller?.pauseCamera()),
              _getOperateButton(Icons.play_arrow, () => _controller?.resumeCamera()),
              _getOperateButton(Icons.stop, () => _controller?.stopCamera()),
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10.w)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getOperateButton(Icons.flashlight_on, () => _controller?.toggleFlash()),
              _getOperateButton(Platform.isAndroid ? Icons.flip_camera_android : Icons.flip_camera_ios, () => _controller?.flipCamera()),
            ],
          ),
        ],
      ),
    );
  }

  Container _getOperateButton(IconData iconData, Function()? onPressed) {
    return Container(
      height: 60.w,
      width: 60.w,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      color: const Color.fromRGBO(255, 255, 255, 0.15),
      child: IconButton(
        iconSize: 30.w,
        icon: Icon(
          iconData,
          color: Colors.white,
          size: 30.w,
        ),
        onPressed: onPressed,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      _controller = controller;
      _controller?.resumeCamera();
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        _barcode = scanData;
        String? code = _barcode?.code;
        if (code == null) {
          return;
        }
        _controller?.pauseCamera();
        EasyLoading.showInfo("扫描到的二维码是：$code", duration: const Duration(seconds: 3));
      });
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
