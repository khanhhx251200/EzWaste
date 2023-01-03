import 'package:flutter/material.dart';
import 'package:shop_app/components/top_bottom_sheet.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/screens/new_design/dashboash/follow_booking/components/box_selection.dart';
import 'package:shop_app/screens/new_design/dashboash/follow_booking/provider/booking_provider.dart';
import 'package:provider/provider.dart';
import 'filter_button.dart';

class FilterBottom extends StatefulWidget {
  const FilterBottom({Key? key}) : super(key: key);

  @override
  State<FilterBottom> createState() => _FilterBottomState();
}

class _FilterBottomState extends State<FilterBottom> {
  List<BoxSelection> listType = [];
  List<BoxSelection> listStatus = [];

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<BookingProvider>(context, listen: false);
    listType = provider.listType;
    listStatus = provider.listStatus;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding:
          const EdgeInsets.symmetric(vertical: size14, horizontal: size36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopBottomSheet(),
          const SizedBox(
            height: size20,
          ),
          filterByTypeRecycle(),
          const SizedBox(
            height: size20,
          ),
          filterByStatusRecycle(),
        ],
      ),
    );
  }

  Column filterByTypeRecycle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          kClassifyRecycle,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: size18),
        ),
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          children: listType.map((type) => FilterButton(selection: type)).toList(),
        ),
      ],
    );
  }

  Column filterByStatusRecycle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          kStatus,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: size18),
        ),
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          children: listStatus.map((type) => FilterButton(selection: type)).toList(),
        ),
      ],
    );
  }
}
