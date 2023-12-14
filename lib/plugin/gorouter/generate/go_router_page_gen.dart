import 'package:flutter/widgets.dart';
import 'package:flutter_demo/plugin/gorouter/go_origin_page.dart';
import 'package:flutter_demo/plugin/gorouter/go_router2_page.dart';
import 'package:flutter_demo/plugin/gorouter/go_router_page.dart';
import 'package:go_router/go_router.dart';

part 'go_router_page_gen.g.dart';

@TypedGoRoute<GoOriginPageRoute>(path: '/', routes: [
  TypedGoRoute<GoRouterPageRoute>(
    path: 'router1',
  ),
  TypedGoRoute<GoRouter2PageRoute>(
    path: 'router2',
  )
])
@immutable
class GoOriginPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const GoOriginPage();
  }
}

@immutable
class GoRouterPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const GoRouterPage();
  }
}

@immutable
class GoRouter2PageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const GoRouter2Page();
  }
}
