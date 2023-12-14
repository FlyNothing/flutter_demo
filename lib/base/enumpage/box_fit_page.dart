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
    List<Widget> res = [];
    for (var boxFit in BoxFit.values) {
      res.add(getImage("assets/images/image1.jpg", fit: boxFit));
      res.add(getImage("assets/images/image1_vertical.jpg", fit: boxFit));
      res.add(getImage("assets/images/image2.jpg", fit: boxFit));
      res.add(getImage("assets/images/image2_vertical.jpg", fit: boxFit));
      res.add(Divider(color: _color, thickness: 1));
    }
    return res;
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
          child: Text(fit == null ? "Origin" : fit.toString(), style: size16W600(color: _color)),
        ));
  }
}
