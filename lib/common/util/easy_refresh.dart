import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/widgets.dart';

EasyRefresh getEasyRefresh({EasyRefreshController? controller, Function()? onLoad, Function()? onRefresh, required Widget child}) {
  return EasyRefresh(
    controller: controller,
    header: _defaultHeader(),
    footer: _defaultFooter(),
    onLoad: onLoad,
    onRefresh: onRefresh,
    child: child,
  );
}

ClassicHeader _defaultHeader() {
  return const ClassicHeader(
    dragText: "下拉刷新",
    armedText: "准备刷新",
    readyText: "刷新中",
    processingText: "刷新中",
    processedText: "刷新成功",
    noMoreText: "没有数据",
    failedText: "刷新失败",
    messageText: "更新于 %T",
    showMessage: false,
  );
}

ClassicFooter _defaultFooter() {
  return const ClassicFooter(
    dragText: "上拉加载",
    armedText: "准备加载",
    readyText: "加载中",
    processingText: "加载中",
    processedText: "加载成功",
    noMoreText: "没有更多",
    failedText: "加载失败",
    messageText: "更新于 %T",
    showMessage: false,
  );
}
