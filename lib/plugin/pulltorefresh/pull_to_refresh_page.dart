import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/plugin/pulltorefresh/entity/student.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PullToRefreshPage extends StatefulWidget {
  const PullToRefreshPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PullToRefreshPageState();
}

class _PullToRefreshPageState extends State<PullToRefreshPage> {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  int page = 1, pageSize = 10;
  List<Student> studentList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    _refreshStudent();
  }

  _refreshStudent() {
    page = 1;
    studentList.clear();
    studentList.addAll(getStudent(page, pageSize));
    page += 1;
    setState(() {});
  }

  bool _loadStudent() {
    List<Student> res = getStudent(page, pageSize);
    studentList.addAll(res);
    page += 1;
    setState(() {});
    return res.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'PullToRefresh'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return SmartRefresher(
        controller: _refreshController,
        header: const ClassicHeader(),
        footer: CustomFooter(
          builder: (context, status) {
            if (status == LoadStatus.idle) {
              return const Center(child: Text("初始化加载"));
            } else if (status == LoadStatus.canLoading) {
              return const Center(child: Text("允许加载"));
            } else if (status == LoadStatus.loading) {
              return const Center(child: Text("正在加载中"));
            } else if (status == LoadStatus.failed) {
              return const Center(child: Text("加载失败"));
            } else if (status == LoadStatus.noMore) {
              return const Center(child: Text("没有更多"));
            } else {
              return const Center(child: Text("加载错误"));
            }
          },
        ),
        enablePullDown: true,
        onRefresh: _onRefresh,
        enablePullUp: true,
        onLoading: _onLoading,
        enableTwoLevel: true,
        onTwoLevel: (isOpen) async {
          if (isOpen) {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Scaffold(
                  appBar: appBarStandard(title: "二楼"),
                  body: Center(
                    child: Image.asset("assets/images/avatar.png"),
                  ),
                ),
              ),
            );
            _refreshController.twoLevelComplete();
          }
        },
        child: ListView.builder(
          itemCount: studentList.length,
          itemBuilder: (context, index) => ListTile(
            leading: Text(
              studentList[index].no.toString(),
            ),
            title: Text(
              studentList[index].subject,
            ),
            trailing: Text(
              studentList[index].score.toString(),
            ),
          ),
        ));
  }

  void _onRefresh() {
    Future.delayed(const Duration(milliseconds: 100), () {
      _refreshStudent();
      _refreshController.refreshCompleted(resetFooterState: true);
    });
  }

  void _onLoading() async {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_loadStudent()) {
        _refreshController.loadComplete();
      } else {
        _refreshController.loadNoData();
      }
    });
  }
}
