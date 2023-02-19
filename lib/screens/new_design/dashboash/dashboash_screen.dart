import 'package:flutter/material.dart';
import 'package:shop_app/components/fab_bottom_appbar.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/screens/booking/components/body_booking.dart';
import 'package:shop_app/screens/home/activities/activities_page.dart';
import 'package:shop_app/screens/new_design/dashboash/account/account_screen.dart';
import 'package:shop_app/screens/new_design/dashboash/components/appbar_dashboard.dart';
import 'package:shop_app/screens/new_design/dashboash/follow_booking/follow_booking_page.dart';
import 'package:shop_app/screens/new_design/dashboash/home/home_page.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';

class DashBoardScreen extends StatefulWidget {
  static final String routeName = "/dashboard";

  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  GlobalKey keyBottomBar = GlobalKey();

  final double heightAppBar = 60;
  int currentTabs = 0;
  Widget? currentPage;
  final PageStorageBucket _bucket = PageStorageBucket();
  Color colorUnselected = kGrey75Color;

  List<Widget> pages = [
    HomePage(),
    FollowBookingPage(),
    ActivitiesPage(),
    AccountScreen(),
  ];

  @override
  void initState() {
    currentPage = pages[0];
    super.initState();
  }

  _onTapHandler(int index) {
    setState(() {
      currentTabs = index;
      currentPage = pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: currentTabs != pages.length - 1
          ? PreferredSize(
              preferredSize: Size.fromHeight(heightAppBar),
              child: AppbarDashboard())
          : null,
      body: SafeArea(child: PageStorage(bucket: _bucket, child: currentPage!)),
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: '',
        color: Colors.grey,
        backgroundColor: Colors.white,
        selectedColor: kPrimaryColor,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _onTapHandler,
        items: [
          FABBottomAppBarItem(iconData: Icons.view_quilt, text: kHome),
          FABBottomAppBarItem(iconData: Icons.timelapse, text: kFollow),
          FABBottomAppBarItem(iconData: Icons.pie_chart, text: kCharts),
          FABBottomAppBarItem(iconData: Icons.menu, text: kMenu),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kWhiteColor,
        elevation: 2,
        onPressed: () => Navigator.pushNamed(context, BodyBooking.routeName),
        child: Padding(
          padding: EdgeInsets.all(size8),
          child: Image.asset(
            'assets/icons/logo_waste.png',
          ),
        ),
      ),
    );
  }

  BottomNavigationBar bottomNewDesign() {
    return BottomNavigationBar(
      key: keyBottomBar,
      elevation: 4,
      backgroundColor: colorUnselected,
      selectedIconTheme: IconThemeData(color: kGreenColor, size: 32),
      selectedLabelStyle:
          TextStyle(color: kGreenColor, fontWeight: FontWeight.bold),
      selectedItemColor: kGreenColor,
      unselectedItemColor: colorUnselected,
      unselectedLabelStyle: TextStyle(color: colorUnselected),
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.view_quilt,
          ),
          label: kHome,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wysiwyg),
          label: kCreateOrder,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.timelapse),
          label: kFollow,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pie_chart),
          label: kChart,
        ),
      ],
      onTap: _onTapHandler,
      currentIndex: currentTabs,
    );
  }
}
