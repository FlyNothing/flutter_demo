import 'dart:async';
import 'dart:io';

import 'package:crypto/crypto.dart';

const _usage = '参数不正确。 参数一:<加密方式: md5|sha1|sha256|sha512>  参数二：<文件路径>';

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

  var filename = args[1];
  var input = File(filename);

  if (!input.existsSync()) {
    print('File "$filename" does not exist.');
    exitCode = 66; // An input file did not exist or was not readable.
    return;
  }

  var value = await hasher.bind(input.openRead()).first;
  print(value);
}
