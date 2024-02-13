import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class DioService {
  static late final BaseOptions _baseOptions;
  static late final Dio _dio;


// https://65ca04633b05d29307df7af2.mockapi.io/user

  static const Duration connectTimeout = Duration(seconds: 5);
  static const Duration receiveTimeout = Duration(seconds: 5);
  static const String BASEURL = "https://65ca04633b05d29307df7af2.mockapi.io";
  static const String getApiProduct = "/user";
  static const String getApiUser = "/auth/login";
  static const String getMockApi = "";
  static const Map<String, String> headers = {};

  static Dio init() {
    _baseOptions = BaseOptions(
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        baseUrl: BASEURL,
        headers: headers,
        validateStatus: (statusCode) => statusCode! <= 205);
    _dio = Dio(_baseOptions);
    return _dio;
  }

  static Future<String?> get(String api, ) async {
    try {
      Response response = await init().get(api);
      return jsonEncode(response.data);
    } on DioException catch (e) {
      log(
        e.error.toString(),
      );
      return null;
    }
  }

  static Future request() async {
    final response = await init().request(getApiProduct);
    
  }
}
