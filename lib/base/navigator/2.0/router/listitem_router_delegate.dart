import 'package:flutter/material.dart';
import 'package:flutter_demo/base/navigator/2.0/router/item_page.dart';
import 'package:flutter_demo/base/navigator/2.0/router/list_page.dart';
import 'package:flutter_demo/base/navigator/2.0/router/listitem_router_configuration.dart';

class ListitemRouterDelegate extends RouterDelegate<ListitemRouterConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<ListitemRouterConfiguration> {
  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  static ListitemRouterDelegate of(BuildContext context) {
    final delegate = Router.of(context).routerDelegate;
    assert(delegate is ListitemRouterDelegate, 'Delegate type must match');
    return delegate as ListitemRouterDelegate;
  }

  final List<MaterialPage> _pages = [
    const MaterialPage(key: ValueKey(ListPage.valueKey), name: ListPage.valueKey, child: ListPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: _pages,
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        return true;
      },
    );
  }

  void push(MaterialPage page) {
    _pages.add(page);
    notifyListeners();
  }

  void pop() {
    if (_pages.isNotEmpty) {
      _pages.remove(_pages.last);
    }
    notifyListeners();
  }

  ListitemRouterConfiguration _configuration = ListitemRouterConfiguration("/list", {});

  @override
  Future<void> setNewRoutePath(ListitemRouterConfiguration configuration) async {
    _configuration = configuration;
    if (configuration.location == ItemPage.valueKey) {
      _pages.add(MaterialPage(key: const ValueKey(ItemPage.valueKey), name: ItemPage.valueKey, child: ItemPage(configuration.param["item"])));
    }
    debugPrint("--------------------ListitemRouterDelegate.setNewRoutePath configuration = ${configuration.location}");
  }

  @override
  ListitemRouterConfiguration? get currentConfiguration {
    debugPrint("--------------------ListitemRouterDelegate.currentConfiguration configuration = ${super.currentConfiguration}");
    return _configuration;
  }
}
