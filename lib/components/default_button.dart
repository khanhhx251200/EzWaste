import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';

import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.press,
    this.color,
    this.textSize,
  }) : super(key: key);
  final String? text;
  final Function? press;
  final Color? color;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(size20)),
            primary: Colors.white,
            backgroundColor: color != null ? color : kPrimaryColor,
            padding: EdgeInsets.symmetric(horizontal: 24)
        ),
        onPressed: press != null ? press as Function()? : null,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(textSize ?? size14),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
