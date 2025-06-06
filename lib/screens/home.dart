import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_ui/models/my_product.dart';
import 'package:product_ui/screens/cart_screen.dart';
import 'package:product_ui/screens/favorite_screen.dart';
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
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartScreen()));
              },
              icon: Icon(
                CupertinoIcons.cart,
                color: Colors.blue[300],
              )),
           IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> FavoriteScreen()));
           }, icon: const Icon(Icons.favorite_sharp,color: Colors.red,))   
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
