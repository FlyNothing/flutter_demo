import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/standard_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';
import 'package:flutter_demo/plugin/plugin_menu_config.dart';
import 'package:flutter_demo/plugin/plugin_menu_sort_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PluginMenuPage extends StatefulWidget {
  const PluginMenuPage({super.key});

  @override
  State<StatefulWidget> createState() => _PluginMenuPageState();
}

class _PluginMenuPageState extends State<PluginMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(
        centerTitle: false,
        title: '扩展插件',
        actions: pluginMenuSortList.map((vo) => _getSortContainer(vo, () => _selectToSort(vo))).toList(),
      ),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Text("${pluginMenuList[index].code}\n${pluginMenuList[index].name}"),
        trailing: StandardIconButton(
          Icons.navigate_next,
          () => Navigator.push(context, MaterialPageRoute(builder: (context) => pluginMenuList[index].page)),
        ),
      ),
      itemCount: pluginMenuList.length,
    );
  }

  Widget _getSortContainer(PluginMenuSortVO vo, Function()? onTap) {
    Color color = Colors.white;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(right: 10.w),
        child: Row(
          children: [
            Text(vo.name, style: vo.selected ? size14W600(color: color) : size14W400(color: color)),
            if (vo.selected) Icon(vo.asc ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: color),
          ],
        ),
      ),
    );
  }

  _selectToSort(PluginMenuSortVO e) {
    for (PluginMenuSortVO vo in pluginMenuSortList) {
      if (e.id == vo.id) {
        if (e.selected) {
          e.asc = !e.asc;
        } else {
          e.selected = true;
          e.asc = true;
        }
      } else {
        vo.selected = false;
      }
      if (vo.selected) {
        vo.sortFun(e.asc ? 1 : -1);
      }
    }
    setState(() {});
  }
}
