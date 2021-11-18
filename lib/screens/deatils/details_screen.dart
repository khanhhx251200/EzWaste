import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/fav_btn.dart';
import 'package:shop_app/components/price.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/models/Product2.dart';
import 'package:shop_app/screens/deatils/provider/detail_provider.dart';
import 'package:shop_app/screens/home_2/provider/home_provider.dart';

import 'components/cart_counter.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen(
      {Key? key,
      required this.product,
      required this.quantity,
      required this.onProductAdd,
      required this.onProductRemove,
      required this.provider})
      : super(key: key);

  final Product2 product;
  final VoidCallback onProductAdd;
  final VoidCallback onProductRemove;
  final HomeProvider provider;
  final int quantity;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String _cartTag = "";

  DetailProvider provider = DetailProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: padding20, vertical: defaultPadding),
            child: DefaultButton(
              text: "Thêm vào Giỏ hàng",
              press: () {
                int count = 0;
                print('first: ${widget.quantity}');
                if(provider.quantityProduct != 1){
                  count = widget.quantity - provider.quantityProduct;
                } else {
                  count = 1;
                }

                if (widget.quantity < provider.quantityProduct) {
                  for (int i = 0; i <= -count; i++) {
                    widget.onProductAdd();
                  }
                } else if (widget.quantity > provider.quantityProduct) {
                  for (int i = 0; i < count; i++) {
                    widget.onProductRemove();
                  }
                } else if(widget.quantity == 1 && provider.quantityProduct == 1) {
                  widget.onProductAdd();
                }
                print('count: $count');

                setState(() {
                  _cartTag = '_cartTag';
                });
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.37,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    color: Color(0xFFF8F8F8),
                    child: Hero(
                      tag: widget.product.title! + _cartTag,
                      child: Image.asset(widget.product.image!),
                    ),
                  ),
                  Positioned(
                    bottom: -20,
                    child: CartCounter(
                      provider: provider,
                      quantity: widget.quantity,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: defaultPadding * 1.5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.product.title!,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Price(amount: "5000"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Text(
                "Bắp cải hay cải bắp hay cải nồi là một loại rau chủ lực trong họ Cải, phát sinh từ vùng Địa Trung Hải. Nó là cây thân thảo, sống hai năm, và là một thực vật có hoa thuộc nhóm hai lá mầm với các lá tạo thành một cụm đặc hình gần như hình tròn đặc trưng.",
                style: TextStyle(
                  color: Color(0xFFBDBDBD),
                  height: 1.8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: BackButton(
        color: Colors.black,
      ),
      backgroundColor: Color(0xFFF8F8F8),
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Rau quả",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        FavBtn(radius: 20),
        SizedBox(width: defaultPadding),
      ],
    );
  }
}
