import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recycle_app/core/auth_provider.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';
import 'package:recycle_app/core/constants/strings_constant.dart';

class WalletBalance extends StatelessWidget {
  const WalletBalance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: size24,),
        Text(
          kWalletBalance,
          style: Theme
              .of(context)
              .textTheme
              .headline6!
              .copyWith(
              color: kWhiteColor.withOpacity(0.5), fontSize: size16),
        ),
        Text(
          convertNumberToCurrency(Provider.of<AuthProvider>(context).userInfo.moneySeller),
          style: Theme
              .of(context)
              .textTheme
              .headline4!
              .copyWith(
              color: kWhiteColor),
        ),
      ],
    );
  }
}
