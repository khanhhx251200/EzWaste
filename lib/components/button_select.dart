import 'package:flutter/material.dart';
import 'package:recycle_app/core/constants/color_constants.dart';

import '../core/constants/constants.dart';
import '../size_config.dart';

class ButtonSelect extends StatelessWidget {
  const ButtonSelect({
    Key? key,
    this.text,
    this.press, this.isSelected, this.heightBtn,
  }) : super(key: key);
  final String? text;
  final Function? press;
  final bool? isSelected;
  final double? heightBtn;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(heightBtn != null ? heightBtn! : 32),
      child: ElevatedButton(

        style: TextButton.styleFrom(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            primary: Colors.white,
            backgroundColor: isSelected! ?  kPrimaryColor : kNoSelectButtonColor,
            padding: EdgeInsets.symmetric(horizontal: 24)
        ),
        onPressed: press != null ? press as Function()? : null,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(14),
            color: isSelected! ? kWhiteColor : kNoSelectTextnColor,
          ),
        ),
      ),
    );
  }
}
