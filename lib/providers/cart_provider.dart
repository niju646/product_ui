//cartProvider
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:product_ui/models/cart_products.dart';
import 'package:product_ui/services/dio_client.dart';

class CartProvider extends ChangeNotifier {
  List<CartProducts> _cartItems = [];
  String? _error;
  List<CartProducts> get cartItems => _cartItems;
  String? get error => _error;

  // final Dio _dio = Dio(BaseOptions(
  //   baseUrl: 'http://localhost:3000/',
  // ));
  final Dio _dio = DioClient.instance;

  Future<void> fetchCart() async {
    _error = null;
    try {
      final response = await _dio.get('/cart');

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
      await _dio.post('/cart/add', data: {
        'productId': product.productId,
      });
      await fetchCart();
      notifyListeners();
    } catch (e) {
      _error = 'add to cart error: $e';
    }
  }

  Future<void> removeCart(CartProducts product) async {
    _error = null;
    try {
      await _dio.delete('/cart/${product.productId}');
      await fetchCart();
      notifyListeners();
    } catch (e) {
      _error = 'Remove from cart error: $e';
    }
  }
}
