import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';

BoxDecoration boxDecorationShadow({radius = size10}) {
  return BoxDecoration(
    color: kWhiteColor,
    borderRadius: BorderRadius.all(Radius.circular(radius)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.4),
        spreadRadius: size8 / 2,
        blurRadius: 7,
        offset: Offset(0, 0), // changes position of shadow
      ),
    ],
  );
}