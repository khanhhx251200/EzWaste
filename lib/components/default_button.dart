import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';

import '../core/constants/constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(48),
      child: ElevatedButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius:  BorderRadius.circular(8)),
          primary: Colors.white,
          backgroundColor: kPrimaryColor,

        ),
        onPressed: press != null ? press as Function()? :  null,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(16),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
