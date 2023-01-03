import 'package:flutter/material.dart';

import 'latest_booking_item.dart';

class ListLatestBooking extends StatelessWidget {
  const ListLatestBooking({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 12,
        itemBuilder: (context, index) => LatestBookingItem(),
      ),
    );
  }
}
