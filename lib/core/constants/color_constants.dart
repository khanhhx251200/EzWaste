import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF41D18C);
const kFiveColor = Color(0xFF3FBE81);
const kPrimaryLightColor = Color(0xFFBFFCCF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [kPrimaryColor, kPrimaryColor],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const kGreyColor = Colors.grey;
const kBlackColor = Colors.black;
const kSecondaryTextColor = Color(0xFFBBBBBB);
const kWhiteColor = Colors.white;
const bgColor = Color(0xFFF6F5F2);
const kWarningColor = Color(0xFFF3BB1C);
const kErrorColor = Color(0xFFF03738);
const kErrorSecondColor = Color(0xFFFF6839);
const kSuccessColor = Color(0xFF42BA96);
const kThirdColor = Color(0xFFF56618);
const kThirdLightColor = Color(0xFFFEF4EA);
const kFourLightColor = Color(0xFF454480);
const kNoSelectButtonColor = Color(0xFFEFEFEF);
const kNoSelectTextnColor = Color(0xFF686868);
const kBackgroundColor = Color(0xFFF2F2F2);
const kBackgroundTextFieldColor = Color(0xFFF4F6FA);
const kTextFieldColor = Color(0xFF8E8E8E);
const kTextFieldSecondColor = Color(0xFF1B2C49);
const kTextColorNew = Color(0xFF1B2C49);
final kGrey75Color = Color(0xFF000000).withOpacity(0.75);
const kOrganicColor = const MaterialColor(
  0xFFFF725E,
  const <int, Color>{
    50: const Color(0xFFFF725E),
    100: const Color(0xFFFF725E),
    200: const Color(0xFFFF725E),
    300: const Color(0xFFFF725E),
    400: const Color(0xFFFF725E),
    500: const Color(0xFFFF725E),
    600: const Color(0xFFFF725E),
    700: const Color(0xFFFF725E),
    800: const Color(0xFFFF725E),
    900: const Color(0xFFFF725E),
  },
);
const kPlasticColor = const MaterialColor(
  0xFF4BC999,
  const <int, Color>{
    50: const Color(0xFF4BC999),
    100: const Color(0xFF4BC999),
    200: const Color(0xFF4BC999),
    300: const Color(0xFF4BC999),
    400: const Color(0xFF4BC999),
    500: const Color(0xFF4BC999),
    600: const Color(0xFF4BC999),
    700: const Color(0xFF4BC999),
    800: const Color(0xFF4BC999),
    900: const Color(0xFF4BC999),
  },
);
const kGreenColor = Color(0xFF3FBE81);
const kBlueColor = Color(0xFF4E71FF);



Color statusColor(int status) {
  if (status == 1 || status == 5) {
    return kErrorColor;
  } else if (status == 2 || status == 3) {
    return kWarningColor;
  } else {
    return kSuccessColor;
  }
}
