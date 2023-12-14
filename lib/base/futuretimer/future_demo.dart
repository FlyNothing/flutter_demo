// ignore_for_file: avoid_print, invalid_return_type_for_catch_error
import 'dart:async';
import 'dart:math';

Future<String> getAndy() async {
  await Future.delayed(const Duration(milliseconds: 500));
  print("getAndy");
  return "getAndy";
}

Future<String> getNovak() async {
  await Future.delayed(const Duration(milliseconds: 1000));
  print("getNovak");
  return "getNovak";
}

Future<String> getRafa() async {
  await Future.delayed(const Duration(milliseconds: 1500));
  print("getRafa");
  return "getRafa";
}

class MyExcepiton {
  final int code;
  final String msg;

  MyExcepiton(this.code, this.msg);

  @override
  String toString() {
    return "code=$code msg=$msg";
  }
}

Future<bool> isOK() async {
  Random random = Random(DateTime.now().millisecondsSinceEpoch);
  int delayed = random.nextInt(1000);
  await Future.delayed(Duration(milliseconds: delayed));
  if (delayed % 10 == 1) {
    print("isOK:false");
    return false;
  }
  print("isOK:true");
  return true;
}

/*----------静态方法&工厂方法----------*/
Future<int> randomEven() async {
  Random random = Random(DateTime.now().millisecondsSinceEpoch);
  int resInt = random.nextInt(1000);
  if (resInt % 2 == 1) {
    throw Exception("random value isn't a even");
  }
  return resInt;
}

testFutureAny() {
  Future f = Future.any([getNovak(), getRafa(), getAndy()]);
  f.then((value) => print("Future.any = $value"));
}

testFutureDelayed() {
  Future.delayed(const Duration(milliseconds: 3000), () => print("delayed1"));
  Future.delayed(const Duration(milliseconds: 2000), () => print("delayed2"));
  Future.delayed(const Duration(milliseconds: 1000), () => print("delayed3"));
}

testFutureDoWhile() {
  Future.doWhile(() => isOK());
}

testFutureError() {
  Future<MyExcepiton> f = Future.error(MyExcepiton(500, "服务不可用"));
  f.then((value) => value.toString());
}

testFutureForEach() {
  Future.forEach([getNovak(), getRafa(), getAndy()], (element) {
    element.then((value) => print("forEach: $value"));
  });
}

testFutureMicrotask() async {
  Future(() => print("EventQueue1"));
  Future.microtask(() => print("Microtask1"));
  print("Main1");
  Future(() {
    print("EventQueue2-1");
    Future(() => print("EventQueue2-1-1"));
    Future.microtask(() => print("Microtask2-1"));
    Future(() => print("EventQueue2-1-2"));
    print("EventQueue2-2");
    Future.microtask(() => print("Microtask2-2"));
    print("EventQueue2-3");
  });
  Future.microtask(() => print("Microtask2"));
  print("Main2");
  Future(() => print("EventQueue3"));
  Future.microtask(() => print("Microtask3"));
  print("Main3");
}

testFutureSync() {
  print("Main1");
  Future(() => print("EventQueue1"));
  Future.sync(() => print("EventQueue2"));
  Future.sync(() => "EventQueue3").then((value) => print(value));
  print("Main2");
}

testFutureValue() {
  print("Main1");
  Future(() => print("EventQueue1"));
  Future.value("EventQueue-Value1").then((str) => print(str));
  Future.value(() => print("EventQueue-Value2")).then((func) => func());
  Future.sync(() => print("EventQueue2"));
  print("Main2");
}

testFutureWait() {
  Future f = Future.wait([getNovak(), getRafa(), getAndy()]);
  f.then((value) => print("Future.wait = $value"));
}

void main(List<String> args) {
  testWhenComplete();
}

/*----------对象方法----------*/
testAsStream() {
  Future f = Future.wait([getNovak(), getRafa(), getAndy()]);
  f.asStream().last.then((value) => print(value));
}

testCatchError() {
  randomEven().then((value) => print(value)).catchError((error, stackTrace) => print(error));
  randomEven().then((value) {
    if (value > 500) {
      throw Exception("value is too big");
    }
    print(value);
  }).catchError((error, stackTrace) => print(error));
}

testIgnore() {
  Future f = randomEven().then((value) => print(value));
  f.ignore();
}

testOnError() {
  randomEven().then((value) => print("then finished")).onError((error, stackTrace) => print(error));
  randomEven().then((value) {
    if (value > 500) {
      throw Exception("value is too big");
    }
    print(value);
  }).onError((error, stackTrace) {
    print(error);
  });
}

testTimeout() {
  Future f = getNovak();
  f.timeout(
    const Duration(
      milliseconds: 500,
    ),
    onTimeout: () {
      return Future<String>.value("getNovak timeout");
    },
  ).then((value) => print("timeout finished: $value"));
}

testToString() {
  Future f = Future.value("future");
  print(f.toString());
}

testWhenComplete() {
  Future f = Future.delayed(const Duration(milliseconds: 1000), () => print("future"));
  f.whenComplete(() => print("future finished"));
}
