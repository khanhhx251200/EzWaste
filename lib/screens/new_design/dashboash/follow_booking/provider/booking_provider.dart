import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/models/booking.dart';
import 'package:shop_app/models/booking_search.dart';
import 'package:shop_app/screens/new_design/dashboash/follow_booking/components/box_selection.dart';
import 'package:shop_app/services/booking_service.dart';

class BookingProvider extends ChangeNotifier {
  final BookingService _bookingService = BookingService();

  Booking? _bookingDetail;
  List<Booking> _listBooking = [];

  List<BoxSelection> _listType = [
    BoxSelection(
        title: kOrganicRecycle, isSelected: false, options: FILTER_ORGANIC),
    BoxSelection(
        title: kPlasticRecycle, isSelected: false, options: FILTER_PLASTIC),
  ];

  List<BoxSelection> _listStatus = [
    BoxSelection(
        title: kNotCollect, isSelected: false, options: FILTER_NOT_COLLECT),
    BoxSelection(title: kRefuse, isSelected: false, options: FILTER_REFUSE),
    BoxSelection(title: kComplete, isSelected: false, options: FILTER_COMPLETE),
    BoxSelection(
        title: kWaitConfirm, isSelected: false, options: FILTER_WAIT_CONFIRM),
  ];

  List<BoxSelection> _listSortBy = [
    BoxSelection(
        title: kNearestCollectTime, isSelected: true, options: SORT_BY_NEAR),
    BoxSelection(
        title: kFurthestCollectTime, isSelected: false, options: SORT_BY_FAR),
  ];

  List<BoxSelection> get listStatus => _listStatus;

  List<BoxSelection> get listType => _listType;

  List<BoxSelection> get listSortBy => _listSortBy;

  List<Booking> get listBooking => _listBooking;

  Booking? get bookingDetail => _bookingDetail;

  BoxSelection _sortBy = BoxSelection(
      title: kNearestCollectTime, isSelected: true, options: SORT_BY_NEAR);

  BoxSelection get sortBy => _sortBy;

  setSortBy(BoxSelection selection) {
    _sortBy = selection;
    print(_sortBy.title);
  }

  resetTypes() {
    for (BoxSelection item in _listType) {
      item.isSelected = false;
    }
  }

  resetStatus() {
    for (BoxSelection item in _listStatus) {
      item.isSelected = false;
    }
  }

  resetSort() {
    for (BoxSelection item in _listSortBy) {
      item.isSelected = false;
    }
    sortByAll();
  }

  sortByAll() {
    _sortBy = BoxSelection(title: '', isSelected: true, options: '');
  }

  Future<List<Booking>> getBookings() async {
    _listBooking = await _bookingService.getBookings(prepareBodySearch());
    notifyListeners();
    return _listBooking;
  }

  BookingSearch prepareBodySearch() {
    final List<BoxSelection> types =
        _listType.where((element) => element.isSelected).toList();
    final status = _listStatus.where((element) => element.isSelected).toList();
    return BookingSearch(types, status, _sortBy.options, page: 1, size: 100);
  }

  getDetail(int id) async {
    _bookingDetail = await _bookingService.getDetail(id);
    notifyListeners();
  }

  Future<Booking?> refuseBooking(int id, String reason) async {
    return await _bookingService.refuseBooking(id, reason);
  }

  Future<Booking?> accessBooking(int id, String feedback, double rate) async {
    return await _bookingService.accessBooking(id, feedback, rate);
  }
}
