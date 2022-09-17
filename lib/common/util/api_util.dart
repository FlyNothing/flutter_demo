import 'package:dio/dio.dart';
import 'package:flutter_demo/common/vo/base_resp_vo.dart';

Future<BaseRespVo> getTest() async {
  var api = 'http://localhost:8080/test';
  Response resp;
  BaseRespVo respVO;
  try {
    resp = await Dio().put(
      api,
    );
  } catch (e) {
    respVO = BaseRespVo(code: 503);
    return respVO;
  }
  respVO = baseRespVoFromJson(resp.toString());
  return respVO;
}
