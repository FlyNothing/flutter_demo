import 'package:flutter/material.dart';
import 'package:flutter_demo/base/navigator/1.0/router2_page.dart';
import 'package:flutter_demo/base/navigator/1.0/router_page.dart';
import 'package:flutter_demo/common/page/httperror/loading_page.dart';
import 'package:flutter_demo/common/page/httperror/not_found_page.dart';
import 'package:flutter_demo/common/page/httperror/service_unavailable_page.dart';

class GlobalRouter {
  static Map<String, Function> routes = {
    RouterPage.routeName: (context) => const RouterPage(),
    Router2Page.routeName: (context) => const Router2Page(),
    HttpLoadingPage.routeName: (context) => const HttpLoadingPage(),
    HttpNotFoundPage.routeName: (context) => const HttpNotFoundPage(),
    HttpServiceUnavailablePage.routeName: (context) => const HttpServiceUnavailablePage(),
  };

  var onGenerateRoute = (RouteSettings settings) {
    String? path = settings.name;
    if (path != null) {
      List<String> pathList = path.split("?");
      String url = pathList[0];
      final Function? pageBuilder = routes[url];
      if (pageBuilder != null) {
        // settings.arguments不为空，直接路由
        if (settings.arguments != null) {
          return MaterialPageRoute(builder: (context) => pageBuilder(context), settings: settings);
        }
        // settings.arguments为空，尝试从name中获取url参数
        return MaterialPageRoute(builder: (context) => pageBuilder(context), settings: handleArguments(path) ?? settings);
      }
    }
    return MaterialPageRoute(builder: (context) => const HttpNotFoundPage());
  };

  /// Url中参数组装覆盖RouteSettings的参数arguments
  static RouteSettings? handleArguments(String name) {
    List<String> nameList = name.split("?");
    if (nameList.length <= 1) return null;
    Map paramMap = {};
    nameList[1].split("&").forEach((param) {
      List paramList = param.split("=");
      paramMap[paramList[0]] = paramList[1];
    });
    return RouteSettings(name: name, arguments: paramMap);
  }
}
