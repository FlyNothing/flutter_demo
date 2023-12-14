import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/standard_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';
import 'package:flutter_demo/plugin/sqlite/floor/dao/customer_dao.dart';
import 'package:flutter_demo/plugin/sqlite/floor/dao/customer_db.dart';
import 'package:flutter_demo/plugin/sqlite/floor/entity/customer.dart';
import 'package:flutter_demo/plugin/sqlite/sqflite/const/common_const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloorPage extends StatefulWidget {
  const FloorPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FloorPageState();
}

class _FloorPageState extends State<FloorPage> {
  List<Customer> userList = [];
  late CustomerDao customerDao;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addrController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future<CustomerDatabase> future = $FloorCustomerDatabase.databaseBuilder(dbCustomer).build();
    future.then((value) async {
      customerDao = value.customerDao;
      userList = await customerDao.queryAll();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'Floor测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.symmetric(vertical: 5.h), child: _getCustomerList()),
        _addCustomerButton(),
      ],
    );
  }

  Widget _getCustomerList() {
    List<TableRow> rows = List.generate(
      userList.length,
      (index) => TableRow(
        children: [
          _getTableText(userList[index].id.toString()),
          _getTableText(userList[index].name ?? ""),
          _getTableText(userList[index].age.toString()),
          _getTableText(userList[index].addr ?? ""),
          GestureDetector(
            child: Center(child: Text("删除", style: size14W500(color: Colors.blue))),
            onTap: () async {
              await customerDao.deletePerson(userList[index]);
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

  Widget _addCustomerButton() {
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
        await customerDao.insertCustomer(Customer(name: _nameController.text, age: int.parse(_ageController.text), addr: _addrController.text));
        userList = await customerDao.queryAll();
        ;
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
