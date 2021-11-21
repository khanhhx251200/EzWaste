import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/models/Product2.dart';
import 'package:shop_app/models/ProductItem.dart';

enum HomeState { normal, cart }

class HomeProvider extends ChangeNotifier {
  HomeState homeState = HomeState.normal;

  List<ProductItem> cart = [];

  void changeHomeState(HomeState state) {
    homeState = state;
    notifyListeners();
  }

  void addProductToCart(Product2 product) {
    print('add product');
    for (ProductItem item in cart) {
      if (item.product!.title == product.title) {
        print('add increment');

        item.increment();
        notifyListeners();
        return;
      }
    }
    cart.add(ProductItem(product: product));
    print('card: $cart');
    notifyListeners();
  }

  void removeProductToCart(Product2 product) {
    for (ProductItem item in cart) {
      if (item.product!.title == product.title) {
        item.decrease();
        notifyListeners();
        return;
      }
    }
    cart.remove(ProductItem(product: product));
    notifyListeners();
  }

  int getQuantity(Product2 product) {
    for (ProductItem item in cart) {
      if (item.product!.title == product.title) {
        return item.quantity;
      }
    }
    return 0;
  }

  String totalBill() {
    int total = 0;
    for (int i = 0; i < cart.length; i++) {
      total += cart[i].quantity * cart[i].product!.price!;
    }
    return convertIntToCurrency(total);
  }

  int totalCartItems() => cart.fold(
      0, (previousValue, element) => previousValue + element.quantity);
}
