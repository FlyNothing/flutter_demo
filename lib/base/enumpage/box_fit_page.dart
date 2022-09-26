import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoxFitPage extends StatelessWidget {
  const BoxFitPage({super.key});
  static final Color _color = Colors.black.withOpacity(0.7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'BoxFit模式'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    List<Widget> images = genImageList();
    return GridView.count(crossAxisCount: 1, children: images);
  }

  List<Widget> genImageList() {
    return [
      getImage("assets/images/image1.jpg"),
      getImage("assets/images/image1_vertical.jpg"),
      getImage("assets/images/image2.jpg"),
      getImage("assets/images/image2_vertical.jpg"),
      Divider(color: _color, thickness: 1),
      getImage("assets/images/image1.jpg", fit: BoxFit.contain),
      getImage("assets/images/image1_vertical.jpg", fit: BoxFit.contain),
      getImage("assets/images/image2.jpg", fit: BoxFit.contain),
      getImage("assets/images/image2_vertical.jpg", fit: BoxFit.contain),
      Divider(color: _color, thickness: 1),
      getImage("assets/images/image1.jpg", fit: BoxFit.cover),
      getImage("assets/images/image1_vertical.jpg", fit: BoxFit.cover),
      getImage("assets/images/image2.jpg", fit: BoxFit.cover),
      getImage("assets/images/image2_vertical.jpg", fit: BoxFit.cover),
      Divider(color: _color, thickness: 1),
      getImage("assets/images/image1.jpg", fit: BoxFit.fill),
      getImage("assets/images/image1_vertical.jpg", fit: BoxFit.fill),
      getImage("assets/images/image2.jpg", fit: BoxFit.fill),
      getImage("assets/images/image2_vertical.jpg", fit: BoxFit.fill),
      Divider(color: _color, thickness: 1),
      getImage("assets/images/image1.jpg", fit: BoxFit.fitHeight),
      getImage("assets/images/image1_vertical.jpg", fit: BoxFit.fitHeight),
      getImage("assets/images/image2.jpg", fit: BoxFit.fitHeight),
      getImage("assets/images/image2_vertical.jpg", fit: BoxFit.fitHeight),
      Divider(color: _color, thickness: 1),
      getImage("assets/images/image1.jpg", fit: BoxFit.fitWidth),
      getImage("assets/images/image1_vertical.jpg", fit: BoxFit.fitWidth),
      getImage("assets/images/image2.jpg", fit: BoxFit.fitWidth),
      getImage("assets/images/image2_vertical.jpg", fit: BoxFit.fitWidth),
      Divider(color: _color, thickness: 1),
      getImage("assets/images/image1.jpg", fit: BoxFit.none),
      getImage("assets/images/image1_vertical.jpg", fit: BoxFit.none),
      getImage("assets/images/image2.jpg", fit: BoxFit.none),
      getImage("assets/images/image2_vertical.jpg", fit: BoxFit.none),
      Divider(color: _color, thickness: 1),
      getImage("assets/images/image1.jpg", fit: BoxFit.scaleDown),
      getImage("assets/images/image1_vertical.jpg", fit: BoxFit.scaleDown),
      getImage("assets/images/image2.jpg", fit: BoxFit.scaleDown),
      getImage("assets/images/image2_vertical.jpg", fit: BoxFit.scaleDown),
    ];
  }

  Container getImage(String image, {BoxFit? fit}) {
    return Container(
        margin: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: _color),
          image: DecorationImage(image: AssetImage(image), fit: fit),
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: Text(fit == null ? "Origin" : fit.toString(), style: TextStyleUtil.size16W600(color: _color)),
        ));
  }
}
