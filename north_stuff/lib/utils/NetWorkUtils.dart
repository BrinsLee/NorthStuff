import 'dart:async';
import 'package:dio/dio.dart';

class NetWorkUtils {
  static Future<String> get(String url, {Map<String, String> params}) async {
    if (params != null && params.isNotEmpty) {
      StringBuffer sb = StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key=$value&");
      });
      String paramsStr = sb.toString();
      paramsStr = paramsStr.substring(0, paramsStr.length - 1);
      url += paramsStr;
    }
    Dio dio = new Dio();
    Response response = await dio.get(url);
    print(response.data);
    return response.data;
  }
}
