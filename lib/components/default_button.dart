import 'package:flutter/material.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';

import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.press,
    this.color,
    this.textSize,
    this.radius = size20,
  }) : super(key: key);
  final String? text;
  final Function? press;
  final Color? color;
  final double? textSize;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
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
