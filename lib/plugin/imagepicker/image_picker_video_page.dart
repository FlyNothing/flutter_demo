import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/standard_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class ImagePickerVideoPage extends StatefulWidget {
  const ImagePickerVideoPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ImagePickerVideoPageState();
}

class _ImagePickerVideoPageState extends State<ImagePickerVideoPage> {
  final ImagePicker _imagePicker = ImagePicker();
  File? file;
  VideoPlayerController? _controller;

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: '选择视频'),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StandardTextButton("拍照", () => _pickVideo(ImageSource.camera)),
                  StandardTextButton("相册", () => _pickVideo(ImageSource.gallery)),
                ],
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10.h)),
              _getVideoView()
            ],
          ),
        )
      ],
    );
  }

  Container _getVideoView() {
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 1)),
      width: 0.8.sw,
      height: 0.4.sh,
      child: _controller != null
          ? AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: VideoPlayer(_controller!),
            )
          : const SizedBox.shrink(),
    );
  }

  Future<void> _pickVideo(ImageSource source) async {
    XFile? videoFile = await _imagePicker.pickVideo(source: source);
    if (videoFile != null) {
      setState(() {
        _controller = VideoPlayerController.file(File(videoFile.path));
        _controller?.initialize();
        _controller?.play();
      });
    }
  }
}
