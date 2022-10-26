import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class BadgesPage extends StatelessWidget {
  const BadgesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'Badges测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Badge(
            badgeContent: const Text('1'),
            position: BadgePosition.bottomEnd(),
            child: const Icon(Icons.hub),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Badge(
            badgeContent: const Text('2'),
            position: BadgePosition.bottomStart(),
            child: textButtonStandard("Button", () {}),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Badge(
            badgeColor: Colors.blue,
            badgeContent: const Text('3'),
            position: BadgePosition.bottomEnd(),
            child: const Text("文字的蓝色徽标"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Badge(
            toAnimate: false,
            badgeContent: const Text('1'),
            position: BadgePosition.bottomEnd(),
            child: const Text("禁止动画"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Badge(
            animationDuration: const Duration(seconds: 3),
            badgeContent: const Text('2'),
            position: BadgePosition.bottomEnd(),
            child: const Text("动画时长"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Badge(
            shape: BadgeShape.square,
            badgeContent: const Text('1'),
            position: BadgePosition.bottomEnd(),
            child: const Text("方形徽标"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Badge(
                animationType: BadgeAnimationType.fade,
                badgeContent: const Text('1'),
                position: BadgePosition.bottomEnd(),
                child: const Text("fade动画"),
              ),
              Badge(
                animationType: BadgeAnimationType.scale,
                badgeContent: const Text('1'),
                position: BadgePosition.bottomEnd(),
                child: const Text("scale动画"),
              ),
              Badge(
                animationType: BadgeAnimationType.slide,
                badgeContent: const Text('1'),
                position: BadgePosition.bottomEnd(),
                child: const Text("slide动画"),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Badge(
            showBadge: false,
            badgeContent: const Text('1'),
            position: BadgePosition.bottomEnd(),
            child: const Text("隐藏徽标"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Badge(
                ignorePointer: true,
                badgeContent: IconButton(
                  onPressed: (() {
                    EasyLoading.showToast("禁用");
                  }),
                  icon: const Icon(Icons.ads_click),
                ),
                position: BadgePosition.bottomEnd(),
                child: const Text("禁用徽标互动"),
              ),
              Badge(
                ignorePointer: false,
                badgeContent: IconButton(
                  onPressed: (() {
                    EasyLoading.showToast("允许");
                  }),
                  icon: const Icon(Icons.ads_click),
                ),
                position: BadgePosition.bottomEnd(),
                child: const Text("允许徽标互动"),
              )
            ],
          ),
        ),
      ],
    );
  }
}
