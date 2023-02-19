import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/loading_widget.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/models/booking.dart';
import 'package:shop_app/screens/new_design/dashboash/follow_booking/provider/booking_provider.dart';

import 'item_tracking.dart';

class ListTracking extends StatefulWidget {
  const ListTracking({Key? key}) : super(key: key);

  @override
  State<ListTracking> createState() => _ListTrackingState();
}

class _ListTrackingState extends State<ListTracking> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        getBookings();
      }
    });
    refresh();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future getBookings() async {
    await Provider.of<BookingProvider>(context, listen: false)
        .getBookings();
  }

  Future refresh() async {
    BookingProvider provider =
        Provider.of<BookingProvider>(context, listen: false);
    provider.resetSort();
    provider.resetStatus();
    provider.resetTypes();
    provider.clearBookings();
    provider.setPage(1);
    await provider.getBookings();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Consumer<BookingProvider>(
      builder: (context, provider, child) => Container(
        width: _size.width,
        child: provider.listBooking.isNotEmpty
            ? RefreshIndicator(
                onRefresh: () => refresh(),
                child: ListView.builder(
                  controller: scrollController,
                  shrinkWrap: true,
                  itemCount: provider.totalRecords == provider.listBooking.length ? provider.listBooking.length :  provider.listBooking.length + 1,
                  itemBuilder: (context, index) {
                    if (index < provider.listBooking.length) {
                      final Booking order = provider.listBooking[index];
                      return ItemTracking(booking: order);
                    } else {
                      return LoadingWidget(color: kPrimaryColor);
                    }
                  },
                ),
              )
            : Center(
                child: const Text('Không có lịch thu gom'),
              ),
      ),
    );
  }
}
