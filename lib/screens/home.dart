import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:product_ui/models/my_product.dart';
import 'package:product_ui/providers/product_provider.dart';
import 'package:product_ui/router/app_route_constants.dart';
import 'package:product_ui/widgets/product_card.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    // Provider.of<ProductProvider>(context, listen: false).fetchProduct();
     WidgetsBinding.instance.addPostFrameCallback((_) {
    Provider.of<ProductProvider>(context, listen: false).fetchProduct();
  });
  }

  @override
  Widget build(BuildContext context) {
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
                GoRouter.of(context).pushNamed(MyAppCostants().cartRouteName);
              },
              icon: Icon(
                CupertinoIcons.cart,
                color: Colors.blue[300],
              )),
          IconButton(
              onPressed: () {
                GoRouter.of(context)
                    .pushNamed(MyAppCostants().favoriteRouteName);
              },
              icon: const Icon(
                Icons.favorite_sharp,
                color: Colors.red,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),

        child: Consumer<ProductProvider>(
          builder: (context, provider, _) {
            if (provider.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (provider.error != null) {
              return Center(
                child: Text(provider.error!),
              );
            } else if (provider.product.isEmpty) {
              return const Center(
                child: Text('Cart is empty'),
              );
            } else {
              return GridView.builder(
                itemCount: provider.product.length,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.72,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: provider.product[index],
                  );
                },
              );
            }
          },
        ),

        // child: FutureBuilder<List<dynamic>>(
        //   future: MyProduct().allProducts,
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const Center(child: CircularProgressIndicator());
        //     } else if (snapshot.hasError) {
        //       return Center(child: Text('Error: ${snapshot.error}'));
        //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
        //       return const Center(child: Text('No products available'));
        //     }

        //     final products = snapshot.data!;
        //     return GridView.builder(
        //       itemCount: products.length,
        //       physics: const BouncingScrollPhysics(),
        //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 2,
        //         childAspectRatio: 0.72,
        //         crossAxisSpacing: 12,
        //         mainAxisSpacing: 12,
        //       ),
        //       itemBuilder: (context, index) {
        //         return ProductCard(product: products[index]);
        //       },
        //     );
        //   },
        // ),
      ),
    );
  }
}
