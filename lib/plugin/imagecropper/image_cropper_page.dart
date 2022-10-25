import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageCropperPage extends StatefulWidget {
  const ImageCropperPage({super.key});

  @override
  State<StatefulWidget> createState() => ImageCropperPageState();
}

class ImageCropperPageState extends State<ImageCropperPage> {
  final ImagePicker _imagePicker = ImagePicker();
  CroppedFile? _croppedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'image_cropper测试'),
      body: _getBody(context),
    );
  }

  _getBody(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 10.h)),
              TextButton(
                onPressed: () => _pickImage(),
                child: Text("相册", style: TextStyleUtil.size18W400(color: Colors.white)),
              ),
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
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.blue,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: false),
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
