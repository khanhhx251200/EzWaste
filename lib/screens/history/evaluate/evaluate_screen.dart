import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';

class EvaluateScreen extends StatefulWidget {
  static String routeName = '/evaluate';
  const EvaluateScreen({Key? key}) : super(key: key);

  @override
  _EvaluateScreenState createState() => _EvaluateScreenState();
}

class _EvaluateScreenState extends State<EvaluateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        title: Text(kRate, style: TextStyle(color: kBlackColor)),
      ),
    );
  }
}
