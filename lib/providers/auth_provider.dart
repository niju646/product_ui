import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier{
  bool _isLoggedIn = false;
  bool _isVisible = false;

  bool get isLoggedin =>  _isLoggedIn;
  bool get isVisible => _isVisible;

  void login(){
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout(){
    _isLoggedIn = false;
    notifyListeners();
  }


  void visiblity(){
    _isVisible = !_isVisible;
    notifyListeners();
  }
}