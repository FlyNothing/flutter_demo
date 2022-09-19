import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesPage extends StatefulWidget {
  const SharedPreferencesPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SharedPreferencesPageState();
  }
}

class SharedPreferencesPageState extends State<SharedPreferencesPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late int _intValue = -1;

  @override
  void initState() {
    super.initState();
    _initValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: standardAppBar(title: 'SharedPreferences测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Text("int = $_intValue", style: TextStyleUtil.size18W600()),
          title: IconButton(onPressed: _addInt, icon: const Icon(Icons.exposure_plus_1)),
          trailing: IconButton(onPressed: _plusInt, icon: const Icon(Icons.exposure_minus_1)),
        ),
      ],
    );
  }

  _initValue() {
    _prefs.then((value) {
      _intValue = value.getInt("int") ?? 0;
      setState(() {});
    });
  }

  _addInt() {
    _prefs.then((value) {
      value.setInt("int", ++_intValue);
      setState(() {});
    });
  }

  _plusInt() {
    _prefs.then((value) {
      value.setInt("int", --_intValue);
      setState(() {});
    });
  }
}
