import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:product_ui/feature/cart/models/product.dart';
import 'package:product_ui/core/router/app_route_constants.dart';
import 'package:product_ui/feature/cart/screens/cart_screen.dart';
import 'package:product_ui/feature/cart/screens/favorite_screen.dart';
import 'package:product_ui/feature/cart/screens/home.dart';
import 'package:product_ui/feature/cart/screens/login_page.dart';
import 'package:product_ui/feature/cart/screens/product_details.dart';
import 'package:product_ui/feature/cart/screens/signup_page.dart';

class MyAppRouter {

  final _secureStorage = const FlutterSecureStorage();


 late final  GoRouter router = GoRouter(
  initialLocation: '/',
  redirect: (context, state)async {
  final token = await _secureStorage.read(key: 'auth_token');

  final isLoggedIn = token != null;
  final isOnLogin = state.matchedLocation == '/';

  if (!isLoggedIn && !isOnLogin) {
    return '/';
  } else if (isLoggedIn && isOnLogin) {
    return '/home';
  }

  return null;

  },
    routes: [
    GoRoute(
      path: '/',
      name: MyAppCostants().loginRouteName,
      pageBuilder: (context, state) {
        return const MaterialPage(child: LoginPage());
      },
    ),
    GoRoute(
      path: '/home',
      name: MyAppCostants().homeRouteName,
      pageBuilder: (context, state) {
        return const MaterialPage(child: Home());
      },
    ),
    GoRoute(
      path: '/signup',
      name: MyAppCostants().signupRouteName,
      pageBuilder: (context, state) {
        return const MaterialPage(child: SignupPage());
      },
    ),
    GoRoute(
      path: '/cart',
      name: MyAppCostants().cartRouteName,
      pageBuilder: (context, state) {
        return const MaterialPage(child: CartScreen());
      },
    ),
    GoRoute(
      path: '/favorite',
      name: MyAppCostants().favoriteRouteName,
      pageBuilder: (context, state) {
        return const MaterialPage(child: FavoriteScreen());
      },
    ),
    GoRoute(
      path: '/productdetail',
      name: MyAppCostants().productRouteName,
      pageBuilder: (context, state) {
        final product = state.extra as Product;
        return MaterialPage(child: ProductDetails(product: product));
      },
    )
  ]);
}
