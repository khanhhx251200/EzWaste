import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/new_design/dashboash/components/address_and_date.dart';
import 'package:shop_app/screens/new_design/dashboash/components/advertisement.dart';
import 'package:shop_app/screens/new_design/dashboash/home/provider/home_page_provider.dart';

import 'components/latest_booking.dart';
import 'components/news.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, value, child) => SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              AddressAndDate(),
              Advertisement(),
              LatestBooking(),
              News()
            ],
          ),
        ),
      ),
    );
  }
}

