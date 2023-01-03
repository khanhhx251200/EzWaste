import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';

class FieldNote extends StatelessWidget {
  const FieldNote({
    Key? key,
    required this.textEditingController,
    required this.hintText,
  }) : super(key: key);
  final TextEditingController textEditingController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      textInputAction: TextInputAction.done,
      maxLines: null,
      minLines: 3,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: kWhiteColor,
          contentPadding:
          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          hintStyle: TextStyle(color: kTextColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
    );
  }
}
