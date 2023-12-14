import 'package:flutter/widgets.dart';
import 'package:flutter_demo/plugin/gorouter/go_origin_page.dart';
import 'package:flutter_demo/plugin/gorouter/go_router2_page.dart';
import 'package:flutter_demo/plugin/gorouter/go_router_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter goRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const GoOriginPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'router1',
          builder: (BuildContext context, GoRouterState state) {
            return const GoRouterPage();
          },
        ),
        GoRoute(
          path: 'router2',
          builder: (BuildContext context, GoRouterState state) {
            return const GoRouter2Page();
          },
        ),
      ],
    ),
  ],
);
