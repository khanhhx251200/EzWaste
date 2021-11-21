import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/screens/deatils/components/input_quantity.dart';
import 'package:shop_app/screens/deatils/provider/detail_provider.dart';
import 'package:shop_app/size_config.dart';

import 'rounded_icon_btn.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({Key? key, required this.provider, required this.quantity})
      : super(key: key);
  final DetailProvider provider;
  final int quantity;

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  final counterController = TextEditingController();

  bool isTextCounter = true;

  changeInputCounter() {
    setState(() {
      isTextCounter = !isTextCounter;
    });
  }

  @override
  void initState() {
    super.initState();
    widget.provider.setQuantity(widget.quantity);
    counterController.text = widget.provider.quantityProduct.toString();
  }

  @override
  void dispose() {
    super.dispose();
    widget.provider.setQuantity(0);
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
            press: widget.provider.quantityProduct == 1 ||
                    widget.provider.quantityProduct == 0
                ? null
                : () {
                    if (!isTextCounter) {
                      changeInputCounter();
                    }
                    setState(() {
                      widget.provider.decrement();
                    });
                    widget.provider.changeWidget(
                        widget.provider.quantityProduct.toString().length);

                  },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding20 / 4),
            child: isTextCounter
                ? buildTextQuantity()
                : InputQuantity(
                    controller: counterController,
                    provider: widget.provider,
                    changeTextQuantity: changeInputCounter,
                  ),
          ),
          RoundIconBtn(
            iconData: Icons.add,
            press: () {
              if (!isTextCounter) {
                changeInputCounter();
              }
              setState(() {
                widget.provider.increment();
              });
              widget.provider.changeWidget(
                  widget.provider.quantityProduct.toString().length);
            },
          ),
        ],
      ),
    );
  }

  GestureDetector buildTextQuantity() {
    return GestureDetector(
      onTap: changeInputCounter,
      child: Container(
        width: getProportionateScreenWidth(widget.provider.widthQuantity),
        child: Center(
          child: Text(
            widget.provider.quantityProduct.toString(),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}
