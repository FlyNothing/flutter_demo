import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/api.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/standard_widget.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ImageGallerySaverPage extends StatelessWidget {
  ImageGallerySaverPage({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  final Uuid _uuid = const Uuid();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'ImageGallerySaver测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      children: [
        _getUrlTextField(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StandardTextButton("保存到相册", () => _saveToGallery(_controller.text)),
            StandardTextButton("查看相册", () => _pickImage()),
          ],
        )
      ],
    );
  }

  Container _getUrlTextField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.w),
      height: 40.h,
      width: 1.sw,
      child: StandardTextField(_controller, hintText: "请输入图片下载地址"),
    );
  }

  /// 保存到相册
  Future<void> _saveToGallery(String url) async {
    // 下载文件
    Response resp = await getHttpFile(url);
    List<int> dataList = resp.data as List<int>;
    Map res = await ImageGallerySaver.saveImage(Uint8List.fromList(dataList), name: _getFileName(url));
    if (res["isSuccess"]) {
      EasyLoading.showInfo("保存成功");
    } else {
      EasyLoading.showError("保存失败");
    }
  }

  void _pickImage() {
    _imagePicker.pickImage(source: ImageSource.gallery);
  }

  String _getFileName(String url) {
    return _uuid.v5(Uuid.NAMESPACE_URL, url);
  }
}
