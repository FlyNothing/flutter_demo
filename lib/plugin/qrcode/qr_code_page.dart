import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodePage extends StatelessWidget {
  final String _code;
  const QRCodePage(this._code, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'QRCode测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return getImageContainer();
  }

  Container getImageContainer() {
    return Container(
      alignment: Alignment.center,
      child: QrImage(
        data: _code,
        version: QrVersions.auto,
        size: 300,
        embeddedImage: const AssetImage("assets/images/avatar.jpg"),
        embeddedImageStyle: QrEmbeddedImageStyle(size: const Size.square(50)),
      ),
    );
  }
}
