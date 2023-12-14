import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/standard_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';
import 'package:flutter_demo/plugin/sqlite/sqflite/dao/user_dao.dart';
import 'package:flutter_demo/plugin/sqlite/sqflite/entity/user.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SqflitePage extends StatefulWidget {
  const SqflitePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SqflitePageState();
}

class _SqflitePageState extends State<SqflitePage> {
  List<User> userList = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addrController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future future = UserDao().open();
    future.then((value) async {
      userList = await UserDao().getAll();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'Sqflite测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.symmetric(vertical: 5.h), child: _getUserList()),
        _addUserButton(),
      ],
    );
  }

  Widget _getUserList() {
    List<TableRow> rows = List.generate(
      userList.length,
      (index) => TableRow(
        children: [
          _getTableText(userList[index].id.toString()),
          _getTableText(userList[index].name),
          _getTableText(userList[index].age.toString()),
          _getTableText(userList[index].addr ?? ""),
          GestureDetector(
            child: Center(child: Text("删除", style: size14W500(color: Colors.blue))),
            onTap: () async {
              await UserDao().deleteById(userList[index].id);
              userList.removeAt(index);
              setState(() {});
            },
          )
        ],
      ),
    );
    rows.insert(0, TableRow(children: [_getTableText("主键"), _getTableText("姓名"), _getTableText("年纪"), _getTableText("地址"), _getTableText("操作")]));
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: {
        0: FixedColumnWidth(0.1.sw),
        1: FixedColumnWidth(0.2.sw),
        2: FixedColumnWidth(0.2.sw),
        3: FixedColumnWidth(0.3.sw),
        4: FixedColumnWidth(0.2.sw),
      },
      border: TableBorder.all(width: 1.h, color: Colors.grey),
      children: rows,
    );
  }

  Center _getTableText(String text) {
    return Center(child: Text(text));
  }

  Widget _addUserButton() {
    return StandardTextButton("新增", () {
      Future<String?> res = showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.white,
          content: SizedBox(
            height: 0.25.sh,
            child: Column(
              children: [
                StandardTextField(_nameController, hintText: "请输入姓名"),
                Padding(padding: EdgeInsets.only(top: 0.02.sh)),
                StandardTextField(_ageController, hintText: "请输入年龄"),
                Padding(padding: EdgeInsets.only(top: 0.02.sh)),
                StandardTextField(_addrController, hintText: "请输入地址")
              ],
            ),
          ),
          actions: [StandardTextButton("取消", () => Navigator.pop(context)), StandardTextButton("确认", () => Navigator.pop(context, _nameController.text))],
          actionsAlignment: MainAxisAlignment.center,
        ),
      );
      res.then((value) async {
        await UserDao().insertRaw(User(id: 0, name: _nameController.text, age: int.parse(_ageController.text), addr: _addrController.text));
        userList = await UserDao().getAll();
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _addrController.dispose();
    super.dispose();
  }
}
