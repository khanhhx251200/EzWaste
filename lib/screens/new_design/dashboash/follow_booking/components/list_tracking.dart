import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/booking.dart';
import 'package:shop_app/screens/new_design/dashboash/follow_booking/provider/booking_provider.dart';

import 'item_tracking.dart';

class ListTracking extends StatefulWidget {
  const ListTracking({Key? key}) : super(key: key);

  @override
  State<ListTracking> createState() => _ListTrackingState();
}

class _ListTrackingState extends State<ListTracking> {
  @override
  void initState() {
    super.initState();

    Provider.of<BookingProvider>(context, listen: false).getBookings();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Consumer<BookingProvider>(
      builder: (context, provider, child) => Container(
        width: _size.width,
        child: provider.listBooking.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: provider.listBooking.length,
                itemBuilder: (context, index) {
                  final Booking order = provider.listBooking[index];
                  return ItemTracking(booking: order);
                },
              )
            : Center(
                child: const Text('Không có lịch thu gom'),
              ),
      ),
    );
  }
}
