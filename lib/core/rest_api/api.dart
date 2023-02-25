import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:recycle_app/core/constants/endpoint_constant.dart';
import 'package:recycle_app/core/constants/key_constant.dart';
import 'package:recycle_app/core/rest_api/dio_interceptor.dart';
import 'package:recycle_app/services/share_preferences_service.dart';

class Api {
  Api._privateConstructor();

  final String _apiUrl = UrlConstant.API_URL;

  static final Api apiProvider = Api._privateConstructor();
  final _preferences = PreferencesService();
  final storage = FlutterSecureStorage();

  final dio = Dio(
    BaseOptions(
      baseUrl: UrlConstant.API_URL,
    )
  )..interceptors.add(Logging());

  _getUrlEndpoint(String endPoint) {
    final url = '$_apiUrl/$endPoint';
    return url;
  }

  dynamic get(String url) async {
    var requestHeaders = <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${await storage.read(key: KeyConstant.KEY_TOKEN)}"
    };
    try {
      final response = await dio.get(_getUrlEndpoint(url),
          options: Options(sendTimeout: 2000, headers: requestHeaders));
      return response;
    } on DioError catch (e) {
      print(e.message);
      throw e.error;
    }
  }

  dynamic post(String url, {var body, var isNotToken, var isFormData}) async {
    bool isToken = isNotToken ?? true;
    var requestHeaders = <String, String>{
      "Content-Type": isFormData != null ? "multipart/form-data": "application/json",
      "Accept": '*/*',
      if (isToken) "Authorization": "Bearer ${await storage.read(key: KeyConstant.KEY_TOKEN)}"
    };
    try {
      final response = await dio.post(_getUrlEndpoint(url),
          data: body, options: Options(headers: requestHeaders));
      return response;
    } on DioError catch (e) {
      throw e.error;
    }
  }

  dynamic put(String url, {var body}) async {
    var requestHeaders = <String, String>{
      "Content-Type": "application/json",
      "Accept": '*/*',
      "Authorization": "Bearer ${await storage.read(key: KeyConstant.KEY_TOKEN)}"
    };
    try {
      final response = await dio.put(_getUrlEndpoint(url),
          data: body, options: Options(headers: requestHeaders));
      return response;
    } on DioError catch (e) {
      throw e.error;
    }
  }

  dynamic postFormData(String url, {var body}) async {
    var requestHeaders = <String, String>{
      "Accept": '*/*',
      "Authorization": "Bearer ${await storage.read(key: KeyConstant.KEY_TOKEN)}"
    };

    try {
      final response = await Dio().post(_getUrlEndpoint(url),
          data: FormData.fromMap(body),
          options: Options(headers: requestHeaders));
      return response;
    } on DioError catch (e) {
      throw e.error;
    }
  }
}
