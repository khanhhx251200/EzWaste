import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/screens/deatils/provider/detail_provider.dart';
import 'package:shop_app/size_config.dart';

class InputQuantity extends StatefulWidget {
  const InputQuantity(
      {Key? key,
      required this.controller,
      required this.provider,
      required this.changeTextQuantity})
      : super(key: key);
  final TextEditingController controller;
  final DetailProvider provider;
  final VoidCallback changeTextQuantity;

  @override
  State<InputQuantity> createState() => _InputQuantityState();
}

class _InputQuantityState extends State<InputQuantity> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(widget.provider.widthQuantity),
      child: TextFormField(
        textAlign: TextAlign.center,
        initialValue: widget.provider.quantityProduct.toString(),
        autofocus: true,
        onChanged: (value) {
          if (value.isEmpty) {
            widget.changeTextQuantity();
          } else {
            widget.provider.changeWidget(value.length);
            print(widget.provider.quantityProduct);
          }
        },
        onFieldSubmitted: (value) {
          widget.changeTextQuantity();
          widget.provider.setQuantity(int.parse(value));
        },
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w800, color: kTextColor),
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            isCollapsed: true,
            isDense: true,
            contentPadding: EdgeInsets.all(0)),
      ),
    );
  }
}
