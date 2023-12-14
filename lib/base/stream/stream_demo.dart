testStructure() {
  Stream<int> s1 = Stream.fromFuture(Future.value(123));
  s1.listen(
    (data) => print("onData1: $data"),
    onDone: () => print("onDone1"),
    onError: (err) => print("onError1: $err"),
  );

  Stream<int> s2 = Stream.fromFutures([Future.value(123), Future.value(456)]);
  s2.listen(
    (data) => print("onData2: $data"),
    onDone: () => print("onDone2"),
    onError: (err) => print("onError2: $err"),
  );

  Stream<int> s3 = Stream.fromIterable([123, 456]);
  s3.listen(
    (data) => print("onData3: $data"),
    onDone: () => print("onDone3"),
    onError: (err) => print("onError3: $err"),
  );

  Stream<int> s4 = Stream.periodic(const Duration(seconds: 1), (i) => i).take(10);
  s4.listen(
    (data) => print("onData4: $data"),
    onDone: () => print("onDone4"),
    onError: (err) => print("onError4: $err"),
  );
}

testGet() async {
  Stream<int> s = Stream.fromFutures([Future.value(123), Future.value(456)]);
  print("s.isBroadcast: ${s.isBroadcast}");
  print("s.runtimeType: ${s.runtimeType}");
  print("s.hashCode: ${s.hashCode}");

  print("s.isEmpty: ${await s.isEmpty}"); // 监听流，非广播流不能重用流
  // print("s.first: ${await s.first}"); // 监听流，非广播流不能重用流
  // print("s.last: ${await s.last}"); // 监听流，非广播流不能重用流
  // print("s.length: ${await s.length}"); // 监听流，非广播流不能重用流
  // print("s.single: ${await s.single}"); // 监听流，非广播流不能重用流
}

testTake() {
  Stream<int> s1 = Stream.fromFutures([Future.value(123), Future.value(456)]).take(1);
  s1.listen((data) => print("onData: $data"));

  Stream<int> s2 = Stream.periodic(const Duration(seconds: 1), (i) => i).take(5);
  s2.listen((data) => print("onData2: $data"));
}

testTakeWhile() {
  Stream<int> s = Stream.fromFutures([Future.value(123), Future.value(456)]).takeWhile((data) => data < 200);
  s.listen((data) => print("onData1: $data"));

  Stream<int> s2 = Stream.periodic(const Duration(seconds: 1), (i) => i).takeWhile((data) => data < 5);
  s2.listen((data) => print("onData2: $data"));
}

testWhere() {
  Stream<int> s = Stream.fromFutures([Future.value(123), Future.value(456)]).where((data) => data > 200);
  s.listen((data) => print("onData: $data"));

  Stream<int> s2 = Stream.periodic(const Duration(seconds: 1), (i) => i).take(10).where((data) => data % 2 == 0 && data < 10);
  s2.listen((data) => print("onData2: $data"));
}

testDistinct() {
  Stream<int> s = Stream.fromFutures([Future.value(123), Future.value(123), Future.value(456)]).distinct();
  s.listen((data) => print("onData: $data"));

  Stream<int> s2 = Stream.periodic(const Duration(seconds: 1), (i) => i ~/ 2).take(10).distinct();
  s2.listen((data) => print("onData2: $data"));
}

testSkip() {
  Stream<int> s = Stream.fromFutures([Future.value(123), Future.value(456)]).skip(1);
  s.listen((data) => print("onData: $data"));

  Stream<int> s2 = Stream.periodic(const Duration(seconds: 1), (i) => i).take(10).skip(1);
  s2.listen((data) => print("onData2: $data"));
}

testSkipWhile() {
  Stream<int> s = Stream.fromFutures([Future.value(110), Future.value(130), Future.value(160), Future.value(210), Future.value(230), Future.value(260)])
      .skipWhile((data) => data < 200);
  s.listen((data) => print("onData: $data"));

  Stream<int> s2 = Stream.periodic(const Duration(seconds: 1), (i) => i).take(10).skipWhile((data) => data < 5);
  s2.listen((data) => print("onData2: $data"));
}

testToList() async {
  Stream<int> s = Stream.fromFutures([Future.value(123), Future.value(456)]);
  List<int> list = await s.toList();
  print(list.join(","));

  Stream<int> s2 = Stream.periodic(const Duration(seconds: 1), (i) => i).take(10);
  List<int> list2 = await s2.toList();
  print(list2.join(","));
}

testToSet() async {
  Stream<int> s = Stream.fromFutures([Future.value(123), Future.value(456), Future.value(123), Future.value(456), Future.value(123), Future.value(456)]);
  Set<int> list = await s.toSet();
  print(list.join(","));

  Stream<int> s2 = Stream.periodic(const Duration(seconds: 1), (i) => i ~/ 3).take(10);
  Set<int> list2 = await s2.toSet();
  print(list2.join(","));
}

testForEach() {
  Stream<int> s = Stream.fromFutures([Future.value(123), Future.value(456)]);
  s.forEach((data) => print("s: $data"));

  Stream<int> s2 = Stream.periodic(const Duration(seconds: 1), (i) => i).take(10);
  s2.forEach((data) => print("s1: $data"));
}

void main(List<String> args) {
  // testStructure();
  // testGet();
  // testTake();
  // testTakeWhile();
  // testWhere();
  // testDistinct();
  // testSkip();
  // testSkipWhile();
  // testToList();
  // testToSet();
  testForEach();
}
