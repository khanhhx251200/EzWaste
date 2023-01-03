import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/components/fab_bottom_appbar.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/screens/booking/booking_screen.dart';
import 'package:shop_app/screens/edit_profile/edit_profile_screen.dart';
import 'package:shop_app/screens/home/activities/activities_page.dart';
import 'package:shop_app/screens/home/components/wallet_and_points.dart';
import 'package:shop_app/screens/home/provider/home_provider.dart';
import 'package:shop_app/screens/learderboard/leaderboard_screen.dart';
import 'package:shop_app/screens/notifications/notifications_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/profile_information/profile_information_screen.dart';
import 'package:shop_app/screens/sell/sell_screen.dart';

import 'components/body.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabs = 0;
  Widget? currentPage;
  final PageStorageBucket _bucket = PageStorageBucket();
  double heightAppBar = 200;

  List<Widget> pages = [
    Body(),
    NotificationsScreen(),
    ActivitiesPage(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    currentPage = pages[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: currentTabs == 0
          ? PreferredSize(
              preferredSize: Size.fromHeight(heightAppBar), child: appBarHome())
          : null,
      body: PageStorage(bucket: _bucket, child: currentPage!),
      backgroundColor: Colors.white,
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: '',
        color: Colors.grey,
        backgroundColor: Colors.white,
        selectedColor: kPrimaryColor,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: onTapHandler,
        items: [
          FABBottomAppBarItem(iconData: Icons.home, text: kHome),
          FABBottomAppBarItem(
              iconData: Icons.local_activity, text: 'Hoạt động'),
          FABBottomAppBarItem(
              iconData: Icons.emoji_events_sharp, text: kCharts),
          FABBottomAppBarItem(iconData: Icons.menu, text: kMenu),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kWhiteColor,
        elevation: 2,
        onPressed: () => Navigator.pushNamed(context, BookingScreen.routeName),
        child: Padding(
          padding: const EdgeInsets.all(size8),
          child: Image.asset(
            'assets/icons/logo_waste.png',
          ),
        ),
      ),
    );
  }

  AppBar appBarHome() {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
          onPressed: () =>
              Navigator.pushNamed(context, ProfileInformationScreen.routeName),
          icon: Icon(
            Icons.perm_identity,
            color: kWhiteColor,
          )),
      title: Image.asset(
        'assets/images/ez_waste_appbar.png',
        height: heightAppBar / 2,
        width: heightAppBar / 2,
      ),
      titleSpacing: 0,
      actions: [
        GestureDetector(
          onTap: () {
            showDialogWallet(context);
          },
          child: SvgPicture.asset(
            'assets/icons/Cash.svg',
            color: kPrimaryColor,
          ),
        ),
        iconNotification()
      ],
      flexibleSpace: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        ),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bgr.jpg'),
                  fit: BoxFit.fill)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacer(),
              Text('${getWelcomeCustomer()},',
                  style: TextStyle(fontSize: size18, color: kWhiteColor)),
              Text(context.read<HomeProvider>().userInfo!.fullName,
                  style: TextStyle(
                      fontSize: 32,
                      color: kWhiteColor,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }

  InkWell iconNotification() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NotificationsScreen.routeName);
      },
      child: Container(
        width: 48,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/icons/bell.svg',
                  color: kWhiteColor,
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 2),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    '99',
                    style: TextStyle(fontSize: size10),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  showDialogWallet(BuildContext context) async {
    await showGeneralDialog(
        context: context,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return Align(
              alignment: Alignment.topCenter,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                margin: const EdgeInsets.only(top: 150),
                elevation: 24,
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.all(size8),
                    decoration: const BoxDecoration(
                      color: kWhiteColor,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        WalletAndPoints(),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Đóng',
                              style: TextStyle(color: kPrimaryColor)),
                        )
                      ],
                    )),
              ));
        },
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierDismissible: true,
        barrierColor: Colors.transparent.withOpacity(0.3),
        transitionDuration: const Duration(milliseconds: 350));
  }

  String getWelcomeCustomer() {
    DateTime currentDate = DateTime.now();
    final hourNow = currentDate.hour;
    if (hourNow >= 5 && hourNow <= 11) {
      return 'Chào buổi sáng';
    } else if (hourNow > 11 && hourNow <= 17) {
      return 'Chào buổi chiều';
    } else {
      return 'Buổi tối vui vẻ';
    }
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        buildBottomNavigationBarItem(0, kHome, Icons.home),
        buildBottomNavigationBarItem(1, kNotifications, Icons.notifications),
        buildBottomNavigationBarItem(2, kHistory, Icons.update),
        buildBottomNavigationBarItem(3, kMe, Icons.person),
      ],
      onTap: (int index) {
        onTapHandler(index);
      },
    );
  }

  Widget getBody() {
    return pages[currentTabs];
  }

  onTapHandler(int index) {
    setState(() {
      currentTabs = index;
      currentPage = pages[index];
    });
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
      int index, String title, IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: currentTabs == index ? kPrimaryColor : kGreyColor,
      ),
      title: Text(title,
          style: TextStyle(
              color: currentTabs == index ? kPrimaryColor : kGreyColor,
              fontSize: size12)),
    );
  }

  Container buildBottom() {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: itemMenu(0, kHome, Icons.home)),
          Expanded(child: itemMenu(1, kNotifications, Icons.notifications)),
          Expanded(child: itemMenu(2, kHistory, Icons.update)),
          Expanded(child: itemMenu(3, kMe, Icons.person)),
        ],
      ),
    );
  }

  Widget itemMenu(int index, String title, IconData icon) {
    return MaterialButton(
      minWidth: 40,
      onPressed: () {
        setState(() {
          currentTabs = index;
          print('hehe: ${pages[index]}');
          currentPage = pages[index];
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: currentTabs == index ? kPrimaryColor : kGreyColor,
          ),
          Text(title,
              style: TextStyle(
                  color: currentTabs == index ? kPrimaryColor : kGreyColor,
                  fontSize: size12))
        ],
      ),
    );
  }
}
