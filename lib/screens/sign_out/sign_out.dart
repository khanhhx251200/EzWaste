import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:recycle_app/core/auth_provider.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';
import 'package:recycle_app/core/constants/strings_constant.dart';

import '../../size_config.dart';

signOut(BuildContext context) async {
  bool resLogout = await context.read<AuthProvider>().logout(context);
  print('đăng xuất: ' + resLogout.toString());
}

void openSignOutDrawer(BuildContext context) {
  showModalBottomSheet(
      backgroundColor: kPrimaryColor,
      context: context,
      builder: (context) {
        return buildLogOut(context);
      });
}

Container buildLogOut(BuildContext context) {
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
                  borderRadius: BorderRadius.circular(size8),
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
                  borderRadius: BorderRadius.circular(size8),
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
}
