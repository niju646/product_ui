import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:product_ui/core/services/login_service.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool _isVisible = false;
  String? _error;
  // bool _isChecking = true;

  bool get isLoggedin => _isLoggedIn;
  bool get isVisible => _isVisible;
  String? get error => _error;
  // bool get isChecking => _isChecking;

  final _loginService = LoginService();
  final _secureStorage = const FlutterSecureStorage();

  void login() {
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() async {
    await _secureStorage.delete(key: 'auth_token');
    _isLoggedIn = false;
    notifyListeners();
  }

  void visiblity() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  Future<bool> loginAuth(String email, String password) async {
    try {
      await _loginService.login(email, password);
      _isLoggedIn = true;
      _error = null;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> signupAuth(
      String username, String email, String password) async {
    try {
      await _loginService.signup(username, email, password);
      // _isLoggedIn = true;
      _error = null;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<void> checkLoginStatus()async{
    final token = await _secureStorage.read(key: 'auth_token');
    _isLoggedIn = token !=null;
    log("⏩⏩ token is: $token");
    log('✅ Token exists: $_isLoggedIn');
    // _isChecking = false;
    notifyListeners();
  }
}
