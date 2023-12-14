// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class WebviewFlutter extends StatefulWidget {
  const WebviewFlutter(this._title, this._url, {Key? key}) : super(key: key);
  final String _title;
  final String _url;

  @override
  State<StatefulWidget> createState() => _WebviewFlutterState();
}

class _WebviewFlutterState extends State<WebviewFlutter> {
  final WebViewController controller = WebViewController();
  @override
  void initState() {
    super.initState();
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) => debugPrint("----------onPageStarted, url = $url"),
        onPageFinished: (url) => debugPrint("----------onPageFinished, url = $url"),
        onProgress: (progress) => debugPrint("----------onProgress, progress = ${progress.toString()}"),
        onNavigationRequest: (request) {
          debugPrint("----------onNavigationRequest, request.url = ${request.url}");
          return NavigationDecision.navigate;
        },
        onWebResourceError: (error) => debugPrint("----------onWebResourceError, error.description = ${error.description}"),
      ))
      ..loadRequest(Uri.parse(widget._url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: widget._title),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Center(
      child: WebViewWidget(controller: controller),
    );
  }
}

class PlatformWebviewFlutter extends StatefulWidget {
  const PlatformWebviewFlutter(this._title, this._url, {Key? key}) : super(key: key);
  final String _title;
  final String _url;

  @override
  State<StatefulWidget> createState() => _PlatformWebviewFlutterState();
}

class _PlatformWebviewFlutterState extends State<PlatformWebviewFlutter> {
  final WebViewController controller = WebViewController();
  @override
  void initState() {
    super.initState();
    PlatformNavigationDelegateCreationParams params = const PlatformNavigationDelegateCreationParams();
    controller.loadRequest(Uri.parse(widget._url));
    // 使用PlatformWebViewController配置会覆盖WebViewController配置
    controller.platform
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setPlatformNavigationDelegate(WebViewPlatform.instance is WebKitWebViewPlatform
          ? WebKitNavigationDelegate(WebKitNavigationDelegateCreationParams.fromPlatformNavigationDelegateCreationParams(params))
          : AndroidNavigationDelegate(AndroidNavigationDelegateCreationParams.fromPlatformNavigationDelegateCreationParams(params)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: widget._title),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Center(
      child: WebViewWidget(controller: controller),
    );
  }
}
