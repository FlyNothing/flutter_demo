import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/standard_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CachedNetworkImagePage extends StatefulWidget {
  const CachedNetworkImagePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CachedNetworkImagePageState();
}

class _CachedNetworkImagePageState extends State<CachedNetworkImagePage> {
  final TextEditingController _controller = TextEditingController();
  String _imageUrl = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'CachedNetworkImage测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      children: [
        _getUrlTextField(),
        StandardTextButton("刷新图片", () {
          _imageUrl = _controller.text;
          setState(() {
            debugPrint("刷新图片");
          });
        }),
        _getImage(),
      ],
    );
  }

  Center _getImage() {
    return Center(
      child: CachedNetworkImage(
        imageUrl: _imageUrl,
        // imageBuilder: (context, imageProvider) => Container(
        //   decoration: BoxDecoration(
        //     image: DecorationImage(image: imageProvider, fit: BoxFit.cover, colorFilter: const ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
        //   ),
        // ),
        // placeholder: (context, url) => const CircularProgressIndicator(),
        progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  Container _getUrlTextField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.w),
      height: 40.h,
      width: 1.sw,
      child: StandardTextField(_controller, hintText: "请输入图片下载地址"),
    );
  }
}
