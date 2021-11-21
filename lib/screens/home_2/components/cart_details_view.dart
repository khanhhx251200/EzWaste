import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/screens/home_2/provider/home_provider.dart';
import 'package:shop_app/size_config.dart';

import 'cart_details_view_card.dart';

class CartDetailsView extends StatelessWidget {
  const CartDetailsView({Key? key, required this.provider}) : super(key: key);

  final HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Giỏ hàng", style: Theme.of(context).textTheme.headline6),
          ...List.generate(
            provider.cart.length,
            (index) => CartDetailsViewCard(productItem: provider.cart[index]),
          ),
          SizedBox(height: getProportionateScreenHeight(padding20)),
          addVoucherCode(),
          SizedBox(height: getProportionateScreenHeight(defaultPadding)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: "Tổng:\n",
                  children: [
                    TextSpan(
                      text: "${provider.totalBill()}",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(width: padding20),
              Expanded(
                child: DefaultButton(
                  text: "Thanh toán",
                  press: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row addVoucherCode() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          height: getProportionateScreenWidth(40),
          width: getProportionateScreenWidth(40),
          decoration: BoxDecoration(
            color: Color(0xFFF5F6F9),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            "assets/icons/receipt.svg",
            color: kPrimaryColor,
          ),
        ),
        Spacer(),
        Text("Nhập mã giảm giá"),
        const SizedBox(width: 10),
        Icon(
          Icons.arrow_forward_ios,
          size: 12,
          color: kTextColor,
        )
      ],
    );
  }
}
