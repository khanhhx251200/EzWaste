import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/models/booking.dart';
import 'package:shop_app/models/booking_search.dart';
import 'package:shop_app/screens/new_design/dashboash/follow_booking/components/box_selection.dart';
import 'package:shop_app/services/booking_service.dart';

class HomePageProvider extends ChangeNotifier {
  final bookingService = BookingService();

  List<Booking> _lateBookings = [];

  List<Booking> get lateBookings => _lateBookings;

  List<BoxSelection> _typeLateBooking = [
    BoxSelection(title: kPlasticRecycle, isSelected: true, options: FILTER_PLASTIC),
  ];

  List<BoxSelection> _listStatus = [
    BoxSelection(title: kNotCollect, isSelected: true, options: FILTER_NOT_COLLECT),
  ];

  BoxSelection _sortBy = BoxSelection(
      title: kNearestCollectTime, isSelected: true, options: SORT_BY_NEAR);

  getLateBookings() async {
    _lateBookings = await bookingService.getBookings(BookingSearch(_typeLateBooking, _listStatus, _sortBy.options));
    print('_lateBookings: $_lateBookings');
    notifyListeners();
  }
}