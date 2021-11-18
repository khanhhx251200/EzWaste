import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/screens/home_2/provider/home_provider.dart';


class CardShortView extends StatelessWidget {
  const CardShortView({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Giỏ hàng",
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(width: padding20),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                provider.cart.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: padding20 / 2),
                  child: Hero(
                    tag: provider.cart[index].product!.title! + "_cartTag",
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage:
                          AssetImage(provider.cart[index].product!.image!),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            provider.totalCartItems().toString(),
            style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          ),
        )
      ],
    );
  }
}
