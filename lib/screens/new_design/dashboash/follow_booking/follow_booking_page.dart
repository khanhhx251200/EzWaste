import 'package:flutter/material.dart';
import 'package:shop_app/components/title_page.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/screens/new_design/dashboash/follow_booking/components/body.dart';

class FollowBookingPage extends StatelessWidget {
  const FollowBookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: const [
          TitlePage(title: kFollowBooking),
          Expanded(
            child: Body(),
          )
        ],),
    );
  }
}
