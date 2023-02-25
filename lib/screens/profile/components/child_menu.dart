import 'package:flutter/material.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';

class ChildMenu extends StatelessWidget {
  const ChildMenu({Key? key, required this.text, required this.press,required this.notification, required this.icon}) : super(key: key);
  final String text;
  final VoidCallback press;
  final int notification;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Positioned(child: Icon(icon, size: 48 ,color: kTextColor,)),
            Visibility(
              visible: notification > 0,
              child: Positioned(
                right: -2,
                top: -2,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kWhiteColor,
                  ),
                  padding: EdgeInsets.all(2),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kPrimaryColor,
                    ),
                    child: Text('$notification', style: TextStyle(color: kWhiteColor, fontSize: size12)),
                  ),
                ),
              ),
            ),
          ],
        ),
        Text(text, style: TextStyle( fontSize: size12))
      ],
    );
  }
}
