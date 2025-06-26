


import 'package:dio/dio.dart';
import 'package:product_ui/core/utils/urls.dart';


class ApiServices {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Urls.baseurl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  static Future<Response> fetchProduct() async {
    return await _dio.get('/product');
  }

  static Future<Response> fetchCart() async {
    return await _dio.get('/cart');
  }

  static Future<Response> addToCart(String productId) async {
    return await _dio.post('/cart/add', data: {
      'productId': productId,
    });
  }

  static Future<Response> removeCart(String productId) async {
    return await _dio.delete('/cart/$productId');
  }
}
