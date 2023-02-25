import 'package:flutter/material.dart';
import 'package:recycle_app/core/auth_provider.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';
import 'package:provider/provider.dart';
import 'package:recycle_app/screens/profile_information/profile_information_screen.dart';

class ProfilePic extends StatelessWidget {
  ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, ProfileInformationScreen.routeName),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: size32,
              backgroundImage: AssetImage("assets/images/profile.png"),
            ),
            SizedBox(height: size12),
            Text(
              context.read<AuthProvider>().userInfo.fullName,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: size16),
            ),
            SizedBox(height: size8),
            Text(
              context.read<AuthProvider>().userInfo.userName!,
              style: TextStyle(color: kTextColor, fontSize: size14),
            )
          ],
        ),
      ),
    );
  }
}
