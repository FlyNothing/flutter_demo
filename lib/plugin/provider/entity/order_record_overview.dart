import 'package:flutter/material.dart';
import 'package:flutter_demo/plugin/provider/entity/order_record_info.dart';
import 'package:flutter_demo/plugin/provider/entity/order_type_enum.dart';

class OrderRecordOverview extends ChangeNotifier {
  double _incomeSum = 0; // 收入金额
  double _expenditureSum = 0; // 支出金额
  int _incomeCnt = 0; // 收入笔数
  int _expenditureCnt = 0; // 支出笔数

  final List<OrderRecordInfo> _records = List.empty(growable: true);

  double get incomeSum => _incomeSum;
  double get expenditureSum => _expenditureSum;
  int get incomeCnt => _incomeCnt;
  int get expenditureCnt => _expenditureCnt;
  List<OrderRecordInfo> get records => _records;

  void addRecord(OrderRecordInfo record) {
    if (record.type == OrderTypeEnum.income.index) {
      _incomeSum += record.amount;
      _incomeCnt += 1;
    } else if (record.type == OrderTypeEnum.expenditure.index) {
      _expenditureSum += record.amount;
      _expenditureCnt += 1;
    }
    _records.add(record);
    notifyListeners();
    debugPrint("----------OrderRecordOverview=$_incomeSum $_expenditureSum $_incomeCnt $_expenditureCnt ${_records.length}");
  }
}
