// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/standard_widget.dart';
import 'package:flutter_demo/plugin/carouselslider/carousel_slider_common.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselSliderPage extends StatelessWidget {
  CarouselSliderPage({Key? key}) : super(key: key);
  final CarouselController _controller = CarouselController();
  bool _isAutoPlay = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: '轮播图'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      children: [
        _getWithOptions(),
        ..._getWithController(),
      ],
    );
  }

  Widget _getWithOptions() {
    return Padding(
      padding: EdgeInsets.all(10.h),
      child: CarouselSlider(
        items: widgets,
        disableGesture: true,
        options: CarouselOptions(
          height: 0.25.sh,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          animateToClosest: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 2),
          autoPlayAnimationDuration: const Duration(milliseconds: 1000),
          autoPlayCurve: Curves.linear,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) => debugPrint("----------onPageChanged index=$index reason.index=${reason.index} reason.name=${reason.name}"),
          // onScrolled: (value) => debugPrint("----------onScrolled value=$value"),
          scrollPhysics: const PageScrollPhysics(),
          pageSnapping: false,
          pauseAutoPlayOnTouch: true,
          pauseAutoPlayOnManualNavigate: true,
          pauseAutoPlayInFiniteScroll: true,
          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
          enlargeFactor: 0.4,
          disableCenter: false,
          padEnds: true,
          clipBehavior: Clip.hardEdge,
        ),
      ),
    );
  }

  List<Widget> _getWithController() {
    Map<int, String> valueMap = {};
    for (var i = 0; i < widgets.length; i++) {
      valueMap[i] = "第 ${i + 1} 页";
    }
    int selectIndex = 0;
    return [
      Padding(
        padding: EdgeInsets.all(10.h),
        child: CarouselSlider.builder(
          itemCount: widgets.length,
          itemBuilder: (_, index, realIndex) {
            debugPrint("----------index=$index realIndex=$realIndex");
            return widgets[index];
          },
          options: CarouselOptions(
            height: 0.25.sh,
            viewportFraction: 1,
            autoPlayInterval: const Duration(seconds: 2),
            autoPlay: true,
          ),
          carouselController: _controller,
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StandardTextButton("播放/暂停", () {
              _isAutoPlay ? _controller.stopAutoPlay() : _controller.startAutoPlay();
              _isAutoPlay = !_isAutoPlay;
              EasyLoading.showToast(_isAutoPlay ? "开始播放" : "暂停播放", duration: const Duration(seconds: 1));
            }),
            StandardTextButton("上一页", () => _controller.previousPage()),
            StandardTextButton("下一页", () => _controller.nextPage()),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 0.3.sw,
              child: StandardDropdownButtonFormField(valueMap, (dynamic value) {
                selectIndex = value ?? 0;
              }),
            ),
            StandardTextButton("动画", () => _controller.animateToPage(selectIndex)),
            StandardTextButton("跳转", () => _controller.jumpToPage(selectIndex)),
          ],
        ),
      )
    ];
  }
}
