import 'package:flutter/material.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';
import 'package:recycle_app/core/constants/strings_constant.dart';

import 'list_latest_booking.dart';

class LatestBooking extends StatefulWidget {
  const LatestBooking({Key? key}) : super(key: key);

  @override
  State<LatestBooking> createState() => _LatestBookingState();
}

class _LatestBookingState extends State<LatestBooking> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kWhiteColor,
      padding: EdgeInsets.symmetric(horizontal: size16, vertical: size8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            kLatestBooking,
            style: TextStyle(fontSize: size18, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: size8,
          ),
          ListLatestBooking(),
        ],
      ),
    );
  }
}
