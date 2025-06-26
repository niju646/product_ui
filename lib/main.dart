import 'package:flutter/material.dart';
import 'package:product_ui/feature/cart/providers/product_provider.dart';
import 'package:product_ui/feature/cart/providers/auth_provider.dart';
import 'package:product_ui/feature/cart/providers/cart_provider.dart';
import 'package:product_ui/feature/cart/providers/favorite_provider.dart';
import 'package:product_ui/core/router/app_route_config.dart';
import 'package:provider/provider.dart';

main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // final authProvider = AuthProvider();
  // await authProvider.checkLoginStatus();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => CartProvider()),
    ChangeNotifierProvider(create: (_) => FavoriteProvider()),
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => ProductProvider()),
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
