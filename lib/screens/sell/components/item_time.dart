import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/models/time_sell.dart';
import 'package:shop_app/screens/sell/sell_provider.dart';

class ItemTime extends StatelessWidget {
  const ItemTime({Key? key, required this.timeSell, required this.provider})
      : super(key: key);
  final TimeSell timeSell;
  final SellProvider provider;

  @override
  Widget build(BuildContext context) {
    bool isCurrentDate =
        convertDateToString(provider.dateSellSelected!.dateTime) ==
            convertDateToString(DateTime.now());
    bool disableTimePassed = isCurrentDate
        ? DateTime.now().hour >= int.parse(timeSell.time!.split(":")[0])
        : false;
    return Container(
      alignment: Alignment.center,
      child: Text(timeSell.time!,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: timeSell.isSelected
                  ? disableTimePassed
                      ? kFourLightColor
                      : kWhiteColor
                  : kFourLightColor,
              fontSize: size14)),
      decoration: BoxDecoration(
          color: disableTimePassed
              ? kNoSelectButtonColor
              : timeSell.isSelected
                  ? kPrimaryColor
                  : kWhiteColor,
          border: Border.all(
              color: disableTimePassed
                  ? kNoSelectButtonColor
                  : timeSell.isSelected
                      ? kPrimaryColor
                      : kFourLightColor),
          borderRadius: BorderRadius.circular(4)),
    );
  }
}
