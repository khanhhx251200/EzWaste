import 'package:flutter/material.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';

class ActionBox extends StatelessWidget {
  const ActionBox({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(size16)),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(color: kBackgroundGreyColor),
        child: Icon(icon, size: size20, color: kTextColor,),
      ),
    );
  }
}
