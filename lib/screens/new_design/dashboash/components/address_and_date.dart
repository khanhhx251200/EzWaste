import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/auth_provider.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';

class AddressAndDate extends StatelessWidget {
  const AddressAndDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      height: _size.height * 0.08,
      padding: EdgeInsets.symmetric(horizontal: size36),
      color: kGreenColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: item(Icons.location_on,
                context.read<AuthProvider>().userInfo.address!),
          ),
          item(Icons.date_range, convertDateToString(DateTime.now())),
        ],
      ),
    );
  }

  Row item(IconData icon, String address) {
    return Row(
      children: [
        Icon(
          icon,
          color: kWhiteColor,
        ),
        SizedBox(
          width: size8,
        ),
        Text(
          address,
          style: TextStyle(color: kWhiteColor, fontSize: size16),
        )
      ],
    );
  }
}
