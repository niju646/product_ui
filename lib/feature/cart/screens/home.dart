import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:product_ui/feature/cart/providers/auth_provider.dart';
import 'package:product_ui/feature/cart/providers/product_provider.dart';
import 'package:product_ui/core/router/app_route_constants.dart';
import 'package:product_ui/feature/cart/widgets/product_card.dart';
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
              )),
          IconButton(
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).logout();
                GoRouter.of(context).pushNamed(MyAppCostants().loginRouteName);
                //  Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Successfully logout'),
                  backgroundColor: Colors.green,
                ));
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
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
                child: Text('No Products are available'),
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
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: const Icon(
                  CupertinoIcons.cart,
                  color: Colors.black,
                  size: 50,
                )),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("P R O F I L E"),
              onTap: () {
                Navigator.pop(context);
                GoRouter.of(context).push('/profile');
              },
            )
          ],
        ),
      ),
    );
  }
}
