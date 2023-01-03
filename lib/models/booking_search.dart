import 'package:shop_app/screens/new_design/dashboash/follow_booking/components/box_selection.dart';

class BookingSearch {
  final List<BoxSelection> types;
  final List<BoxSelection> listStatus;
  final String sortBy;

  BookingSearch(this.types, this.listStatus, this.sortBy);

  Map<String, dynamic> toJson() => {
    "types": types.map((e) => e.options).toList(),
    "status": listStatus.map((e) => e.options).toList(),
    "sortBy": sortBy,
  };
}