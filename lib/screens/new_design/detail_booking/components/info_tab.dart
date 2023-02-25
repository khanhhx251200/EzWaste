import 'package:flutter/material.dart';
import 'package:recycle_app/components/decoration_border_shadow.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';
import 'package:recycle_app/core/constants/strings_constant.dart';
import 'package:recycle_app/models/booking.dart';

class InfoBookingTab extends StatelessWidget {
  const InfoBookingTab({Key? key, required this.booking}) : super(key: key);
  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [labelTab(), contentTab(context)],
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
              Icons.date_range, convertTimeStampToString(booking.dateBooking!),
              colorIcon:
                  valueByType(booking.type, kOrganicColor, kPlasticColor)),
          itemBody(Icons.location_on, booking.address!,
              colorIcon:
                  valueByType(booking.type, kOrganicColor, kPlasticColor)),
          itemBody(Icons.delete_outline,
              valueByType(booking.type, kOrganicRecycle, kPlasticRecycle),
              colorIcon:
                  valueByType(booking.type, kOrganicColor, kPlasticColor)),
          booking.status! >= 3
              ? itemBody(const IconData(0xf24e, fontFamily: 'MaterialIcons'),
                  booking.money.toString() + ' VNĐ',
                  colorIcon:
                      valueByType(booking.type, kOrganicColor, kPlasticColor))
              : const SizedBox(),
          booking.status! >= 3
              ? itemBody(const IconData(0xe235, fontFamily: 'MaterialIcons'),
                  booking.mass.toString() + ' kg',
                  colorIcon:
                      valueByType(booking.type, kOrganicColor, kPlasticColor))
              : const SizedBox(),
          booking.noteSeller != null && booking.noteSeller != ''
              ? itemBody(Icons.event_note, booking.noteSeller!.trim(),
                  colorIcon:
                      valueByType(booking.type, kOrganicColor, kPlasticColor))
              : SizedBox(),
          const Divider(),
          itemBody(statusIcon(booking.status!), statusString(booking.status!),
              colorIcon: statusColor(booking.status!)),
        ],
      ),
    );
  }

  Padding itemBody(IconData icon, String data, {colorIcon = kGreenColor}) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: size8, horizontal: size8 / 2),
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
