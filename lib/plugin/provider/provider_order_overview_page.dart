import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/standard_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';
import 'package:flutter_demo/plugin/provider/entity/order_record_info.dart';
import 'package:flutter_demo/plugin/provider/entity/order_record_overview.dart';
import 'package:flutter_demo/plugin/provider/order_common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProviderOrderOverviewPage extends StatefulWidget {
  const ProviderOrderOverviewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProviderOrderOverviewPageState();
}

class _ProviderOrderOverviewPageState extends State<ProviderOrderOverviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'Provider'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return ListView(
      children: [
        _getTitle("收支总览"),
        // Selecor使用说明
        // Selector<OrderRecordOverview, Tuple2<double, int>>(
        //   selector: (_, order) => Tuple2(order.incomeSum, order.incomeCnt),
        //   builder: (context, tuple, child) => Text("收入金额: ${tuple.item1} 收入笔数:  ${tuple.item2}"),
        // ),
        // Selector<OrderRecordOverview, Tuple2<double, int>>(
        //   selector: (_, order) => Tuple2(order.expenditureSum, order.expenditureCnt),
        //   builder: (context, tuple, child) => Text("支出金额: ${tuple.item1} 支出笔数:  ${tuple.item2}"),
        // ),
        _getRecordStatistics(),
        _getTitle("收支明细"),
        _getRecordList(),
        _getAddRecordButton(context),
      ],
    );
  }

  Widget _getTitle(String title) {
    return _getPadding(Container(
      height: 30.h,
      alignment: Alignment.centerLeft,
      child: Text(title, style: size22W600()),
    ));
  }

  Widget _getRecordList() {
    List<OrderRecordInfo> records = context.select((OrderRecordOverview order) => order.records);
    return Container(
      padding: EdgeInsets.only(left: 20.w),
      height: 0.6.sh,
      child: ListView(
        children: List.generate(
          records.length,
          (index) => Row(
            children: [
              _getListViewTitle("类型:   ${orderTypeTextMap[records[index].type] ?? "其他"}", color: orderTypeColorMap[records[index].type]),
              _getListViewTitle("金额:   ${records[index].amount.toString()}", color: orderTypeColorMap[records[index].type]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getRecordStatistics() {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: {
          0: FixedColumnWidth(0.2.sw),
          1: FixedColumnWidth(0.3.sw),
          2: FixedColumnWidth(0.2.sw),
          3: FixedColumnWidth(0.1.sw),
        },
        children: [
          TableRow(
            children: [
              _getTableTitle("收入金额:"),
              _getTableContent("￥ ${getPriceString(context.select((OrderRecordOverview order) => order.incomeSum))}", color: Colors.green),
              _getTableTitle("收入笔数:"),
              _getTableContent(context.select((OrderRecordOverview order) => order.incomeCnt).toString(), color: Colors.green),
            ],
          ),
          TableRow(
            children: [
              _getTableTitle("支出金额:"),
              _getTableContent("￥ ${getPriceString(context.select((OrderRecordOverview order) => order.expenditureSum))}", color: Colors.red),
              _getTableTitle("支出笔数:"),
              _getTableContent(context.select((OrderRecordOverview order) => order.expenditureCnt).toString(), color: Colors.red),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getListViewTitle(String text, {Color? color}) {
    return Container(
      height: 0.05.sh,
      width: 0.4.sw,
      alignment: Alignment.centerLeft,
      child: Text(text, style: size16W500(color: color)),
    );
  }

  Widget _getTableTitle(String text) {
    return Container(
      height: 0.05.sh,
      alignment: Alignment.centerLeft,
      child: Text(text, style: size16W500()),
    );
  }

  Widget _getTableContent(String text, {Color? color}) {
    return Container(
      height: 0.05.sh,
      alignment: Alignment.centerLeft,
      child: Text(text, style: size18W600(color: color)),
    );
  }

  StandardTextButton _getAddRecordButton(BuildContext context) {
    TextEditingController? amountController = TextEditingController();
    int type = 0;
    return StandardTextButton("新增", () {
      Future<OrderRecordInfo?> res = showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.white,
          content: SizedBox(
            height: 0.2.sh,
            child: Column(
              children: [
                _getPadding(
                  StandardDropdownButtonFormField(orderTypeTextMap, (dynamic value) {
                    type = value ?? 0;
                  }),
                ),
                _getPadding(StandardTextField(amountController, hintText: "请输入金额", keyboardType: TextInputType.number)),
              ],
            ),
          ),
          actions: [
            _getPadding(
              StandardTextButton("取消", () => Navigator.pop(context)),
            ),
            _getPadding(
              StandardTextButton("确认", () {
                Navigator.pop(context, OrderRecordInfo(double.parse(amountController.text), type));
              }),
            )
          ],
          actionsAlignment: MainAxisAlignment.center,
        ),
      );
      res.then((value) {
        if (value != null) {
          context.read<OrderRecordOverview>().addRecord(value);
        }
      });
    });
  }

  Padding _getPadding(Widget child) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: child,
    );
  }
}
