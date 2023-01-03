import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/screens/home/provider/home_provider.dart';
import 'package:shop_app/screens/sell/components/style_title.dart';
import 'package:provider/provider.dart';
class AddressOrder extends StatefulWidget {
  const AddressOrder({Key? key}) : super(key: key);

  @override
  _AddressOrderState createState() => _AddressOrderState();
}

class _AddressOrderState extends State<AddressOrder> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.location_on, color: kPrimaryColor, size: 32),
              Expanded(child: Text('Địa chỉ', style: styleTitle())),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: size8),
            child: Text(
              context.read<HomeProvider>().userInfo!.address ?? '',
              style:
              TextStyle(color: kFourLightColor, fontSize: size14),
            ),
          )
        ],
      ),
    );
  }
}
