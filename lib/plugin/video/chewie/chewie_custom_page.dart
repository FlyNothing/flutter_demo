import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class ChewieCustomPage extends StatefulWidget {
  const ChewieCustomPage(this._title, {Key? key}) : super(key: key);
  final String _title;

  @override
  State<StatefulWidget> createState() => _VideoPlayPageState();
}

class _VideoPlayPageState extends State<ChewieCustomPage> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/videos/poppy-field.mp4");
    // _controller = VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");
    _controller.initialize().then((value) {
      _chewieController = ChewieController(
        videoPlayerController: _controller,
        optionsTranslation: OptionsTranslation(
          playbackSpeedButtonText: "倍速",
          subtitlesButtonText: "子标题",
          cancelButtonText: "取消",
        ),
        autoPlay: true,
        looping: true,
        showControlsOnInitialize: false,
        fullScreenByDefault: false,
        showOptions: true,
        additionalOptions: (context) => [
          OptionItem(
              onTap: () {
                debugPrint("自定义Options");
                Navigator.pop(context);
              },
              iconData: Icons.close,
              title: "关闭")
        ],
        showControls: true,
        subtitle: Subtitles([
          Subtitle(index: 1, start: const Duration(seconds: 0), end: const Duration(seconds: 3), text: "前三秒"),
          Subtitle(index: 2, start: const Duration(seconds: 10), end: const Duration(seconds: 13), text: "中三秒")
        ]),
        subtitleBuilder: (context, subtitle) => Text(
          subtitle.toString(),
          style: size22W400(color: Colors.white),
        ),
        isLive: false,
        // 如果使用自定义按钮，则控件自带按钮将不再显示
        // customControls: Align(
        //   alignment: Alignment.bottomRight,
        //   child: StandardIconButton(Icons.close, () => Navigator.pop(context), color: Colors.white),
        // ),
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
