import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:shop_app/core/auth_provider.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/key_constant.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/screens/change_password/change_password_screen.dart';
import 'package:shop_app/screens/history/history_screen.dart';
import 'package:shop_app/screens/login/components/verify_biometric/verify_biometric.dart';
import 'package:shop_app/screens/new_design/dashboash/dashboash_screen.dart';
import 'package:shop_app/services/share_preferences_service.dart';
import 'package:shop_app/size_config.dart';
import 'package:provider/provider.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          // ProfileMenu(
          //   urlImage: 'assets/icons/Cart Icon.svg',
          //   text: 'Đơn hàng ',
          //   press: () {
          //     nextToCollectionHistory(context);
          //   },
          //   isMember: false,
          // ),
          ProfileMenu(
            urlImage: 'assets/icons/Lock.svg',
            text: kChangePassword,
            press: () {
              Navigator.pushNamed(context, ChangePasswordScreen.routeName);
            },
            isMember: false,
          ),
          VerifyAuthenticate(),
          Divider(height: 2, color: kGreyColor),
          ProfileMenu(
            urlImage: 'assets/icons/Log out.svg',
            text: kLogOut,
            press: () => _openSignOutDrawer(context),
            isMember: false,
          ),
        ],
      ),
    );
  }

  logout(BuildContext context) async {
    bool resLogout = await context.read<AuthProvider>().logout(context);
    print('đăng xuất: ' + resLogout.toString());
  }

  nextToCollectionHistory(context) {
    Navigator.of(context).pushNamed(HistoryScreen.routeName);
  }

  void _openSignOutDrawer(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: kPrimaryColor,
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.only(
              top: size8,
              bottom: 0,
              left: 24,
              right: 24,
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
                      child: MaterialButton(
                        onPressed: () {
                          logout(context);
                        },
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
                    SizedBox(width: getProportionateScreenWidth(size20)),
                    Expanded(
                      child: OutlineButton(
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
                  ],
                ),
              ],
            ),
          );
        });
  }
}
