import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/api.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/standard_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class PathProviderPage extends StatefulWidget {
  const PathProviderPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PathProviderPageState();
}

class _PathProviderPageState extends State<PathProviderPage> {
  final TextEditingController _controller = TextEditingController();
  final Uuid _uuid = const Uuid();
  File? _localFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'PathProvider测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StandardTextButton("获取目录", () => showDirectorys()),
        Padding(padding: EdgeInsets.symmetric(vertical: 10.h), child: Divider(thickness: 2.h)),
        _getUrlTextField(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            StandardTextButton("HttpGet到本地", () => _getHttpFile(_controller.text)),
            StandardTextButton("下载到本地", () => _downloadFile(_controller.text)),
          ],
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 10.h), child: Divider(thickness: 2.h)),
        StandardTextButton("读取本地文件", () => _loadLocalFile(_controller.text)),
        _localFile != null ? Image.file(_localFile as File) : const SizedBox.shrink(),
      ],
    );
  }

  Container _getUrlTextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      height: 40.h,
      width: 1.sw,
      child: StandardTextField(_controller, hintText: "请输入图片下载地址"),
    );
  }

  Future<void> showDirectorys() async {
    Map<String, String> dirMap = await getDirectorys();
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 400.h,
          color: Colors.white,
          child: Column(
            children: dirMap.entries
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: e.key, style: size16W600()),
                          TextSpan(text: e.value, style: size14W400()),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }

  Future<Map<String, String>> getDirectorys() async {
    Map<String, String> dirMap = {};
    Directory tempDir = await getTemporaryDirectory();
    dirMap["  Temporary:  "] = tempDir.path;

    Directory appSupDir = await getApplicationSupportDirectory();
    dirMap["  ApplicationSupport:  "] = appSupDir.path;

    Directory appDocDir = await getApplicationDocumentsDirectory();
    dirMap["  ApplicationDocuments:  "] = appDocDir.path;

    Directory? extStoDir = await getExternalStorageDirectory();
    dirMap["  ExternalStorage:  "] = extStoDir?.path ?? "";

    List<Directory>? extCacheDirs = await getExternalCacheDirectories();
    dirMap["  ExternalCaches:  "] = _dirsToStrings(extCacheDirs);

    List<Directory>? extStoDirs = await getExternalStorageDirectories();
    dirMap["  ExternalStorages:  "] = _dirsToStrings(extStoDirs);
    return dirMap;
  }

  String _dirsToStrings(List<Directory>? extCacheDirs) {
    if (extCacheDirs == null) {
      return "";
    }
    return extCacheDirs.map((dir) => dir.path).toList().join(",");
  }

  /// Http Get存储到本地
  Future<void> _getHttpFile(String url) async {
    // 下载文件
    Response resp = await getHttpFile(url);
    List<int> dataList = resp.data as List<int>;

    // 存储到本地文件
    Directory dir = await getApplicationDocumentsDirectory();
    String path = "${dir.path}/${_getFileName(url)}";
    File newFile = File(path);
    await newFile.writeAsBytes(dataList);
  }

  /// 下载到本地
  Future<void> _downloadFile(String url) async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = "${dir.path}/${_getFileName(url)}";
    await download(url, path);
  }

  Future<void> _loadLocalFile(String url) async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = "${dir.path}/${_getFileName(url)}";
    _localFile = File(path);
    setState(() {});
  }

  String _getFileName(String url) {
    return _uuid.v5(Uuid.NAMESPACE_URL, url);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
