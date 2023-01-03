import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/screens/home/provider/home_provider.dart';
import 'package:shop_app/size_config.dart';

import 'package:provider/provider.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.isMember,
    this.urlImage,
    this.press,
    this.isMoney,
  }) : super(key: key);

  final String text;
  final VoidCallback? press;
  final bool isMember;
  final bool? isMoney;
  final String? urlImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: kPrimaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(size8)),
        ),
        onPressed: press,
        child: Row(
          children: [
            urlImage != null
                ? Container(
                    width: 40,
                    child: SvgPicture.asset(urlImage!,
                        color: text == kLogOut ? kErrorSecondColor : kPrimaryColor))
                : SizedBox(width: 40,),
            SizedBox(width: size14),
            Expanded(
                child: Text(
                  text,
                  style: TextStyle(color: text == kLogOut ? kErrorSecondColor : kBlackColor),
                )),
            Visibility(
                visible: isMember,
                child: Row(
                  children: [
                    Text('0 Điểm', style: TextStyle(color: kTextColor)),
                    SizedBox(width: getProportionateScreenWidth(4)),
                    CircleAvatar(
                      radius: 10,
                      child: Icon(
                        Icons.emoji_events_sharp,
                        color: kWhiteColor,
                        size: size12,
                      ),
                      backgroundColor: kPrimaryColor,
                    ),
                  ],
                )),
            isMoney != null
                ? Visibility(
                    visible: isMoney!,
                    child: Row(
                      children: [
                        Text(
                            '${context.read<HomeProvider>().userInfo!.moneySeller!.toStringAsFixed(0)} đ',
                            style: TextStyle(color: kTextColor)),
                        SizedBox(width: getProportionateScreenWidth(4)),
                        CircleAvatar(
                          radius: 10,
                          child: Icon(
                            Icons.attach_money,
                            color: kWhiteColor,
                            size: size12,
                          ),
                          backgroundColor: kPrimaryColor,
                        ),
                      ],
                    ))
                : Container(),
            SizedBox(width: getProportionateScreenWidth(4)),
           text == kLogOut ? SizedBox() : Icon(
              Icons.arrow_forward_ios,
              size: size12,
              color: kBlackColor,
            ),
          ],
        ),
      ),
    );
  }
}
