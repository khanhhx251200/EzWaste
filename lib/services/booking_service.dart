import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shop_app/core/constants/endpoint_constant.dart';
import 'package:shop_app/core/rest_api/api.dart';
import 'package:shop_app/models/booking.dart';
import 'package:shop_app/models/booking_plastic.dart';
import 'package:shop_app/models/booking_search.dart';
import 'package:shop_app/models/history_response.dart';

class BookingService {
  final Api _api = Api.apiProvider;

  Future<bool?> addBooking(BookingPlastic body) async {
    try {
      final response =
          await _api.post(UrlConstant.ADD_BOOKING, body: body.toJson());
      return response.statusCode == 200;
    } on DioError catch (e) {
      if (e.response != null) {
        print("error: " + e.response!.data.toString());
      } else {
        print(e.requestOptions);
        print(e.message);
      }
    }
    return null;
  }

  Future<List<Booking>> getBookings(BookingSearch search) async {
    List<Booking> _listBooking = [];
    print('body: ' + jsonEncode(search.toJson()));
    try {
      final response = await _api.post(
          UrlConstant.GET_BOOKINGS + "?page=1&size=100",
          body: jsonEncode(search.toJson()));
      if (response.statusCode == 200) {
        final dataResponse = response.data['data'];
        _listBooking = (dataResponse['objList'] as List)
            .map((e) => Booking.fromJson(e))
            .toList();
        return _listBooking;
      }
      return _listBooking;
    } catch (e) {
      return [];
    }
  }

  Future<Booking?> getDetail(int id) async {
    Booking? booking;
    try {
      final response = await _api.get(
          UrlConstant.GET_DETAIL_BOOKING + "?idBooking=${id}");
      if (response.statusCode == 200) {
        final dataResponse = response.data['data'];
        booking = Booking.fromJson(dataResponse);
      }
      return booking;
    } catch (e) {
      return null;
    }
  }

  Future<Booking?> refuseBooking(int id, String reason) async {
    Booking? booking;
    try {
      Map<String, dynamic> bodyRequest = {
        "idBooking": id,
        "reason": reason,
      };
      final response = await _api.post(
          UrlConstant.REFUSE_BOOKING, body: jsonEncode(bodyRequest));
      if (response.statusCode == 200) {
        final dataResponse = response.data['data'];
        booking = Booking.fromJson(dataResponse);
      }
      return booking;
    } catch (e) {
      return null;
    }
  }

  Future<Booking?> accessBooking(int id, String feedback, double rate) async {
    Booking? booking;
    try {
      Map<String, dynamic> bodyRequest = {
        "idBooking": id,
        "feedback": feedback,
        "rate": rate,
      };
      final response = await _api.post(
          UrlConstant.ACCESS_BOOKING, body: jsonEncode(bodyRequest));
      if (response.statusCode == 200) {
        final dataResponse = response.data['data'];
        booking = Booking.fromJson(dataResponse);
      }
      return booking;
    } catch (e) {
      return null;
    }
  }
}
