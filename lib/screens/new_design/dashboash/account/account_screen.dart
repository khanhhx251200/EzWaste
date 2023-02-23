import 'package:flutter/material.dart';
import 'package:shop_app/core/auth_provider.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/screens/new_design/dashboash/account/components/rank_in_accout.dart';
import 'package:shop_app/screens/new_design/dashboash/account/components/wallet/extension_child.dart';
import 'package:shop_app/screens/new_design/dashboash/account/components/wallet/my_wallet/my_wallet_screen.dart';
import 'package:shop_app/screens/new_design/dashboash/account/components/wallet/other_child.dart';
import 'package:shop_app/screens/new_design/dashboash/account/components/wallet/surplus_child.dart';
import 'package:shop_app/screens/new_design/dashboash/account/components/wallet/account_box.dart';
import 'package:shop_app/screens/new_design/dashboash/account/components/weather_and_date_now.dart';
import 'package:shop_app/screens/profile/components/profile_pic.dart';
import 'package:shop_app/size_config.dart';
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
        onPressed: () => _openSignOutDrawer(context),
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

  signOut(BuildContext context) async {
    bool resLogout = await context.read<AuthProvider>().logout(context);
    print('đăng xuất: ' + resLogout.toString());
  }

  void _openSignOutDrawer(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: kPrimaryColor,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(size32),
              topRight: Radius.circular(size32)),
        ),
        builder: (context) {
          return Container(
            padding: const EdgeInsets.only(
              top: size16,
              bottom: 0,
              left: 24,
              right: 24,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(size16)),
            ),
            height: getProportionateScreenHeight(150),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: context.read<AuthProvider>().userInfo.fullName,
                      style: TextStyle(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          fontSize: size18,
                          fontWeight: FontWeight.w600)),
                  TextSpan(
                    text: ", bạn có chắc chắn muốn đăng xuất không?",
                    style: TextStyle(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontSize: size16,
                        fontWeight: FontWeight.w300),
                  )
                ])),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: OutlineButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(size12),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        borderSide: BorderSide(
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          "Ở lại",
                          style: TextStyle(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: getProportionateScreenWidth(size20)),
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          signOut(context);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(size12),
                        ),
                        color: Colors.white,
                        child: Text(
                          kLogOut,
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
