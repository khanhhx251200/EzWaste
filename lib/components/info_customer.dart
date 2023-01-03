import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/models/booking.dart';

class InfoShipper extends StatelessWidget {
  const InfoShipper({
    Key? key,
    required this.booking,
  }) : super(key: key);

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset('assets/images/user_empty.png'),
      title: Text(
        booking.nameShipper!,
        style: const TextStyle(
            fontWeight: FontWeight.w500, color: kBlackColor),
      ),
      subtitle: Text(booking.phoneShipper!),
    );
  }
}
