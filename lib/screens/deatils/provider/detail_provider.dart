import 'package:flutter/cupertino.dart';

class DetailProvider extends ChangeNotifier {
  int _quantityProduct = 0;
  double _widthQuantity = 20;

  int get quantityProduct => _quantityProduct;

  double get widthQuantity => _widthQuantity;

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

  changeWidget(int lengthText) {
    if (lengthText >= 3) {
      _widthQuantity += ((lengthText * 10) - _widthQuantity);
    } else {
      _widthQuantity = 20;
    }
    notifyListeners();
  }
}
