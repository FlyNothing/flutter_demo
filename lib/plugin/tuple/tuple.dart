// ignore_for_file: avoid_print

import 'package:tuple/tuple.dart';

void main(List<String> args) {
  Tuple2<int, String> tuple2 = const Tuple2(2, "Test");
  print("item1 = ${tuple2.item1}, item2 = ${tuple2.item2}");

  tuple2 = tuple2.withItem1(3);
  print("item1 = ${tuple2.item1}, item2 = ${tuple2.item2}");

  tuple2 = tuple2.withItem2("Pro");
  print("item1 = ${tuple2.item1}, item2 = ${tuple2.item2}");
}
