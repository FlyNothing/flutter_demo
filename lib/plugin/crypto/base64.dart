import 'dart:convert';

String enBase64(String input) {
  return base64Encode(utf8.encode(input));
}

String deBase64(String input) {
  return utf8.decode(base64Decode(input));
}

void main(List<String> args) {
  String input = "this is a test";
  String en = enBase64(input);
  String de = deBase64(en);
  print("base64编码: ${en}        base64解码: ${de}");
}
