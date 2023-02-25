import 'package:flutter/material.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';


ThemeData theme() {
  return ThemeData(
    fontFamily: "NotoSans",
    appBarTheme: appBarTheme(),
    primaryColor: kPrimaryColor,
    // textTheme: textTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(size8),
    borderSide: BorderSide(color: kTextColor),
    gapPadding: size8,
  );
  return InputDecorationTheme(
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    floatingLabelBehavior: FloatingLabelBehavior.always,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: InputBorder.none,
    floatingLabelStyle: TextStyle(color: kPrimaryColor)
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: kWhiteColor,
    elevation: 0,
    brightness: Brightness.dark,
    centerTitle: true,
    iconTheme: IconThemeData(color: kGreyColor),
    titleTextStyle:   TextStyle(color: kWhiteColor, fontSize: size16),
  );
}
