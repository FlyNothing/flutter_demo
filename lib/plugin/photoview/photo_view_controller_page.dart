import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/standard_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewControllerPage extends StatefulWidget {
  const PhotoViewControllerPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PhotoViewControllerPageState();
}

class _PhotoViewControllerPageState extends State<PhotoViewControllerPage> {
  final ImagePicker _imagePicker = ImagePicker();
  Image? _image;
  PhotoViewController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PhotoViewController(
      initialPosition: const Offset(50, 50),
      initialRotation: 0,
      initialScale: 1.0,
    );
    _controller?.outputStateStream.listen((value) {
      debugPrint("----------value = $value");
    });

    debugPrint("----------initial ${_controller?.initial}");
    debugPrint("----------prevValue ${_controller?.prevValue}");

    debugPrint("----------outputStateStream ${_controller?.outputStateStream}");
    debugPrint("----------position ${_controller?.position}");
    debugPrint("----------rotation ${_controller?.rotation}");
    debugPrint("----------rotationFocusPoint ${_controller?.rotationFocusPoint}");
    debugPrint("----------scale ${_controller?.scale}");
    debugPrint("----------value ${_controller?.value}");

    // _controller?.addIgnorableListener(() {});
    // _controller?.removeIgnorableListener(() {});
    // _controller?.reset();
    // _controller?.updateMultiple();
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'PhotoViewController'),
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
            child: _image != null ? PhotoView(imageProvider: _image!.image, controller: _controller) : const SizedBox.shrink(),
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
