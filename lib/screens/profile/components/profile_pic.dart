import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/home/provider/home_provider.dart';
import 'package:shop_app/screens/profile_information/profile_information_screen.dart';

class ProfilePic extends StatelessWidget {
  ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, ProfileInformationScreen.routeName),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("assets/images/profile.png"),
          ),
          SizedBox(width: size8),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.read<HomeProvider>().userInfo!.fullName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kBlackColor,
                    fontSize: size16),
              ),
              SizedBox(height: size8),
              Text(
                context.read<HomeProvider>().userInfo!.userName!,
                style: TextStyle(color: kTextColor, fontSize: size12),
              )
            ],
          ))
        ],
      ),
    );
  }
}
