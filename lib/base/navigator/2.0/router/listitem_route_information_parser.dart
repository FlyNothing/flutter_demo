import 'package:flutter/material.dart';
import 'package:flutter_demo/base/navigator/2.0/router/listitem_router_configuration.dart';

/// 主要用于web
/// 可以将RouteInformation解析为自定义的对象
class ListitemRouteInformationParser extends RouteInformationParser<ListitemRouterConfiguration> {
  @override
  Future<ListitemRouterConfiguration> parseRouteInformation(RouteInformation routeInformation) async {
    debugPrint("--------------------ListitemRouteInformationParser.parseRouteInformation location = ${routeInformation.location}");
    return ListitemRouterConfiguration(routeInformation.location ?? "/list", {});
  }

  @override
  RouteInformation? restoreRouteInformation(ListitemRouterConfiguration configuration) {
    debugPrint("--------------------ListitemRouteInformationParser.restoreRouteInformation location = ${configuration.location}");
    return RouteInformation(location: configuration.location);
  }
}
