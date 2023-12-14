import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/standard_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  final TextEditingController _controller = TextEditingController();
  String _imageUrl = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'Image测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _getUrlTextField(),
          StandardTextButton("刷新图片", () {
            _imageUrl = _controller.text;
            setState(() {
              debugPrint("刷新图片");
            });
          }),
          _getImage(),
          _getFadeInImage(),
        ],
      ),
    );
  }

  Widget _getImage() {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Stack(
        children: [
          _imageUrl.isEmpty ? Image.asset("assets/images/avatar.png") : Image.network(_imageUrl),
          Text(
            "Image",
            style: size16W400(color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget _getFadeInImage() {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Stack(
        children: [
          _imageUrl.isEmpty
              ? Image.asset("assets/images/avatar.png")
              : FadeInImage(
                  placeholder: const AssetImage("assets/images/avatar.png"),
                  placeholderErrorBuilder: (context, error, stackTrace) {
                    return Text(
                      "Placeholder加载错误",
                      style: size16W400(color: Colors.black),
                    );
                  },
                  image: NetworkImage(_imageUrl),
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Text(
                      "图片加载错误",
                      style: size16W400(color: Colors.black),
                    );
                  },
                ),
          Text(
            "FadeInImage",
            style: size16W400(color: Colors.white),
          )
        ],
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
