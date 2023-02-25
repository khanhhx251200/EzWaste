import 'package:flutter/material.dart';
import 'package:recycle_app/core/constants/strings_constant.dart';
import 'package:recycle_app/models/booking.dart';
import 'package:recycle_app/models/booking_search.dart';
import 'package:recycle_app/models/response_model.dart';
import 'package:recycle_app/screens/new_design/dashboash/follow_booking/components/box_selection.dart';
import 'package:recycle_app/services/booking_service.dart';

class BookingProvider extends ChangeNotifier {
  final BookingService _bookingService = BookingService();

  int _page = 1;
  int _size = 10;
  int _totalRecords = 0;
  int _totalPage = 0;
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

  int get totalRecords => _totalRecords;

  BoxSelection _sortBy = BoxSelection(
      title: kNearestCollectTime, isSelected: true, options: SORT_BY_NEAR);

  BoxSelection get sortBy => _sortBy;

  setPage(int page) => _page = page;

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

  clearBookings() {
    _listBooking.clear();
  }

  Future<List<Booking>> getBookings() async {
    print('totalRecords: $_totalPage');

    ResponseModel? res = await _bookingService.getBookings(prepareBodySearch());
    if (res != null) {
      _totalRecords = res.totalRecord;
      _totalPage = res.totalPage;
      if (res.objList != null) {
        List<Booking> listBooking =
            (res.objList as List).map((e) => Booking.fromJson(e)).toList();
        if (_listBooking.length < _totalRecords) {
          _listBooking.addAll(listBooking);
        }

        if (_page < _totalPage) {
          _page++;
        }
      }
    }
    notifyListeners();
    return _listBooking;
  }

  BookingSearch prepareBodySearch() {
    final List<BoxSelection> types =
        _listType.where((element) => element.isSelected).toList();
    final status = _listStatus.where((element) => element.isSelected).toList();
    return BookingSearch(types, status, _sortBy.options,
        page: _page, size: _size);
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
