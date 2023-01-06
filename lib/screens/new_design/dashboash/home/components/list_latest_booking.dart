import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/booking.dart';
import 'package:shop_app/screens/new_design/dashboash/home/provider/home_page_provider.dart';

import 'latest_booking_item.dart';

class ListLatestBooking extends StatefulWidget {
  const ListLatestBooking({
    Key? key,
  }) : super(key: key);

  @override
  State<ListLatestBooking> createState() => _ListLatestBookingState();
}

class _ListLatestBookingState extends State<ListLatestBooking> {

  @override
  void initState() {
    super.initState();
    Provider.of<HomePageProvider>(context, listen: false).getLateBookings();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: Provider.of<HomePageProvider>(context, listen: false).lateBookings.length,
        itemBuilder: (context, index) {
          final Booking item = Provider.of<HomePageProvider>(context, listen: false).lateBookings[index];
          return LatestBookingItem(booking: item,);
        },
      ),
    );
  }
}
