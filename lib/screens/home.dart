import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_ui/models/my_product.dart';
import 'package:product_ui/widgets/product_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final products = MyProduct().allProducts;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Products",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue[300],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.cart,
                color: Colors.blue[300],
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
            itemCount: products.length,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.72,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              return ProductCard(product: products[index]);
            }),
      ),
    );
  }
}
