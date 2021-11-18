import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/screens/home_2/provider/home_provider.dart';

import 'cart_detailsview_card.dart';

class CartDetailsView extends StatelessWidget {
  const CartDetailsView({Key? key, required this.provider}) : super(key: key);

  final HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Giỏ hàng", style: Theme.of(context).textTheme.headline6),
          ...List.generate(
            provider.cart.length,
            (index) => CartDetailsViewCard(productItem: provider.cart[index]),
          ),
          SizedBox(height: padding20),
          DefaultButton(
            text: "Tiếp - ${provider.totalBill()!= null ? provider.totalBill() : 0}đ",
            press: (){},
          ),
        ],
      ),
    );
  }
}
