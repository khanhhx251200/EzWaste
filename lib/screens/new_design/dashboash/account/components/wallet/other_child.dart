import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:shop_app/core/auth_provider.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/screens/login/components/verify_biometric/verify_biometric.dart';
import 'package:shop_app/screens/new_design/dashboash/account/components/wallet/action_horizontal.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../size_config.dart';

class OtherChild extends StatelessWidget {
  const OtherChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(size8),
      child: Column(
        children: [
          VerifyAuthenticate(),
          lineBetweenItem(),
          ActionHorizontal(
              icon: Icons.headset_mic_outlined,
              title: "Tổng đài CSKH",
              subTitle: '$kHotlineSupport',
              onClickAction: () => _makingLaunchUrl("tel:$kHotlineSupport")),
          lineBetweenItem(),
          ActionHorizontal(
              icon: Icons.mail,
              title: "Email",
              subTitle: kEmailSupport,
              onClickAction: () => _makingLaunchUrl("mailto:$kEmailSupport")),
          lineBetweenItem(),
          ActionHorizontal(
            icon: Icons.facebook,
            title: "Facebook",
            subTitle: kFacebookCompany,
              onClickAction: () => _makingLaunchUrl("https:$kFacebookCompany")
          ),
          lineBetweenItem(),
          ActionHorizontal(
            icon: Icons.logout_outlined,
            title: kLogOut,
            onClickAction: () => _openSignOutDrawer(context),
          ),
        ],
      ),
    );
  }

  Padding lineBetweenItem() {
    return Padding(
      padding: const EdgeInsets.only(top: size12, bottom: size12, left: size56),
      child: Divider(
        height: 1,
        thickness: 2,
      ),
    );
  }

  _makingLaunchUrl(uri) async {
    var url = Uri.parse(uri);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
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
