import 'package:flutter/material.dart';
import 'package:shop_app/components/app_bar.dart';
import 'package:shop_app/components/loading_widget.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/models/booking.dart';
import 'package:shop_app/screens/new_design/dashboash/components/address_and_date.dart';
import 'package:shop_app/screens/new_design/dashboash/follow_booking/provider/booking_provider.dart';
import 'package:shop_app/screens/new_design/detail_booking/components/collection_tab.dart';
import 'package:shop_app/screens/new_design/detail_booking/components/info_tab.dart';
import 'package:provider/provider.dart';

class DetailBookingScreen extends StatefulWidget {
  static final String routeName = '/detail-booking';

  const DetailBookingScreen({Key? key}) : super(key: key);

  @override
  State<DetailBookingScreen> createState() => _DetailBookingScreenState();
}

class _DetailBookingScreenState extends State<DetailBookingScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int indexTabParent = 0;
  late Booking _booking;
  late int idBooking;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingProvider>(
      builder: (context, provider, child) => Scaffold(
        appBar: appBar(kInfoBooking),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(color: kWhiteColor),
            child: Column(
              children: [
                AddressAndDate(),
                buildTabBar(),
                provider.bookingDetail != null
                    ? Expanded(
                        child: TabBarView(
                        controller: _tabController,
                        children: [
                          InfoBookingTab(
                            booking: provider.bookingDetail!,
                          ),
                          CollectionTab(
                            booking: provider.bookingDetail!,
                          )
                        ],
                      ))
                    : LoadingWidget(color: kPrimaryColor)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildTabBar() {
    return Container(
      margin: EdgeInsets.all(size24),
      decoration: BoxDecoration(
        color: kGreenColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(size20),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(size20), color: kGreenColor),
        labelColor: kWhiteColor,
        unselectedLabelColor: kWhiteColor,
        onTap: (value) {
          setState(() {
            indexTabParent = value;
          });
        },
        tabs: [
          Tab(
            text: kBooking,
          ),
          Tab(
            text: kCollect,
          ),
        ],
      ),
    );
  }
}
