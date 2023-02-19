import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/screens/new_design/dashboash/follow_booking/components/box_selection.dart';
import 'package:shop_app/screens/new_design/dashboash/follow_booking/components/filter_bottom_sheet.dart';
import 'package:shop_app/screens/new_design/dashboash/follow_booking/components/sort_bottom_sheet.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shop_app/screens/new_design/dashboash/follow_booking/provider/booking_provider.dart';

class FilterTracking extends StatefulWidget {
  const FilterTracking({
    Key? key,
  }) : super(key: key);

  @override
  State<FilterTracking> createState() => _FilterTrackingState();
}

class _FilterTrackingState extends State<FilterTracking> {
  int totalBookings = 0;
 @override
  void didChangeDependencies() {
   setState(() {
     totalBookings = Provider.of<BookingProvider>(context).listBooking.length;
    });
   super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: size16, vertical: size8),
      child: Row(
        children: [
          buttonAction(
              kFilter, Icons.filter_alt_outlined, () => filter(context),
              isFilter: true),
          const SizedBox(width: size8),
          buttonAction(kSortBy, Icons.sort, () => sortBy(context)),
          Spacer(),
          totalBooking()
        ],
      ),
    );
  }

  Text totalBooking() {
    return Text(
      '$totalBookings',
      style: TextStyle(
          color: kPrimaryColor, fontSize: size14, fontWeight: FontWeight.w700),
    );
  }

  Widget countFilter(bool isFilter, IconData icon) {
    BookingProvider provider =
        Provider.of<BookingProvider>(context, listen: false);
    int countFilter =
        provider.listStatus.where((element) => element.isSelected).length +
            provider.listType.where((element) => element.isSelected).length;
    int indexSort =
        provider.listSortBy.indexWhere((element) => element.isSelected);

    if (isFilter && countFilter > 0) {
      return Container(
        padding: EdgeInsets.all(size8),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            '$countFilter',
            style: TextStyle(color: kWhiteColor, fontWeight: FontWeight.bold),
          ),
        ),
      );
    } else if (!isFilter && indexSort != -1) {
      BoxSelection sortBy =
          provider.listSortBy.firstWhere((element) => element.isSelected);
      return Icon(
          sortBy.options == SORT_BY_NEAR
              ? Icons.arrow_circle_down
              : Icons.arrow_circle_up,
          color: kPrimaryColor);
    }
    return Icon(icon, color: kGrey75Color);
  }

  Row buttonAction(String label, IconData icon, Function? press,
      {isFilter = false}) {
    return Row(
      children: [
        OutlinedButton.icon(
          label: Text(
            label,
            style: TextStyle(color: kTextColor, fontWeight: FontWeight.w500),
          ),
          onPressed: press != null ? press as Function()? : null,
          icon: countFilter(isFilter, icon),
          style: styleButtonAction(),
        ),
      ],
    );
  }

  ButtonStyle styleButtonAction() {
    return ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(size20),
    )));
  }

  filter(BuildContext context) async {
    await showMaterialModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(50.0), topLeft: Radius.circular(50.0)),
      ),
      builder: (context) => const FilterBottom(),
    );
    searchAfterFilter(context);
  }

  sortBy(BuildContext context) async {
    await showMaterialModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(50.0), topLeft: Radius.circular(50.0)),
      ),
      builder: (context) => const SortBottom(),
    );
    searchAfterFilter(context);
  }

  searchAfterFilter(BuildContext context) {
    final provider = Provider.of<BookingProvider>(context, listen: false);
    setState(() {
      provider.clearBookings();
      provider.setPage(1);
      provider.getBookings();
    });
  }
}
