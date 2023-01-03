import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';

class InfoShipper extends StatelessWidget {
  const InfoShipper({Key? key, required this.fullName, required this.userName})
      : super(key: key);
  final String fullName;
  final String userName;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        children: [
          Text(
            kInfoShipper,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: size18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: size36,
          ),
          CircleAvatar(
            radius: _size.height * 0.05,
            child: Image.asset(
              'assets/images/Profile Image.png',
              height: _size.height * 0.3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              fullName,
              style: TextStyle(
                  color: kGrey75Color,
                  fontSize: size20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            userName,
            style: TextStyle(color: kSecondaryTextColor),
          ),
        ],
      ),
    );
  }
}
