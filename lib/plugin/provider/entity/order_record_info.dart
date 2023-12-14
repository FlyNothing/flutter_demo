class OrderRecordInfo {
  final double _amount; // 金额
  final int _type; // 收支类型

  OrderRecordInfo(this._amount, this._type);

  int get type => _type;
  double get amount => _amount;
}
