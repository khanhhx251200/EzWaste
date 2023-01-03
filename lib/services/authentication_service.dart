import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shop_app/core/constants/endpoint_constant.dart';
import 'package:shop_app/core/rest_api/api_helper.dart';
import 'package:shop_app/models/user.dart';

class AuthenticationService {
  static final ApiHelper _api = ApiHelper.apiProvider;

  static Future<UserInfo?> signIn(String userName, String password) async {
    UserInfo? _result;
    Map<String, dynamic> bodyLogin() => {
          "userName": userName,
          "password": password,
        };
    var data = FormData.fromMap(bodyLogin());

    try {
      print(UrlConstant.API_URL + UrlConstant.SIGN_IN);
      final response = await Dio().post(
          UrlConstant.API_URL + UrlConstant.SIGN_IN,
          options: Options(
            contentType: 'multipart/form-data',
            headers: {
              "Accept": '*/*'
            }
          ),
          data: data);
      if (response.statusCode == 200) {
        _result = UserInfo.fromJson(response.data['data']['userInfo']);
        print('login success');
      } else {
        print('login failed');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print("data" + e.response!.data.toString());
      } else {
        print(e.requestOptions);
        print(e.message);
      }
    }
    return _result;
  }
}
