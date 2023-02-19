import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/screens/new_design/dashboash/account/components/rank_in_accout.dart';
import 'package:shop_app/screens/new_design/dashboash/account/components/wallet/extension_child.dart';
import 'package:shop_app/screens/new_design/dashboash/account/components/wallet/other_child.dart';
import 'package:shop_app/screens/new_design/dashboash/account/components/wallet/surplus_child.dart';
import 'package:shop_app/screens/new_design/dashboash/account/components/wallet/wallet_box.dart';
import 'package:shop_app/screens/new_design/dashboash/account/components/weather_and_date_now.dart';
import 'package:shop_app/screens/profile/components/profile_pic.dart';

class AccountScreen extends StatelessWidget {
  static final routeName = "/account";

  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
            child: Container(
          color: kBackgroundGreyColor,
          padding: EdgeInsets.only(bottom: size32),
          child: Column(
            children: [
              headerAccount(),
              WalletBox(
                titleBox: "Số dư ví",
                childBox: SurplusChild(),
                subTitleBox: "1,127đ",
              ),
              WalletBox(titleBox: "Tiện ích", childBox: ExtensionChild()),
              WalletBox(titleBox: "Khác", childBox: OtherChild())
            ],
          ),
        )),
      ),
    );
  }

  Container headerAccount() {
    return Container(
      color: kWhiteColor,
      margin: EdgeInsets.only(bottom: size8 / 2),
      padding: EdgeInsets.symmetric(vertical: size8),
      child: Column(
        children: [
          WeatherAndDateNow(),
          ProfilePic(),
          RankInAccount(),
        ],
      ),
    );
  }
}
