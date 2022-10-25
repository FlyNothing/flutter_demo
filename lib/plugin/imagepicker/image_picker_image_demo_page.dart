import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerImageDemoPage extends StatefulWidget {
  const ImagePickerImageDemoPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ImagePickerImageDemoPageState();
}

class _ImagePickerImageDemoPageState extends State<ImagePickerImageDemoPage> {
  final ImagePicker _imagePicker = ImagePicker();
  final List<Image> _images = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: '选择图片'),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => _pickImage(ImageSource.camera),
                    child: Text("拍照", style: TextStyleUtil.size18W400(color: Colors.white)),
                  ),
                  TextButton(
                    onPressed: () => _pickImage(ImageSource.gallery),
                    child: Text("相册", style: TextStyleUtil.size18W400(color: Colors.white)),
                  ),
                  TextButton(
                    onPressed: () => _pickMultiImage(),
                    child: Text("相册列表", style: TextStyleUtil.size18W400(color: Colors.white)),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10.h)),
              _images.isEmpty
                  ? Container(decoration: BoxDecoration(border: Border.all(width: 1)), width: 0.9.sw, height: 0.4.sh)
                  : GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: List.generate(_images.length, (index) => _getImageView(_images[index])),
                    )
            ],
          ),
        )
      ],
    );
  }

  Container _getImageView(Image image) {
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 1)),
      width: 0.4.sw,
      height: 0.4.sh,
      child: image,
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    XFile? imageFile = await _imagePicker.pickImage(source: source);
    if (imageFile != null) {
      setState(() {
        _images.clear();
        _images.add(Image.file(File(imageFile.path), fit: BoxFit.cover));
      });
    }
  }

  Future<void> _pickMultiImage() async {
    List<XFile>? imageFiles = await _imagePicker.pickMultiImage();
    if (imageFiles.isNotEmpty) {
      setState(() {
        _images.clear();
        _images.addAll(List.generate(
          imageFiles.length,
          (index) => Image.file(File(imageFiles[index].path), fit: BoxFit.cover),
        ));
      });
    }
  }
}
