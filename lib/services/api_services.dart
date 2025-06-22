import 'package:dio/dio.dart';

class ApiServices {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:3000',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  static Future<Response> fetchProduct() async {
    return await _dio.get('/products');
  }

  static Future<Response> fetchCart() async {
    return await _dio.get('/cart');
  }

  static Future<Response> addToCart(int productId) async {
    return await _dio.post('/cart/add', data: {
      'productId': productId,
    });
  }

  static Future<Response> removeCart(int productId) async {
    return await _dio.delete('/cart/$productId');
  }
}
