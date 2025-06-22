//product_provider.dart

import 'package:flutter/material.dart';
import 'package:product_ui/models/product.dart';
import 'package:product_ui/services/api_services.dart';

class ProductProvider extends ChangeNotifier {
  bool _isLoading = false;
  List<Product> _product = [];
  String? _error;

  bool get isLoading => _isLoading;
  List<Product> get product => _product;
  String? get error => _error;

  Future<void> fetchProduct() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await ApiServices.fetchProduct();

      if (response.statusCode == 200 || response.statusCode == 201) {
        List jsonResponse = response.data;
        _product = jsonResponse.map((e) => Product.fromJson(e)).toList();
      } else {
        _error = 'error ${response.statusCode}';
      }
    } catch (e) {
      _error = 'There is the connection error: $e';
    }
    _isLoading = false;
    notifyListeners();
  }
}
