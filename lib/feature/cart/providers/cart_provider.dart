//cartProvider

import 'package:flutter/cupertino.dart';
import 'package:product_ui/feature/cart/models/cart_products.dart';
import 'package:product_ui/core/services/api_services.dart';

class CartProvider extends ChangeNotifier {
  List<CartProducts> _cartItems = [];
  String? _error;
  List<CartProducts> get cartItems => _cartItems;
  String? get error => _error;
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> fetchCart() async {
    _error = null;
    try {
      final response = await ApiServices.fetchCart();
      if (response.statusCode == 201 || response.statusCode == 200) {
        final List data = response.data['items'];
        _cartItems = data.map((item) => CartProducts.fromJson(item)).toList();
      }
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = 'connection error: $e';
    }
  }

  Future<void> addToCart(String productId) async {
    _error = null;
    try {
      final response = await ApiServices.addToCart(productId);
      if (response.statusCode == 201 || response.statusCode == 200) {
        await fetchCart();
      }

      notifyListeners();
    } catch (e) {
      _error = 'add to cart error: $e';
    }
  }

  Future<void> removeCart(String productId) async {
    _error = null;
    try {
      await ApiServices.removeCart(productId);
      await fetchCart();
      notifyListeners();
    } catch (e) {
      _error = 'Remove from cart error: $e';
    }
  }
}
