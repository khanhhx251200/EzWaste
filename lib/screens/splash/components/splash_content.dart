import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/core/constants/color_constants.dart';

import '../../../core/constants/strings_constant.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image!,
      height: getProportionateScreenHeight(265),
      width: getProportionateScreenWidth(235),
    );
  }
}
