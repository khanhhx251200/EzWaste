import 'package:flutter/material.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';
import 'package:recycle_app/screens/new_design/dashboash/account/components/wallet/action_box.dart';

class ActionVertical extends StatelessWidget {
  const ActionVertical({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ActionBox(icon: icon),
        SizedBox(
          height: size8,
        ),
        Center(
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: size12),
          ),
        )
      ],
    );
  }
}

