import 'package:flutter_demo/common/vo/base_menu_vo.dart';
import 'package:flutter_demo/plugin/imagepicker/image_picker_image_page.dart';
import 'package:flutter_demo/plugin/imagepicker/image_picker_video_page.dart';

List<BaseMenuVO> imagePickerMenuList = [
  BaseMenuVO("选择图片", const ImagePickerImagePage()),
  BaseMenuVO("选择视频", const ImagePickerVideoPage()),
];
