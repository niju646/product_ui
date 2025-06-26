

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:product_ui/core/utils/urls.dart';

class LoginService {
  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: Urls.baseurl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        followRedirects: true,
        headers: {
          'Content-Type' :'application/json'
        }
    )
  );

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<void> signup(String username, String email, String password) async {
    log('start');
    log('Sending login data: ${{
  "email": email,
  "password": password,
}}');

    try{
        final response = await _dio.post('/users/register',data: {
            "username":username,
            "email":email,
            "password":password,
        });
        log(response.data.toString());

      final token = response.data['token'];
      if(token != null){
        await _secureStorage.write(key: 'auth_token',
         value: token);
      }else{
        throw Exception("token not found");
      }
    }on DioException catch (e){
        if (e.response != null) {
    log('Error data: ${e.response?.data}');
    throw Exception(e.response?.data['message'] ?? 'Something went wrong');
  } else {
    throw Exception('Network error');
  }
    }
  }
  Future<void> login(String email, String password) async{
    try{
        final response = await _dio.post('/users/login',data: {
          "email":email,
          "password":password,
        });
        log(response.data.toString());
        final token = response.data['token'];
        if(token != null){
          await _secureStorage.write(key: 'auth_token',
           value: token);
        }
    }on DioException catch(e){
          if (e.response != null) {
    log('Error data: ${e.response?.data}');
    throw Exception(e.response?.data['message'] ?? 'Something went wrong');
  } else {
    throw Exception('Network error');
  }
    }
  }


  Future<String?> getToken() async {
    return await _secureStorage.read(key: 'auth_token');
  }

  Future<void> logout() async {
    await _secureStorage.delete(key: 'auth_token');
  }

}