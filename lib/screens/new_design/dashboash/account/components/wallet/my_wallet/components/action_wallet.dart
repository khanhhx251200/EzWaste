import 'package:flutter/material.dart';
import 'package:recycle_app/core/constants/size_constants.dart';

class ActionMyWallet extends StatelessWidget {
  const ActionMyWallet({
    Key? key,
    required this.title,
    required this.iconPath,
    required this.press,
  }) : super(key: key);
  final String title;
  final String iconPath;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Image.asset(
            iconPath,
            height: size36,
            width: size36,
          ),
          SizedBox(
            height: size8,
          ),
          Text(title)
        ],
      ),
    );
  }
}
