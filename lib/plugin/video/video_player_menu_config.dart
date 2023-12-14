import 'package:flutter_demo/common/vo/base_menu_vo.dart';
import 'package:flutter_demo/plugin/video/video_player/video_player_asset_page.dart';
import 'package:flutter_demo/plugin/video/video_player/video_player_network_page.dart';

List<BaseMenuVO> videoPlayerMenuList = [
  BaseMenuVO("Network视频", const VideoPlayerNetworkPage("Network视频")),
  BaseMenuVO("Asset视频", const VideoPlayerAssetPage("Asset视频")),
];
