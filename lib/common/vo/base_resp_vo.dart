import 'dart:convert';

BaseRespVo initBaseRespVo({required int code}) => BaseRespVo(code: code);

BaseRespVo baseRespVoFromJson(String str) => BaseRespVo.fromJson(json.decode(str));

String baseRespVoToJson(BaseRespVo data) => json.encode(data.toJson());

class BaseRespVo {
  BaseRespVo({
    required this.code,
    this.msg,
  });

  int code;
  String? msg;

  factory BaseRespVo.fromJson(Map<String, dynamic> json) => BaseRespVo(
        code: json["code"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
      };
}
