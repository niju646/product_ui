//product_provider.dart

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:product_ui/feature/cart/models/product.dart';
import 'package:product_ui/core/services/api_services.dart';

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
        log("response datatype: ${response.runtimeType}");
        log("Response:${response.data.toString()}");
        // List jsonResponse = response.data['products'];
        // _product = jsonResponse.map((e) => Product.fromJson(e)).toList();
        // log("Product:${_product.toString()}");
        final data = response.data;
        List jsonResponse;
        if(data is List){
          jsonResponse = data;
        }else if (data is Map && data.containsKey('products')) {
      jsonResponse = data['products'];
    }else{
      throw const FormatException('Unexpected data format');
    }
        _product = jsonResponse.map<Product>((e) {
          try{
            return Product.fromJson(e);
          }catch(e){
            log("Skipping product due to FormatException: $e");
            return Product();
          }
        }).where((e)=>e.id != null && e.name !=null && e.price !=null).toList();
        //
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
