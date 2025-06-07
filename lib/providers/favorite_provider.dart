import 'package:flutter/cupertino.dart';
import 'package:product_ui/models/product.dart';

class FavoriteProvider extends ChangeNotifier{

  final List<Product> _favorite = [];
  List<Product> get favorite => _favorite;

  void toggleFavorite(Product product){
    if(_favorite.contains(product)){
        _favorite.remove(product);
        
    }else{
      _favorite.add(product);
    }
    notifyListeners();
  }

  void deletefavorite(Product product){
    _favorite.remove(product);
    notifyListeners();
  }

  bool isFavorite(Product product){
    return _favorite.contains(product); 
  }
}