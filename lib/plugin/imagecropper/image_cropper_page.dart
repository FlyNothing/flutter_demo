import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/standard_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageCropperPage extends StatefulWidget {
  const ImageCropperPage({super.key});

  @override
  State<StatefulWidget> createState() => _ImageCropperPageState();
}

class _ImageCropperPageState extends State<ImageCropperPage> {
  final ImagePicker _imagePicker = ImagePicker();
  final ImageCropper _imageCropper = ImageCropper();
  CroppedFile? _croppedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'ImageCropper测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 10.h)),
              StandardTextButton("相册", () => _pickImage()),
              Padding(padding: EdgeInsets.symmetric(vertical: 10.h)),
              _getImageView()
            ],
          ),
        )
      ],
    );
  }

  Container _getImageView() {
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 1)),
      width: 0.8.sw,
      height: 0.4.sh,
      child: _croppedFile != null
          ? Image.file(
              File((_croppedFile as CroppedFile).path),
              fit: BoxFit.cover,
            )
          : const SizedBox.shrink(),
    );
  }

  Future<void> _pickImage() async {
    XFile? imageFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      _cropImage(File(imageFile.path));
    }
  }

  Future<void> _cropImage(File image) async {
    CroppedFile? croppedFile = await _imageCropper.cropImage(
      sourcePath: image.path,
      // 当设置aspectRatio后将锁定裁剪器，用户无法调整。
      // 可以通过AndroidUiSettings.lockAspectRatio取消锁定。
      // aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 2),

      // 控制裁剪菜单视图的纵横比列表
      // 如设置aspectRatio则纵横比被锁定，无法选择
      // 可以被AndroidUiSettings.initAspectRatio覆盖后，无法选择
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      // 设置裁剪器形状：圆形和矩形
      // cropStyle: CropStyle.circle,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.blue,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
    _croppedFile = croppedFile;
    setState(() {});
  }
}
