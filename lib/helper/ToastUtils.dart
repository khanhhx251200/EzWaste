import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';
import 'package:recycle_app/core/constants/strings_constant.dart';

showToastInApp(BuildContext context, String content,
    {Color? backgroundColor, Color? textColor, String? align}) {
  StyledToastPosition? position;
  if (align == kTOP) {
    position = StyledToastPosition.top;
  } else if (align == kBOTTOM) {
    position = StyledToastPosition.bottom;
  } else {
    position = StyledToastPosition.center;
  }
  showToast(content,
      context: context,
      backgroundColor: backgroundColor,
      textStyle: TextStyle(color: textColor),
      animation: StyledToastAnimation.slideFromTop,
      reverseAnimation: StyledToastAnimation.slideFromTop,
      startOffset: Offset(0.0, 3.0),
      reverseEndOffset: Offset(0.0, 3.0),
      position: position,
      duration: Duration(seconds: 4),
      animDuration: Duration(seconds: 1),
      curve: Curves.elasticOut,
      reverseCurve: Curves.fastOutSlowIn);
}

showDialogConfirm(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          kConfirm,
          style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
        ),
        content: Text(kAreYouSureWantToCloseThisFeature),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              kAgree,
              style: TextStyle(color: kPrimaryColor),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(kNo, style: TextStyle(color: kTextColor)),
          ),
        ],
      );
    },
  );
}

showToastWithOutContext(
    {String message = '', Color backgroundColor = kPrimaryColor}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    timeInSecForIosWeb: 1,
    backgroundColor: backgroundColor,
    textColor: kWhiteColor,
    fontSize: size16,
  );
}
