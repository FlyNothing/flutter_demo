import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/easy_refresh.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/plugin/easyrefresh/easy_refresh_data.dart';

class EasyRefreshPage extends StatefulWidget {
  const EasyRefreshPage({Key? key}) : super(key: key);

  @override
  State<EasyRefreshPage> createState() => _EasyRefreshPageState();
}

class _EasyRefreshPageState extends State<EasyRefreshPage> {
  List<Map<String, String>> _data = List.empty(growable: true);
  late EasyRefreshController _controller;
  late int _page;
  final int _size = 10;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'EasyRefresh测试'),
      body: _getBody(),
    );
  }

  _refresh() {
    _page = 1;
    List<Map<String, String>> respData = getPageData(_page, _size);
    _page = _page + 1;
    setState(() {
      _data = respData;
    });
    _controller.finishRefresh();
  }

  _load() {
    List<Map<String, String>> respData = getPageData(_page, _size);
    _page = _page + 1;
    setState(() {
      _data.addAll(respData);
    });
    _controller.finishLoad(respData.length < _size ? IndicatorResult.noMore : IndicatorResult.success);
  }

  Widget _getBody() {
    if (_data.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return getEasyRefresh(
      controller: _controller,
      onLoad: _load,
      onRefresh: _refresh,
      child: ListView.builder(
        itemCount: _data.length,
        itemBuilder: ((context, index) => ListTile(
              // contentPadding: const EdgeInsets.all(20),
              leading: Text(_data[index]["leading"] as String),
              title: Text(_data[index]["title"] as String),
              trailing: Text(_data[index]["trailing"] as String),
            )),
      ),
    );
  }
}
