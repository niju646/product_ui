//cartProvider

import 'package:flutter/cupertino.dart';
import 'package:product_ui/models/cart_products.dart';
import 'package:product_ui/services/dio_client.dart';

class CartProvider extends ChangeNotifier {
  List<CartProducts> _cartItems = [];
  String? _error;
  List<CartProducts> get cartItems => _cartItems;
  String? get error => _error;

  Future<void> fetchCart() async {
    _error = null;
    try {
      final response = await DioClient.fetchCart();

      final List data = response.data;
      _cartItems = data.map((item) => CartProducts.fromJson(item)).toList();
      notifyListeners();
    } catch (e) {
      _error = 'connection error: $e';
    }
  }

  Future<void> addToCart(CartProducts product) async {
    _error = null;
    try {
      await DioClient.addToCart(product.productId);
      await fetchCart();
      notifyListeners();
    } catch (e) {
      _error = 'add to cart error: $e';
    }
  }

  Future<void> removeCart(CartProducts product) async {
    _error = null;
    try {
      await DioClient.removeCart(product.productId);
      await fetchCart();
      notifyListeners();
    } catch (e) {
      _error = 'Remove from cart error: $e';
    }
  }
}
