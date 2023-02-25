import 'package:flutter/material.dart';
import 'package:recycle_app/core/constants/color_constants.dart';

AppBar appBar(String text) {
  return AppBar(
    title: Text(
      text,
      style: TextStyle(color: kBlackColor, fontWeight: FontWeight.bold),
    ),
    elevation: 4,
  );
}