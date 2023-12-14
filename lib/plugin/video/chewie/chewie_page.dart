import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class ChewiePage extends StatefulWidget {
  const ChewiePage(this._title, {Key? key}) : super(key: key);
  final String _title;

  @override
  State<StatefulWidget> createState() => _ChewiePageState();
}

class _ChewiePageState extends State<ChewiePage> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/videos/poppy-field.mp4");
    _controller.initialize().then((value) {
      _chewieController = ChewieController(
        videoPlayerController: _controller,
        autoPlay: true,
        looping: true,
      );
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _chewieController.dispose();
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
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Chewie(
                controller: _chewieController,
              ),
            )
          : Container(color: Colors.black.withOpacity(0.8)),
    );
  }
}
