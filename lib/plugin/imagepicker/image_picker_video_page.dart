import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';
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
                    onPressed: () => _pickVideo(ImageSource.camera),
                    child: Text("拍照", style: TextStyleUtil.size18W400(color: Colors.white)),
                  ),
                  TextButton(
                    onPressed: () => _pickVideo(ImageSource.gallery),
                    child: Text("相册", style: TextStyleUtil.size18W400(color: Colors.white)),
                  ),
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
