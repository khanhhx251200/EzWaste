import 'package:http/http.dart' as http;
import 'package:shop_app/core/constants/endpoint_constant.dart';
import 'package:shop_app/services/share_preferences_service.dart';

class ApiHelper {
  ApiHelper._privateConstructor();

   String _apiUrl = UrlConstant.API_URL;
  final _preferences = PreferencesService();

  static final ApiHelper apiProvider = ApiHelper._privateConstructor();

  _getUrlEndpoint(String endPoint) {
    final url = Uri.parse('$_apiUrl/$endPoint');
    return url;
  }

  dynamic get(String url) async {
    var requestHeaders = <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json, ",
      "Authorization": "Bearer ${await _preferences.getToken()}"
    };
    try {
      final response = await http.get(_getUrlEndpoint(url), headers: requestHeaders,);
      return response;
    } catch (e) {
      print(e);
    }
  }

  dynamic post(String url, dynamic body) async {
    var requestHeaders = <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json, ",
      "Authorization": "Bearer ${await _preferences.getToken()}"
    };
    try {
      final response = await http.post(_getUrlEndpoint(url), headers: requestHeaders, body: body);
      return response;
    } catch (e) {
      print(e);
    }
  }
}
