import 'package:flutter/material.dart';
import 'package:product_ui/providers/cart_provider.dart';
import 'package:product_ui/providers/favorite_provider.dart';
import 'package:product_ui/screens/home.dart';
import 'package:provider/provider.dart';

main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=> CartProvider()),
      ChangeNotifierProvider(create: (_)=> FavoriteProvider()),
    ],
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
