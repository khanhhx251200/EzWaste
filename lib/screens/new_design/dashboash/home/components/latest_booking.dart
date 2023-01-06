import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';

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
      padding: EdgeInsets.all(size20),
      color: kGreenColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            kLatestBooking,
            style: TextStyle(
                color: kWhiteColor,
                fontSize: size18,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(height: size8,),
          ListLatestBooking(),
        ],
      ),
    );
  }
}


