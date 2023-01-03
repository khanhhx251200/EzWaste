import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/endpoint_constant.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/core/rest_api/api.dart';
import 'package:shop_app/helper/ToastUtils.dart';
import 'package:shop_app/models/history_response.dart';
import 'package:shop_app/models/item_product.dart';
import 'package:shop_app/models/user.dart';
import 'package:shop_app/services/share_preferences_service.dart';

class HomeProvider extends ChangeNotifier {
  final _api = Api.apiProvider;
  final _preferences = new PreferencesService();

  List<Products> _listProduct = [];
  List<Order> _listOrder = [];
  Order? _dataHistory;
  UserInfo? _userInfo;
  DateTime? _dateTimeSelected;

  bool _isLoadingListOrder = false;

  bool get isLoadingListOrder => _isLoadingListOrder;

  get listProduct => _listProduct;

  UserInfo? get userInfo => _userInfo;

  List<Order> get listOrder => _listOrder;

  Order? get dataHistory => _dataHistory;

  DateTime? get dateTimeSelected => _dateTimeSelected;

  int _statusSchedule = 0;

  int get statusSchedule => _statusSchedule;

  setUserInfo(UserInfo userInfo) => _userInfo = userInfo;

  setDateTimeSelected(DateTime dateTime) {
    _dateTimeSelected = dateTime;
    _listOrder = [];
    getListOrder();
  }

  setStatusSchedule() {
    if (_statusSchedule < 4) {
      _statusSchedule++;
      notifyListeners();
    } else {
      _statusSchedule = 1;
      notifyListeners();
    }
  }

  getListProduct() async {
    _listProduct = [];
    try {
      final response = await _api.get(UrlConstant.GET_ALL_LIST_PRODUCT);
      print(response);
      if (response.statusCode == 200) {
        final dataResponse = response.data['data'];
        _listProduct =
            (dataResponse as List).map((e) => Products.fromJson(e)).toList();
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  getListHistory() async {
    _listOrder.clear();
    _isLoadingListOrder = true;
    notifyListeners();
    try {
      final response = await _api.get(UrlConstant.GET_ALL_LIST_ORDER);
      _listOrder = [];

      if (response.statusCode == 200) {
        final dataResponse = response.data['data'];
        _listOrder =
            (dataResponse as List).map((e) => Order.fromJson(e)).toList();
        _isLoadingListOrder = false;
        notifyListeners();
      }
    } on DioError catch (e) {
      _listOrder = [];
      _isLoadingListOrder = false;
      notifyListeners();
      print(e);
    }
  }

  Future<List<Order>> getListOrder() async {
    try {
      final response = await _api.get(
          UrlConstant.GET_ALL_LIST_ORDER_BY_DATE_AND_STATUS +
              '?date=${DateFormat('dd-MM-yyyy').format(_dateTimeSelected!)}' +
              '&status=');
      if (response.statusCode == 200) {
        final dataResponse = response.data['data'];
        _listOrder = (dataResponse as List).map((e) => Order.fromJson(e)).toList();
        print('listOrders: $_listOrder');
        notifyListeners();
        return _listOrder;
      }
      return _listOrder;
    } on DioError catch (e) {
      return _listOrder;
    }
  }

  getUserInfo() async {

    String? username = await _preferences.getUsername();
    try {
      final response = await _api.get(UrlConstant.GET_USER_INFO + '$username');
      if (response.statusCode == 200) {
        final dataResponse = response.data['data'];

        _userInfo = UserInfo.fromJson(dataResponse);
        notifyListeners();
      }
    } on DioError catch (e) {
      print(e);
    }
  }

  confirmSchedule(context, int id) async {
    try {
      final response =
          await _api.post(UrlConstant.CONFIRM_ORDER + "?id=$id");
      if (response.statusCode == 200) {
        final dataResponse = response.data['data'];
        print('res: $dataResponse');
        showToastInApp(context, "Xác nhận đơn hàng thành công!!",
            backgroundColor: kSuccessColor, textColor: kWhiteColor);
        notifyListeners();
      }
      getListHistory();
    } on DioError catch (e) {
      print(e);
    }
  }
}
