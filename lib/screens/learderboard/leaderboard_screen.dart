import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/function_in_development.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/screens/learderboard/components/body.dart';
import 'package:shop_app/screens/learderboard/provider/leaderboard_provider.dart';
import 'package:shop_app/screens/sell/components/style_title.dart';

class LeaderboardScreen extends StatefulWidget {
  static String routeName = '/leaderboard';

  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  _LeaderboardScreenState createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen>
    with TickerProviderStateMixin {
  late TabController _tabParentController;
  late TabController _tabChildController;
  int indexTabParent = 0;
  dynamic color = kOrganicColor;
  bool isInDevelopment = true;

  @override
  void initState() {
    super.initState();
    _tabParentController = TabController(length: 2, vsync: this);
    _tabChildController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabParentController.dispose();
    _tabChildController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LeaderBoardProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: kWhiteColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: indexTabParent == 0 ? kOrganicColor : kPlasticColor,
            title: Text(kLeaderboard, style: styleTitleAppBar()),
          ),
          body: isInDevelopment ? FunctionInDevelopment() :  SafeArea(
              child: Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size14, vertical: size8),
                  color: indexTabParent == 0 ? kOrganicColor : kPlasticColor,
                  child: buildTabBarParent(provider)),
              Expanded(
                child: TabBarView(
                  controller: _tabParentController,
                  children: [
                    // first tab bar view widget
                    buildTabChild(provider.currentColor, provider),
                    buildTabChild(provider.currentColor, provider),
                  ],
                ),
              ),
            ],
          )),
        );
      },
    );
  }

  Column buildTabChild(color, LeaderBoardProvider provider) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.symmetric(
                horizontal: size14, vertical: size8),
            color: indexTabParent == 0 ? kOrganicColor : kPlasticColor,
            child: buildTabBarChild(provider)),
        Expanded(
          child: TabBarView(
            controller: _tabChildController,
            children: [
              // first tab bar view widget
              Body(type: 1),
              Body(type: 2),
              Body(type: 3),
            ],
          ),
        ),
      ],
    );
  }

  Container buildTabBarChild(LeaderBoardProvider provider) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: kWarningColor,
        borderRadius: BorderRadius.circular(
          25.0,
        ),
      ),
      child: TabBar(
        controller: _tabChildController,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(24), color: kWhiteColor),
        labelColor: kWarningColor,
        unselectedLabelColor: kWhiteColor.withOpacity(0.7),
        padding: EdgeInsets.all(4),
        onTap: (value) async {
          String typeDate = DAY;
          if (value == 0) {
            typeDate = DAY;
          } else if (value == 1) {
            typeDate = MONTH;
          } else if (value == 2) {
            typeDate = YEAR;
          }
          provider.setTypeDate(typeDate);
          await provider.getList();
        },
        tabs: [
          Tab(
            text: 'Ngày',
          ),
          Tab(
            text: 'Tháng',
          ),
          Tab(
            text: 'Năm',
          ),
        ],
      ),
    );
  }

  Container buildTabBarParent(LeaderBoardProvider provider) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: indexTabParent == 0 ? kOrganicColor : kPlasticColor,
        borderRadius: BorderRadius.circular(
          25.0,
        ),
      ),
      child: TabBar(
        controller: _tabParentController,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(24), color: kWhiteColor),
        labelColor: indexTabParent == 0 ? kOrganicColor : kPlasticColor,
        unselectedLabelColor: kWhiteColor.withOpacity(0.7),
        padding: EdgeInsets.all(4),
        onTap: (value) {
          setState(() {
            indexTabParent = value;
          });
          provider.setTypeRecycle(value == 0 ? ORGANIC : PLASTIC);
          provider.getList();
        },
        tabs: [
          Tab(
            text: 'Rác sinh hoạt',
          ),
          Tab(
            text: 'Rác tái chế',
          ),
        ],
      ),
    );
  }
}
