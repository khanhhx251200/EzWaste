import 'package:recycle_app/screens/new_design/dashboash/follow_booking/components/box_selection.dart';

class BookingSearch {
  final List<BoxSelection> types;
  final List<BoxSelection> listStatus;
  final String sortBy;
  final int page;
  final int size;

  BookingSearch(this.types, this.listStatus, this.sortBy,
      {this.page = 1, this.size = 10});

  Map<String, dynamic> toJson() => {
    "types": types.map((e) => e.options).toList(),
    "status": listStatus.map((e) => e.options).toList(),
    "sortBy": sortBy,
  };
}