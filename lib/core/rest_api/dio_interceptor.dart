import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shop_app/helper/ToastUtils.dart';
import 'package:shop_app/screens/login/login2_screen.dart';
import 'package:shop_app/screens/login/login_screen.dart';

import '../../main.dart';

class Logging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    if (response.statusCode == 403) {
      navigatorKey.currentState!.pushNamedAndRemoveUntil(
          LoginScreen.routeName, (Route<dynamic> route) => false);
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    print('ERROR: ${err.response!.data['message']}');
    if (err.response?.statusCode != 500) {
      showToastWithOutContext(message: err.response!.data['message']);
    }else {
      showToastWithOutContext(message: 'Lỗi hệ thống!!');
    }
    if (err.response?.statusCode == 403) {
      FlutterSecureStorage().deleteAll();
      navigatorKey.currentState!.pushNamedAndRemoveUntil(
          Login2Screen.routeName, (Route<dynamic> route) => false);
    }
    return super.onError(err, handler);
  }
}
