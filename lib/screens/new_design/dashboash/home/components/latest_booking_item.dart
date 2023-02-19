import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/models/booking.dart';
import 'package:shop_app/screens/new_design/dashboash/follow_booking/provider/booking_provider.dart';
import 'package:shop_app/screens/new_design/detail_booking/detail_booking_screen.dart';

class LatestBookingItem extends StatelessWidget {
  const LatestBookingItem({
    Key? key,
    required this.booking,
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
        width: 250,
        margin: EdgeInsets.only(right: size16, left: size8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader(),
            buildContent(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: size16),
              child: Row(
                children: [
                  Icon(
                    statusIcon(booking.status!),
                    color: statusColor(booking.status!),
                  ),
                  SizedBox(
                    width: size8,
                  ),
                  Text(
                    statusString(booking.status!),
                    style: TextStyle(
                        color: statusColor(booking.status!), fontSize: size12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildContent() {
    return Container(
      width: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(size12)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: size8 / 2,
              blurRadius: 7,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              valueByType(booking.type, kOrganicColor, kPlasticColor)
                  .withOpacity(0.9),
              valueByType(booking.type, kOrganicColor, kPlasticColor)
                  .withOpacity(0.6),
            ],
          )),
      child: ListTile(
        leading: Image.asset(valueByType(booking.type,
            "assets/icons/organic.png", "assets/icons/plastic.png")),
        title: Text(
          booking.nameShipper!,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: size14,
              color: kWhiteColor),
        ),
        subtitle: Text(
          booking.phoneShipper!,
          style: TextStyle(fontSize: size14, color: kWhiteColor),
        ),
      ),
    );
  }

  Container buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: size16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: convertDateToNameOfDay(
                    convertTimeStampToDateTime(booking.dateBooking!)),
                style: TextStyle(
                    fontWeight: FontWeight.w700, color: kPrimaryColor)),
            TextSpan(text: " - ", style: TextStyle(color: kPrimaryColor)),
            TextSpan(
              text: convertTimeStampToString(booking.dateBooking!),
              style: TextStyle(
                  color:
                      valueByType(booking.type, kOrganicColor, kPlasticColor),
                  fontSize: size12),
            )
          ])),
          Text(
            valueByType(booking.type, kOrganicRecycle, kPlasticRecycle),
            style: TextStyle(
                color: valueByType(booking.type, kOrganicColor, kPlasticColor),
                fontWeight: FontWeight.w700,
                fontSize: size14),
          ),
        ],
      ),
    );
  }
}
