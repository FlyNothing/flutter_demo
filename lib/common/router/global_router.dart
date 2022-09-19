import 'package:flutter/material.dart';
import 'package:flutter_demo/base/router/router_demo_page.dart';
import 'package:flutter_demo/common/httperror/loading_page.dart';
import 'package:flutter_demo/common/httperror/not_found_page.dart';
import 'package:flutter_demo/common/httperror/service_unavailable_page.dart';

class GlobalRouter {
  static Map<String, Function> routes = {
    RouterDemoPage.routeName: (context) => const RouterDemoPage(),
    HttpLoadingPage.routeName: (context) => const HttpLoadingPage(),
    HttpNotFoundPage.routeName: (context) => const HttpNotFoundPage(),
    HttpServiceUnavailablePage.routeName: (context) => const HttpServiceUnavailablePage(),
  };

  var onGenerateRoute = (RouteSettings settings) {
    String? name = settings.name;
    if (name != null) {
      List<String> nameList = name.split("?");
      name = nameList[0];
      final Function? pageBuilder = routes[name];
      if (pageBuilder != null) {
        // settings.arguments不为空，直接路由
        if (settings.arguments != null) {
          return MaterialPageRoute(builder: (context) => pageBuilder(context), settings: settings);
        }
        // settings.arguments为空，尝试从name中获取url参数
        return MaterialPageRoute(builder: (context) => pageBuilder(context), settings: handleArguments(nameList, settings) ?? settings);
      }
    }
    return MaterialPageRoute(builder: (context) => const HttpNotFoundPage());
  };

  /// Url中参数组装覆盖RouteSettings的参数arguments
  static RouteSettings? handleArguments(List<String> nameList, RouteSettings settings) {
    if (nameList.length <= 1) return null;
    Map paramMap = {};
    nameList[1].split("&").forEach((param) {
      List paramList = param.split("=");
      paramMap[paramList[0]] = paramList[1];
    });
    return settings.copyWith(arguments: paramMap);
  }
}
