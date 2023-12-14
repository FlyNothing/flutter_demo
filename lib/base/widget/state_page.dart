import 'package:flutter/material.dart';
import 'package:flutter_demo/common/page/httperror/loading_page.dart';
import 'package:flutter_demo/common/page/httperror/service_unavailable_page.dart';
import 'package:flutter_demo/common/util/api.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';
import 'package:flutter_demo/common/vo/base_resp_vo.dart';

/// StatefulWidget测试
class StatePage extends StatefulWidget {
  static const String routeName = "/state-demo";

  const StatePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {
  final BaseRespVo _respVo = initBaseRespVo(code: -1);

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      _getTest();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'State测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    if (_respVo.code == -1) {
      return const HttpLoadingPage();
    } else if (_respVo.code == 0) {
      return genContainer();
    } else {
      return const HttpServiceUnavailablePage();
    }
  }

  void _getTest() {
    Future<BaseRespVo> future = getTest();
    future.then((respVo) {
      _respVo.code = respVo.code;
      setState(() {});
    });
  }

  Widget genContainer() {
    return Container(
      alignment: Alignment.center,
      child: Text("页面加载完成", style: size16W400()),
    );
  }
}
