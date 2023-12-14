import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';

const _usage = '参数不正确。 参数一:<加密方式: md5|sha1|sha256|sha512>  参数二：<加密数据>';

Future<void> main(List<String> args) async {
  if (args.length != 2) {
    print(_usage);
    exitCode = 64; // Command was used incorrectly.
    return;
  }

  Hash hasher;

  switch (args[0]) {
    case 'md5':
      hasher = md5;
      break;
    case 'sha1':
      hasher = sha1;
      break;
    case 'sha256':
      hasher = sha256;
      break;
    case 'sha512':
      hasher = sha512;
      break;
    default:
      print(_usage);
      exitCode = 64; // Command was used incorrectly.
      return;
  }

  String text = args[1];
  Digest digest = hasher.convert(utf8.encode(text));
  String value = digest.toString();
  print(value);
}
