import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/decoration_border_shadow.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/models/booking.dart';
import 'package:shop_app/screens/new_design/dashboash/follow_booking/provider/booking_provider.dart';
import 'package:shop_app/screens/new_design/detail_booking/detail_booking_screen.dart';

class LatestBookingItem extends StatelessWidget {
  const LatestBookingItem({
    Key? key, required this.booking,
  }) : super(key: key);
  
  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<BookingProvider>(context, listen: false)
            .getDetail(booking.id!);
        Navigator.pushNamed(context, DetailBookingScreen.routeName);
      },
      child: Container(
        margin: EdgeInsets.only(right: size36),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: size16),
              child: Text(
                'Ngày ${convertTimeStampToString(booking.dateBooking!)}',
                style: TextStyle(color: kWhiteColor, fontSize: size12),
              ),
            ),
            Container(
              width: 220,
              decoration: boxDecorationShadow(),
              child: ListTile(
                leading: Container(
                  padding: EdgeInsets.all(size8),
                  height: 54,
                  width: 54,
                  child: CircleAvatar(
                    backgroundImage:
                    AssetImage("assets/images/user_empty.png"),
                  ),
                ),
                title: Text(
                  booking.nameShipper!,
                  style: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: size14),
                ),
                subtitle: Text(
                  booking.phoneShipper!,
                  style: TextStyle(fontSize: size14),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: size16),
              child: Text(
                "Loại rác: ${valueByType(booking.type!, kOrganicRecycle, kPlasticRecycle)}",
                style: TextStyle(color: kWhiteColor, fontSize: size12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
