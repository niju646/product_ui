import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:product_ui/models/product.dart';
import 'package:product_ui/router/app_route_constants.dart';
import 'package:product_ui/screens/cart_screen.dart';
import 'package:product_ui/screens/favorite_screen.dart';
import 'package:product_ui/screens/home.dart';
// import 'package:product_ui/screens/home.dart';
import 'package:product_ui/screens/login_page.dart';
import 'package:product_ui/screens/product_details.dart';
import 'package:product_ui/screens/signup_page.dart';

class MyAppRouter {
  
   
    GoRouter router = GoRouter(routes: [
      GoRoute(path: '/',
      name: MyAppCostants().loginRouteName,
      pageBuilder: (context, state) {
        return MaterialPage(child: LoginPage());
      },
      ),

      GoRoute(path: '/home',
      name:  MyAppCostants().homeRouteName,
      pageBuilder: (context, state) {
        return MaterialPage(child: Home());
      }, ),

      GoRoute(path: '/signup',
      name: MyAppCostants().signupRouteName,
      pageBuilder: (context, state) {
        return MaterialPage(child: SignupPage());
      },
      ),

      GoRoute(path: '/cart',
      name: MyAppCostants().cartRouteName,
      pageBuilder: (context, state) {
        return MaterialPage(child: CartScreen());
      },
      ),

      GoRoute(path: '/favorite',
      name: MyAppCostants().favoriteRouteName,
      pageBuilder: (context, state) {
        return MaterialPage(child: FavoriteScreen());
      },),

      GoRoute(path: '/productdetail',
      name: MyAppCostants().productRouteName,
      pageBuilder: (context, state) {
         final product = state.extra as Product;
        return MaterialPage(child: ProductDetails(product:product));
      },)


    ]);


    
      
}