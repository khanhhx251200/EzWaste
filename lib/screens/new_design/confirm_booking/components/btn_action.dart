import 'package:flutter/material.dart';
import 'package:recycle_app/components/default_button.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';
import 'package:recycle_app/core/constants/strings_constant.dart';
import 'package:recycle_app/models/booking.dart';
import 'package:recycle_app/screens/action_booking/components/access_booking.dart';
import 'package:recycle_app/screens/action_booking/components/refuse_booking_screen.dart';

class BtnActionConfirm extends StatelessWidget {
  const BtnActionConfirm({
    Key? key,
    required this.booking,
  }) : super(key: key);
  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: DefaultButton(
            text: kAgree,
            press: () => Navigator.pushNamed(
                context, AccessBookingScreen.routeName,
                arguments: booking),
          ),
        ),
        SizedBox(
          width: size16,
        ),
        Expanded(
          child: DefaultButton(
            text: kRefuse,
            color: kErrorColor,
            press: () => Navigator.pushNamed(
                context, RefuseBookingScreen.routeName,
                arguments: booking),
          ),
        ),
      ],
    );
  }
}
