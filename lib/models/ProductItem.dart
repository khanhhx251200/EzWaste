import 'package:shop_app/models/Product2.dart';

class ProductItem {
  int quantity;
  final Product2? product;

  ProductItem({this.quantity = 1, required this.product});

  void increment() {
    quantity++;
  }
  void decrease() {
    quantity--;
  }

  // void add() {}

  // void substract() {}
}
