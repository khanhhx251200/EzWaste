import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/endpoint_constant.dart';
import 'package:shop_app/core/rest_api/api.dart';
import 'package:shop_app/helper/ToastUtils.dart';

class ChangePasswordProvider extends ChangeNotifier {
  final _api = Api.apiProvider;

  changePassword(String newPassword, context) async {
    try{
      final response = await _api.put(UrlConstant.CHANGE_PASSWORD);

    } on DioError catch (e) {
      if (e.response != null) {
        showToastInApp(context, e.response!.data['message'],
            backgroundColor: kWarningColor, textColor: kWhiteColor);
      } else {
        print("ss"+e.requestOptions.toString());
        print(e.message);
      }
    }
  }
}
