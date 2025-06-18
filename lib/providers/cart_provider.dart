import 'package:flutter/cupertino.dart';
import 'package:product_ui/models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cartItems = [];
  List<Product> get cartItems => _cartItems;

  void addToCart(Product product) {
    if (!_cartItems.contains(product)) {
      _cartItems.add(product);
      notifyListeners();
    }
  }

   void removeCart(Product product) {
    _cartItems.remove(product); 
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.clear();
    notifyListeners();
  }
}
