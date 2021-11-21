import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';

import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Body(),
    );
  }
}
