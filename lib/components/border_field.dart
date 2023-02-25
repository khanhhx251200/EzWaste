import 'package:flutter/material.dart';
import 'package:recycle_app/core/constants/color_constants.dart';

InputDecoration inputDecoration(
    hintText, bool showClear, TextEditingController controller) {
  return InputDecoration(
    labelText: hintText,
    suffixIcon: Icon(
      Icons.close,
      color: kWhiteColor,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    errorBorder: InputBorder.none,
  );
}
