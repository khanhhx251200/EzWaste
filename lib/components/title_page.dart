import 'package:flutter/material.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery
        .of(context)
        .size;
    return Container(
      color: kGreenColor,
      height: _size.height * 0.08,
      width: _size.width,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: size36),
      child: Text(
        title,
        style: const TextStyle(
            color: kWhiteColor,
            fontWeight: FontWeight.bold,
            fontSize: size18),
      ),
    );
  }
}
