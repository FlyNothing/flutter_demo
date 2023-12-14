import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/standard_widget.dart';
// import 'package:flutter_demo/common/util/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewCustomChildPage extends StatefulWidget {
  const PhotoViewCustomChildPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PhotoViewCustomChildPageState();
}

class _PhotoViewCustomChildPageState extends State<PhotoViewCustomChildPage> {
  final ImagePicker _imagePicker = ImagePicker();
  Image? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'PhotoView.customChild'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(border: Border.all(width: 1)),
            width: double.infinity,
            height: double.infinity,
            child: _image != null ? PhotoView.customChild(child: _image) : const SizedBox.shrink(),
            // child: PhotoView.customChild(
            //   child: Center(
            //     child: Container(
            //       width: 1.sw,
            //       height: 1.sh,
            //       alignment: Alignment.center,
            //       color: Colors.yellow.withOpacity(0.5),
            //       child: Text(
            //         "PhotoView.customChild",
            //         style: size14W600(color: Colors.red),
            //       ),
            //     ),
            //   ),
            // ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: StandardTextButton("相册", () => _pickImage(ImageSource.gallery)),
          ),
        )
      ],
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    XFile? imageFile = await _imagePicker.pickImage(source: source);
    if (imageFile != null) {
      setState(() {
        _image = Image.file(File(imageFile.path), fit: BoxFit.cover);
      });
    }
  }
}
