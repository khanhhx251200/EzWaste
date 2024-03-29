import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:recycle_app/core/constants/endpoint_constant.dart';
import 'package:recycle_app/core/constants/strings_constant.dart';
import 'package:recycle_app/core/rest_api/api.dart';
import 'package:recycle_app/models/booking.dart';
import 'package:recycle_app/models/booking_plastic.dart';
import 'package:recycle_app/models/booking_search.dart';
import 'package:recycle_app/models/history_response.dart';
import 'package:recycle_app/models/response_model.dart';
import 'package:recycle_app/models/statistic_booking.dart';

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

  Future<ResponseModel?> getBookings(BookingSearch search) async {
    print('body: ' + jsonEncode(search.toJson()));
    try {
      final response = await _api.post(
          UrlConstant.GET_BOOKINGS + "?page=${search.page}&size=${search.size}",
          body: jsonEncode(search.toJson()));
      if (response.statusCode == 200) {
        return ResponseModel.fromJson(response.data['data']);
      }
      return ResponseModel(totalPage: 0, totalRecord: 0, objList: null);
    } catch (e) {
      return ResponseModel(totalPage: 0, totalRecord: 0, objList: null);
    }
  }

  Future<Booking?> getDetail(int id) async {
    Booking? booking;
    try {
      final response =
          await _api.get(UrlConstant.GET_DETAIL_BOOKING + "?idBooking=${id}");
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
      final response = await _api.post(UrlConstant.REFUSE_BOOKING,
          body: jsonEncode(bodyRequest));
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
      final response = await _api.post(UrlConstant.ACCESS_BOOKING,
          body: jsonEncode(bodyRequest));
      if (response.statusCode == 200) {
        final dataResponse = response.data['data'];
        booking = Booking.fromJson(dataResponse);
      }
      return booking;
    } catch (e) {
      return null;
    }
  }

  Future<Statistic?> getStatistic(
      DateTime? startDate, DateTime? endDate) async {
    try {
      Map<String, dynamic> bodyRequest = {
        "startDate":
            startDate != null ? convertDateToStringBackend(startDate) : '',
        "endDate": endDate != null ? convertDateToStringBackend(endDate) : '',
      };
      print('body: ' + jsonEncode(bodyRequest));

      final response = await _api.post(UrlConstant.GET_STATISTIC,
          body: jsonEncode(bodyRequest));
      if (response.statusCode == 200) {
        final dataResponse = response.data['data'];
        return Statistic.fromJson(dataResponse);
      }
      return null;
    } catch (e) {
      print('Error Statistic: $e');
      return null;
    }
  }
}
