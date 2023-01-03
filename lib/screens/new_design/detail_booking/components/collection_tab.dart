import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/models/booking.dart';
import 'package:shop_app/screens/history/components/info_shipper.dart';
import 'package:shop_app/screens/new_design/confirm_booking/components/info_organic.dart';
import 'package:shop_app/screens/new_design/confirm_booking/components/info_plastic.dart';

class CollectionTab extends StatelessWidget {
  const CollectionTab({Key? key, required this.booking}) : super(key: key);
  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size24),
      child: Column(
        children: [
          InfoShipper(
              fullName: booking.nameShipper!, userName: booking.phoneShipper!),
          SizedBox(height: size24),
          // Thông tin sau khi đã thu gom (status = 3)
          // InfoOrganic(idOrder: 0, totalMass: 5, status: 3,),
          Expanded(
              child: InfoPlastic(
            idOrder: 0,
            totalMass: booking.mass!,
            status: booking.status!,
            booking: booking,
          )),
          SizedBox(height: size24),
        ],
      ),
    );
  }
}
