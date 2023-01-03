import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/endpoint_constant.dart';
import 'package:shop_app/core/rest_api/api.dart';
import 'package:shop_app/helper/ToastUtils.dart';
import 'package:shop_app/models/history_response.dart';
import 'package:shop_app/screens/history/components/confirm_order_success.dart';

class HistoryProvider extends ChangeNotifier {
  final _api = Api.apiProvider;

  List<Order> _listHistory = [];
  List<Order> _listRequest = [];
  List<Order> _listConfirm = [];
  List<Order> _listComplete = [];

  List<Order> get listHistory => _listHistory;

  List<Order> get listRequest => _listRequest;

  List<Order> get listConfirm => _listConfirm;

  List<Order> get listComplete => _listComplete;

  getListHistory() async {
    _listHistory = [];
    _listRequest = [];
    _listConfirm = [];
    _listComplete = [];
    try {
      final response = await _api.get(UrlConstant.GET_ALL_LIST_ORDER);
      if (response.statusCode == 200) {
        final dataResponse = response.data['data'];
        _listHistory =
            (dataResponse as List).map((e) => Order.fromJson(e)).toList();
        for (Order history in _listHistory) {
          if (history.status == 1 || history.status == 2) {
            _listRequest.add(history);
          } else if (history.status == 3) {
            _listConfirm.add(history);
          } else if (history.status == 4) {
            _listComplete.add(history);
          }
        }
        notifyListeners();
      }
    } on DioError catch (e) {
      print('catch');
      if (e.response != null) {
        print(e.response!.data['message']);
        // showToastInApp(context, e.response!.data['message'],
        //     backgroundColor: kWarningColor, textColor: kWhiteColor);
      } else {
        print(e.requestOptions);
        print(e.message);
      }
    }
  }

  confirmSchedule(context, int id, Order? order) async {
    try {
      final response =
          await _api.post(UrlConstant.CONFIRM_ORDER + "?id=$id");
      if (response.statusCode == 200) {
        final dataResponse = response.data['data'];
        print('res: $dataResponse');
        Navigator.pushNamed(context, ConfirmOrderSuccess.routeName);
        notifyListeners();
      }
      getListRequest();
    } on DioError catch (e) {
      print(e);
    }
  }

  Future<List<Order>> getListRequest() async {
    try {
      final response = await _api.get(
          UrlConstant.GET_ALL_LIST_ORDER_BY_STATUS + '?status=2');

      if (response.statusCode == 200) {
        final dataResponse = response.data['data'];
        _listRequest =
            (dataResponse as List).map((e) => Order.fromJson(e)).toList();
        print('_listRequest: $_listRequest');
        notifyListeners();
        return _listRequest;
      }
    } on DioError catch (e) {
      print(e);
      return _listRequest;
    }
    return _listRequest;
  }

  Future<List<Order>> getListConfirmed() async {
    try {
      final response = await _api.get(
          UrlConstant.GET_ALL_LIST_ORDER_BY_STATUS + '?status=3');

      if (response.statusCode == 200) {
        final dataResponse = response.data['data'];
        print('_listConfirm: $dataResponse');

        _listConfirm =
            (dataResponse as List).map((e) => Order.fromJson(e)).toList();
        print('_listConfirm: $_listConfirm');
        notifyListeners();
        return _listConfirm;
      }
      return _listConfirm;
    } on DioError catch (e) {
      print(e);
      return _listConfirm;
    }
  }

  Future<List<Order>> getListComplete() async {
    try {
      final response = await _api.get(
          UrlConstant.GET_ALL_LIST_ORDER_BY_STATUS + '?status=4');

      if (response.statusCode == 200) {
        final dataResponse = response.data['data'];
        print('_listComplete: $dataResponse');

        _listComplete =
            (dataResponse as List).map((e) => Order.fromJson(e)).toList();
        print('_listComplete: $_listComplete');
        notifyListeners();
        return _listComplete;
      }
      return _listComplete;
    } on DioError catch (e) {
      print(e);
      return _listComplete;
    }
  }
}
