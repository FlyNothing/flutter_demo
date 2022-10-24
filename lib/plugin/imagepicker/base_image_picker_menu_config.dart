import 'package:flutter/material.dart';
import 'package:flutter_demo/plugin/imagepicker/image_picker_image_demo_page.dart';
import 'package:flutter_demo/plugin/imagepicker/image_picker_video_demo_page.dart';

List<BaseMenuVO> baseImagePickerMenuList = [
  BaseMenuVO("选择图片", const ImagePickerImageDemoPage()),
  BaseMenuVO("选择视频", const ImagePickerVideoDemoPage()),
];

class BaseMenuVO {
  BaseMenuVO(this.name, this.page);

  final String name;
  final Widget page;
}
