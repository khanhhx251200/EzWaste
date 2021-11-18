import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';

import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kSignIn),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: kPrimaryGradientColor),
          )
      ),
      body: Body(),
    );
  }
}
