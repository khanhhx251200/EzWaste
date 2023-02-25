import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:recycle_app/core/constants/endpoint_constant.dart';
import 'package:recycle_app/core/constants/key_constant.dart';
import 'package:recycle_app/core/rest_api/api.dart';
import 'package:recycle_app/models/notication.dart';
import 'package:recycle_app/models/user.dart';
import 'package:recycle_app/services/share_preferences_service.dart';

class UserService {
  final Api _api = Api.apiProvider;
  final storage = FlutterSecureStorage();
  final _preferences = new PreferencesService();

  Future<UserInfo?> doLogin(String userName, String password) async {
    String? tokenFirebase = await _preferences.getTokenFirebase();
    Map<String, dynamic> bodyLogin() => {
          "userName": userName,
          "password": password,
          "tokenFireBase": '$tokenFirebase}',
        };
    var data = FormData.fromMap(bodyLogin());
    try {
      final response = await _api.post(UrlConstant.SIGN_IN,
          isFormData: true, isNotToken: false, body: data);
      if (response.statusCode == 200) {
        print('login success');
        storage.write(
            key: KeyConstant.KEY_FULL_NAME,
            value: response.data['data']['userInfo']['fullName']);
        storage.write(key: KeyConstant.KEY_USER_NAME, value: userName);
        storage.write(key: KeyConstant.KEY_PASSWORD, value: password);
        storage.write(
            key: KeyConstant.KEY_TOKEN,
            value: response.data['data']['tokenInfo']['accessToken']);
        return UserInfo.fromJson(response.data['data']['userInfo']);
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
    return null;
  }

  Future<List<NotificationModel>> getNotifications() async {
    try {
      final Response response =
          await _api.get(UrlConstant.GET_LIST_FOLLOW_USER);
      if (response.statusCode == 200) {
        final data = response.data['data'];
        if (data != null) {
          return (data as List)
              .map((e) => NotificationModel.fromJson(e))
              .toList();
        }
      }
    } catch (e) {
      print(e);
    }
    return [];
  }
}
