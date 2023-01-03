import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/endpoint_constant.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/rest_api/api.dart';
import 'package:shop_app/helper/ToastUtils.dart';
import 'package:shop_app/models/user.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/home/provider/home_provider.dart';
import 'package:shop_app/services/share_preferences_service.dart';
class EditProfileProvider extends ChangeNotifier {
  final _api = Api.apiProvider;
  final _preferences = new PreferencesService();

  bool _isEditUser = false;

  UserInfo? _userInfo;

  UserInfo? get userInfo => _userInfo;

  UserInfo? setUserInfo(UserInfo userInfo) => _userInfo = userInfo;

  bool get isEditUser => _isEditUser;

  bool setIsEditUser(bool value) => _isEditUser = value;

  getUserInfo() async {
    try {
      final response = await _api.get(UrlConstant.GET_USER_INFO + '${_preferences.getUsername()}');
      if (response.statusCode == 200) {
        final dataResponse = response.data['data'];
        _userInfo = UserInfo.fromJson(dataResponse);
        notifyListeners();
      }
    } on DioError catch (e) {
      print(e);
    }
  }

  Future<void> editUser(BuildContext context) async {
    if (_isEditUser) {
      try {
        final response = await _api.post(UrlConstant.EDIT_USER_INFO,
            body: jsonEncode(_userInfo!.toJson()));
        if (response.statusCode == 200) {
          final dataResponse = response.data['data'];
          _userInfo = UserInfo.fromJson(dataResponse);
          notifyListeners();
        }
      } on DioError catch (e) {
        if (e.response != null) {
          showToastInApp(context, e.response!.data['message'],
              backgroundColor: kWarningColor, textColor: kWhiteColor);
        } else {
          print(e.requestOptions);
          print(e.message);
        }
      }
    }
    showToastInApp(context, 'Đã chỉnh sửa thông tin',
        backgroundColor: kPrimaryColor, textColor: kWhiteColor);
    await context.read<HomeProvider>().getUserInfo();
    Future.delayed(panelTransition, (){
      Navigator.pop(context);
    });
  }
}
