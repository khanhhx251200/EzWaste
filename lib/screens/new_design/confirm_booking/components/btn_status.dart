import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';

class ButtonStatus extends StatelessWidget {
  const ButtonStatus({Key? key, required this.status}) : super(key: key);
  final int status;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DefaultButton(
        text: statusString(status),
        color: statusColor(status),
        press: null,
      ),
    );
  }
}
