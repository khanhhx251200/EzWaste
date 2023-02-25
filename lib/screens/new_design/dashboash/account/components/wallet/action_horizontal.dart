import 'package:flutter/material.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';
import 'package:recycle_app/screens/new_design/dashboash/account/components/wallet/action_box.dart';

class ActionHorizontal extends StatelessWidget {
  ActionHorizontal({
    Key? key,
    required this.title,
    required this.icon,
    required this.onClickAction,
    this.subTitle = '',
  }) : super(key: key);
  final String title;
  final String subTitle;
  final IconData icon;
  final VoidCallback onClickAction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClickAction == null ? null : () => onClickAction(),
      child: Row(
        children: [
          ActionBox(icon: icon),
          SizedBox(
            width: size16,
          ),
          Expanded(child: Text(title)),
          Text(
            subTitle,
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
