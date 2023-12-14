import 'package:flutter_demo/plugin/plugin_menu_config.dart';

List<PluginMenuSortVO> pluginMenuSortList = [
  PluginMenuSortVO(0, "编码", true, false, (int asc) => pluginMenuList.sort((p1, p2) => asc * p1.code.compareTo(p2.code))),
  PluginMenuSortVO(1, "名称", true, false, (int asc) => pluginMenuList.sort((p1, p2) => asc * p1.name.compareTo(p2.name))),
];

/// 插件列表排序VO对象
class PluginMenuSortVO {
  PluginMenuSortVO(this.id, this.name, this.asc, this.selected, this.sortFun);

  final int id;

  /// 排序方式名称
  final String name;

  /// 排序方式 true:正序 false:倒序
  bool asc;

  /// 筛选方式是否被选中
  bool selected;

  /// 筛选执行的函数
  final Function sortFun;
}
