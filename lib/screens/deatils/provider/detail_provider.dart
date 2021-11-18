import 'package:flutter/cupertino.dart';

class DetailProvider extends ChangeNotifier {
  int _quantityProduct = 1;

  int get quantityProduct => _quantityProduct;

  int setQuantity(int quantity) => _quantityProduct = quantity;

  void increment() {
    print('++');
    _quantityProduct++;
    notifyListeners();
    print(quantityProduct);
  }

  void decrement() {
    print('--');
    _quantityProduct--;
    notifyListeners();
    print(quantityProduct);

  }
}
