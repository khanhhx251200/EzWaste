import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/models/Product2.dart';
import 'package:shop_app/screens/deatils/provider/detail_provider.dart';
import 'package:shop_app/screens/home_2/provider/home_provider.dart';

import 'rounded_icon_btn.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({
    Key? key,
    required this.provider,
    required this.quantity
  }) : super(key: key);
  final DetailProvider provider;
  final int quantity;
  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {

  @override
  void initState() {
    super.initState();
    widget.provider.setQuantity(widget.quantity);
  }
  @override
  void dispose() {
    super.dispose();
    widget.provider.setQuantity(1);

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF6F6F6),
        borderRadius: const BorderRadius.all(Radius.circular(40)),
      ),
      child: Row(
        children: [
          RoundIconBtn(
            iconData: Icons.remove,
            color: Colors.black38,
            press: widget.provider.quantityProduct == 1 ? null : () {
              setState(() {
                widget.provider.decrement();
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: padding20 / 4),
            child: Text(
              widget.provider.quantityProduct.toString(),
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w800),
            ),
          ),
          RoundIconBtn(
            iconData: Icons.add,
            press: () {
              setState(() {
                widget.provider.increment();
              });
            },
          ),
        ],
      ),
    );
  }
}