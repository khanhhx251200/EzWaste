import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';

class IconNotification extends StatelessWidget {
  const IconNotification({
    Key? key, required this.radius,
  }) : super(key: key);
  final double radius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: kWhiteColor,
      child: Icon(
        Icons.notifications,
        color: kPrimaryColor,
      ),
    );
  }
}
