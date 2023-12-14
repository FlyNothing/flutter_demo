import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/standard_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewScaleStateControllerPage extends StatefulWidget {
  const PhotoViewScaleStateControllerPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PhotoViewScaleStateControllerPageState();
}

class _PhotoViewScaleStateControllerPageState extends State<PhotoViewScaleStateControllerPage> {
  final ImagePicker _imagePicker = ImagePicker();
  Image? _image;
  PhotoViewScaleStateController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PhotoViewScaleStateController();
    _controller?.outputScaleStateStream.listen((state) {
      debugPrint("----------state.name=${state.name} index=${state.index} runtimeType=${state.runtimeType}");
    });

    debugPrint("----------prevScaleState ${_controller?.prevScaleState}");

    debugPrint("----------outputScaleStateStream ${_controller?.outputScaleStateStream}");
    debugPrint("----------hasChanged ${_controller?.hasChanged}");
    debugPrint("----------isZooming ${_controller?.isZooming}");
    debugPrint("----------scaleState ${_controller?.scaleState}");

    // _controller?.addIgnorableListener(() {});
    // _controller?.removeIgnorableListener(() {});
    // _controller?.reset();
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'PhotoViewScaleStateController'),
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
            child: _image != null ? PhotoView(imageProvider: _image!.image, scaleStateController: _controller) : const SizedBox.shrink(),
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
