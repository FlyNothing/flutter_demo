import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';

/// ListView嵌套Gridview <br/>
/// ListView用于布局、可以下拉滑动页面 <br/>
/// Gridview展示内容，不允许下拉且一次加载所有列表
class ListviewGridview1Page extends StatelessWidget {
  const ListviewGridview1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'Listview和Gridview测试1'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return ListView(
      children: [
        getTitle("标题1"),
        getContent(20),
        getTitle("标题2"),
        getContent(10),
        getTitle("标题3"),
        getContent(5),
        getTitle("标题4"),
        getContent(10),
        getTitle("标题5"),
        getContent(20),
      ],
    );
  }

  getTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Text(
          title,
          style: size16W600(),
        ),
      ),
    );
  }

  getContent(int i) {
    return GridView.builder(
      shrinkWrap: true, // ListView跟随GridView内容变化高度
      physics: const NeverScrollableScrollPhysics(), // 取消GridView滚动效果
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 16 / 9, mainAxisSpacing: 5, crossAxisSpacing: 5),
      itemCount: i,
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(border: Border.all(width: 1)),
          child: Text("$index"),
        );
      },
    );
  }
}
