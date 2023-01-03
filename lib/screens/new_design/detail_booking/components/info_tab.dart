import 'package:flutter/material.dart';
import 'package:shop_app/components/decoration_border_shadow.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/models/booking.dart';

class InfoBookingTab extends StatelessWidget {
  const InfoBookingTab({Key? key, required this.booking}) : super(key: key);
  final Booking booking;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          labelTab(),
          contentTab(context)
        ],
      ),
    );
  }

  Container contentTab(BuildContext context) {
    return Container(
          margin: EdgeInsets.symmetric(horizontal: size24, vertical: size32),
          padding: EdgeInsets.all(size18),
          decoration: boxDecorationShadow(radius: size20),
          child: Column(
            children: [
              itemBody(
                  Icons.date_range, convertTimeStampToString(booking.dateBooking!)),
              itemBody(Icons.location_on, booking.address!),
              itemBody(Icons.delete_outline,
                  valueByType(booking.type!, kOrganicRecycle, kPlasticRecycle)),
              booking.status! >= 3
                  ? itemBody(IconData(0xf24e, fontFamily: 'MaterialIcons'), booking.money.toString() + ' VNĐ')
                  : const SizedBox(),
              booking.status! >= 3
                  ? itemBody(IconData(0xe235, fontFamily: 'MaterialIcons'), booking.mass.toString() + ' kg')
                  : const SizedBox(),
              booking.noteSeller != null && booking.noteSeller != ''
                  ? itemBody(Icons.event_note, booking.noteSeller!.trim())
                  : SizedBox(),
              const Divider(),
              itemBody(statusIcon(booking.status!),
                  statusString(booking.status!),
                  colorIcon: statusColor(booking.status!)),
            ],
          ),
        );
  }

  Padding itemBody(IconData icon, String data, {colorIcon = kGreenColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: size8, horizontal: size8 / 2),
      child: Row(
        children: [
          Icon(
            icon,
            color: colorIcon,
            size: size18,
          ),
          const SizedBox(
            width: size12,
          ),
          Expanded(
            child: Text(
              data,
              style: const TextStyle(
                  fontSize: size12,
                  fontWeight: FontWeight.w500,
                  color: kBlackColor),
            ),
          )
        ],
      ),
    );
  }

  Text labelTab() {
    return Text(
      kInfoBooking,
      style: TextStyle(fontSize: size18, fontWeight: FontWeight.w700),
    );
  }
}
