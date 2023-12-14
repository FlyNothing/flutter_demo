// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'go_router_page_gen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $goOriginPageRoute,
    ];

GoRoute get $goOriginPageRoute => GoRouteData.$route(
      path: '/',
      factory: $GoOriginPageRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'router1',
          factory: $GoRouterPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'router2',
          factory: $GoRouter2PageRouteExtension._fromState,
        ),
      ],
    );

extension $GoOriginPageRouteExtension on GoOriginPageRoute {
  static GoOriginPageRoute _fromState(GoRouterState state) =>
      GoOriginPageRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $GoRouterPageRouteExtension on GoRouterPageRoute {
  static GoRouterPageRoute _fromState(GoRouterState state) =>
      GoRouterPageRoute();

  String get location => GoRouteData.$location(
        '/router1',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $GoRouter2PageRouteExtension on GoRouter2PageRoute {
  static GoRouter2PageRoute _fromState(GoRouterState state) =>
      GoRouter2PageRoute();

  String get location => GoRouteData.$location(
        '/router2',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}
