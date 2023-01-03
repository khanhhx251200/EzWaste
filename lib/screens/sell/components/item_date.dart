import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/models/date_sell.dart';

class ItemDate extends StatelessWidget {
  const ItemDate({
    Key? key,
    required this.dateOrder,
    required this.isDisable,
  }) : super(key: key);

  final DateSell dateOrder;
  final bool isDisable;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: size8),
      padding: const EdgeInsets.all(size8),
      width: 72,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: dateOrder.isSelected ? kPrimaryColor : isDisable ? kSecondaryTextColor : kWhiteColor,
          border: Border.all(
              color:
              dateOrder.isSelected ? kPrimaryColor : isDisable ? kSecondaryTextColor : kWhiteColor),
          borderRadius: BorderRadius.circular(size8)),
      child: Column(
        children: [
          Text(dateOrder.day! + " Th" + dateOrder.month!,
              style: TextStyle(
                  color: !isDisable && !dateOrder.isSelected ? kPrimaryColor : kWhiteColor)),
          Text(dateOrder.dateTime!.weekday < 7 ? "Thứ " + (dateOrder.dateTime!.weekday + 1).toString(): 'CN',
              style: TextStyle(
                  color: !dateOrder.isSelected ? kFourLightColor : kWhiteColor,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
