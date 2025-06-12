import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:product_ui/models/product.dart';
import 'package:product_ui/providers/favorite_provider.dart';
import 'package:product_ui/router/app_route_constants.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .pushNamed(MyAppCostants().productRouteName, extra: product);
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          gradient: const LinearGradient(
            colors: [
              Color(0xFFE3F2FD),
              Color(0xFFBBDEFB),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(
            color: const Color.fromARGB(255, 196, 221, 241),
            width: 1.5,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x33000000),
              blurRadius: 8,
              spreadRadius: 2,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                      onPressed: () {
                        favoriteProvider.toggleFavorite(product);
                      },
                      icon: Icon(
                        favoriteProvider.isFavorite(product)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      )),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Rs.${product.price.toInt()}'),
                  const SizedBox(
                    height: 8,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      GoRouter.of(context).pushNamed(
                          MyAppCostants().productRouteName,
                          extra: product);
                    },
                    child: const Text("view"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
