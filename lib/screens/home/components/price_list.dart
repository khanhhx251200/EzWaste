import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/screens/home/provider/home_provider.dart';
import 'package:shop_app/screens/sell/components/item_product.dart';
import 'package:shop_app/size_config.dart';

class PriceList extends StatefulWidget {
  const PriceList({Key? key, required this.provider}) : super(key: key);
  final HomeProvider provider;

  @override
  State<PriceList> createState() => _PriceListState();
}

class _PriceListState extends State<PriceList> {
  @override
  void initState() {
    super.initState();
    widget.provider.getListProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      width: double.infinity,
      padding:
      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(size12), vertical: getProportionateScreenHeight(size8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('Bảng giá', style: TextStyle(fontWeight: FontWeight.bold, color: kFourLightColor, fontSize: size18)),
          ),
          Container(
            constraints: BoxConstraints(minHeight: 50),
            margin: EdgeInsets.only(top: size8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4))),
            child: widget.provider.listProduct.length == 0
                ? SizedBox()
                : GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.8,
                      mainAxisSpacing: size8,
                      crossAxisSpacing: size8,
                    ),
                    itemCount: widget.provider.listProduct.length,
                    itemBuilder: (BuildContext ctx, index) {
                      final element = widget.provider.listProduct[index];
                      return ItemProduct(product: element);
                    }),
          )
        ],
      ),
    );
  }
}
