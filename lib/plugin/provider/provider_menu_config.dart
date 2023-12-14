import 'package:flutter_demo/common/vo/base_menu_vo.dart';
import 'package:flutter_demo/plugin/provider/entity/order_record_overview.dart';
import 'package:flutter_demo/plugin/provider/provider_order_overview_page.dart';
import 'package:flutter_demo/plugin/provider/provider_page.dart';
import 'package:provider/provider.dart';

List<BaseMenuVO> providerMenuList = [
  BaseMenuVO("Provider", const ProviderPage()),
  BaseMenuVO(
    "Provider.Order",
    ListenableProvider<OrderRecordOverview>(
      create: (_) => OrderRecordOverview(),
      child: const ProviderOrderOverviewPage(),
    ),
  ),
];
