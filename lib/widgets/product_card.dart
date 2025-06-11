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
    // final cartProvider = Provider.of<CartProvider>(context);
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => ProductDetails(product: product)));
        GoRouter.of(context).pushNamed(MyAppCostants().productRouteName,extra: product);
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              spreadRadius: 2,
              offset: const Offset(0, 4),
              color: Colors.grey.withOpacity(0.3),
            )
          ],
          color: Colors.white,
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
                      // cartProvider.addToCart(product);
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProductDetails(product: product)));
                      GoRouter.of(context).pushNamed(MyAppCostants().productRouteName,extra: product);
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
