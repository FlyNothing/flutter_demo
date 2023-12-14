// ignore_for_file: avoid_print

import 'package:flutter_demo/base/prototype/demo.dart';
import 'package:flutter_demo/base/prototype/prototype_demo.dart';

void main(List<String> args) {
  List<int> list = [1, 2, 3];
  Demo p1 = Demo(list);
  Demo p2 = Demo(list);
  print("p1 == p2:  ${p1 == p2}        p1.value == p2.value:  ${p1.getValue == p2.getValue}");

  PrototypeDemo pd1 = PrototypeDemo();
  PrototypeDemo pd2 = PrototypeDemo();
  pd1.addValue(1);
  print("PrototypeDemo.value = ${pd2.getValue}");
  pd2.addValue(2);
  print("PrototypeDemo.value = ${pd1.getValue}");
  print("pd1 == pd2:  ${pd1 == pd2}        pd1.value == pd2.value:  ${pd1.getValue == pd2.getValue}");
}
