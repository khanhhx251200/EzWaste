import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/endpoint_constant.dart';
import 'package:shop_app/core/rest_api/api.dart';
import 'package:shop_app/core/rest_api/api_helper.dart';
import 'package:shop_app/helper/ToastUtils.dart';
import 'package:shop_app/models/date_sell.dart';
import 'package:shop_app/models/item_product.dart';
import 'package:shop_app/models/location.dart';
import 'package:shop_app/models/sell.dart';
import 'package:shop_app/models/time_sell.dart';

class SellProvider extends ChangeNotifier {
  final _api = Api.apiProvider;
  final _apiHelper = ApiHelper.apiProvider;
  final _currentDate = DateTime.now();
  final _dayFormatter = DateFormat('d');
  final _monthFormatter = DateFormat('MM');
  final List<Widget> _dates = <Widget>[];

  List<LocationModel> _listLocation = [];
  List<Products> _listProduct = [];
  List<TimeSell> _listTime = [];
  List<DateSell> _listDate = [];
  LocationModel? _locationModelSelected;
  TimeSell? _timeSellSelected;

  DateSell? _dateSellSelected;

  String _intendTime = '';

  bool _typeAddress = false;
  bool _typeOrder = false;

  get typeAddress => _typeAddress;

  bool get typeOrder => _typeOrder;

  get listLocation => _listLocation;

  get listTime => _listTime;

  List<DateSell> get listDate => _listDate;

  List<Products> get listProduct => _listProduct;

  get locationModelSelected => _locationModelSelected;

  get intendTime => _intendTime;

  TimeSell? get timeSellSelected => _timeSellSelected;

  DateSell? get dateSellSelected => _dateSellSelected;

  get dates => _dates;

  setTypeAddress(bool value) => _typeAddress = value;

  setTypeTime(bool value) => _typeOrder = value;

  setTimeIsSelected(bool status) =>
      _timeSellSelected != null ? _timeSellSelected!.isSelected = status : null;


  setDateSelected(DateSell dateSell) => _dateSellSelected = dateSell;

  setDemoAddress(List<LocationModel> listDemo) => _listLocation = listDemo;

  setListAddress(List<LocationModel> listNew) => _listLocation = listNew;

  Future<List<LocationModel>> getListAddress() async {
    _listLocation = [];
    try {
      final response = await _api.get(UrlConstant.GET_ALL_LIST_ADDRESS);
      print(response);
      if (response.statusCode == 200) {
        final dataResponse = response.data['data'];
        _listLocation =
            (dataResponse as List).map((e) => LocationModel(detailLocation: e)).toList();
        if (_listLocation.isNotEmpty){
          _listLocation[0].isSelected = true;
        }
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
    return _listLocation;
  }

  setSelectedLocation(index) {
    for (int i = 0; i < _listLocation.length; i++) {
      if (i == index) {
        _listLocation[i].isSelected = !_listLocation[i].isSelected;
        _locationModelSelected = _listLocation[i];
        notifyListeners();
      } else {
        _listLocation[i].isSelected = false;
        notifyListeners();
      }
    }
  }

  setSelectedDate(index) {
    setSelectedTime(-1);
    for (int i = 0; i < _listDate.length; i++) {
      if (i == index) {
        _listDate[i].isSelected = true;
        _dateSellSelected = _listDate[i];

        notifyListeners();
      } else {
        _listDate[i].isSelected = false;
      }
    }
  }

  setSelectedTime(index) {
    for (int i = 0; i < _listTime.length; i++) {
      if (i == index) {
        _listTime[i].isSelected = true;
        _timeSellSelected = _listTime[i];
        notifyListeners();
      } else {
        _listTime[i].isSelected = false;
      }
    }
  }

  addItemLocationToList(LocationModel locationModel) {
    _listLocation.add(locationModel);
    notifyListeners();
  }

  removeItemLocationToList(LocationModel locationModel) {
    _listLocation.remove(locationModel);
    notifyListeners();
  }

  bool getTodayEnable() {
    bool result = true;

    for (int i = 0; i < _listTime.length; i++) {
      if (_listTime[i].isDisable) {
        result = false;
      } else {
        result = true;
      }
    }
    return result;
  }

  bool isTimeSelected() {
    bool result = false;
    for (int i = 0; i < _listTime.length; i++) {
      if (_listTime[i].isSelected) {
        result = true;
        break;
      }
    }
    return result;
  }

  getNext15Days({typeOrder}) {
    _listDate.clear();

    for (int i = 1; i < 30; i++) {
      final date = _currentDate.add(Duration(days: i));
        _listDate.add(DateSell(
            isSelected:  false,
            day: _dayFormatter.format(date),
            month: _monthFormatter.format(date),
            dateTime: date,
            id: i + 1));
    }
    DateSell initTime = _listDate[_listDate[0].dateTime!.weekday %2 == 0 && !_typeOrder ? 1 : 0];
    initTime.isSelected = true;
    _dateSellSelected = initTime;
  }

  setSchedule(BuildContext context, Sell sell, Function errorFunction, Function successFunction) async {
    print('time: ${sell.time}');
    //
    // String timeFormat = DateFormat('yyyy-MM-dd').format(DateFormat('hh:mm - dd/MM/yyyy').parse(sell.time));
    // print('time: $timeFormat');
    print(jsonEncode(sell.toJson()));
    try{
      final response = await _apiHelper.post(UrlConstant.ORDER_ADD,  jsonEncode(sell.toJson()));

      if(response.statusCode == 200){
        successFunction();
      }else if(response.statusCode == 404){
        showToastInApp(context, " ",
            backgroundColor: kWarningColor, textColor: kWhiteColor);
      }
    }  on DioError catch (e){
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
