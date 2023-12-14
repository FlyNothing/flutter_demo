import 'package:flutter_demo/common/vo/base_menu_vo.dart';
import 'package:flutter_demo/plugin/video/chewie/chewie_custom_page.dart';
import 'package:flutter_demo/plugin/video/chewie/chewie_page.dart';

List<BaseMenuVO> chewieMenuList = [
  BaseMenuVO("Chewie", const ChewiePage("Chewie")),
  BaseMenuVO("自定义Chewie", const ChewieCustomPage("自定义Chewie")),
];
