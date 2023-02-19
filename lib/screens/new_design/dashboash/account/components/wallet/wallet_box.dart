import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';

class WalletBox extends StatelessWidget {
  WalletBox(
      {Key? key,
      required this.titleBox,
      required this.childBox,
      this.subTitleBox = ''})
      : super(key: key);
  final String titleBox;
  final String subTitleBox;
  final Widget childBox;

  @override
  Widget build(BuildContext context) {
    return Container(
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
