import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/standard_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewPage extends StatefulWidget {
  const PhotoViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PhotoViewPageState();
}

class _PhotoViewPageState extends State<PhotoViewPage> {
  final ImagePicker _imagePicker = ImagePicker();
  Image? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'PhotoView'),
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
            child: _image != null
                ? PhotoView(
                    imageProvider: _image!.image,
                    loadingBuilder: (context, event) => Center(
                      child: SizedBox(
                        width: 0.5.sw,
                        height: 0.5.sw,
                        child: CircularProgressIndicator(color: Colors.grey.withOpacity(0.1)),
                      ),
                    ), // Image.asset("assets/images/avatar.png")
                    backgroundDecoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
                    wantKeepAlive: false,
                    gaplessPlayback: false,
                    scaleStateChangedCallback: (state) => debugPrint("----------state=${state.name}"),
                    enableRotation: false,
                    // maxScale: 2.0, // PhotoViewComputedScale.covered/contained
                    // minScale: 0.05, // PhotoViewComputedScale.contained * 0.5
                    initialScale: PhotoViewComputedScale.contained, // 0.4    PhotoViewComputedScale.covered * 2
                    basePosition: Alignment.center,
                    scaleStateCycle: (actual) {
                      debugPrint("----------scaleState=${actual.name}");
                      return PhotoViewScaleState.initial;
                    },
                    onTapUp: (context, details, controllerValue) => debugPrint("----------onTapUp controllerValue=${controllerValue.position}"),
                    onTapDown: (context, details, controllerValue) => debugPrint("----------onTapDown ontrollerValue=${controllerValue.position}"),
                    onScaleEnd: (context, details, controllerValue) => debugPrint("----------onScaleEnd ontrollerValue=${controllerValue.position}"),
                    // customSize: Size(0.5.sw, 0.5.sh),
                    // gestureDetectorBehavior: HitTestBehavior.deferToChild,
                    filterQuality: FilterQuality.low,
                    enablePanAlways: true,
                  )
                : const SizedBox.shrink(),
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
