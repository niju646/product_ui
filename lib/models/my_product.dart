import 'package:dio/dio.dart';
import 'package:product_ui/models/product.dart';

class MyProduct {
    final Dio _dio = Dio(
        BaseOptions(
          baseUrl: 'https://cart-app-backend-3nff.onrender.com/api/',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {
            'Accept':'application/json',
          }
        )
    );
    Future<List<Product>> get allProducts async{
      try {
      final response = await _dio
          .get(
            '/product',
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200 || response.statusCode == 201) {
        List jsonResponse = response.data;
        return jsonResponse.map((data) => Product.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      print("The error is : $e");
      throw Exception('Error fetching products: $e');
    }
    }
    
  }












// import 'package:dio/dio.dart';

// import 'package:product_ui/models/product.dart';

// class MyProduct {
//   final Dio _dio = Dio(BaseOptions(
//       baseUrl: 'http://192.168.42.110:3000',
//       connectTimeout: const Duration(seconds: 10),
//       receiveTimeout: const Duration(seconds: 10),
//       headers: {
//         'Accept': 'application/json',
//       }));
//   Future<List<Product>> get allProducts async {
//     try {
//       final response = await _dio.get('/products');

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         List jsonResponse = response.data;
//         return jsonResponse.map((data) => Product.fromJson(data)).toList();
//       } else {
//         throw Exception('Failed to load products: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error fetching products: $e');
//     }
//   }
// }
