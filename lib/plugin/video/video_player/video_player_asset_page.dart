import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerAssetPage extends StatefulWidget {
  const VideoPlayerAssetPage(this._title, {Key? key}) : super(key: key);
  final String _title;

  @override
  State<StatefulWidget> createState() => _VideoPlayPageState();
}

class _VideoPlayPageState extends State<VideoPlayerAssetPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/videos/poppy-field.mp4");
    _controller.setLooping(true);
    _controller.initialize().then((value) => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: widget._title),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return SizedBox(
      height: 1.sw * 9 / 16,
      width: 1.sw,
      child: Stack(
        children: _controller.value.isInitialized
            ? [
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
                Align(
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying ? _controller.pause() : _controller.play();
                      });
                    },
                    icon: Icon(
                      _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 50.w,
                      color: Colors.blue,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ]
            : [
                Container(color: Colors.black.withOpacity(0.8)),
              ],
      ),
    );
  }
}
