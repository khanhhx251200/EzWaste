import 'package:flutter/material.dart';
import 'package:recycle_app/core/auth_provider.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';
import 'package:recycle_app/core/constants/strings_constant.dart';
import 'package:recycle_app/screens/new_design/dashboash/account/components/rank_in_accout.dart';
import 'package:recycle_app/screens/new_design/dashboash/account/components/wallet/extension_child.dart';
import 'package:recycle_app/screens/new_design/dashboash/account/components/wallet/my_wallet/my_wallet_screen.dart';
import 'package:recycle_app/screens/new_design/dashboash/account/components/wallet/other_child.dart';
import 'package:recycle_app/screens/new_design/dashboash/account/components/wallet/surplus_child.dart';
import 'package:recycle_app/screens/new_design/dashboash/account/components/wallet/account_box.dart';
import 'package:recycle_app/screens/new_design/dashboash/account/components/weather_and_date_now.dart';
import 'package:recycle_app/screens/profile/components/profile_pic.dart';
import 'package:recycle_app/screens/sign_out/sign_out.dart';
import 'package:recycle_app/size_config.dart';
import 'package:provider/provider.dart';

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
              AccountBox(
                titleBox: kWalletBalance,
                childBox: SurplusChild(),
                subTitleBox: "1,127đ",
                onTap: () => Navigator.pushNamed(context, MyWalletScreen.routeName),
              ),
              AccountBox(titleBox: kExtension, childBox: ExtensionChild()),
              AccountBox(titleBox: kOther, childBox: OtherChild()),
              btnSignOut(context)
            ],
          ),
        )),
      ),
    );
  }

  Container btnSignOut(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size8, vertical: size8 / 2),
      decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.all(Radius.circular(size6))),
      child: MaterialButton(
        onPressed: () => openSignOutDrawer(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.logout_outlined,
              color: kOrganicColor,
            ),
            SizedBox(
              width: size8,
            ),
            Text(kLogOut)
          ],
        ),
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
