

import 'package:flutter/material.dart';
import 'package:shop_app/components/decoration_border_shadow.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';

class InputDisable extends StatelessWidget {
  const InputDisable({
    Key? key,
    required this.hintText,
    required this.valueText,
  }) : super(key: key);

  final String hintText;
  final String valueText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: size20),
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: size32),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(size20),
            topRight: Radius.circular(size20),
            bottomLeft: Radius.circular(size20),
            bottomRight: Radius.circular(size20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        controller: TextEditingController(text: valueText),
        readOnly: true,
        enabled: true,
        style: TextStyle(fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            labelText: hintText,
            hintStyle: TextStyle(color: kTextColor),
            labelStyle: TextStyle(color: kSecondaryTextColor),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: InputBorder.none),
      ),
    );
  }
}