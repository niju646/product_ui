import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_ui/models/product.dart';
import 'package:product_ui/providers/cart_provider.dart';
import 'package:product_ui/providers/favorite_provider.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  final Product product;
  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            // Hero Image Section
            Container(
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Image.asset(
                      product.image,
                      height: 400,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Gradient overlay for better text visibility
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.3),
                          Colors.transparent,
                          Colors.transparent,
                          Colors.black.withOpacity(0.2),
                        ],
                      ),
                    ),
                  ),
                  // Back Button
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          CupertinoIcons.back,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  // Favorite Button
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        onPressed: () {
                          favoriteProvider.toggleFavorite(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              content: Text(
                                favoriteProvider.isFavorite(product)
                                    ? '${product.name} added to favorites'
                                    : '${product.name} removed from favorites',
                              ),
                              backgroundColor:
                                  favoriteProvider.isFavorite(product)
                                      ? Colors.pink
                                      : Colors.orange,
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        icon: Icon(
                          favoriteProvider.isFavorite(product)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Product Details Section
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Name
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Price with styling
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "₹${product.price.toInt()}",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[700],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Rating Section (placeholder)
                    Row(
                      children: [
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color:
                                  index < 4 ? Colors.amber : Colors.grey[300],
                              size: 20,
                            );
                          }),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "4.0 (128 reviews)",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Description Section
                    Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Features Section
                    Text(
                      "Features",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Column(
                      children: [
                        _buildFeatureItem(
                            "Premium Quality", CupertinoIcons.star_fill),
                        _buildFeatureItem(
                            "Fast Delivery", CupertinoIcons.rocket_fill),
                        _buildFeatureItem(
                            "30-Day Return", CupertinoIcons.return_icon),
                        _buildFeatureItem(
                            "24/7 Support", CupertinoIcons.phone_fill),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),

            // Bottom Action Bar
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Add to Favorites Button
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.pink),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: () {
                        favoriteProvider.toggleFavorite(product);
                      },
                      icon: Icon(
                        favoriteProvider.isFavorite(product)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Add to Cart Button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        cartProvider.addToCart(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            content: Text('${product.name} added to cart'),
                            backgroundColor: Colors.green,
                            duration: const Duration(seconds: 2),
                            action: SnackBarAction(
                              label: 'View Cart',
                              textColor: Colors.white,
                              onPressed: () {
                                // Navigate to cart screen
                              },
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[600],
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.cart_badge_plus,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Add to Cart",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: Colors.blue[600],
              size: 16,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
