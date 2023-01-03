import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/endpoint_constant.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/models/item_product.dart';

class ItemProduct extends StatelessWidget {
  const ItemProduct({Key? key, required this.product}) : super(key: key);
  final Products product;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Expanded(
            flex: 3,
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(UrlConstant.API_URL +
                UrlConstant.AVATAR +
                product.url),
          )),
          Expanded(
            child: Text(product.name.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: kPrimaryColor)),
          ),
          Text(product.money.toString().split(".")[0] + 'đ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kFourLightColor,
                  fontSize: size12)),
        ],
      ),
      decoration: BoxDecoration(
          color: kWhiteColor,
          border: Border.all(color: kFourLightColor),
          borderRadius: BorderRadius.circular(6)),
    );
  }
}
