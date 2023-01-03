import 'package:flutter/material.dart';
import 'package:shop_app/screens/new_design/dashboash/follow_booking/components/filter_tracking.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/new_design/dashboash/follow_booking/provider/booking_provider.dart';
import 'list_tracking.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  void initState() {
    super.initState();
    initSearch();
  }

  initSearch() {
    final provider = Provider.of<BookingProvider>(context, listen: false);
    provider.resetTypes();
    provider.resetStatus();
    provider.resetSort();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        FilterTracking(),
        Flexible(child: ListTracking())
      ],
    );
  }
}
