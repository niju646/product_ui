import 'package:flutter/material.dart';
import 'package:product_ui/providers/auth_provider.dart';
import 'package:product_ui/providers/cart_provider.dart';
import 'package:product_ui/providers/favorite_provider.dart';
import 'package:product_ui/router/app_route_config.dart';
import 'package:provider/provider.dart';

main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => CartProvider()),
    ChangeNotifierProvider(create: (_) => FavoriteProvider()),
    ChangeNotifierProvider(create: (_) => AuthProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: MyAppRouter().router,
    );
  }
}
