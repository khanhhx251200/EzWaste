import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/screens/booking/components/table_choose_time.dart';
import 'package:shop_app/screens/new_design/dashboash/components/appbar_dashboard.dart';

class BodyBooking extends StatefulWidget {
  static const String routeName = '/booking';
  const BodyBooking({Key? key}) : super(key: key);

  @override
  State<BodyBooking> createState() => _BodyBookingState();
}

class _BodyBookingState extends State<BodyBooking> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60), child: AppbarDashboard()),
      body: Container(
        height: _size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background_booking.png'),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: Column(
            children: [
              textChooseTime(_size),
              Expanded(child: TableChooseTimeBooking())
            ],
          ),
        ),
      ),
    );
  }

  Container textChooseTime(Size _size) {
    return Container(
      height: _size.height * 0.08,
      width: _size.width,
      color: kPrimaryColor,
      child: Center(
          child: Text(
        kChooseTimeBooking,
        style: TextStyle(color: kWhiteColor, fontSize: size18),
      )),
    );
  }
}
