import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier{
  bool _isLoggedIn = false;

  bool get isLoggedin =>  _isLoggedIn;

  void login(){
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout(){
    _isLoggedIn = false;
    notifyListeners();
  }
}