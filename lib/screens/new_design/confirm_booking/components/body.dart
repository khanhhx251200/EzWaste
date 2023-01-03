import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/models/booking.dart';
import 'package:shop_app/screens/history/components/info_shipper.dart';
import 'package:shop_app/screens/new_design/confirm_booking/components/info_organic.dart';
import 'package:shop_app/screens/new_design/confirm_booking/components/info_plastic.dart';

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
          InfoShipper(fullName: booking.nameShipper!, userName: booking.phoneShipper!),
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
