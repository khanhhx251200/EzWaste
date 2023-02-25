import 'dart:math';

import 'package:flutter/material.dart';
import 'package:recycle_app/models/statistic_booking.dart';
import 'package:recycle_app/services/booking_service.dart';

class ActivitiesProvider extends ChangeNotifier {
  final bookingService = BookingService();
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  Statistic? _statisticBooking;

  DateTime? get rangeStart => _rangeStart;

  DateTime? get rangeEnd => _rangeEnd;

  Statistic? get statisticBooking => _statisticBooking;

  setRangeStart(DateTime? dateTime) => _rangeStart = dateTime;

  setRangeEnd(DateTime? dateTime) => _rangeEnd = dateTime;

  getStatistic() async {
    _statisticBooking =
        await bookingService.getStatistic(_rangeStart, _rangeEnd);
    print('listStatistic: $_statisticBooking');
    if (_statisticBooking == null) {
      _statisticBooking = Statistic(sumMassSh: 0, sumMoneySh: 0, sumMassTc: 0, sumMoneyTc: 0);
    }
    notifyListeners();
  }
}
