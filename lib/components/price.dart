import 'package:flutter/material.dart';
import 'package:recycle_app/core/constants/color_constants.dart';


class Price extends StatelessWidget {
  const Price({
    Key? key,
    required this.amount,
  }) : super(key: key);
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: amount,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(fontWeight: FontWeight.w600, color: kPrimaryColor),
        children: [
          TextSpan(
            text: "/kg",
            style:
                TextStyle(color: Colors.black26, fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }
}
