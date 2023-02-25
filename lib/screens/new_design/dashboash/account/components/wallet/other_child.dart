import 'package:flutter/material.dart';
import 'package:recycle_app/core/constants/size_constants.dart';
import 'package:recycle_app/core/constants/strings_constant.dart';
import 'package:recycle_app/screens/change_password/change_password_screen.dart';
import 'package:recycle_app/screens/login/components/verify_biometric/verify_biometric.dart';
import 'package:recycle_app/screens/new_design/dashboash/account/components/wallet/action_horizontal.dart';
import 'package:url_launcher/url_launcher.dart';


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
            icon: Icons.password,
            title: kChangePassword,
            onClickAction: () => Navigator.pushNamed(context, ChangePasswordScreen.routeName),
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
}
