import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/standard_widget.dart';

class ValueNotifierPage extends StatefulWidget {
  const ValueNotifierPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ValueNotifierPageState();
}

class _ValueNotifierPageState extends State<ValueNotifierPage> {
  late ValueNotifier<int> _ageNotifier;
  late ValueNotifier<String> _nameNotifier;
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  late int _age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'ValueNotifier测试'),
      body: _getBody(context),
    );
  }

  @override
  void initState() {
    _ageNotifier = ValueNotifier(0);
    _ageNotifier.addListener(_setAge);
    _nameNotifier = ValueNotifier("");
    _nameController = TextEditingController();
    _ageController = TextEditingController();
    _age = 0;
    super.initState();
  }

  @override
  void dispose() {
    _ageNotifier.removeListener(_setAge);
    _ageNotifier.dispose();
    _nameNotifier.dispose();
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  Widget _getBody(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Text("姓名"),
          title: ValueListenableBuilder(valueListenable: _nameNotifier, builder: (context, value, child) => Text(value)),
          trailing: _getNameButton(context),
        ),
        ListTile(
          leading: const Text("年龄"),
          title: Text(_age.toString()),
          trailing: _getAgeButton(context),
        )
      ],
    );
  }

  StandardIconButton _getNameButton(BuildContext context) {
    return StandardIconButton(
      Icons.navigate_next,
      () {
        Future<String?> res = showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.white,
            content: StandardTextField(_nameController, hintText: "请输入姓名"),
            actions: [
              StandardTextButton("取消", () => Navigator.pop(context)),
              StandardTextButton("确认", () => Navigator.pop(context, _nameController.text)),
            ],
            actionsAlignment: MainAxisAlignment.center,
          ),
        );
        res.then((value) => _nameNotifier.value = value ?? "");
      },
    );
  }

  StandardIconButton _getAgeButton(BuildContext context) {
    return StandardIconButton(
      Icons.navigate_next,
      () {
        Future<int?> res = showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.white,
            content: StandardTextField(_ageController, hintText: "年龄"),
            actions: [
              StandardTextButton("取消", () => Navigator.pop(context)),
              StandardTextButton("确认", () => Navigator.pop(context, int.parse(_ageController.text)))
            ],
            actionsAlignment: MainAxisAlignment.center,
          ),
        );
        res.then((value) => _ageNotifier.value = value ?? 0);
      },
    );
  }

  void _setAge() {
    _age = _ageNotifier.value;
    setState(() {});
  }
}
