import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

class FlutterInappwebview extends StatefulWidget {
  const FlutterInappwebview(this._title, this._url, {Key? key}) : super(key: key);
  final String _title;
  final String _url;

  @override
  State<StatefulWidget> createState() => _FlutterInappwebviewState();
}

class _FlutterInappwebviewState extends State<FlutterInappwebview> {
  late PullToRefreshController? _pullToRefreshController;

  @override
  void initState() {
    _pullToRefreshController = kIsWeb
        ? null
        : PullToRefreshController(
            settings: PullToRefreshSettings(color: Colors.blue, backgroundColor: Colors.green),
            onRefresh: () => debugPrint("PullToRefreshController onRefresh"),
          );
    super.initState();
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
      child: InAppWebView(
          initialUrlRequest: URLRequest(url: WebUri(widget._url)),
          initialSettings: InAppWebViewSettings(),
          pullToRefreshController: _pullToRefreshController,
          onLoadStart: (controller, url) => debugPrint("InAppWebView onLoadStart. url = $url"),
          onLoadStop: (controller, url) {
            _pullToRefreshController?.endRefreshing();
            debugPrint("InAppWebView onLoadStop. url = $url");
          },
          onReceivedError: (controller, request, error) {
            _pullToRefreshController?.endRefreshing();
            debugPrint("InAppWebView onReceivedError. url = ${request.url}");
          },
          onProgressChanged: (controller, progress) {
            if (progress == 100) {
              _pullToRefreshController?.endRefreshing();
            }
            debugPrint("InAppWebView onProgressChanged. progress = $progress");
          },
          shouldOverrideUrlLoading: (controller, navigationAction) async {
            WebUri? uri = navigationAction.request.url;
            if (uri == null) {
              return NavigationActionPolicy.CANCEL;
            }
            if (!["http", "https", "file", "chrome", "data", "javascript", "about"].contains(uri.scheme)) {
              if (await canLaunchUrl(uri)) {
                await launchUrl(
                  uri,
                );
              }
            }
            return NavigationActionPolicy.CANCEL;
          }),
    );
  }
}
