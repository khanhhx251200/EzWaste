import 'package:flutter/material.dart';
import 'package:recycle_app/components/info_customer.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';
import 'package:recycle_app/models/booking.dart';
import 'package:recycle_app/screens/new_design/confirm_booking/components/info_organic.dart';
import 'package:recycle_app/screens/new_design/confirm_booking/components/info_plastic.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key, required this.booking,
  }) : super(key: key);
  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: kWhiteColor),
      padding: EdgeInsets.symmetric(vertical: size32, horizontal: size36),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InfoShipper(booking: booking,),
          SizedBox(
            height: size32,
          ),
          Expanded(
            child: valueByType(2, InfoOrganic(idOrder: 0, totalMass: 5, status: 2,),
                InfoPlastic(idOrder: 0, totalMass: 5, status: 2, booking: booking,)),
          )
        ],
      ),
    );
  }
}
