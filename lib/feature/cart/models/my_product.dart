// import 'package:dio/dio.dart';

// import 'package:product_ui/models/product.dart';

// class MyProduct {
//   final Dio _dio = Dio(BaseOptions(
//       baseUrl: 'http://localhost:3000',
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




// import 'package:dio/dio.dart';
// import 'package:product_ui/models/product.dart';

// class MyProduct {
//   final Dio _dio = Dio(BaseOptions(
//       baseUrl: 'https://cart-app-backend-3nff.onrender.com/api/',
//       connectTimeout: const Duration(seconds: 10),
//       receiveTimeout: const Duration(seconds: 10),
//       headers: {
//         'Accept': 'application/json',
//       }));
//   Future<List<Product>> get allProducts async {
//     try {
//       final response = await _dio
//           .get(
//             '/product',
//           )
//           .timeout(const Duration(seconds: 10));

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         List jsonResponse = response.data;
//         return jsonResponse.map((data) => Product.fromJson(data)).toList();
//       } else {
//         throw Exception('Failed to load products: ${response.statusCode}');
//       }
//     } on DioException catch (e) {
//       String errorMessage = 'Dio error: ${e.message}';

//       if (e.type == DioExceptionType.connectionError ||
//           e.type == DioExceptionType.unknown) {
//         errorMessage = 'Connection error: Failed to reach the server.';
//       } else if (e.type == DioExceptionType.receiveTimeout ||
//           e.type == DioExceptionType.sendTimeout) {
//         errorMessage = 'Connection timed out. Please try again later.';
//       } else if (e.response != null) {
//         errorMessage =
//             'Server error: ${e.response?.statusCode} - ${e.response?.statusMessage}';
//       }

//       print(errorMessage);
//       throw Exception(errorMessage);
//     } catch (e) {
//       // Handle all other errors
//       print("Unexpected error: $e");
//       throw Exception('Unexpected error fetching products: $e');
//     }
//   }
// }

