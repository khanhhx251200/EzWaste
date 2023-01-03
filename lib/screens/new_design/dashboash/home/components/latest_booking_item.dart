import 'package:flutter/material.dart';
import 'package:shop_app/components/decoration_border_shadow.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';

class LatestBookingItem extends StatelessWidget {
  const LatestBookingItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: size36),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: size16),
            child: Text(
              'Ngày 01/11/2022',
              style: TextStyle(color: kWhiteColor, fontSize: size12),
            ),
          ),
          Container(
            width: 220,
            decoration: boxDecorationShadow(),
            child: ListTile(
              leading: Container(
                padding: EdgeInsets.all(size8),
                height: 54,
                width: 54,
                child: CircleAvatar(
                  backgroundImage:
                  AssetImage("assets/images/user_empty.png"),
                ),
              ),
              title: Text(
                'Nguyễn Văn A',
                style: TextStyle(
                    fontWeight: FontWeight.w700, fontSize: size14),
              ),
              subtitle: Text(
                '0328962512',
                style: TextStyle(fontSize: size14),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: size16),
            child: Text(
              "Loại rác: ${'Sinh hoạt'}",
              style: TextStyle(color: kWhiteColor, fontSize: size12),
            ),
          ),
        ],
      ),
    );
  }
}
