import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';

/// Stack嵌套Gridview <br/>
/// Stack用于布局<br/>
/// Gridview展示内容，允许下拉加载
class ListviewGridview2Page extends StatelessWidget {
  const ListviewGridview2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'Listview和Gridview测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Stack(
      children: [
        Padding(padding: const EdgeInsets.only(top: 10), child: getTitle("标题1")),
        Padding(padding: const EdgeInsets.only(top: 50), child: getContent(15)),
        Padding(padding: const EdgeInsets.only(top: 260), child: getTitle("标题2")),
        Padding(padding: const EdgeInsets.only(top: 300), child: getContent(15)),
      ],
    );
  }

  getTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        title,
        style: size16W600(),
      ),
    );
  }

  getContent(int i) {
    return SizedBox(
      height: 200,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 16 / 9, mainAxisSpacing: 5, crossAxisSpacing: 5),
        itemCount: i,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(border: Border.all(width: 1)),
            child: Text("$index"),
          );
        },
      ),
    );
  }
}
