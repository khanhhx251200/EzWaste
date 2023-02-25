import 'package:flutter/material.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';

class AccountBox extends StatelessWidget {
  AccountBox(
      {Key? key,
      required this.titleBox,
      required this.childBox,
      this.subTitleBox = '',
      this.onTap})
      : super(key: key);
  final String titleBox;
  final String subTitleBox;
  final Widget childBox;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: size8, vertical: size8 / 2),
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.all(Radius.circular(size6))),
        child: Column(
          children: [
            headerWallet(),
            Padding(
              padding: const EdgeInsets.all(size8),
              child: childBox,
            )
          ],
        ),
      ),
    );
  }

  ListTile headerWallet() {
    return ListTile(
      leading: Text(
        titleBox,
        style: TextStyle(color: kTextColor, fontSize: size12),
      ),
      trailing: subTitleBox != ''
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(subTitleBox),
                SizedBox(
                  width: size8,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: size16,
                )
              ],
            )
          : null,
    );
  }
}
