import 'package:flutter_demo/common/vo/base_menu_vo.dart';
import 'package:flutter_demo/plugin/photoview/photo_view_controller_page.dart';
import 'package:flutter_demo/plugin/photoview/photo_view_custom_child_page.dart';
import 'package:flutter_demo/plugin/photoview/photo_view_gallery_builder_page.dart';
import 'package:flutter_demo/plugin/photoview/photo_view_gallery_page.dart';
import 'package:flutter_demo/plugin/photoview/photo_view_page.dart';
import 'package:flutter_demo/plugin/photoview/photo_view_scale_state_controller_page.dart';

List<BaseMenuVO> photoViewMenuList = [
  BaseMenuVO("PhotoView", const PhotoViewPage()),
  BaseMenuVO("PhotoView.customChild", const PhotoViewCustomChildPage()),
  BaseMenuVO("PhotoViewGallery", const PhotoViewGalleryPage()),
  BaseMenuVO("PhotoViewGallery.builder", const PhotoViewGalleryBuilderPage()),
  BaseMenuVO("PhotoViewController", const PhotoViewControllerPage()),
  BaseMenuVO("PhotoViewScaleStateController", const PhotoViewScaleStateControllerPage()),
];
