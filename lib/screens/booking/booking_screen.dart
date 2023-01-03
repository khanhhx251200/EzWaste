import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/screens/booking/components/body_booking.dart';

class BookingScreen extends StatefulWidget {
  static String routeName = "/booking";

  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(FontAwesomeIcons.chevronLeft, size: size20,)),
        title: Text(
          kBookingPlastic,
          style: TextStyle(color: kBlackColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: BodyBooking(),
    );
  }
}
