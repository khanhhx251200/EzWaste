import 'package:shared_preferences/shared_preferences.dart';
import 'package:recycle_app/core/constants/key_constant.dart';
import 'package:recycle_app/models/user.dart';

class PreferencesService {
  Future setTokenFirebase(String token) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(KeyConstant.KEY_TOKEN_FIREBASE, token);
  }

  Future setToken(String token, int timeExprise) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(KeyConstant.KEY_TOKEN, token);
    await preferences.setInt(KeyConstant.KEY_TOKEN_TIME_EXPRISE, timeExprise);
  }

  Future<String?> getTokenFirebase() async {
    final preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString(KeyConstant.KEY_TOKEN_FIREBASE);
    return token ?? '';
  }

  Future<String?> getToken() async {
    final preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString(KeyConstant.KEY_TOKEN);
    return token ?? '';
  }

  Future<String?> getUsername() async {
    final preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString(KeyConstant.KEY_USER_NAME);
    return token ?? '';
  }

  Future setUsername(String userName) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(KeyConstant.KEY_USER_NAME, userName);
  }

  Future<int?> getTimeExprise() async {
    final preferences = await SharedPreferences.getInstance();
    int? time = preferences.getInt(KeyConstant.KEY_TOKEN_TIME_EXPRISE);
    return time ?? DateTime.now().millisecondsSinceEpoch;
  }

  logout() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(KeyConstant.KEY_TOKEN, '');
    await preferences.setString(KeyConstant.KEY_USER_NAME, '');
    await preferences.setInt(KeyConstant.KEY_TOKEN_TIME_EXPRISE, DateTime.now().millisecondsSinceEpoch);
  }
}
