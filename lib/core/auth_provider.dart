import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/endpoint_constant.dart';
import 'package:recycle_app/core/constants/key_constant.dart';
import 'package:recycle_app/core/rest_api/api.dart';
import 'package:recycle_app/helper/ToastUtils.dart';
import 'package:recycle_app/models/user.dart';
import 'package:recycle_app/screens/login/login2_screen.dart';
import 'package:recycle_app/screens/new_design/dashboash/dashboash_screen.dart';
import 'package:recycle_app/screens/sign_in/sign_in_screen.dart';
import 'package:recycle_app/services/share_preferences_service.dart';
class AuthProvider extends ChangeNotifier {
  final _api = Api.apiProvider;
  final _preferences = PreferencesService();
  final _storage = FlutterSecureStorage();

  User? _user;
  UserInfo? _userInfo;

  UserInfo get userInfo => _userInfo!;

  bool _isLoading = false;

  get isLoading => _isLoading;

  setUser(User user) => _user = user;

  setUserInfo(UserInfo user) => _userInfo = user;

  setPhone(String phone) => _user!.phone = phone;

  setFullName(String fullName) => _user!.fullName = fullName;


   signIn(context, String username, String password) async {

    String? tokenFirebase = await _preferences.getTokenFirebase();
    _isLoading = true;
    print(username);
    print(password);
    notifyListeners();
    UserInfo? _result;
    Map<String, dynamic> bodyLogin() => {
          "userName": username,
          "password": password,
          "tokenFireBase": '$tokenFirebase}',
        };
    String url = UrlConstant.API_URL + "/" + UrlConstant.SIGN_IN;

    var data = FormData.fromMap(bodyLogin());
    // Navigator.pushReplacementNamed(context, HomeScreen.routeName);

    try {
      print(UrlConstant.API_URL + "/" + UrlConstant.SIGN_IN);
      final response = await Dio().post(url,
          options: Options(contentType: 'multipart/form-data', headers: {
            "Accept": '*/*',
            "Content-Type": "application/json",
          }),
          data: data);
      _isLoading = false;
      notifyListeners();
      if (response.statusCode == 200) {
        _preferences.setUsername(username);
        var dataResponse = response.data['data'];
        _result = UserInfo.fromJson(dataResponse['userInfo']);
        print("token: ${dataResponse['tokenInfo']['accessToken']}");
        _preferences.setToken(dataResponse['tokenInfo']['accessToken'],
            dataResponse['tokenInfo']['timeExprise']);
        Navigator.pushReplacementNamed(context, DashBoardScreen.routeName);

        return _result;
      }
    } on DioError catch (e) {
      _isLoading = false;
      notifyListeners();
      if (e.response != null) {
        showToastInApp(context, e.response!.data['message'],
            backgroundColor: kWarningColor, textColor: kWhiteColor);
      } else {
        print(e.requestOptions);
        print(e.message);
      }
    }
    return _result;
  }

  signUp(context, String userName, String password) async {
    _isLoading = true;
    notifyListeners();
    var bodySignUp = {'userName': userName, 'passwordnew': password};

    try {
      final response = await _api.post(
          UrlConstant.SIGN_UP + "?isSeller=true",
          isNotToken: false,
          body: jsonEncode(bodySignUp));
      _isLoading = false;
      notifyListeners();
      print('res: $response');
      if (response.statusCode == 200) {
        Navigator.pushReplacementNamed(context, SignInScreen.routeName);
        print('signUp success');
      } else {
        print('signUp failed');
      }
    } on DioError catch (e) {
      _isLoading = false;
      notifyListeners();
      if (e.response != null) {
        showToastInApp(context, e.response!.data['message'],
            backgroundColor: kWarningColor, textColor: kWhiteColor);
      } else {
        print("reqOption: " + e.requestOptions.toString());
        print("message: " + e.message);
      }
    }
  }

  Future<bool> logout(context) async {
     bool result = false;
     try {
       final response = await _api.post(
           UrlConstant.LOG_OUT);
       print('res: $response');
       if (response.statusCode == 200) {
         result = true;
         print('logout success');
         _storage.delete(key: KeyConstant.KEY_TOKEN);
         Navigator.of(context).pushNamedAndRemoveUntil(
             Login2Screen.routeName, (Route<dynamic> route) => false);
       } else {
         print('logout failed');
       }
     } on DioError catch (e) {
       notifyListeners();
     }
     return result;
  }
}
