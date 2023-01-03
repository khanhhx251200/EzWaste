import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/screens/new_design/confirm_booking/confirm_booking_screen.dart';

class AppbarDashboard extends StatelessWidget {
  const AppbarDashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading: IconButton(
      //   onPressed: () {},
      //   icon: Icon(Icons.menu),
      // ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Image.asset('assets/icons/logo_waste.png', height: 48),
      actions: [
        // GestureDetector(
        //   onTap: () => Navigator.pushNamed(context, ConfirmBookingScreen.routeName),
        //   child: SvgPicture.asset(
        //     "assets/icons/bell.svg",
        //     color: kGreenColor,
        //   ),
        // ),
        const SizedBox(
          width: size24,
        )
      ],
    );
  }
}
