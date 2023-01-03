import 'package:flutter/material.dart';
import 'package:shop_app/components/app_bar.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/models/booking.dart';
import 'package:shop_app/screens/new_design/confirm_booking/components/body.dart';

class ConfirmBookingScreen extends StatelessWidget {
  static final String routeName = '/confirm-booking';

  const ConfirmBookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final booking = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Booking;
    return Scaffold(
      appBar: appBar(kConfirmRecycle),
      body: SafeArea(child: Body(booking: booking,)),
    );
  }
}
