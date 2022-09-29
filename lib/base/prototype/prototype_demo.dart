class PrototypeDemo {
  final List<int> _value;
  // 1 构造方法私有化
  PrototypeDemo._internal(this._value);
  // 2 生成private实例
  static final PrototypeDemo _instance = PrototypeDemo._internal([]);
  // 3 提供工厂方法
  factory PrototypeDemo() => _instance;
  // 4 提供对外的方法
  List<int> get getValue => _value;
  addValue(int add) => _value.add(add);
}
