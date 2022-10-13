import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

void main() {
  v1Test();
}

uuidTest() {
  var uuid = const Uuid();

  // Generates a time-based version 1 UUID
  var v1 = uuid.v1();

  // options详情可以查看https://www.ietf.org/rfc/rfc4122.txt
  var v1Exact = uuid.v1(options: {
    'node': [0x01, 0x23, 0x45, 0x67, 0x89, 0xab],
    'clockSeq': 0x1234,
    'mSecs': DateTime(2022, 1, 1).millisecondsSinceEpoch,
    'nSecs': 1111
  });
  // Generates a mathRNG version 4 UUID
  var v4 = uuid.v4();

  // Generate a v4 (crypto-random) id
  var v4Crypto = uuid.v4(options: {'rng': UuidUtil.cryptoRNG});

  // Generates a namespace & name-based version 5 UUID
  var v5 = uuid.v5(Uuid.NAMESPACE_URL, 'this is a test string');

  print(v1);
  print(v1Exact);
  print(v4);
  print(v4Crypto);
  print(v5);
}

v1Test() {
  var uuid = const Uuid();
  // print(uuid.v1());
  DateTime now = DateTime(2022, 10, 13, 15, 01, 31, 147, 510);
  print(now.difference(DateTime(1582, 10, 15, 0, 0, 0))); // 此处计算的是UTC时间now到1582-10-15的时间间隔
  print(uuid.v1(options: {
    'mSecs': now.millisecondsSinceEpoch + 3600 * 8 * 1000, // 本地时间生成的时间戳【毫秒值】，需要换算成now当时对应UTC时区的时间，在获取时间戳
    'nSecs': 510 * 10, // 微秒+纳秒值除以100纳秒 = 4位
    'clockSeq': 0x4234, // 取后14位，前面两位补10
    'node': [0x00, 0x11, 0x22, 0x33, 0x44, 0x55], // mac地址
  }));
}
